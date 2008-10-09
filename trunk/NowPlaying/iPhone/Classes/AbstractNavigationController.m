//Copyright 2008 Cyrus Najmabadi
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

#import "AbstractNavigationController.h"

#import "ApplicationTabBarController.h"
#import "Movie.h"
#import "MovieDetailsViewController.h"
#import "NowPlayingModel.h"
#import "ReviewsViewController.h"
#import "SearchViewController.h"
#import "Theater.h"
#import "TheaterDetailsViewController.h"
#import "TicketsViewController.h"

@implementation AbstractNavigationController

@synthesize tabBarController;
@synthesize searchViewController;

- (void) dealloc {
    self.tabBarController = nil;
    self.searchViewController = nil;

    [super dealloc];
}


- (id) initWithTabBarController:(ApplicationTabBarController*) controller {
    if (self = [super init]) {
        self.tabBarController = controller;
        self.view.autoresizesSubviews = YES;
        showingSearch = NO;
    }

    return self;
}


- (void) refresh {
    for (id controller in self.viewControllers) {
        if ([controller respondsToSelector:@selector(refresh)]) {
            [controller refresh];
        }
    }
}


- (NowPlayingModel*) model {
    return tabBarController.model;
}


- (NowPlayingController*) controller {
    return tabBarController.controller;
}


- (void) navigateToLastViewedPage {
    NSArray* types = self.model.navigationStackTypes;
    NSArray* values = self.model.navigationStackValues;

    for (int i = 0; i < types.count; i++) {
        NSInteger type = [[types objectAtIndex:i] intValue];
        id value = [values objectAtIndex:i];

        if (type == MovieDetails) {
            Movie* movie = [Movie movieWithDictionary:value];
            [self pushMovieDetails:movie animated:NO];
        } else if (type == TheaterDetails) {
            Theater* theater = [Theater theaterWithDictionary:value];
            [self pushTheaterDetails:theater animated:NO];
        } else if (type == Reviews) {
            Movie* movie = [Movie movieWithDictionary:value];
            [self pushReviewsView:movie animated:NO];
        } else if (type == Tickets) {
            Movie* movie = [Movie movieWithDictionary:[value objectAtIndex:0]];
            Theater* theater = [Theater theaterWithDictionary:[value objectAtIndex:1]];
            NSString* title = [value objectAtIndex:2];

            [self pushTicketsView:movie theater:theater title:title animated:NO];
        }
    }
}


- (void) pushReviewsView:(Movie*) movie animated:(BOOL) animated {
    ReviewsViewController* controller = [[[ReviewsViewController alloc] initWithNavigationController:self
                                                                                               movie:movie] autorelease];

    [self pushViewController:controller animated:animated];
}


- (void) pushMovieDetails:(Movie*) movie
                 animated:(BOOL) animated {
    [self hideSearchView];
    UIViewController* viewController = [[[MovieDetailsViewController alloc] initWithNavigationController:self
                                                                                                   movie:movie] autorelease];

    [self pushViewController:viewController animated:animated];
}


- (void) pushTheaterDetails:(Theater*) theater animated:(BOOL) animated {
    [self hideSearchView];
    UIViewController* viewController = [[[TheaterDetailsViewController alloc] initWithNavigationController:self
                                                                                                   theater:theater] autorelease];

    [self pushViewController:viewController animated:animated];
}


- (void) pushTicketsView:(Movie*) movie
                 theater:(Theater*) theater
                   title:(NSString*) title
                animated:(BOOL) animated {
    UIViewController* viewController = [[[TicketsViewController alloc] initWithController:self
                                                                                  theater:theater
                                                                                    movie:movie
                                                                                    title:title] autorelease];

    [self pushViewController:viewController animated:animated];
}


- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    return YES;
}


- (void) showSearchView {
    if (searchViewController == nil) {
        self.searchViewController = [[[SearchViewController alloc] initWithNavigationController:self] autorelease];
    }

    [self presentModalViewController:searchViewController animated:YES];
    [searchViewController onShow];
}


- (void) hideSearchView {
    [searchViewController onHide];
    [self dismissModalViewControllerAnimated:YES];
}


@end