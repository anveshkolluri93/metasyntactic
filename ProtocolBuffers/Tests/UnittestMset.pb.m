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

#import "UnittestMset.pb.h"

@implementation UnittestMsetProtoRoot
static PBFileDescriptor* descriptor = nil;
static PBDescriptor* internal_static_protobuf_unittest_TestMessageSet_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_TestMessageSet_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_TestMessageSet_descriptor {
  return internal_static_protobuf_unittest_TestMessageSet_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_TestMessageSet_fieldAccessorTable {
  return internal_static_protobuf_unittest_TestMessageSet_fieldAccessorTable;
}
static PBDescriptor* internal_static_protobuf_unittest_TestMessageSetContainer_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_TestMessageSetContainer_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_TestMessageSetContainer_descriptor {
  return internal_static_protobuf_unittest_TestMessageSetContainer_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_TestMessageSetContainer_fieldAccessorTable {
  return internal_static_protobuf_unittest_TestMessageSetContainer_fieldAccessorTable;
}
static PBDescriptor* internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_TestMessageSetExtension1_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor {
  return internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_TestMessageSetExtension1_fieldAccessorTable {
  return internal_static_protobuf_unittest_TestMessageSetExtension1_fieldAccessorTable;
}
static PBDescriptor* internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_TestMessageSetExtension2_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor {
  return internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_TestMessageSetExtension2_fieldAccessorTable {
  return internal_static_protobuf_unittest_TestMessageSetExtension2_fieldAccessorTable;
}
static PBDescriptor* internal_static_protobuf_unittest_RawMessageSet_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_RawMessageSet_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_RawMessageSet_descriptor {
  return internal_static_protobuf_unittest_RawMessageSet_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_RawMessageSet_fieldAccessorTable {
  return internal_static_protobuf_unittest_RawMessageSet_fieldAccessorTable;
}
static PBDescriptor* internal_static_protobuf_unittest_RawMessageSet_Item_descriptor = nil;
static PBFieldAccessorTable* internal_static_protobuf_unittest_RawMessageSet_Item_fieldAccessorTable = nil;
+ (PBDescriptor*) internal_static_protobuf_unittest_RawMessageSet_Item_descriptor {
  return internal_static_protobuf_unittest_RawMessageSet_Item_descriptor;
}
+ (PBFieldAccessorTable*) internal_static_protobuf_unittest_RawMessageSet_Item_fieldAccessorTable {
  return internal_static_protobuf_unittest_RawMessageSet_Item_fieldAccessorTable;
}
+ (void) initialize {
  if (self == [UnittestMsetProtoRoot class]) {
    descriptor = [[UnittestMsetProtoRoot buildDescriptor] retain];
    internal_static_protobuf_unittest_TestMessageSet_descriptor = [[[self descriptor].messageTypes objectAtIndex:0] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:nil];
      internal_static_protobuf_unittest_TestMessageSet_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_TestMessageSet_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[TestMessageSet class]
                                      builderClass:[TestMessageSet_Builder class]] retain];
    }
    internal_static_protobuf_unittest_TestMessageSetContainer_descriptor = [[[self descriptor].messageTypes objectAtIndex:1] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:@"MessageSet", nil];
      internal_static_protobuf_unittest_TestMessageSetContainer_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_TestMessageSetContainer_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[TestMessageSetContainer class]
                                      builderClass:[TestMessageSetContainer_Builder class]] retain];
    }
    internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor = [[[self descriptor].messageTypes objectAtIndex:2] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:@"I", nil];
      internal_static_protobuf_unittest_TestMessageSetExtension1_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[TestMessageSetExtension1 class]
                                      builderClass:[TestMessageSetExtension1_Builder class]] retain];
    }
    internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor = [[[self descriptor].messageTypes objectAtIndex:3] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:@"Str", nil];
      internal_static_protobuf_unittest_TestMessageSetExtension2_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[TestMessageSetExtension2 class]
                                      builderClass:[TestMessageSetExtension2_Builder class]] retain];
    }
    internal_static_protobuf_unittest_RawMessageSet_descriptor = [[[self descriptor].messageTypes objectAtIndex:4] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:@"Item", nil];
      internal_static_protobuf_unittest_RawMessageSet_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_RawMessageSet_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[RawMessageSet class]
                                      builderClass:[RawMessageSet_Builder class]] retain];
    }
    internal_static_protobuf_unittest_RawMessageSet_Item_descriptor = [[[internal_static_protobuf_unittest_RawMessageSet_descriptor nestedTypes] objectAtIndex:0] retain];
    {
      NSArray* fieldNames = [NSArray arrayWithObjects:@"TypeId", @"Message", nil];
      internal_static_protobuf_unittest_RawMessageSet_Item_fieldAccessorTable = 
        [[PBFieldAccessorTable tableWithDescriptor:internal_static_protobuf_unittest_RawMessageSet_Item_descriptor
                                        fieldNames:fieldNames
                                      messageClass:[RawMessageSet_Item class]
                                      builderClass:[RawMessageSet_Item_Builder class]] retain];
    }
  }
}
+ (PBFileDescriptor*) descriptor {
  return descriptor;
}
+ (PBFileDescriptor*) buildDescriptor {
  static uint8_t descriptorData[] = {
    10,35,103,111,111,103,108,101,47,112,114,111,116,111,98,117,102,47,117,
    110,105,116,116,101,115,116,95,109,115,101,116,46,112,114,111,116,111,18,
    17,112,114,111,116,111,98,117,102,95,117,110,105,116,116,101,115,116,34,
    30,10,14,84,101,115,116,77,101,115,115,97,103,101,83,101,116,42,8,8,4,16,
    128,128,128,128,2,58,2,8,1,34,81,10,23,84,101,115,116,77,101,115,115,97,
    103,101,83,101,116,67,111,110,116,97,105,110,101,114,18,54,10,11,109,101,
    115,115,97,103,101,95,115,101,116,24,1,32,1,40,11,50,33,46,112,114,111,
    116,111,98,117,102,95,117,110,105,116,116,101,115,116,46,84,101,115,116,
    77,101,115,115,97,103,101,83,101,116,34,150,1,10,24,84,101,115,116,77,101,
    115,115,97,103,101,83,101,116,69,120,116,101,110,115,105,111,110,49,18,
    9,10,1,105,24,15,32,1,40,5,50,111,10,21,109,101,115,115,97,103,101,95,115,
    101,116,95,101,120,116,101,110,115,105,111,110,18,33,46,112,114,111,116,
    111,98,117,102,95,117,110,105,116,116,101,115,116,46,84,101,115,116,77,
    101,115,115,97,103,101,83,101,116,24,176,166,94,32,1,40,11,50,43,46,112,
    114,111,116,111,98,117,102,95,117,110,105,116,116,101,115,116,46,84,101,
    115,116,77,101,115,115,97,103,101,83,101,116,69,120,116,101,110,115,105,
    111,110,49,34,152,1,10,24,84,101,115,116,77,101,115,115,97,103,101,83,101,
    116,69,120,116,101,110,115,105,111,110,50,18,11,10,3,115,116,114,24,25,
    32,1,40,9,50,111,10,21,109,101,115,115,97,103,101,95,115,101,116,95,101,
    120,116,101,110,115,105,111,110,18,33,46,112,114,111,116,111,98,117,102,
    95,117,110,105,116,116,101,115,116,46,84,101,115,116,77,101,115,115,97,
    103,101,83,101,116,24,249,187,94,32,1,40,11,50,43,46,112,114,111,116,111,
    98,117,102,95,117,110,105,116,116,101,115,116,46,84,101,115,116,77,101,
    115,115,97,103,101,83,101,116,69,120,116,101,110,115,105,111,110,50,34,
    110,10,13,82,97,119,77,101,115,115,97,103,101,83,101,116,18,51,10,4,105,
    116,101,109,24,1,32,3,40,10,50,37,46,112,114,111,116,111,98,117,102,95,
    117,110,105,116,116,101,115,116,46,82,97,119,77,101,115,115,97,103,101,
    83,101,116,46,73,116,101,109,26,40,10,4,73,116,101,109,18,15,10,7,116,121,
    112,101,95,105,100,24,2,32,2,40,5,18,15,10,7,109,101,115,115,97,103,101,
    24,3,32,2,40,12,66,2,72,1,
  };
  NSArray* dependencies = [NSArray arrayWithObjects:nil];
  
  NSData* data = [NSData dataWithBytes:descriptorData length:595];
  PBFileDescriptorProto* proto = [PBFileDescriptorProto parseFromData:data];
  return [PBFileDescriptor buildFrom:proto dependencies:dependencies];
}
@end

