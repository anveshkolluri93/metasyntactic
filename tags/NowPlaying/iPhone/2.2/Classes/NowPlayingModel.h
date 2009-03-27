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

enum ViewControllerType {
    MovieDetails = 1,
    TheaterDetails = 2,
    Reviews = 3,
    Tickets = 4
};

@interface NowPlayingModel : NSObject {
    UserLocationCache* userLocationCache;
    DVDCache* dvdCache;
    IMDbCache* imdbCache;
    PosterCache* posterCache;
    ScoreCache* scoreCache;
    TrailerCache* trailerCache;
    UpcomingCache* upcomingCache;

    NSInteger searchRadius;

    NSMutableArray* favoriteTheatersData;

    id<DataProvider> dataProvider;
}

@property (retain) UserLocationCache* userLocationCache;
@property (retain) DVDCache* dvdCache;
@property (retain) IMDbCache* imdbCache;
@property (retain) PosterCache* posterCache;
@property (retain) ScoreCache* scoreCache;
@property (retain) TrailerCache* trailerCache;
@property (retain) UpcomingCache* upcomingCache;

@property (retain) NSMutableArray* favoriteTheatersData;
@property (retain) id<DataProvider> dataProvider;

+ (NowPlayingModel*) model;

+ (NSString*) version;

- (NSInteger) scoreProviderIndex;
- (void) setScoreProviderIndex:(NSInteger) index;
- (BOOL) rottenTomatoesScores;
- (BOOL) metacriticScores;
- (BOOL) googleScores;
- (BOOL) noScores;
- (NSString*) currentScoreProvider;
- (NSArray*) scoreProvider;

- (NSInteger) selectedTabBarViewControllerIndex;
- (void) setSelectedTabBarViewControllerIndex:(NSInteger) index;

- (NSInteger) allMoviesSelectedSegmentIndex;
- (void) setAllMoviesSelectedSegmentIndex:(NSInteger) index;

- (NSInteger) allTheatersSelectedSegmentIndex;
- (void) setAllTheatersSelectedSegmentIndex:(NSInteger) index;

- (NSInteger) upcomingMoviesSelectedSegmentIndex;
- (void) setUpcomingMoviesSelectedSegmentIndex:(NSInteger) index;

- (NSInteger) dvdMoviesSelectedSegmentIndex;
- (void) setDvdMoviesSelectedSegmentIndex:(NSInteger) index;

- (NSInteger) numbersSelectedSegmentIndex;
- (void) setNumbersSelectedSegmentIndex:(NSInteger) index;

- (BOOL) allMoviesSortingByTitle;
- (BOOL) allMoviesSortingByScore;
- (BOOL) allMoviesSortingByReleaseDate;

- (BOOL) upcomingMoviesSortingByTitle;
- (BOOL) upcomingMoviesSortingByReleaseDate;

- (BOOL) dvdMoviesSortingByTitle;
- (BOOL) dvdMoviesSortingByReleaseDate;

- (BOOL) numbersSortingByDailyGross;
- (BOOL) numbersSortingByWeekendGross;
- (BOOL) numbersSortingByTotalGross;

- (void) saveNavigationStack:(AbstractNavigationController*) controller;
- (NSArray*) navigationStackTypes;
- (NSArray*) navigationStackValues;

- (BOOL) autoUpdateLocation;
- (void) setAutoUpdateLocation:(BOOL) value;

- (NSString*) userAddress;
- (void) setUserAddress:(NSString*) userAddress;

- (NSInteger) searchRadius;
- (void) setSearchRadius:(NSInteger) searchRadius;

- (NSDate*) searchDate;
- (void) setSearchDate:(NSDate*) date;

- (NSArray*) movies;
- (NSArray*) theaters;

- (void) onDataProviderUpdated;

- (NSArray*) directorsForMovie:(Movie*) movie;
- (NSArray*) castForMovie:(Movie*) movie;
- (NSString*) imdbAddressForMovie:(Movie*) movie;
- (NSArray*) genresForMovie:(Movie*) movie;
- (UIImage*) posterForMovie:(Movie*) movie;
- (NSDate*) releaseDateForMovie:(Movie*) movie;

- (NSMutableArray*) theatersShowingMovie:(Movie*) movie;
- (NSArray*) moviesAtTheater:(Theater*) theater;
- (NSArray*) moviePerformances:(Movie*) movie forTheater:(Theater*) theater;
- (NSString*) simpleAddressForTheater:(Theater*) theater;
- (NSDate*) synchronizationDateForTheater:(Theater*) theater;

- (BOOL) isStale:(Theater*) theater;
- (NSString*) showtimesRetrievedOnString:(Theater*) theater;

- (NSDictionary*) theaterDistanceMap;
- (NSArray*) theatersInRange:(NSArray*) theaters;

NSInteger compareMoviesByScore(id t1, id t2, void *context);
NSInteger compareMoviesByReleaseDateAscending(id t1, id t2, void *context);
NSInteger compareMoviesByReleaseDateDescending(id t1, id t2, void *context);
NSInteger compareMoviesByTitle(id t1, id t2, void *context);
NSInteger compareTheatersByName(id t1, id t2, void *context);
NSInteger compareTheatersByDistance(id t1, id t2, void *context);

- (void) prioritizeMovie:(Movie*) movie;

- (NSString*) synopsisForMovie:(Movie*) movie;
- (Score*) scoreForMovie:(Movie*) movie;
- (NSInteger) scoreValueForMovie:(Movie*) movie;

- (NSArray*) trailersForMovie:(Movie*) movie;
- (NSArray*) reviewsForMovie:(Movie*) movie;

- (NSMutableArray*) favoriteTheaters;
- (BOOL) isFavoriteTheater:(Theater*) theater;
- (void) addFavoriteTheater:(Theater*) theater;
- (void) removeFavoriteTheater:(Theater*) theater;

- (NSString*) noLocationInformationFound;
- (NSString*) feedbackUrl;

- (BOOL) useSmallFonts;
- (void) setUseSmallFonts:(BOOL) useSmallFonts;

@end