//
//  UpdatingListingsViewController.m
//  NowPlaying
//
//  Created by Cyrus Najmabadi on 12/2/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "UpdatingListingsViewController.h"

@interface UpdatingListingsViewController()
@property (retain) id target;
@property SEL selector;
@end

@implementation UpdatingListingsViewController

@synthesize target;
@synthesize selector;

- (void)dealloc {
    self.target = nil;
    self.selector = nil;
    [super dealloc];
}


- (id) initWithTarget:(id) target_
             selector:(SEL) selector_ {
    if (self = [super init]) {
        self.target = target_;
        self.selector = selector_;
    }
    
    return self;
}


- (UILabel*) createLabel {
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.text = NSLocalizedString(@"Updating Listings", nil);
    label.backgroundColor = [UIColor clearColor];
    label.opaque = NO;
    label.font = [UIFont boldSystemFontOfSize:24];
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    CGRect labelFrame = label.frame;
    labelFrame.origin.x = (int)((frame.size.width - labelFrame.size.width) / 2.0);
    labelFrame.origin.y = (int)((frame.size.height - labelFrame.size.height) / 2.0) - 20;
    label.frame = labelFrame;
    
    return label;
}


- (UIActivityIndicatorView*) createActivityIndicator:(UILabel*) label {
    UIActivityIndicatorView* activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] autorelease];
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator sizeToFit];
    
    CGRect labelFrame = label.frame;
    CGRect activityFrame = activityIndicator.frame;
    
    activityFrame.origin.x = (int)(labelFrame.origin.x - activityFrame.size.width) - 5;
    activityFrame.origin.y = (int)(labelFrame.origin.y + (labelFrame.size.height / 2) - (activityFrame.size.height / 2));
    activityIndicator.frame = activityFrame;
    
    [activityIndicator startAnimating];
    
    return activityIndicator;
}


- (UIButton*) createButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button.backgroundColor = [UIColor blackColor];
    button.font = [button.font fontWithSize:button.font.pointSize + 4];
    button.opaque = NO;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* image = [[UIImage imageNamed:@"BlackButton.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button sizeToFit];
    
    CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
    CGRect frame = CGRectZero;
    frame.origin.x = 10;
    frame.origin.y = applicationFrame.size.height - frame.origin.x - image.size.height;
    frame.size.height = image.size.height;
    frame.size.width = (int)(applicationFrame.size.width - 2 * frame.origin.x);
    button.frame = frame;
    
    return button;
}


- (UIView*) createView {
    CGRect viewFrame = [UIScreen mainScreen].applicationFrame;
    viewFrame.origin.y = 0;
    
    UIView* view = [[[UIView alloc] initWithFrame:viewFrame] autorelease];
    view.backgroundColor = [UIColor blackColor];
    
    UILabel* label = [self createLabel];
    UIActivityIndicatorView* activityIndicator = [self createActivityIndicator:label];
    UIButton* button = [self createButton];
    
    CGRect frame = activityIndicator.frame;
    double width = frame.size.width;
    frame.origin.x = (int)(frame.origin.x + width / 2);
    activityIndicator.frame = frame;
    
    frame = label.frame;
    frame.origin.x = (int)(frame.origin.x + width / 2);
    label.frame = frame;
    
    [view addSubview:activityIndicator];
    [view addSubview:label];
    [view addSubview:button];
    
    return view;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    self.view = [self createView];
}


@end
