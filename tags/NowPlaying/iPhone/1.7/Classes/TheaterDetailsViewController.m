// Copyright (C) 2008 Cyrus Najmabadi
//
// This program is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the Free
// Software Foundation; either version 2 of the License, or (at your option) any
// later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#import "TheaterDetailsViewController.h"

#import "Application.h"
#import "AttributeCell.h"
#import "ColorCache.h"
#import "DateUtilities.h"
#import "ImageCache.h"
#import "Movie.h"
#import "MovieShowtimesCell.h"
#import "MovieTitleCell.h"
#import "NowPlayingModel.h"
#import "Theater.h"
#import "TheatersNavigationController.h"
#import "Utilities.h"
#import "ViewControllerUtilities.h"
#import "WarningView.h"

@implementation TheaterDetailsViewController

@synthesize navigationController;
@synthesize theater;
@synthesize movies;
@synthesize movieShowtimes;
@synthesize segmentedControl;
@synthesize favoriteButton;

- (void) dealloc {
    self.navigationController = nil;
    self.theater = nil;
    self.movies = nil;
    self.movieShowtimes = nil;
    self.segmentedControl = nil;
    self.favoriteButton = nil;

    [super dealloc];
}


- (NowPlayingModel*) model {
    return navigationController.model;
}


- (NowPlayingController*) controller {
    return navigationController.controller;
}


- (void) setFavoriteImage {
    self.favoriteButton.selected = [self.model isFavoriteTheater:theater];
}


- (void) switchFavorite:(id) sender {
    if ([self.model isFavoriteTheater:theater]) {
        [self.model removeFavoriteTheater:theater];
    } else {
        [self.model addFavoriteTheater:theater];
    }

    [self setFavoriteImage];
}


- (void) initializeFavoriteButton {
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [favoriteButton setImage:[ImageCache emptyStarImage] forState:UIControlStateNormal];
    [favoriteButton setImage:[ImageCache filledStarImage] forState:UIControlStateSelected];
    [favoriteButton addTarget:self action:@selector(switchFavorite:) forControlEvents:UIControlEventTouchUpInside];

    CGRect frame = favoriteButton.frame;
    frame.size = [ImageCache emptyStarImage].size;
    frame.size.width += 10;
    frame.size.height += 10;
    favoriteButton.frame = frame;

    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:favoriteButton] autorelease];
    [self setFavoriteImage];
}


- (id) initWithNavigationController:(AbstractNavigationController*) controller
                            theater:(Theater*) theater_ {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.theater = theater_;
        self.navigationController = controller;

        self.movies = [[self.model moviesAtTheater:theater] sortedArrayUsingFunction:compareMoviesByTitle
                                                                             context:self.model];

        self.movieShowtimes = [NSMutableArray array];
        for (Movie* movie in movies) {
            NSArray* showtimes = [self.model moviePerformances:movie forTheater:theater];

            [movieShowtimes addObject:showtimes];
        }

        UILabel* label = [ViewControllerUtilities viewControllerTitleLabel];
        label.text = theater.name;

        self.title = theater.name;
        self.navigationItem.titleView = label;

        [self initializeFavoriteButton];
    }

    return self;
}


- (void) viewWillAppear:(BOOL) animated {
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:animated];

    [self refresh];
}


- (void) viewDidAppear:(BOOL) animated {
    [self.model saveNavigationStack:navigationController];
}


- (void) refresh {
    [self.tableView reloadData];
}


- (NSInteger) numberOfSectionsInTableView:(UITableView*) tableView {
    // header
    NSInteger sections = 1;

    // e-mail listings
    sections++;

    // movies
    sections += movies.count;

    return sections;
}


- (NSInteger)     tableView:(UITableView*) tableView
      numberOfRowsInSection:(NSInteger) section {
    if (section == 0) {
        // theater address and possibly phone number
        return 1 + ([Utilities isNilOrEmpty:theater.phoneNumber] ? 0 : 1);
    } else if (section == 1) {
        return 1;
    } else {
        return 2;
    }
}


- (UITableViewCell*) cellForHeaderRow:(NSInteger) row {
    AttributeCell* cell = [[[AttributeCell alloc] initWithFrame:[UIScreen mainScreen].applicationFrame
                                                reuseIdentifier:nil] autorelease];

    NSString* mapString = NSLocalizedString(@"Map", nil);
    NSString* callString = NSLocalizedString(@"Call", nil);
    CGSize size1 = [mapString sizeWithFont:[AttributeCell keyFont]];
    CGSize size2 = [callString sizeWithFont:[AttributeCell keyFont]];

    NSInteger width = MAX(size1.width, size2.width) + 30;

    if (row == 0) {
        [cell setKey:mapString
               value:[self.model simpleAddressForTheater:theater]
            keyWidth:width];
    } else {
        [cell setKey:callString
               value:theater.phoneNumber
            keyWidth:width];
    }

    return cell;
}


- (UITableViewCell*) cellForEmailListings {
    UITableViewCell* cell = [[[UITableViewCell alloc] initWithFrame:[UIScreen mainScreen].applicationFrame
                                                    reuseIdentifier:nil] autorelease];

    cell.textColor = [ColorCache commandColor];
    cell.font = [UIFont boldSystemFontOfSize:14];
    cell.textAlignment = UITextAlignmentCenter;

    cell.text = NSLocalizedString(@"E-mail listings", nil);

    return cell;
}