@interface TestMessageSet ()
@end

@implementation TestMessageSet

- (void) dealloc {
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
  }
  return self;
}
static TestMessageSet* defaultTestMessageSetInstance = nil;
+ (void) initialize {
  if (self == [TestMessageSet class]) {
    defaultTestMessageSetInstance = [[TestMessageSet alloc] init];
  }
}
+ (TestMessageSet*) defaultInstance {
  return defaultTestMessageSetInstance;
}
- (TestMessageSet*) defaultInstance {
  return defaultTestMessageSetInstance;
}
- (PBDescriptor*) descriptor {
  return [TestMessageSet descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSet_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSet_fieldAccessorTable];
}
- (BOOL) isInitialized {
  if (!self.extensionsAreInitialized) return false;
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  PBExtensionWriter* extensionWriter = [PBExtensionWriter writerWithExtensions:self.extensions];
  [extensionWriter writeUntil:536870912 output:output];
  [self.unknownFields writeAsMessageSetTo:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  size += [self extensionsSerializedSize];
  size += self.unknownFields.serializedSizeAsMessageSet;
  memoizedSerializedSize = size;
  return size;
}
+ (TestMessageSet*) parseFromData:(NSData*) data {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromData:data] build];
}
+ (TestMessageSet*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSet*) parseFromInputStream:(NSInputStream*) input {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromInputStream:input] build];
}
+ (TestMessageSet*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSet*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (TestMessageSet*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSet*)[[[TestMessageSet_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (TestMessageSet_Builder*) createBuilder {
  return [TestMessageSet_Builder builder];
}
@end

@implementation TestMessageSet_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestMessageSet alloc] init] autorelease];
  }
  return self;
}
+ (TestMessageSet_Builder*) builder {
  return [[[TestMessageSet_Builder alloc] init] autorelease];
}
+ (TestMessageSet_Builder*) builderWithPrototype:(TestMessageSet*) prototype {
  return [[TestMessageSet_Builder builder] mergeFromTestMessageSet:prototype];
}
- (TestMessageSet*) internalGetResult {
  return result;
}
- (TestMessageSet_Builder*) clear {
  self.result = [[[TestMessageSet alloc] init] autorelease];
  return self;
}
- (TestMessageSet_Builder*) clone {
  return [TestMessageSet_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [TestMessageSet descriptor];
}
- (TestMessageSet*) defaultInstance {
  return [TestMessageSet defaultInstance];
}
- (TestMessageSet*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (TestMessageSet*) buildPartial {
  TestMessageSet* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestMessageSet_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[TestMessageSet class]]) {
    return [self mergeFromTestMessageSet:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (TestMessageSet_Builder*) mergeFromTestMessageSet:(TestMessageSet*) other {
  if (other == [TestMessageSet defaultInstance]) return self;
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestMessageSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestMessageSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
    }
  }
}
@end

@interface TestMessageSetContainer ()
@property BOOL hasMessageSet;
@property (retain) TestMessageSet* messageSet;
@end

@implementation TestMessageSetContainer

@synthesize hasMessageSet;
@synthesize messageSet;
- (void) dealloc {
  self.hasMessageSet = NO;
  self.messageSet = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.messageSet = [TestMessageSet defaultInstance];
  }
  return self;
}
static TestMessageSetContainer* defaultTestMessageSetContainerInstance = nil;
+ (void) initialize {
  if (self == [TestMessageSetContainer class]) {
    defaultTestMessageSetContainerInstance = [[TestMessageSetContainer alloc] init];
  }
}
+ (TestMessageSetContainer*) defaultInstance {
  return defaultTestMessageSetContainerInstance;
}
- (TestMessageSetContainer*) defaultInstance {
  return defaultTestMessageSetContainerInstance;
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetContainer descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetContainer_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetContainer_fieldAccessorTable];
}
- (BOOL) isInitialized {
  if (self.hasMessageSet) {
    if (!self.messageSet.isInitialized) return false;
  }
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasMessageSet) {
    [output writeMessage:1 value:self.messageSet];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  if (self.hasMessageSet) {
    size += computeMessageSize(1, self.messageSet);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestMessageSetContainer*) parseFromData:(NSData*) data {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromData:data] build];
}
+ (TestMessageSetContainer*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetContainer*) parseFromInputStream:(NSInputStream*) input {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromInputStream:input] build];
}
+ (TestMessageSetContainer*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetContainer*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (TestMessageSetContainer*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetContainer*)[[[TestMessageSetContainer_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (TestMessageSetContainer_Builder*) createBuilder {
  return [TestMessageSetContainer_Builder builder];
}
@end

@implementation TestMessageSetContainer_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestMessageSetContainer alloc] init] autorelease];
  }
  return self;
}
+ (TestMessageSetContainer_Builder*) builder {
  return [[[TestMessageSetContainer_Builder alloc] init] autorelease];
}
+ (TestMessageSetContainer_Builder*) builderWithPrototype:(TestMessageSetContainer*) prototype {
  return [[TestMessageSetContainer_Builder builder] mergeFromTestMessageSetContainer:prototype];
}
- (TestMessageSetContainer*) internalGetResult {
  return result;
}
- (TestMessageSetContainer_Builder*) clear {
  self.result = [[[TestMessageSetContainer alloc] init] autorelease];
  return self;
}
- (TestMessageSetContainer_Builder*) clone {
  return [TestMessageSetContainer_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetContainer descriptor];
}
- (TestMessageSetContainer*) defaultInstance {
  return [TestMessageSetContainer defaultInstance];
}
- (TestMessageSetContainer*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (TestMessageSetContainer*) buildPartial {
  TestMessageSetContainer* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestMessageSetContainer_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[TestMessageSetContainer class]]) {
    return [self mergeFromTestMessageSetContainer:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (TestMessageSetContainer_Builder*) mergeFromTestMessageSetContainer:(TestMessageSetContainer*) other {
  if (other == [TestMessageSetContainer defaultInstance]) return self;
  if (other.hasMessageSet) {
    [self mergeMessageSet:other.messageSet];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestMessageSetContainer_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestMessageSetContainer_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        TestMessageSet_Builder* subBuilder = [TestMessageSet_Builder builder];
        if (self.hasMessageSet) {
          [subBuilder mergeFromTestMessageSet:self.messageSet];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setMessageSet:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasMessageSet {
  return result.hasMessageSet;
}
- (TestMessageSet*) messageSet {
  return result.messageSet;
}
- (TestMessageSetContainer_Builder*) setMessageSet:(TestMessageSet*) value {
  result.hasMessageSet = YES;
  result.messageSet = value;
  return self;
}
- (TestMessageSetContainer_Builder*) setMessageSetBuilder:(TestMessageSet_Builder*) builderForValue {
  return [self setMessageSet:[builderForValue build]];
}
- (TestMessageSetContainer_Builder*) mergeMessageSet:(TestMessageSet*) value {
  if (result.hasMessageSet &&
      result.messageSet != [TestMessageSet defaultInstance]) {
    result.messageSet =
      [[[TestMessageSet_Builder builderWithPrototype:result.messageSet] mergeFromTestMessageSet:value] buildPartial];
  } else {
    result.messageSet = value;
  }
  result.hasMessageSet = YES;
  return self;
}
- (TestMessageSetContainer_Builder*) clearMessageSet {
  result.hasMessageSet = NO;
  result.messageSet = [TestMessageSet defaultInstance];
  return self;
}
@end

@interface TestMessageSetExtension1 ()
@property BOOL hasI;
@property int32_t i;
@end

@implementation TestMessageSetExtension1

@synthesize hasI;
@synthesize i;
- (void) dealloc {
  self.hasI = NO;
  self.i = 0;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.i = 0;
  }
  return self;
}
static PBGeneratedExtension* TestMessageSetExtension1_messageSetExtension = nil;
+ (PBGeneratedExtension*) messageSetExtension {
  return TestMessageSetExtension1_messageSetExtension;
}
static TestMessageSetExtension1* defaultTestMessageSetExtension1Instance = nil;
+ (void) initialize {
  if (self == [TestMessageSetExtension1 class]) {
    defaultTestMessageSetExtension1Instance = [[TestMessageSetExtension1 alloc] init];
     TestMessageSetExtension1_messageSetExtension = [[PBGeneratedExtension extensionWithDescriptor:[[self descriptor].extensions objectAtIndex:0]
                                                       type:[TestMessageSetExtension1 class]] retain];
  }
}
+ (TestMessageSetExtension1*) defaultInstance {
  return defaultTestMessageSetExtension1Instance;
}
- (TestMessageSetExtension1*) defaultInstance {
  return defaultTestMessageSetExtension1Instance;
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetExtension1 descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetExtension1_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetExtension1_fieldAccessorTable];
}
- (BOOL) isInitialized {
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasI) {
    [output writeInt32:15 value:self.i];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  if (hasI) {
    size += computeInt32Size(15, self.i);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestMessageSetExtension1*) parseFromData:(NSData*) data {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromData:data] build];
}
+ (TestMessageSetExtension1*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetExtension1*) parseFromInputStream:(NSInputStream*) input {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromInputStream:input] build];
}
+ (TestMessageSetExtension1*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetExtension1*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (TestMessageSetExtension1*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension1*)[[[TestMessageSetExtension1_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (TestMessageSetExtension1_Builder*) createBuilder {
  return [TestMessageSetExtension1_Builder builder];
}
@end

@implementation TestMessageSetExtension1_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestMessageSetExtension1 alloc] init] autorelease];
  }
  return self;
}
+ (TestMessageSetExtension1_Builder*) builder {
  return [[[TestMessageSetExtension1_Builder alloc] init] autorelease];
}
+ (TestMessageSetExtension1_Builder*) builderWithPrototype:(TestMessageSetExtension1*) prototype {
  return [[TestMessageSetExtension1_Builder builder] mergeFromTestMessageSetExtension1:prototype];
}
- (TestMessageSetExtension1*) internalGetResult {
  return result;
}
- (TestMessageSetExtension1_Builder*) clear {
  self.result = [[[TestMessageSetExtension1 alloc] init] autorelease];
  return self;
}
- (TestMessageSetExtension1_Builder*) clone {
  return [TestMessageSetExtension1_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetExtension1 descriptor];
}
- (TestMessageSetExtension1*) defaultInstance {
  return [TestMessageSetExtension1 defaultInstance];
}
- (TestMessageSetExtension1*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (TestMessageSetExtension1*) buildPartial {
  TestMessageSetExtension1* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestMessageSetExtension1_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[TestMessageSetExtension1 class]]) {
    return [self mergeFromTestMessageSetExtension1:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (TestMessageSetExtension1_Builder*) mergeFromTestMessageSetExtension1:(TestMessageSetExtension1*) other {
  if (other == [TestMessageSetExtension1 defaultInstance]) return self;
  if (other.hasI) {
    [self setI:other.i];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestMessageSetExtension1_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestMessageSetExtension1_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 120: {
        [self setI:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasI {
  return result.hasI;
}
- (int32_t) i {
  return result.i;
}
- (TestMessageSetExtension1_Builder*) setI:(int32_t) value {
  result.hasI = YES;
  result.i = value;
  return self;
}
- (TestMessageSetExtension1_Builder*) clearI {
  result.hasI = NO;
  result.i = 0;
  return self;
}
@end

@interface TestMessageSetExtension2 ()
@property BOOL hasStr;
@property (retain) NSString* str;
@end

@implementation TestMessageSetExtension2

@synthesize hasStr;
@synthesize str;
- (void) dealloc {
  self.hasStr = NO;
  self.str = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.str = @"";
  }
  return self;
}
static PBGeneratedExtension* TestMessageSetExtension2_messageSetExtension = nil;
+ (PBGeneratedExtension*) messageSetExtension {
  return TestMessageSetExtension2_messageSetExtension;
}
static TestMessageSetExtension2* defaultTestMessageSetExtension2Instance = nil;
+ (void) initialize {
  if (self == [TestMessageSetExtension2 class]) {
    defaultTestMessageSetExtension2Instance = [[TestMessageSetExtension2 alloc] init];
     TestMessageSetExtension2_messageSetExtension = [[PBGeneratedExtension extensionWithDescriptor:[[self descriptor].extensions objectAtIndex:0]
                                                       type:[TestMessageSetExtension2 class]] retain];
  }
}
+ (TestMessageSetExtension2*) defaultInstance {
  return defaultTestMessageSetExtension2Instance;
}
- (TestMessageSetExtension2*) defaultInstance {
  return defaultTestMessageSetExtension2Instance;
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetExtension2 descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetExtension2_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_TestMessageSetExtension2_fieldAccessorTable];
}
- (BOOL) isInitialized {
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasStr) {
    [output writeString:25 value:self.str];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  if (hasStr) {
    size += computeStringSize(25, self.str);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestMessageSetExtension2*) parseFromData:(NSData*) data {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromData:data] build];
}
+ (TestMessageSetExtension2*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetExtension2*) parseFromInputStream:(NSInputStream*) input {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromInputStream:input] build];
}
+ (TestMessageSetExtension2*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestMessageSetExtension2*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (TestMessageSetExtension2*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestMessageSetExtension2*)[[[TestMessageSetExtension2_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (TestMessageSetExtension2_Builder*) createBuilder {
  return [TestMessageSetExtension2_Builder builder];
}
@end

@implementation TestMessageSetExtension2_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestMessageSetExtension2 alloc] init] autorelease];
  }
  return self;
}
+ (TestMessageSetExtension2_Builder*) builder {
  return [[[TestMessageSetExtension2_Builder alloc] init] autorelease];
}
+ (TestMessageSetExtension2_Builder*) builderWithPrototype:(TestMessageSetExtension2*) prototype {
  return [[TestMessageSetExtension2_Builder builder] mergeFromTestMessageSetExtension2:prototype];
}
- (TestMessageSetExtension2*) internalGetResult {
  return result;
}
- (TestMessageSetExtension2_Builder*) clear {
  self.result = [[[TestMessageSetExtension2 alloc] init] autorelease];
  return self;
}
- (TestMessageSetExtension2_Builder*) clone {
  return [TestMessageSetExtension2_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [TestMessageSetExtension2 descriptor];
}
- (TestMessageSetExtension2*) defaultInstance {
  return [TestMessageSetExtension2 defaultInstance];
}
- (TestMessageSetExtension2*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (TestMessageSetExtension2*) buildPartial {
  TestMessageSetExtension2* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestMessageSetExtension2_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[TestMessageSetExtension2 class]]) {
    return [self mergeFromTestMessageSetExtension2:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (TestMessageSetExtension2_Builder*) mergeFromTestMessageSetExtension2:(TestMessageSetExtension2*) other {
  if (other == [TestMessageSetExtension2 defaultInstance]) return self;
  if (other.hasStr) {
    [self setStr:other.str];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestMessageSetExtension2_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestMessageSetExtension2_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 202: {
        [self setStr:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasStr {
  return result.hasStr;
}
- (NSString*) str {
  return result.str;
}
- (TestMessageSetExtension2_Builder*) setStr:(NSString*) value {
  result.hasStr = YES;
  result.str = value;
  return self;
}
- (TestMessageSetExtension2_Builder*) clearStr {
  result.hasStr = NO;
  result.str = @"";
  return self;
}
@end

@interface RawMessageSet ()
@property (retain) NSMutableArray* mutableItemList;
@end

@implementation RawMessageSet

@synthesize mutableItemList;
- (void) dealloc {
  self.mutableItemList = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
  }
  return self;
}
static RawMessageSet* defaultRawMessageSetInstance = nil;
+ (void) initialize {
  if (self == [RawMessageSet class]) {
    defaultRawMessageSetInstance = [[RawMessageSet alloc] init];
  }
}
+ (RawMessageSet*) defaultInstance {
  return defaultRawMessageSetInstance;
}
- (RawMessageSet*) defaultInstance {
  return defaultRawMessageSetInstance;
}
- (PBDescriptor*) descriptor {
  return [RawMessageSet descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_RawMessageSet_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_RawMessageSet_fieldAccessorTable];
}
- (NSArray*) itemList {
  return mutableItemList;
}
- (RawMessageSet_Item*) itemAtIndex:(int32_t) index {
  id value = [mutableItemList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  for (RawMessageSet_Item* element in self.itemList) {
    if (!element.isInitialized) return false;
  }
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  for (RawMessageSet_Item* element in self.itemList) {
    [output writeGroup:1 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  for (RawMessageSet_Item* element in self.itemList) {
    size += computeGroupSize(1, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (RawMessageSet*) parseFromData:(NSData*) data {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromData:data] build];
}
+ (RawMessageSet*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (RawMessageSet*) parseFromInputStream:(NSInputStream*) input {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromInputStream:input] build];
}
+ (RawMessageSet*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RawMessageSet*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (RawMessageSet*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet*)[[[RawMessageSet_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (RawMessageSet_Builder*) createBuilder {
  return [RawMessageSet_Builder builder];
}
@end

@interface RawMessageSet_Item ()
@property BOOL hasTypeId;
@property int32_t typeId;
@property BOOL hasMessage;
@property (retain) NSData* message;
@end

@implementation RawMessageSet_Item

@synthesize hasTypeId;
@synthesize typeId;
@synthesize hasMessage;
@synthesize message;
- (void) dealloc {
  self.hasTypeId = NO;
  self.typeId = 0;
  self.hasMessage = NO;
  self.message = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.typeId = 0;
    self.message = [NSData data];
  }
  return self;
}
static RawMessageSet_Item* defaultRawMessageSet_ItemInstance = nil;
+ (void) initialize {
  if (self == [RawMessageSet_Item class]) {
    defaultRawMessageSet_ItemInstance = [[RawMessageSet_Item alloc] init];
  }
}
+ (RawMessageSet_Item*) defaultInstance {
  return defaultRawMessageSet_ItemInstance;
}
- (RawMessageSet_Item*) defaultInstance {
  return defaultRawMessageSet_ItemInstance;
}
- (PBDescriptor*) descriptor {
  return [RawMessageSet_Item descriptor];
}
+ (PBDescriptor*) descriptor {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_RawMessageSet_Item_descriptor];
}
- (PBFieldAccessorTable*) internalGetFieldAccessorTable {
  return [UnittestMsetProtoRoot internal_static_protobuf_unittest_RawMessageSet_Item_fieldAccessorTable];
}
- (BOOL) isInitialized {
  if (!self.hasTypeId) return false;
  if (!self.hasMessage) return false;
  return true;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasTypeId) {
    [output writeInt32:2 value:self.typeId];
  }
  if (hasMessage) {
    [output writeData:3 value:self.message];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) return size;

  size = 0;
  if (hasTypeId) {
    size += computeInt32Size(2, self.typeId);
  }
  if (hasMessage) {
    size += computeDataSize(3, self.message);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (RawMessageSet_Item*) parseFromData:(NSData*) data {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromData:data] build];
}
+ (RawMessageSet_Item*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (RawMessageSet_Item*) parseFromInputStream:(NSInputStream*) input {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromInputStream:input] build];
}
+ (RawMessageSet_Item*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (RawMessageSet_Item*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromCodedInputStream:input] build];
}
+ (RawMessageSet_Item*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (RawMessageSet_Item*)[[[RawMessageSet_Item_Builder builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
- (RawMessageSet_Item_Builder*) createBuilder {
  return [RawMessageSet_Item_Builder builder];
}
@end

@implementation RawMessageSet_Item_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[RawMessageSet_Item alloc] init] autorelease];
  }
  return self;
}
+ (RawMessageSet_Item_Builder*) builder {
  return [[[RawMessageSet_Item_Builder alloc] init] autorelease];
}
+ (RawMessageSet_Item_Builder*) builderWithPrototype:(RawMessageSet_Item*) prototype {
  return [[RawMessageSet_Item_Builder builder] mergeFromRawMessageSet_Item:prototype];
}
- (RawMessageSet_Item*) internalGetResult {
  return result;
}
- (RawMessageSet_Item_Builder*) clear {
  self.result = [[[RawMessageSet_Item alloc] init] autorelease];
  return self;
}
- (RawMessageSet_Item_Builder*) clone {
  return [RawMessageSet_Item_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [RawMessageSet_Item descriptor];
}
- (RawMessageSet_Item*) defaultInstance {
  return [RawMessageSet_Item defaultInstance];
}
- (RawMessageSet_Item*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (RawMessageSet_Item*) buildPartial {
  RawMessageSet_Item* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (RawMessageSet_Item_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[RawMessageSet_Item class]]) {
    return [self mergeFromRawMessageSet_Item:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (RawMessageSet_Item_Builder*) mergeFromRawMessageSet_Item:(RawMessageSet_Item*) other {
  if (other == [RawMessageSet_Item defaultInstance]) return self;
  if (other.hasTypeId) {
    [self setTypeId:other.typeId];
  }
  if (other.hasMessage) {
    [self setMessage:other.message];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (RawMessageSet_Item_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (RawMessageSet_Item_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 16: {
        [self setTypeId:[input readInt32]];
        break;
      }
      case 26: {
        [self setMessage:[input readData]];
        break;
      }
    }
  }
}
- (BOOL) hasTypeId {
  return result.hasTypeId;
}
- (int32_t) typeId {
  return result.typeId;
}
- (RawMessageSet_Item_Builder*) setTypeId:(int32_t) value {
  result.hasTypeId = YES;
  result.typeId = value;
  return self;
}
- (RawMessageSet_Item_Builder*) clearTypeId {
  result.hasTypeId = NO;
  result.typeId = 0;
  return self;
}
- (BOOL) hasMessage {
  return result.hasMessage;
}
- (NSData*) message {
  return result.message;
}
- (RawMessageSet_Item_Builder*) setMessage:(NSData*) value {
  result.hasMessage = YES;
  result.message = value;
  return self;
}
- (RawMessageSet_Item_Builder*) clearMessage {
  result.hasMessage = NO;
  result.message = [NSData data];
  return self;
}
@end

@implementation RawMessageSet_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[RawMessageSet alloc] init] autorelease];
  }
  return self;
}
+ (RawMessageSet_Builder*) builder {
  return [[[RawMessageSet_Builder alloc] init] autorelease];
}
+ (RawMessageSet_Builder*) builderWithPrototype:(RawMessageSet*) prototype {
  return [[RawMessageSet_Builder builder] mergeFromRawMessageSet:prototype];
}
- (RawMessageSet*) internalGetResult {
  return result;
}
- (RawMessageSet_Builder*) clear {
  self.result = [[[RawMessageSet alloc] init] autorelease];
  return self;
}
- (RawMessageSet_Builder*) clone {
  return [RawMessageSet_Builder builderWithPrototype:result];
}
- (PBDescriptor*) descriptor {
  return [RawMessageSet descriptor];
}
- (RawMessageSet*) defaultInstance {
  return [RawMessageSet defaultInstance];
}
- (RawMessageSet*) build {
  if (!self.isInitialized) {
    @throw [NSException exceptionWithName:@"UninitializedMessage" reason:@"" userInfo:nil];
  }
  return [self buildPartial];
}
- (RawMessageSet*) buildPartial {
  RawMessageSet* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (RawMessageSet_Builder*) mergeFromMessage:(id<PBMessage>) other {
  id o = other;
  if ([o isKindOfClass:[RawMessageSet class]]) {
    return [self mergeFromRawMessageSet:o];
  } else {
    [super mergeFromMessage:other];
    return self;
  }
}
- (RawMessageSet_Builder*) mergeFromRawMessageSet:(RawMessageSet*) other {
  if (other == [RawMessageSet defaultInstance]) return self;
  if (other.mutableItemList.count > 0) {
    if (result.mutableItemList == nil) {
      result.mutableItemList = [NSMutableArray array];
    }
    [result.mutableItemList addObjectsFromArray:other.mutableItemList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (RawMessageSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (RawMessageSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet_Builder builderWithUnknownFields:self.unknownFields];
  while (true) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 11: {
        RawMessageSet_Item_Builder* subBuilder = [RawMessageSet_Item_Builder builder];
        [input readGroup:1 builder:subBuilder extensionRegistry:extensionRegistry];
        [self addItem:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (NSArray*) itemList {
  if (result.mutableItemList == nil) { return [NSArray array]; }
  return result.mutableItemList;
}
- (RawMessageSet_Item*) itemAtIndex:(int32_t) index {
  return [result itemAtIndex:index];
}
- (RawMessageSet_Builder*) replaceItemAtIndex:(int32_t) index withItem:(RawMessageSet_Item*) value {
  [result.mutableItemList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (RawMessageSet_Builder*) addAllItem:(NSArray*) values {
  if (result.mutableItemList == nil) {
    result.mutableItemList = [NSMutableArray array];
  }
  [result.mutableItemList addObjectsFromArray:values];
  return self;
}
- (RawMessageSet_Builder*) clearItemList {
  result.mutableItemList = nil;
  return self;
}
- (RawMessageSet_Builder*) addItem:(RawMessageSet_Item*) value {
  if (result.mutableItemList == nil) {
    result.mutableItemList = [NSMutableArray array];
  }
  [result.mutableItemList addObject:value];
  return self;
}
@end