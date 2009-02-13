// Copyright 2008 Cyrus Najmabadi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
package org.metasyntactic.caches;

import org.metasyntactic.Application;
import org.metasyntactic.Constants;
import org.metasyntactic.NowPlayingModel;
import org.metasyntactic.collections.BoundedPrioritySet;
import org.metasyntactic.data.Movie;
import org.metasyntactic.providers.DataProvider;
import org.metasyntactic.threading.ThreadingUtilities;
import org.metasyntactic.utilities.*;
import static org.metasyntactic.utilities.StringUtilities.isNullOrEmpty;
import static org.metasyntactic.utilities.XmlUtilities.children;
import org.w3c.dom.Element;

import java.io.File;
import static java.lang.String.valueOf;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class UpcomingCache extends AbstractCache {
  private static int identifier;
  private final SimpleDateFormat formatter = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z");
  private final BoundedPrioritySet<Movie> prioritizedMovies = new BoundedPrioritySet<Movie>(9);
  private String hash;
  private List<Movie> movies;
  private Map<String, String> studioKeys;
  private Map<String, String> titleKeys;

  public UpcomingCache(final NowPlayingModel model) {
    super(model);
  }

  private static File hashFile() {
    return new File(Application.upcomingDirectory, "Hash");
  }

  private static File moviesFile() {
    return new File(Application.upcomingDirectory, "Movies");
  }

  private static File studiosFile() {
    return new File(Application.upcomingDirectory, "Studios");
  }

  private static File titlesFile() {
    return new File(Application.upcomingDirectory, "Titles");
  }

  private String getHash() {
    if (this.hash == null) {
      this.hash = FileUtilities.readString(hashFile());
      if (this.hash == null) {
        this.hash = "";
      }
    }

    return this.hash;
  }

  public List<Movie> getMovies() {
    if (this.movies == null) {
      final Date today = new Date();
      List<Movie> list = FileUtilities.readPersistableList(Movie.reader, moviesFile());
      if (list == null) {
        list = Collections.emptyList();
      }
      for (final Iterator<Movie> iterator = list.iterator(); iterator.hasNext();) {
        final Movie movie = iterator.next();

        if (movie.getReleaseDate() != null && movie.getReleaseDate().compareTo(today) < 0) {
          iterator.remove();
        }
      }

      this.movies = list;
    }

    return Collections.unmodifiableList(this.movies);
  }

  private Map<String, String> getStudioKeys() {
    if (this.studioKeys == null) {
      this.studioKeys = FileUtilities.readStringToStringMap(studiosFile());
      if (this.studioKeys == null) {
        this.studioKeys = Collections.emptyMap();
      }
    }

    return this.studioKeys;
  }

  private Map<String, String> getTitleKeys() {
    if (this.titleKeys == null) {
      this.titleKeys = FileUtilities.readStringToStringMap(titlesFile());
      if (this.titleKeys == null) {
        this.titleKeys = Collections.emptyMap();
      }
    }

    return this.titleKeys;
  }

  public void update() {
    if (isNullOrEmpty(this.model.getUserAddress())) {
      return;
    }

    updateIndex();
  }

  private void updateDetails() {
    final List<Movie> localMovies = getMovies();
    final Map<String, String> localStudioKeys = getStudioKeys();
    final Map<String, String> localTitleKeys = getTitleKeys();

    final Runnable runnable = new Runnable() {
      public void run() {
        updateDetailsBackgroundEntryPoint(localMovies, localStudioKeys, localTitleKeys);
      }
    };
    ThreadingUtilities.performOnBackgroundThread("Update Upcoming Details", runnable, this.lock, false);
  }

  private void updateIndex() {
    final Runnable runnable = new Runnable() {
      public void run() {
        updateIndexBackgroundEntryPoint();
      }
    };
    ThreadingUtilities.performOnBackgroundThread("Update Upcoming Index", runnable, this.lock, true);
  }

  private void updateIndexBackgroundEntryPoint() {
    final long start = System.currentTimeMillis();
    updateIndexBackgroundEntryPointWorker();
    LogUtilities.logTime(UpcomingCache.class, "Update Index", start);

    this.updateDetails();
  }

  private void updateIndexBackgroundEntryPointWorker() {
    final Map<String, String> localStudioKeys = new HashMap<String, String>();
    final Map<String, String> localTitleKeys = new HashMap<String, String>();
    final List<Movie> localMovies = new ArrayList<Movie>();

    final File indexFile = hashFile();
    if (indexFile.exists()) {
      final long lastModifiedTime = indexFile.lastModified();

      if (Math.abs(lastModifiedTime - new Date().getTime()) < 3 * Constants.ONE_DAY) {
        return;
      }
    }

    final String localHash = getHash();
    final String serverHash_ = NetworkUtilities.downloadString(
        "http://" + Application.host + ".appspot.com/LookupUpcomingListings?q=index&hash=true", false/* important */);
    final String serverHash = serverHash_ == null ? "0" : serverHash_;

    if (localHash.equals(serverHash)) {
      return;
    }

    long start = System.currentTimeMillis();
    final Element resultElement = NetworkUtilities.downloadXml(
        "http://" + Application.host + ".appspot.com/LookupUpcomingListings?q=index", false/* important */);
    LogUtilities.logTime(DataProvider.class, "Update Index - Download Xml", start);

    start = System.currentTimeMillis();
    processResultElement(resultElement, localMovies, localStudioKeys, localTitleKeys);
    LogUtilities.logTime(DataProvider.class, "Update Index - Process Xml", start);
    if (this.shutdown) {
      return;
    }
    if (localMovies.isEmpty()) {
      return;
    }

    reportResults(serverHash, localMovies, localStudioKeys, localTitleKeys);

    start = System.currentTimeMillis();
    saveResults(serverHash, localMovies, localStudioKeys, localTitleKeys);
    LogUtilities.logTime(DataProvider.class, "Update Index - Save Results", start);
  }

  private void reportResults(final String serverHash, final List<Movie> movies, final Map<String, String> studioKeys,
                             final Map<String, String> titleKeys) {
    final Runnable runnable = new Runnable() {
      public void run() {
        reportResultsOnMainThread(serverHash, movies, studioKeys, titleKeys);
      }
    };
    ThreadingUtilities.performOnMainThread(runnable);
  }

  private void reportResultsOnMainThread(final String serverHash, final List<Movie> movies,
                                         final Map<String, String> studioKeys, final Map<String, String> titleKeys) {
    this.hash = serverHash;
    this.movies = movies;
    this.studioKeys = studioKeys;
    this.titleKeys = titleKeys;
  }

  private static void saveResults(final String serverHash, final List<Movie> movies, final Map<String, String> studios,
                                  final Map<String, String> titles) {
    FileUtilities.writePersistableCollection(movies, moviesFile());
    FileUtilities.writeStringToStringMap(studios, studiosFile());
    FileUtilities.writeStringToStringMap(titles, titlesFile());

    // this file has to be last.  it's what we use to determine if we should
    // update or not.
    FileUtilities.writeString(serverHash, hashFile());
  }

  private void processResultElement(final Element resultElement, final List<Movie> movies,
                                    final Map<String, String> studioKeys, final Map<String, String> titleKeys) {
    for (final Element movieElement : children(resultElement)) {
      if (this.shutdown) {
        return;
      }
      processMovieElement(movieElement, movies, studioKeys, titleKeys);
    }
  }

  private void processMovieElement(final Element movieElement, final List<Movie> movies,
                                   final Map<String, String> studioKeys, final Map<String, String> titleKeys) {
    final Date releaseDate;
    try {
      releaseDate = this.formatter.parse(movieElement.getAttribute("date"));
    } catch (final ParseException e) {
      throw new RuntimeException(e);
    }
    final String poster = movieElement.getAttribute("poster");
    final String rating = movieElement.getAttribute("rating");
    final String studio = movieElement.getAttribute("studio");
    final String title = movieElement.getAttribute("title");
    final List<String> directors = processArray(XmlUtilities.element(movieElement, "directors"));
    final List<String> cast = processArray(XmlUtilities.element(movieElement, "actors"));
    final List<String> genres = processArray(XmlUtilities.element(movieElement, "genres"));
    final String studioKey = movieElement.getAttribute("studioKey");
    final String titleKey = movieElement.getAttribute("titleKey");

    final Movie movie = new Movie(valueOf(identifier), title, rating, 0, "", releaseDate, poster, "", studio, directors,
                                  cast, genres);

    identifier++;
    movies.add(movie);
    studioKeys.put(movie.getCanonicalTitle(), studioKey);
    titleKeys.put(movie.getCanonicalTitle(), titleKey);
  }

  private static List<String> processArray(final Element element) {
    final List<String> result = new ArrayList<String>();
    for (final Element child : children(element)) {
      result.add(child.getAttribute("value"));
    }
    return result;
  }

  private void updateDetailsBackgroundEntryPoint(final List<Movie> movies, final Map<String, String> studioKeys,
                                                 final Map<String, String> titleKeys) {
    final long start = System.currentTimeMillis();
    updateDetailsBackgroundEntryPointWorker(movies, studioKeys, titleKeys);
    LogUtilities.logTime(UpcomingCache.class, "Update Details", start);
  }

  private void updateDetailsBackgroundEntryPointWorker(final List<Movie> movies, final Map<String, String> studioKeys,
                                                       final Map<String, String> titleKeys) {
    if (movies.isEmpty()) {
      return;
    }

    final Set<Movie> moviesSet = new TreeSet<Movie>(movies);
    Movie movie;
    do {
      movie = this.prioritizedMovies.removeAny(moviesSet);
      if (movie != null) {
        updateDetails(movie, studioKeys.get(movie.getCanonicalTitle()), titleKeys.get(movie.getCanonicalTitle()));
      }
    } while (movie != null && !this.shutdown);
  }

  private static void updateDetails(final Movie movie, final String studioKey, final String titleKey) {
    updateImdb(movie);
    updatePoster(movie);
    updateSynopsisAndCast(movie, studioKey, titleKey);
    updateTrailers(movie, studioKey, titleKey);
  }

  private static File getCastFile(final Movie movie) {
    return new File(Application.upcomingCastDirectory, FileUtilities.sanitizeFileName(movie.getCanonicalTitle()));
  }

  private static File getIMDbFile(final Movie movie) {
    return new File(Application.upcomingImdbDirectory, FileUtilities.sanitizeFileName(movie.getCanonicalTitle()));
  }

  private static File getPosterFile(final Movie movie) {
    return new File(Application.upcomingPostersDirectory, FileUtilities.sanitizeFileName(movie.getCanonicalTitle()));
  }

  public static File getPosterFile_safeToCallFromBackground(final Movie movie) {
    return getPosterFile(movie);
  }

  private static File getSynopsisFile(final Movie movie) {
    return new File(Application.upcomingSynopsesDirectory, FileUtilities.sanitizeFileName(movie.getCanonicalTitle()));
  }

  private static File getTrailersFile(final Movie movie) {
    return new File(Application.upcomingTrailersDirectory, FileUtilities.sanitizeFileName(movie.getCanonicalTitle()));
  }

  private static void updateTrailers(final Movie movie, final String studioKey, final String titleKey) {
    final File file = getTrailersFile(movie);
    if (file.exists()) {
      if (Math.abs(file.lastModified() - new Date().getTime()) < 3 * Constants.ONE_DAY) {
        return;
      }
    }

    final String trailersString = NetworkUtilities.downloadString(
        "http://" + Application.host + ".appspot.com/LookupTrailerListings?studio=" + studioKey + "&name=" + titleKey,
        false);

    if (isNullOrEmpty(trailersString)) {
      return;
    }

    final String[] trailers = trailersString.split("\n");
    if (trailers.length == 0) {
      return;
    }

    FileUtilities.writeString(trailers[0], file);

    Application.refresh();
  }

  private static void updateSynopsisAndCast(final Movie movie, final String studioKey, final String titleKey) {
    final File file = getSynopsisFile(movie);
    if (file.exists()) {
      if (Math.abs(file.lastModified() - new Date().getTime()) < Constants.ONE_WEEK) {
        return;
      }
    }

    final String result = NetworkUtilities.downloadString(
        "http://" + Application.host + ".appspot.com/LookupUpcomingListings?format=2&studio=" + studioKey + "&name=" + titleKey,
        false);

    if (isNullOrEmpty(result)) {
      return;
    }

    final String[] values = result.split("\n");
    if (values.length == 0) {
      return;
    }

    final String synopsis = values[0];
    final Collection<String> cast = new ArrayList<String>(values.length - 1);
    cast.addAll(Arrays.asList(values).subList(1, values.length));

    if (!synopsis.startsWith("No synopsis")) {
      FileUtilities.writeString(synopsis, file);
      Application.refresh();
    }

    if (!cast.isEmpty()) {
      FileUtilities.writeStringCollection(cast, getCastFile(movie));
    }
  }

  private static void updatePoster(final Movie movie) {
    if (isNullOrEmpty(movie.getPoster())) {
      return;
    }

    final File file = getPosterFile(movie);
    if (file.exists()) {
      return;
    }

    final byte[] data = NetworkUtilities.download(movie.getPoster(), false);
    if (data == null) {
      return;
    }

    FileUtilities.writeBytes(data, file);

    Application.refresh();
  }

  private static void updateImdb(final Movie movie) {
    final File file = getIMDbFile(movie);
    if (file.exists()) {
      final String value = FileUtilities.readString(file);
      if (value.length() > 0) {
        return;
      }

      if (FileUtilities.daysSinceNow(file) < 3) {
        return;
      }
    }

    final String imdbAddress = NetworkUtilities.downloadString(
        "http://" + Application.host + ".appspot.com/LookupIMDbListings?q=" + StringUtilities.urlEncode(
            movie.getCanonicalTitle()), false);

    if (isNullOrEmpty(imdbAddress)) {
      return;
    }

    FileUtilities.writeString(imdbAddress, file);

    Application.refresh();
  }

  public static String getTrailer(final Movie movie) {
    return FileUtilities.readString(getTrailersFile(movie));
  }

  public static byte[] getPoster(final Movie movie) {
    return FileUtilities.readBytes(getPosterFile(movie));
  }

  public static String getSynopsis(final Movie movie) {
    return FileUtilities.readString(getSynopsisFile(movie));
  }

  public static String getIMDbAddress(final Movie movie) {
    return FileUtilities.readString(getIMDbFile(movie));
  }

  public void prioritizeMovie(final Movie movie) {
    this.prioritizedMovies.add(movie);
  }

  @Override protected List<File> getCacheDirectories() {
    return Arrays.asList(Application.upcomingCastDirectory, Application.upcomingImdbDirectory,
                         Application.upcomingPostersDirectory, Application.upcomingSynopsesDirectory,
                         Application.upcomingTrailersDirectory);
  }

  public static List<String> getCast(final Movie movie) {
    return FileUtilities.readStringList(getCastFile(movie));
  }
}