- (UITableViewCell*) cellForTheaterIndex:(NSInteger) index row:(NSInteger) row {
    if (row == 0) {
        static NSString* reuseIdentifier = @"TheaterDetailsMovieCellIdentifier";
        id movieCell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (movieCell == nil) {
            movieCell = [[[MovieTitleCell alloc] initWithFrame:[UIScreen mainScreen].applicationFrame
                                               reuseIdentifier:reuseIdentifier
                                                         model:self.model
                                                         style:UITableViewStyleGrouped] autorelease];
        }

        [movieCell setMovie:[movies objectAtIndex:index] owner:self];

        return movieCell;
    } else {
        static NSString* reuseIdentifier = @"TheaterDetailsShowtimesCellIdentifier";
        id cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[[MovieShowtimesCell alloc] initWithFrame:[UIScreen mainScreen].applicationFrame
                                              reuseIdentifier:reuseIdentifier] autorelease];
        }

        [cell setShowtimes:[movieShowtimes objectAtIndex:index]
             useSmallFonts:self.model.useSmallFonts];

        return cell;
    }
}


- (UITableViewCell*) tableView:(UITableView*) tableView
         cellForRowAtIndexPath:(NSIndexPath*) indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

    if (section == 0) {
        return [self cellForHeaderRow:row];
    } else if (section == 1) {
        return [self cellForEmailListings];
    } else {
        return [self cellForTheaterIndex:(section - 2) row:row];
    }
}


- (CGFloat)         tableView:(UITableView*) tableView
      heightForRowAtIndexPath:(NSIndexPath*) indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

    if (section == 0 || section == 1) {
        return tableView.rowHeight;
    } else {
        section -= 2;

        if (row == 0) {
            return tableView.rowHeight;
        } else {
            return [MovieShowtimesCell heightForShowtimes:[movieShowtimes objectAtIndex:section]
                                                    stale:NO
                                            useSmallFonts:self.model.useSmallFonts] + 18;
        }
    }
}


- (UITableViewCellAccessoryType) tableView:(UITableView*) tableView
          accessoryTypeForRowWithIndexPath:(NSIndexPath*) indexPath {
    NSInteger section = indexPath.section;

    if (section == 0) {
        return UITableViewCellAccessoryNone;
    } else if (section == 1) {
        return UITableViewCellAccessoryNone;
    }

    return UITableViewCellAccessoryDisclosureIndicator;
}


- (void) didSelectEmailListings {
    NSString* theaterAndDate = [NSString stringWithFormat:@"%@ - %@",
                                theater.name,
                                [DateUtilities formatFullDate:self.model.searchDate]];
    NSMutableString* body = [NSMutableString string];

    [body appendString:@"<a href=\"http://maps.google.com/maps?q="];
    [body appendString:theater.address];
    [body appendString:@"\">"];
    [body appendString:[self.model simpleAddressForTheater:theater]];
    [body appendString:@"</a>"];

    for (int i = 0; i < movies.count; i++) {
        [body appendString:@"\n\n"];

        Movie* movie = [movies objectAtIndex:i];
        NSArray* performances = [movieShowtimes objectAtIndex:i];

        [body appendString:movie.displayTitle];
        [body appendString:@"\n"];
        [body appendString:[Utilities generateShowtimeLinks:self.model
                                                      movie:movie
                                                    theater:theater
                                               performances:performances]];
    }

    NSString* url = [NSString stringWithFormat:@"mailto:?subject=%@&body=%@",
                     [Utilities stringByAddingPercentEscapes:theaterAndDate],
                     [Utilities stringByAddingPercentEscapes:body]];

    [Application openBrowser:url];
}


- (void) pushTicketsView:(Movie*) movie
                animated:(BOOL) animated {
    [navigationController pushTicketsView:movie
                                  theater:theater
                                    title:movie.displayTitle
                                 animated:animated];
}


- (void)            tableView:(UITableView*) tableView
      didSelectRowAtIndexPath:(NSIndexPath*) indexPath; {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

    if (section == 0) {
        if (row == 0) {
            [Application openMap:theater.address];
        } else {
            [Application makeCall:theater.phoneNumber];
        }
    } else if (section == 1) {
        [self didSelectEmailListings];
    } else {
        section -= 2;

        Movie* movie = [movies objectAtIndex:section];
        if (row == 0) {
            [navigationController pushMovieDetails:movie animated:YES];
        } else {
            [self pushTicketsView:movie animated:YES];
        }
    }
}


- (NSString*)       tableView:(UITableView*) tableView
      titleForFooterInSection:(NSInteger) section {
    if (section == 1) {
        if (movies.count == 0) {
            return [NSString stringWithFormat:
                    NSLocalizedString(@"This theater has not yet reported its show times. "
                                      "When they become available, %@ will retrieve them automatically.", nil),
                    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]];
        }

        if (![self.model isStale:theater]) {
            return [self.model showtimesRetrievedOnString:theater];
        }
    }

    return nil;
}


- (UIView*)        tableView:(UITableView*) tableView
      viewForFooterInSection:(NSInteger) section {
    if (section == 1) {
        if (movies.count > 0 ) {
            if ([self.model isStale:theater]) {
                return [WarningView view:[self.model showtimesRetrievedOnString:theater]];
            }
        }
    }

    return nil;
}


- (CGFloat)          tableView:(UITableView*) tableView
      heightForFooterInSection:(NSInteger)section {
    WarningView* view = (id)[self tableView:tableView viewForFooterInSection:section];
    if (view != nil) {
        return view.height;
    }

    return -1;
}


- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation) fromInterfaceOrientation {
    [self refresh];
}


@end