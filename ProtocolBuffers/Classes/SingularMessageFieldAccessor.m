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

#import "SingularMessageFieldAccessor.h"

#import "FieldDescriptor.h"

@interface PBSingularMessageFieldAccessor()
    @property SEL newBuilderMethod;
@end

@implementation PBSingularMessageFieldAccessor

@synthesize newBuilderMethod;

- (void) dealloc {
    self.newBuilderMethod = 0;

    [super dealloc];
}


- (id) initWithField:(PBFieldDescriptor*) field
                name:(NSString*) name
        messageClass:(Class) messageClass
        builderClass:(Class) builderClass {
    if (self = [super initWithField:field name:name messageClass:messageClass builderClass:builderClass]) {
        self.newBuilderMethod = @selector(newBuilder);
    }
    
    return self;
}


+ (PBSingularMessageFieldAccessor*) accessorWithField:(PBFieldDescriptor*) field
                                                 name:(NSString*) name
                                         messageClass:(Class) messageClass
                                         builderClass:(Class) builderClass {
    return [[[PBSingularMessageFieldAccessor alloc] initWithField:field
                                                             name:name
                                                     messageClass:messageClass
                                                     builderClass:builderClass] autorelease];
}


- (Class) messageClass {
    return [self.field.messageType class];
}


- (id) coerceType:(id) value {
    if ([value conformsToProtocol:@protocol(PBMessage)] &&
        [(id<PBMessage>)value descriptor] == self.field.messageType) {
        return value;
    } else {
        // The value is not the exact right message type.  However, if it
        // is an alternative implementation of the same type -- e.g. a
        // DynamicMessage -- we should accept it.  In this case we can make
        // a copy of the message.
        @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
#if 0
        id<PBMessage_Builder> builder = [messageClass performSelector:newBuilderMethod];
        return [[builder mergeFromMessage:value] build];
#endif
    }
}


- (void) set:(PBGeneratedMessage_Builder*) builder value:(id) value {
    [super set:builder value:[self coerceType:value]];
}


- (id) getRepeated:(PBGeneratedMessage*) message index:(int32_t) index {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (void) setRepeated:(PBGeneratedMessage_Builder*) builder index:(int32_t) index value:(id) value {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (void) addRepeated:(PBGeneratedMessage_Builder*) builder value:(id) value {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (int32_t) getRepeatedCount:(PBGeneratedMessage*) message {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (void) clear:(PBGeneratedMessage_Builder*) builder {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}


- (id<PBMessage_Builder>) newBuilder {
    @throw [NSException exceptionWithName:@"NYI" reason:@"" userInfo:nil];
}

@end