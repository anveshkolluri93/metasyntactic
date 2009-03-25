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

#import "Theater.h"

#import "DateUtilities.h"
#import "Location.h"
#import "Utilities.h"

@implementation Theater

property_definition(identifier);
property_definition(name);
property_definition(phoneNumber);
property_definition(location);
property_definition(originatingLocation);
property_definition(movieTitles);

- (void) dealloc {
    self.identifier = nil;
    self.name = nil;
    self.phoneNumber = nil;
    self.location = nil;
    self.originatingLocation = nil;
    self.movieTitles = nil;

    [super dealloc];
}


+ (Theater*) theaterWithDictionary:(NSDictionary*) dictionary {
    return [Theater theaterWithIdentifier:[dictionary objectForKey:identifier_key]
                                     name:[dictionary objectForKey:name_key]
                              phoneNumber:[dictionary objectForKey:phoneNumber_key]
                                 location:[Location locationWithDictionary:[dictionary objectForKey:location_key]]
                      originatingLocation:[Location locationWithDictionary:[dictionary objectForKey:originatingLocation_key]]
                              movieTitles:[dictionary objectForKey:movieTitles_key]];
}


- (id)      initWithIdentifier:(NSString*) identifier_
                          name:(NSString*) name_
                   phoneNumber:(NSString*) phoneNumber_
                      location:(Location*) location_
           originatingLocation:(Location*) originatingLocation_
                   movieTitles:(NSArray*) movieTitles_ {
    if (self = [self init]) {
        self.identifier = [Utilities nonNilString:identifier_];
        self.name = [[Utilities nonNilString:name_] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        self.phoneNumber = [Utilities nonNilString:phoneNumber_];
        self.location = location_;
        self.originatingLocation = originatingLocation_;
        self.movieTitles = [Utilities nonNilArray:movieTitles_];
    }

    return self;
}


+ (Theater*) theaterWithIdentifier:(NSString*) identifier
                              name:(NSString*) name
                       phoneNumber:(NSString*) phoneNumber
                          location:(Location*) location
               originatingLocation:(Location*) originatingLocation
                       movieTitles:(NSArray*) movieTitles {
    return [[[Theater alloc] initWithIdentifier:identifier
                                           name:name
                                    phoneNumber:phoneNumber
                                       location:location
                            originatingLocation:originatingLocation
                                    movieTitles:movieTitles] autorelease];
}


- (NSDictionary*) dictionary {
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:identifier                        forKey:identifier_key];
    [dictionary setObject:name                              forKey:name_key];
    [dictionary setObject:phoneNumber                       forKey:phoneNumber_key];
    [dictionary setObject:location.dictionary               forKey:location_key];
    [dictionary setObject:originatingLocation.dictionary    forKey:originatingLocation_key];
    [dictionary setObject:movieTitles                       forKey:movieTitles_key];
    return dictionary;
}


- (NSString*) description {
    return self.dictionary.description;
}


- (BOOL) isEqual:(id) anObject {
    Theater* other = anObject;
    return [name isEqual:other.name];
}


- (NSUInteger) hash {
    return name.hash;
}


- (NSString*) mapUrl {
    return [location mapUrl];
}


+ (NSString*) processShowtime:(NSString*) showtime {
    if ([DateUtilities use24HourTime]) {
        return showtime;
    }

    if ([showtime hasSuffix:@" PM"]) {
        return [NSString stringWithFormat:@"%@pm", [showtime substringToIndex:showtime.length - 3]];
    } else if ([showtime hasSuffix:@" AM"]) {
        return [NSString stringWithFormat:@"%@am", [showtime substringToIndex:showtime.length - 3]];
    }

    if (![showtime hasSuffix:@"am"] && ![showtime hasSuffix:@"pm"]) {
        return [NSString stringWithFormat:@"%@pm", showtime];
    }

    return showtime;
}


@end