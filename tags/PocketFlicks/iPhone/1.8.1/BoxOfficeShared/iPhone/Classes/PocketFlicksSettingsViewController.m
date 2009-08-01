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

#import "PocketFlicksSettingsViewController.h"

//#import "Application.h"
#import "Controller.h"
//#import "DVDFilterViewController.h"
//#import "LocationManager.h"
#import "Model.h"
//#import "ScoreProviderViewController.h"
//#import "SearchDatePickerViewController.h"
//#import "SearchDistancePickerViewController.h"
#import "SwitchCell.h"
//#import "UserLocationCache.h"

@interface PocketFlicksSettingsViewController()
@end


@implementation PocketFlicksSettingsViewController

- (void) dealloc {
  [super dealloc];
}


- (id) init {
  if ((self = [super initWithStyle:UITableViewStyleGrouped])) {
    self.title = LocalizedString(@"Settings", nil);
  }

  return self;
}


- (Model*) model {
  return [Model model];
}


- (Controller*) controller {
  return [Controller controller];
}


- (void) minorRefresh {
  [self majorRefresh];
}


- (void) onBeforeViewControllerPushed {
  [super onBeforeViewControllerPushed];
  self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDone)] autorelease];
  self.navigationController.navigationBar.tintColor = [ColorCache netflixYellow];
}


- (void) onDone {
  [self.navigationController.parentViewController dismissModalViewControllerAnimated:YES];
}


- (NSInteger) numberOfSectionsInTableView:(UITableView*) tableView {
  return 1;
}


- (NSInteger)     tableView:(UITableView*) tableView
      numberOfRowsInSection:(NSInteger) section {
  return 3;
}


- (UITableViewCell*) createSwitchCellWithText:(NSString*) text
                                           on:(BOOL) on
                                     selector:(SEL) selector {
  static NSString* reuseIdentifier = @"switchCellReuseIdentifier";

  SwitchCell* cell = (id)[self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
  if (cell == nil) {
    cell = [[[SwitchCell alloc] initWithReuseIdentifier:reuseIdentifier] autorelease];
  }

  [cell.switchControl removeTarget:self action:NULL forControlEvents:UIControlEventValueChanged];
  [cell.switchControl addTarget:self action:selector forControlEvents:UIControlEventValueChanged];
  cell.switchControl.on = on;
  cell.textLabel.text = text;

  return cell;
}


- (UITableViewCell*) cellForSettingsRow:(NSInteger) row {
    NSString* text;
    BOOL on;
    SEL selector;
    if (row == 0) {
      text = LocalizedString(@"Screen Rotation", @"This string has to be small enough to be visible with a picker switch next to it.  It means 'don't turn the screen automatically when i rotate my phone'");
      on = [MetasyntacticSharedApplication screenRotationEnabled];
      selector = @selector(onScreenRotationEnabledChanged:);
    } else if (row == 1) {
      text = LocalizedString(@"Show Notifications", @"This string has to be small enough to be visible with a picker switch next to it.  It means 'show update notifications in the UI to let me know what's happening'");
      on = self.model.notificationsEnabled;
      selector = @selector(onShowNotificationsChanged:);
    } else if (row == 2) {
      text = LocalizedString(@"Loading Indicators", @"This string has to be small enough to be visible with a picker switch next to it.  It means 'show update spinners in the UI when loading content'");
      on = self.model.loadingIndicatorsEnabled;
      selector = @selector(onLoadingIndicatorsChanged:);
    }

    return [self createSwitchCellWithText:text on:on selector:selector];
}


- (UITableViewCell*) tableView:(UITableView*) tableView
         cellForRowAtIndexPath:(NSIndexPath*) indexPath {
  return [self cellForSettingsRow:indexPath.row];
}



- (void) onScreenRotationEnabledChanged:(UISwitch*) sender {
  [self.model setScreenRotationEnabled:sender.on];
}


- (void) onShowNotificationsChanged:(UISwitch*) sender {
  [self.model setNotificationsEnabled:sender.on];
}


- (void) onLoadingIndicatorsChanged:(UISwitch*) sender {
  [self.model setLoadingIndicatorsEnabled:sender.on];
}


- (void)            tableView:(UITableView*) tableView
      didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
}

@end