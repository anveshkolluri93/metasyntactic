// Protocol Buffers - Google's data interchange format
// Copyright 2008 Google Inc.
// http://code.google.com/p/protobuf/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "Descriptor.h"


@implementation Descriptor

@synthesize nestedTypes;

- (void) dealloc {
    self.nestedTypes = nil;
    [super dealloc];
}

- (NSArray*) getFields {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (PBMessageOptions*) getOptions {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (NSString*) getFullName {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (NSArray*) getEnumTypes {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (NSArray*) getNestedTypes {
    return nestedTypes;
}


- (BOOL) isExtensionNumber:(int32_t) number {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (FieldDescriptor*) findFieldByNumber:(int32_t) number {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}

@end
