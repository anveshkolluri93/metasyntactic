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

#import "Invocation.h"


@implementation Invocation

@synthesize target;
@synthesize selector;
@synthesize argument;

- (void) dealloc {
    self.target = nil;
    self.selector = nil;
    self.argument = nil;

    [super dealloc];
}


- (id) initWithTarget:(id) target_
             selector:(SEL) selector_
             argument:(id) argument_ {
    if (self = [super init]) {
        self.target = target_;
        self.selector = selector_;
        self.argument = argument_;
    }

    return self;
}


+ (Invocation*) invocationWithTarget:(id) target
                            selector:(SEL) selector
                            argument:(id) argument {
    return [[[Invocation alloc] initWithTarget:target
                                      selector:selector
                                      argument:argument] autorelease];
}


- (void) run {
    [target performSelector:selector withObject:argument];
}


@end