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

#import "IMDbCache.h"

#import "Application.h"

@implementation IMDbCache

+ (IMDbCache*) cache {
  return [[[IMDbCache alloc] init] autorelease];
}


- (NSString*) cacheDirectory {
  return [Application imdbDirectory];
}


- (NSString*) serverUrl:(Movie*) movie {
  return [NSString stringWithFormat:@"http://%@.appspot.com/LookupIMDbListings3?q=%@", [Application host], [StringUtilities stringByAddingPercentEscapes:movie.canonicalTitle]];
}


- (void) updateMovieDetails:(Movie*) movie force:(BOOL) force {
  if (movie.imdbAddress.length > 0) {
    // don't even bother if the movie has an imdb address in it
    return;
  }
  [super updateMovieDetails:movie force:force];
}

@end
