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

@class PBDescriptor;
@class PBEnumDescriptor;
@class PBEnumValueDescriptor;
@class PBFieldAccessorTable;
@class PBFileDescriptor;
@class PBGeneratedMessage_Builder;
@class PBDescriptorProto;
@class PBDescriptorProto_Builder;
@class PBDescriptorProto_ExtensionRange;
@class PBDescriptorProto_ExtensionRange_Builder;
@class PBEnumDescriptorProto;
@class PBEnumDescriptorProto_Builder;
@class PBEnumOptions;
@class PBEnumOptions_Builder;
@class PBEnumValueDescriptorProto;
@class PBEnumValueDescriptorProto_Builder;
@class PBEnumValueOptions;
@class PBEnumValueOptions_Builder;
@class PBFieldDescriptorProto;
@class PBFieldDescriptorProto_Builder;
@class PBFieldDescriptorProto_Label;
@class PBFieldDescriptorProto_Type;
@class PBFieldOptions;
@class PBFieldOptions_Builder;
@class PBFieldOptions_CType;
@class PBFileDescriptorProto;
@class PBFileDescriptorProto_Builder;
@class PBFileDescriptorSet;
@class PBFileDescriptorSet_Builder;
@class PBFileOptions;
@class PBFileOptions_Builder;
@class PBFileOptions_OptimizeMode;
@class PBMessageOptions;
@class PBMessageOptions_Builder;
@class PBMethodDescriptorProto;
@class PBMethodDescriptorProto_Builder;
@class PBMethodOptions;
@class PBMethodOptions_Builder;
@class PBServiceDescriptorProto;
@class PBServiceDescriptorProto_Builder;
@class PBServiceOptions;
@class PBServiceOptions_Builder;

@interface DescriptorProtoRoot : NSObject {
}
+ (PBFileDescriptor*) descriptor;
+ (PBFileDescriptor*) buildDescriptor;
@end

@interface PBFileDescriptorSet : PBGeneratedMessage {
  NSMutableArray* mutableFileList;
}
- (NSArray*) fileList;
- (PBFileDescriptorProto*) fileAtIndex:(int32_t) index;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBFileDescriptorSet*) defaultInstance;
- (PBFileDescriptorSet*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBFileDescriptorSet_Builder*) createBuilder;

+ (PBFileDescriptorSet*) parseFromData:(NSData*) data;
+ (PBFileDescriptorSet*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileDescriptorSet*) parseFromInputStream:(NSInputStream*) input;
+ (PBFileDescriptorSet*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileDescriptorSet*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBFileDescriptorSet*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBFileDescriptorSet_Builder : PBGeneratedMessage_Builder {
 @private
  PBFileDescriptorSet* result;
}
@property (retain) PBFileDescriptorSet* result;

+ (PBFileDescriptorSet_Builder*) builder;
+ (PBFileDescriptorSet_Builder*) builderWithPrototype:(PBFileDescriptorSet*) prototype;

- (PBDescriptor*) descriptor;
- (PBFileDescriptorSet*) defaultInstance;

- (PBFileDescriptorSet_Builder*) clear;
- (PBFileDescriptorSet_Builder*) clone;

- (PBFileDescriptorSet*) build;
- (PBFileDescriptorSet*) buildPartial;

- (PBFileDescriptorSet_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBFileDescriptorSet_Builder*) mergeFromPBFileDescriptorSet:(PBFileDescriptorSet*) other;
- (PBFileDescriptorSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBFileDescriptorSet_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (NSArray*) fileList;
- (PBFileDescriptorProto*) fileAtIndex:(int32_t) index;
- (PBFileDescriptorSet_Builder*) replaceFileAtIndex:(int32_t) index withFile:(PBFileDescriptorProto*) value;
- (PBFileDescriptorSet_Builder*) addFile:(PBFileDescriptorProto*) value;
- (PBFileDescriptorSet_Builder*) addAllFile:(NSArray*) values;
- (PBFileDescriptorSet_Builder*) clearFileList;
@end

@interface PBFileDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  BOOL hasPackage;
  NSString* package;
  NSMutableArray* mutableDependencyList;
  NSMutableArray* mutableMessageTypeList;
  NSMutableArray* mutableEnumTypeList;
  NSMutableArray* mutableServiceList;
  NSMutableArray* mutableExtensionList;
  BOOL hasOptions;
  PBFileOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasPackage;
@property (retain, readonly) NSString* package;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBFileOptions* options;
- (NSArray*) dependencyList;
- (NSString*) dependencyAtIndex:(int32_t) index;
- (NSArray*) messageTypeList;
- (PBDescriptorProto*) messageTypeAtIndex:(int32_t) index;
- (NSArray*) enumTypeList;
- (PBEnumDescriptorProto*) enumTypeAtIndex:(int32_t) index;
- (NSArray*) serviceList;
- (PBServiceDescriptorProto*) serviceAtIndex:(int32_t) index;
- (NSArray*) extensionList;
- (PBFieldDescriptorProto*) extensionAtIndex:(int32_t) index;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBFileDescriptorProto*) defaultInstance;
- (PBFileDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBFileDescriptorProto_Builder*) createBuilder;

+ (PBFileDescriptorProto*) parseFromData:(NSData*) data;
+ (PBFileDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBFileDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBFileDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBFileDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBFileDescriptorProto* result;
}
@property (retain) PBFileDescriptorProto* result;

+ (PBFileDescriptorProto_Builder*) builder;
+ (PBFileDescriptorProto_Builder*) builderWithPrototype:(PBFileDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBFileDescriptorProto*) defaultInstance;

- (PBFileDescriptorProto_Builder*) clear;
- (PBFileDescriptorProto_Builder*) clone;

- (PBFileDescriptorProto*) build;
- (PBFileDescriptorProto*) buildPartial;

- (PBFileDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBFileDescriptorProto_Builder*) mergeFromPBFileDescriptorProto:(PBFileDescriptorProto*) other;
- (PBFileDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBFileDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBFileDescriptorProto_Builder*) setName:(NSString*) value;
- (PBFileDescriptorProto_Builder*) clearName;

- (BOOL) hasPackage;
- (NSString*) package;
- (PBFileDescriptorProto_Builder*) setPackage:(NSString*) value;
- (PBFileDescriptorProto_Builder*) clearPackage;

- (NSArray*) dependencyList;
- (NSString*) dependencyAtIndex:(int32_t) index;
- (PBFileDescriptorProto_Builder*) replaceDependencyAtIndex:(int32_t) index withDependency:(NSString*) value;
- (PBFileDescriptorProto_Builder*) addDependency:(NSString*) value;
- (PBFileDescriptorProto_Builder*) addAllDependency:(NSArray*) values;
- (PBFileDescriptorProto_Builder*) clearDependencyList;

- (NSArray*) messageTypeList;
- (PBDescriptorProto*) messageTypeAtIndex:(int32_t) index;
- (PBFileDescriptorProto_Builder*) replaceMessageTypeAtIndex:(int32_t) index withMessageType:(PBDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addMessageType:(PBDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addAllMessageType:(NSArray*) values;
- (PBFileDescriptorProto_Builder*) clearMessageTypeList;

- (NSArray*) enumTypeList;
- (PBEnumDescriptorProto*) enumTypeAtIndex:(int32_t) index;
- (PBFileDescriptorProto_Builder*) replaceEnumTypeAtIndex:(int32_t) index withEnumType:(PBEnumDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addEnumType:(PBEnumDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addAllEnumType:(NSArray*) values;
- (PBFileDescriptorProto_Builder*) clearEnumTypeList;

- (NSArray*) serviceList;
- (PBServiceDescriptorProto*) serviceAtIndex:(int32_t) index;
- (PBFileDescriptorProto_Builder*) replaceServiceAtIndex:(int32_t) index withService:(PBServiceDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addService:(PBServiceDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addAllService:(NSArray*) values;
- (PBFileDescriptorProto_Builder*) clearServiceList;

- (NSArray*) extensionList;
- (PBFieldDescriptorProto*) extensionAtIndex:(int32_t) index;
- (PBFileDescriptorProto_Builder*) replaceExtensionAtIndex:(int32_t) index withExtension:(PBFieldDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addExtension:(PBFieldDescriptorProto*) value;
- (PBFileDescriptorProto_Builder*) addAllExtension:(NSArray*) values;
- (PBFileDescriptorProto_Builder*) clearExtensionList;

- (BOOL) hasOptions;
- (PBFileOptions*) options;
- (PBFileDescriptorProto_Builder*) setOptions:(PBFileOptions*) value;
- (PBFileDescriptorProto_Builder*) setOptionsBuilder:(PBFileOptions_Builder*) builderForValue;
- (PBFileDescriptorProto_Builder*) mergeOptions:(PBFileOptions*) value;
- (PBFileDescriptorProto_Builder*) clearOptions;
@end

@interface PBDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  NSMutableArray* mutableFieldList;
  NSMutableArray* mutableExtensionList;
  NSMutableArray* mutableNestedTypeList;
  NSMutableArray* mutableEnumTypeList;
  NSMutableArray* mutableExtensionRangeList;
  BOOL hasOptions;
  PBMessageOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBMessageOptions* options;
- (NSArray*) fieldList;
- (PBFieldDescriptorProto*) fieldAtIndex:(int32_t) index;
- (NSArray*) extensionList;
- (PBFieldDescriptorProto*) extensionAtIndex:(int32_t) index;
- (NSArray*) nestedTypeList;
- (PBDescriptorProto*) nestedTypeAtIndex:(int32_t) index;
- (NSArray*) enumTypeList;
- (PBEnumDescriptorProto*) enumTypeAtIndex:(int32_t) index;
- (NSArray*) extensionRangeList;
- (PBDescriptorProto_ExtensionRange*) extensionRangeAtIndex:(int32_t) index;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBDescriptorProto*) defaultInstance;
- (PBDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBDescriptorProto_Builder*) createBuilder;

+ (PBDescriptorProto*) parseFromData:(NSData*) data;
+ (PBDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBDescriptorProto_ExtensionRange : PBGeneratedMessage {
  BOOL hasStart;
  int32_t start;
  BOOL hasEnd;
  int32_t end;
}
@property (readonly) BOOL hasStart;
@property (readonly) int32_t start;
@property (readonly) BOOL hasEnd;
@property (readonly) int32_t end;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBDescriptorProto_ExtensionRange*) defaultInstance;
- (PBDescriptorProto_ExtensionRange*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBDescriptorProto_ExtensionRange_Builder*) createBuilder;

+ (PBDescriptorProto_ExtensionRange*) parseFromData:(NSData*) data;
+ (PBDescriptorProto_ExtensionRange*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBDescriptorProto_ExtensionRange*) parseFromInputStream:(NSInputStream*) input;
+ (PBDescriptorProto_ExtensionRange*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBDescriptorProto_ExtensionRange*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBDescriptorProto_ExtensionRange*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBDescriptorProto_ExtensionRange_Builder : PBGeneratedMessage_Builder {
 @private
  PBDescriptorProto_ExtensionRange* result;
}
@property (retain) PBDescriptorProto_ExtensionRange* result;

+ (PBDescriptorProto_ExtensionRange_Builder*) builder;
+ (PBDescriptorProto_ExtensionRange_Builder*) builderWithPrototype:(PBDescriptorProto_ExtensionRange*) prototype;

- (PBDescriptor*) descriptor;
- (PBDescriptorProto_ExtensionRange*) defaultInstance;

- (PBDescriptorProto_ExtensionRange_Builder*) clear;
- (PBDescriptorProto_ExtensionRange_Builder*) clone;

- (PBDescriptorProto_ExtensionRange*) build;
- (PBDescriptorProto_ExtensionRange*) buildPartial;

- (PBDescriptorProto_ExtensionRange_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBDescriptorProto_ExtensionRange_Builder*) mergeFromPBDescriptorProto_ExtensionRange:(PBDescriptorProto_ExtensionRange*) other;
- (PBDescriptorProto_ExtensionRange_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBDescriptorProto_ExtensionRange_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasStart;
- (int32_t) start;
- (PBDescriptorProto_ExtensionRange_Builder*) setStart:(int32_t) value;
- (PBDescriptorProto_ExtensionRange_Builder*) clearStart;

- (BOOL) hasEnd;
- (int32_t) end;
- (PBDescriptorProto_ExtensionRange_Builder*) setEnd:(int32_t) value;
- (PBDescriptorProto_ExtensionRange_Builder*) clearEnd;
@end

@interface PBDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBDescriptorProto* result;
}
@property (retain) PBDescriptorProto* result;

+ (PBDescriptorProto_Builder*) builder;
+ (PBDescriptorProto_Builder*) builderWithPrototype:(PBDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBDescriptorProto*) defaultInstance;

- (PBDescriptorProto_Builder*) clear;
- (PBDescriptorProto_Builder*) clone;

- (PBDescriptorProto*) build;
- (PBDescriptorProto*) buildPartial;

- (PBDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBDescriptorProto_Builder*) mergeFromPBDescriptorProto:(PBDescriptorProto*) other;
- (PBDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBDescriptorProto_Builder*) setName:(NSString*) value;
- (PBDescriptorProto_Builder*) clearName;

- (NSArray*) fieldList;
- (PBFieldDescriptorProto*) fieldAtIndex:(int32_t) index;
- (PBDescriptorProto_Builder*) replaceFieldAtIndex:(int32_t) index withField:(PBFieldDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addField:(PBFieldDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addAllField:(NSArray*) values;
- (PBDescriptorProto_Builder*) clearFieldList;

- (NSArray*) extensionList;
- (PBFieldDescriptorProto*) extensionAtIndex:(int32_t) index;
- (PBDescriptorProto_Builder*) replaceExtensionAtIndex:(int32_t) index withExtension:(PBFieldDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addExtension:(PBFieldDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addAllExtension:(NSArray*) values;
- (PBDescriptorProto_Builder*) clearExtensionList;

- (NSArray*) nestedTypeList;
- (PBDescriptorProto*) nestedTypeAtIndex:(int32_t) index;
- (PBDescriptorProto_Builder*) replaceNestedTypeAtIndex:(int32_t) index withNestedType:(PBDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addNestedType:(PBDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addAllNestedType:(NSArray*) values;
- (PBDescriptorProto_Builder*) clearNestedTypeList;

- (NSArray*) enumTypeList;
- (PBEnumDescriptorProto*) enumTypeAtIndex:(int32_t) index;
- (PBDescriptorProto_Builder*) replaceEnumTypeAtIndex:(int32_t) index withEnumType:(PBEnumDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addEnumType:(PBEnumDescriptorProto*) value;
- (PBDescriptorProto_Builder*) addAllEnumType:(NSArray*) values;
- (PBDescriptorProto_Builder*) clearEnumTypeList;

- (NSArray*) extensionRangeList;
- (PBDescriptorProto_ExtensionRange*) extensionRangeAtIndex:(int32_t) index;
- (PBDescriptorProto_Builder*) replaceExtensionRangeAtIndex:(int32_t) index withExtensionRange:(PBDescriptorProto_ExtensionRange*) value;
- (PBDescriptorProto_Builder*) addExtensionRange:(PBDescriptorProto_ExtensionRange*) value;
- (PBDescriptorProto_Builder*) addAllExtensionRange:(NSArray*) values;
- (PBDescriptorProto_Builder*) clearExtensionRangeList;

- (BOOL) hasOptions;
- (PBMessageOptions*) options;
- (PBDescriptorProto_Builder*) setOptions:(PBMessageOptions*) value;
- (PBDescriptorProto_Builder*) setOptionsBuilder:(PBMessageOptions_Builder*) builderForValue;
- (PBDescriptorProto_Builder*) mergeOptions:(PBMessageOptions*) value;
- (PBDescriptorProto_Builder*) clearOptions;
@end

@interface PBFieldDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  BOOL hasNumber;
  int32_t number;
  BOOL hasLabel;
  PBFieldDescriptorProto_Label* label;
  BOOL hasType;
  PBFieldDescriptorProto_Type* type;
  BOOL hasTypeName;
  NSString* typeName;
  BOOL hasExtendee;
  NSString* extendee;
  BOOL hasDefaultValue;
  NSString* defaultValue;
  BOOL hasOptions;
  PBFieldOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasNumber;
@property (readonly) int32_t number;
@property (readonly) BOOL hasLabel;
@property (retain, readonly) PBFieldDescriptorProto_Label* label;
@property (readonly) BOOL hasType;
@property (retain, readonly) PBFieldDescriptorProto_Type* type;
@property (readonly) BOOL hasTypeName;
@property (retain, readonly) NSString* typeName;
@property (readonly) BOOL hasExtendee;
@property (retain, readonly) NSString* extendee;
@property (readonly) BOOL hasDefaultValue;
@property (retain, readonly) NSString* defaultValue;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBFieldOptions* options;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBFieldDescriptorProto*) defaultInstance;
- (PBFieldDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBFieldDescriptorProto_Builder*) createBuilder;

+ (PBFieldDescriptorProto*) parseFromData:(NSData*) data;
+ (PBFieldDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFieldDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBFieldDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFieldDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBFieldDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBFieldDescriptorProto_Type : NSObject {
 @private
  int32_t index;
  int32_t value;
}
@property (readonly) int32_t index;
@property (readonly) int32_t value;
+ (PBFieldDescriptorProto_Type*) newWithIndex:(int32_t) index value:(int32_t) value;
+ (PBFieldDescriptorProto_Type*) TYPE_DOUBLE;
+ (PBFieldDescriptorProto_Type*) TYPE_FLOAT;
+ (PBFieldDescriptorProto_Type*) TYPE_INT64;
+ (PBFieldDescriptorProto_Type*) TYPE_UINT64;
+ (PBFieldDescriptorProto_Type*) TYPE_INT32;
+ (PBFieldDescriptorProto_Type*) TYPE_FIXED64;
+ (PBFieldDescriptorProto_Type*) TYPE_FIXED32;
+ (PBFieldDescriptorProto_Type*) TYPE_BOOL_;
+ (PBFieldDescriptorProto_Type*) TYPE_STRING;
+ (PBFieldDescriptorProto_Type*) TYPE_GROUP;
+ (PBFieldDescriptorProto_Type*) TYPE_MESSAGE;
+ (PBFieldDescriptorProto_Type*) TYPE_BYTES;
+ (PBFieldDescriptorProto_Type*) TYPE_UINT32;
+ (PBFieldDescriptorProto_Type*) TYPE_ENUM;
+ (PBFieldDescriptorProto_Type*) TYPE_SFIXED32;
+ (PBFieldDescriptorProto_Type*) TYPE_SFIXED64;
+ (PBFieldDescriptorProto_Type*) TYPE_SINT32;
+ (PBFieldDescriptorProto_Type*) TYPE_SINT64;

- (int32_t) number;
+ (PBFieldDescriptorProto_Type*) valueOf:(int32_t) value;
- (PBEnumValueDescriptor*) valueDescriptor;
- (PBEnumDescriptor*) descriptor;
+ (PBEnumDescriptor*) descriptor;

+ (PBFieldDescriptorProto_Type*) valueOfDescriptor:(PBEnumValueDescriptor*) desc;
@end

@interface PBFieldDescriptorProto_Label : NSObject {
 @private
  int32_t index;
  int32_t value;
}
@property (readonly) int32_t index;
@property (readonly) int32_t value;
+ (PBFieldDescriptorProto_Label*) newWithIndex:(int32_t) index value:(int32_t) value;
+ (PBFieldDescriptorProto_Label*) LABEL_OPTIONAL;
+ (PBFieldDescriptorProto_Label*) LABEL_REQUIRED;
+ (PBFieldDescriptorProto_Label*) LABEL_REPEATED;

- (int32_t) number;
+ (PBFieldDescriptorProto_Label*) valueOf:(int32_t) value;
- (PBEnumValueDescriptor*) valueDescriptor;
- (PBEnumDescriptor*) descriptor;
+ (PBEnumDescriptor*) descriptor;

+ (PBFieldDescriptorProto_Label*) valueOfDescriptor:(PBEnumValueDescriptor*) desc;
@end

@interface PBFieldDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBFieldDescriptorProto* result;
}
@property (retain) PBFieldDescriptorProto* result;

+ (PBFieldDescriptorProto_Builder*) builder;
+ (PBFieldDescriptorProto_Builder*) builderWithPrototype:(PBFieldDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBFieldDescriptorProto*) defaultInstance;

- (PBFieldDescriptorProto_Builder*) clear;
- (PBFieldDescriptorProto_Builder*) clone;

- (PBFieldDescriptorProto*) build;
- (PBFieldDescriptorProto*) buildPartial;

- (PBFieldDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBFieldDescriptorProto_Builder*) mergeFromPBFieldDescriptorProto:(PBFieldDescriptorProto*) other;
- (PBFieldDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBFieldDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBFieldDescriptorProto_Builder*) setName:(NSString*) value;
- (PBFieldDescriptorProto_Builder*) clearName;

- (BOOL) hasNumber;
- (int32_t) number;
- (PBFieldDescriptorProto_Builder*) setNumber:(int32_t) value;
- (PBFieldDescriptorProto_Builder*) clearNumber;

- (BOOL) hasLabel;
- (PBFieldDescriptorProto_Label*) label;
- (PBFieldDescriptorProto_Builder*) setLabel:(PBFieldDescriptorProto_Label*) value;
- (PBFieldDescriptorProto_Builder*) clearLabel;

- (BOOL) hasType;
- (PBFieldDescriptorProto_Type*) type;
- (PBFieldDescriptorProto_Builder*) setType:(PBFieldDescriptorProto_Type*) value;
- (PBFieldDescriptorProto_Builder*) clearType;

- (BOOL) hasTypeName;
- (NSString*) typeName;
- (PBFieldDescriptorProto_Builder*) setTypeName:(NSString*) value;
- (PBFieldDescriptorProto_Builder*) clearTypeName;

- (BOOL) hasExtendee;
- (NSString*) extendee;
- (PBFieldDescriptorProto_Builder*) setExtendee:(NSString*) value;
- (PBFieldDescriptorProto_Builder*) clearExtendee;

- (BOOL) hasDefaultValue;
- (NSString*) defaultValue;
- (PBFieldDescriptorProto_Builder*) setDefaultValue:(NSString*) value;
- (PBFieldDescriptorProto_Builder*) clearDefaultValue;

- (BOOL) hasOptions;
- (PBFieldOptions*) options;
- (PBFieldDescriptorProto_Builder*) setOptions:(PBFieldOptions*) value;
- (PBFieldDescriptorProto_Builder*) setOptionsBuilder:(PBFieldOptions_Builder*) builderForValue;
- (PBFieldDescriptorProto_Builder*) mergeOptions:(PBFieldOptions*) value;
- (PBFieldDescriptorProto_Builder*) clearOptions;
@end

@interface PBEnumDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  NSMutableArray* mutableValueList;
  BOOL hasOptions;
  PBEnumOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBEnumOptions* options;
- (NSArray*) valueList;
- (PBEnumValueDescriptorProto*) valueAtIndex:(int32_t) index;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBEnumDescriptorProto*) defaultInstance;
- (PBEnumDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBEnumDescriptorProto_Builder*) createBuilder;

+ (PBEnumDescriptorProto*) parseFromData:(NSData*) data;
+ (PBEnumDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBEnumDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBEnumDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBEnumDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBEnumDescriptorProto* result;
}
@property (retain) PBEnumDescriptorProto* result;

+ (PBEnumDescriptorProto_Builder*) builder;
+ (PBEnumDescriptorProto_Builder*) builderWithPrototype:(PBEnumDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBEnumDescriptorProto*) defaultInstance;

- (PBEnumDescriptorProto_Builder*) clear;
- (PBEnumDescriptorProto_Builder*) clone;

- (PBEnumDescriptorProto*) build;
- (PBEnumDescriptorProto*) buildPartial;

- (PBEnumDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBEnumDescriptorProto_Builder*) mergeFromPBEnumDescriptorProto:(PBEnumDescriptorProto*) other;
- (PBEnumDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBEnumDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBEnumDescriptorProto_Builder*) setName:(NSString*) value;
- (PBEnumDescriptorProto_Builder*) clearName;

- (NSArray*) valueList;
- (PBEnumValueDescriptorProto*) valueAtIndex:(int32_t) index;
- (PBEnumDescriptorProto_Builder*) replaceValueAtIndex:(int32_t) index withValue:(PBEnumValueDescriptorProto*) value;
- (PBEnumDescriptorProto_Builder*) addValue:(PBEnumValueDescriptorProto*) value;
- (PBEnumDescriptorProto_Builder*) addAllValue:(NSArray*) values;
- (PBEnumDescriptorProto_Builder*) clearValueList;

- (BOOL) hasOptions;
- (PBEnumOptions*) options;
- (PBEnumDescriptorProto_Builder*) setOptions:(PBEnumOptions*) value;
- (PBEnumDescriptorProto_Builder*) setOptionsBuilder:(PBEnumOptions_Builder*) builderForValue;
- (PBEnumDescriptorProto_Builder*) mergeOptions:(PBEnumOptions*) value;
- (PBEnumDescriptorProto_Builder*) clearOptions;
@end

@interface PBEnumValueDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  BOOL hasNumber;
  int32_t number;
  BOOL hasOptions;
  PBEnumValueOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasNumber;
@property (readonly) int32_t number;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBEnumValueOptions* options;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBEnumValueDescriptorProto*) defaultInstance;
- (PBEnumValueDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBEnumValueDescriptorProto_Builder*) createBuilder;

+ (PBEnumValueDescriptorProto*) parseFromData:(NSData*) data;
+ (PBEnumValueDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumValueDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBEnumValueDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumValueDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBEnumValueDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBEnumValueDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBEnumValueDescriptorProto* result;
}
@property (retain) PBEnumValueDescriptorProto* result;

+ (PBEnumValueDescriptorProto_Builder*) builder;
+ (PBEnumValueDescriptorProto_Builder*) builderWithPrototype:(PBEnumValueDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBEnumValueDescriptorProto*) defaultInstance;

- (PBEnumValueDescriptorProto_Builder*) clear;
- (PBEnumValueDescriptorProto_Builder*) clone;

- (PBEnumValueDescriptorProto*) build;
- (PBEnumValueDescriptorProto*) buildPartial;

- (PBEnumValueDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBEnumValueDescriptorProto_Builder*) mergeFromPBEnumValueDescriptorProto:(PBEnumValueDescriptorProto*) other;
- (PBEnumValueDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBEnumValueDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBEnumValueDescriptorProto_Builder*) setName:(NSString*) value;
- (PBEnumValueDescriptorProto_Builder*) clearName;

- (BOOL) hasNumber;
- (int32_t) number;
- (PBEnumValueDescriptorProto_Builder*) setNumber:(int32_t) value;
- (PBEnumValueDescriptorProto_Builder*) clearNumber;

- (BOOL) hasOptions;
- (PBEnumValueOptions*) options;
- (PBEnumValueDescriptorProto_Builder*) setOptions:(PBEnumValueOptions*) value;
- (PBEnumValueDescriptorProto_Builder*) setOptionsBuilder:(PBEnumValueOptions_Builder*) builderForValue;
- (PBEnumValueDescriptorProto_Builder*) mergeOptions:(PBEnumValueOptions*) value;
- (PBEnumValueDescriptorProto_Builder*) clearOptions;
@end

@interface PBServiceDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  NSMutableArray* mutableMethodList;
  BOOL hasOptions;
  PBServiceOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBServiceOptions* options;
- (NSArray*) methodList;
- (PBMethodDescriptorProto*) methodAtIndex:(int32_t) index;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBServiceDescriptorProto*) defaultInstance;
- (PBServiceDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBServiceDescriptorProto_Builder*) createBuilder;

+ (PBServiceDescriptorProto*) parseFromData:(NSData*) data;
+ (PBServiceDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBServiceDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBServiceDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBServiceDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBServiceDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBServiceDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBServiceDescriptorProto* result;
}
@property (retain) PBServiceDescriptorProto* result;

+ (PBServiceDescriptorProto_Builder*) builder;
+ (PBServiceDescriptorProto_Builder*) builderWithPrototype:(PBServiceDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBServiceDescriptorProto*) defaultInstance;

- (PBServiceDescriptorProto_Builder*) clear;
- (PBServiceDescriptorProto_Builder*) clone;

- (PBServiceDescriptorProto*) build;
- (PBServiceDescriptorProto*) buildPartial;

- (PBServiceDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBServiceDescriptorProto_Builder*) mergeFromPBServiceDescriptorProto:(PBServiceDescriptorProto*) other;
- (PBServiceDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBServiceDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBServiceDescriptorProto_Builder*) setName:(NSString*) value;
- (PBServiceDescriptorProto_Builder*) clearName;

- (NSArray*) methodList;
- (PBMethodDescriptorProto*) methodAtIndex:(int32_t) index;
- (PBServiceDescriptorProto_Builder*) replaceMethodAtIndex:(int32_t) index withMethod:(PBMethodDescriptorProto*) value;
- (PBServiceDescriptorProto_Builder*) addMethod:(PBMethodDescriptorProto*) value;
- (PBServiceDescriptorProto_Builder*) addAllMethod:(NSArray*) values;
- (PBServiceDescriptorProto_Builder*) clearMethodList;

- (BOOL) hasOptions;
- (PBServiceOptions*) options;
- (PBServiceDescriptorProto_Builder*) setOptions:(PBServiceOptions*) value;
- (PBServiceDescriptorProto_Builder*) setOptionsBuilder:(PBServiceOptions_Builder*) builderForValue;
- (PBServiceDescriptorProto_Builder*) mergeOptions:(PBServiceOptions*) value;
- (PBServiceDescriptorProto_Builder*) clearOptions;
@end

@interface PBMethodDescriptorProto : PBGeneratedMessage {
  BOOL hasName;
  NSString* name;
  BOOL hasInputType;
  NSString* inputType;
  BOOL hasOutputType;
  NSString* outputType;
  BOOL hasOptions;
  PBMethodOptions* options;
}
@property (readonly) BOOL hasName;
@property (retain, readonly) NSString* name;
@property (readonly) BOOL hasInputType;
@property (retain, readonly) NSString* inputType;
@property (readonly) BOOL hasOutputType;
@property (retain, readonly) NSString* outputType;
@property (readonly) BOOL hasOptions;
@property (retain, readonly) PBMethodOptions* options;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBMethodDescriptorProto*) defaultInstance;
- (PBMethodDescriptorProto*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBMethodDescriptorProto_Builder*) createBuilder;

+ (PBMethodDescriptorProto*) parseFromData:(NSData*) data;
+ (PBMethodDescriptorProto*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMethodDescriptorProto*) parseFromInputStream:(NSInputStream*) input;
+ (PBMethodDescriptorProto*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMethodDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBMethodDescriptorProto*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBMethodDescriptorProto_Builder : PBGeneratedMessage_Builder {
 @private
  PBMethodDescriptorProto* result;
}
@property (retain) PBMethodDescriptorProto* result;

+ (PBMethodDescriptorProto_Builder*) builder;
+ (PBMethodDescriptorProto_Builder*) builderWithPrototype:(PBMethodDescriptorProto*) prototype;

- (PBDescriptor*) descriptor;
- (PBMethodDescriptorProto*) defaultInstance;

- (PBMethodDescriptorProto_Builder*) clear;
- (PBMethodDescriptorProto_Builder*) clone;

- (PBMethodDescriptorProto*) build;
- (PBMethodDescriptorProto*) buildPartial;

- (PBMethodDescriptorProto_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBMethodDescriptorProto_Builder*) mergeFromPBMethodDescriptorProto:(PBMethodDescriptorProto*) other;
- (PBMethodDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBMethodDescriptorProto_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (PBMethodDescriptorProto_Builder*) setName:(NSString*) value;
- (PBMethodDescriptorProto_Builder*) clearName;

- (BOOL) hasInputType;
- (NSString*) inputType;
- (PBMethodDescriptorProto_Builder*) setInputType:(NSString*) value;
- (PBMethodDescriptorProto_Builder*) clearInputType;

- (BOOL) hasOutputType;
- (NSString*) outputType;
- (PBMethodDescriptorProto_Builder*) setOutputType:(NSString*) value;
- (PBMethodDescriptorProto_Builder*) clearOutputType;

- (BOOL) hasOptions;
- (PBMethodOptions*) options;
- (PBMethodDescriptorProto_Builder*) setOptions:(PBMethodOptions*) value;
- (PBMethodDescriptorProto_Builder*) setOptionsBuilder:(PBMethodOptions_Builder*) builderForValue;
- (PBMethodDescriptorProto_Builder*) mergeOptions:(PBMethodOptions*) value;
- (PBMethodDescriptorProto_Builder*) clearOptions;
@end

@interface PBFileOptions : PBGeneratedMessage {
  BOOL hasJavaPackage;
  NSString* javaPackage;
  BOOL hasJavaOuterClassname;
  NSString* javaOuterClassname;
  BOOL hasJavaMultipleFiles;
  BOOL javaMultipleFiles;
  BOOL hasOptimizeFor;
  PBFileOptions_OptimizeMode* optimizeFor;
  BOOL hasObjectivecPackage;
  NSString* objectivecPackage;
  BOOL hasObjectivecClassPrefix;
  NSString* objectivecClassPrefix;
}
@property (readonly) BOOL hasJavaPackage;
@property (retain, readonly) NSString* javaPackage;
@property (readonly) BOOL hasJavaOuterClassname;
@property (retain, readonly) NSString* javaOuterClassname;
@property (readonly) BOOL hasJavaMultipleFiles;
@property (readonly) BOOL javaMultipleFiles;
@property (readonly) BOOL hasOptimizeFor;
@property (retain, readonly) PBFileOptions_OptimizeMode* optimizeFor;
@property (readonly) BOOL hasObjectivecPackage;
@property (retain, readonly) NSString* objectivecPackage;
@property (readonly) BOOL hasObjectivecClassPrefix;
@property (retain, readonly) NSString* objectivecClassPrefix;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBFileOptions*) defaultInstance;
- (PBFileOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBFileOptions_Builder*) createBuilder;

+ (PBFileOptions*) parseFromData:(NSData*) data;
+ (PBFileOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBFileOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFileOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBFileOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBFileOptions_OptimizeMode : NSObject {
 @private
  int32_t index;
  int32_t value;
}
@property (readonly) int32_t index;
@property (readonly) int32_t value;
+ (PBFileOptions_OptimizeMode*) newWithIndex:(int32_t) index value:(int32_t) value;
+ (PBFileOptions_OptimizeMode*) SPEED;
+ (PBFileOptions_OptimizeMode*) CODE_SIZE;

- (int32_t) number;
+ (PBFileOptions_OptimizeMode*) valueOf:(int32_t) value;
- (PBEnumValueDescriptor*) valueDescriptor;
- (PBEnumDescriptor*) descriptor;
+ (PBEnumDescriptor*) descriptor;

+ (PBFileOptions_OptimizeMode*) valueOfDescriptor:(PBEnumValueDescriptor*) desc;
@end

@interface PBFileOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBFileOptions* result;
}
@property (retain) PBFileOptions* result;

+ (PBFileOptions_Builder*) builder;
+ (PBFileOptions_Builder*) builderWithPrototype:(PBFileOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBFileOptions*) defaultInstance;

- (PBFileOptions_Builder*) clear;
- (PBFileOptions_Builder*) clone;

- (PBFileOptions*) build;
- (PBFileOptions*) buildPartial;

- (PBFileOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBFileOptions_Builder*) mergeFromPBFileOptions:(PBFileOptions*) other;
- (PBFileOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBFileOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasJavaPackage;
- (NSString*) javaPackage;
- (PBFileOptions_Builder*) setJavaPackage:(NSString*) value;
- (PBFileOptions_Builder*) clearJavaPackage;

- (BOOL) hasJavaOuterClassname;
- (NSString*) javaOuterClassname;
- (PBFileOptions_Builder*) setJavaOuterClassname:(NSString*) value;
- (PBFileOptions_Builder*) clearJavaOuterClassname;

- (BOOL) hasJavaMultipleFiles;
- (BOOL) javaMultipleFiles;
- (PBFileOptions_Builder*) setJavaMultipleFiles:(BOOL) value;
- (PBFileOptions_Builder*) clearJavaMultipleFiles;

- (BOOL) hasOptimizeFor;
- (PBFileOptions_OptimizeMode*) optimizeFor;
- (PBFileOptions_Builder*) setOptimizeFor:(PBFileOptions_OptimizeMode*) value;
- (PBFileOptions_Builder*) clearOptimizeFor;

- (BOOL) hasObjectivecPackage;
- (NSString*) objectivecPackage;
- (PBFileOptions_Builder*) setObjectivecPackage:(NSString*) value;
- (PBFileOptions_Builder*) clearObjectivecPackage;

- (BOOL) hasObjectivecClassPrefix;
- (NSString*) objectivecClassPrefix;
- (PBFileOptions_Builder*) setObjectivecClassPrefix:(NSString*) value;
- (PBFileOptions_Builder*) clearObjectivecClassPrefix;
@end

@interface PBMessageOptions : PBGeneratedMessage {
  BOOL hasMessageSetWireFormat;
  BOOL messageSetWireFormat;
}
@property (readonly) BOOL hasMessageSetWireFormat;
@property (readonly) BOOL messageSetWireFormat;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBMessageOptions*) defaultInstance;
- (PBMessageOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBMessageOptions_Builder*) createBuilder;

+ (PBMessageOptions*) parseFromData:(NSData*) data;
+ (PBMessageOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMessageOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBMessageOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMessageOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBMessageOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBMessageOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBMessageOptions* result;
}
@property (retain) PBMessageOptions* result;

+ (PBMessageOptions_Builder*) builder;
+ (PBMessageOptions_Builder*) builderWithPrototype:(PBMessageOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBMessageOptions*) defaultInstance;

- (PBMessageOptions_Builder*) clear;
- (PBMessageOptions_Builder*) clone;

- (PBMessageOptions*) build;
- (PBMessageOptions*) buildPartial;

- (PBMessageOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBMessageOptions_Builder*) mergeFromPBMessageOptions:(PBMessageOptions*) other;
- (PBMessageOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBMessageOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasMessageSetWireFormat;
- (BOOL) messageSetWireFormat;
- (PBMessageOptions_Builder*) setMessageSetWireFormat:(BOOL) value;
- (PBMessageOptions_Builder*) clearMessageSetWireFormat;
@end

@interface PBFieldOptions : PBGeneratedMessage {
  BOOL hasCtype;
  PBFieldOptions_CType* ctype;
  BOOL hasExperimentalMapKey;
  NSString* experimentalMapKey;
}
@property (readonly) BOOL hasCtype;
@property (retain, readonly) PBFieldOptions_CType* ctype;
@property (readonly) BOOL hasExperimentalMapKey;
@property (retain, readonly) NSString* experimentalMapKey;

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBFieldOptions*) defaultInstance;
- (PBFieldOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBFieldOptions_Builder*) createBuilder;

+ (PBFieldOptions*) parseFromData:(NSData*) data;
+ (PBFieldOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFieldOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBFieldOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBFieldOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBFieldOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBFieldOptions_CType : NSObject {
 @private
  int32_t index;
  int32_t value;
}
@property (readonly) int32_t index;
@property (readonly) int32_t value;
+ (PBFieldOptions_CType*) newWithIndex:(int32_t) index value:(int32_t) value;
+ (PBFieldOptions_CType*) CORD;
+ (PBFieldOptions_CType*) STRING_PIECE;

- (int32_t) number;
+ (PBFieldOptions_CType*) valueOf:(int32_t) value;
- (PBEnumValueDescriptor*) valueDescriptor;
- (PBEnumDescriptor*) descriptor;
+ (PBEnumDescriptor*) descriptor;

+ (PBFieldOptions_CType*) valueOfDescriptor:(PBEnumValueDescriptor*) desc;
@end

@interface PBFieldOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBFieldOptions* result;
}
@property (retain) PBFieldOptions* result;

+ (PBFieldOptions_Builder*) builder;
+ (PBFieldOptions_Builder*) builderWithPrototype:(PBFieldOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBFieldOptions*) defaultInstance;

- (PBFieldOptions_Builder*) clear;
- (PBFieldOptions_Builder*) clone;

- (PBFieldOptions*) build;
- (PBFieldOptions*) buildPartial;

- (PBFieldOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBFieldOptions_Builder*) mergeFromPBFieldOptions:(PBFieldOptions*) other;
- (PBFieldOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBFieldOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCtype;
- (PBFieldOptions_CType*) ctype;
- (PBFieldOptions_Builder*) setCtype:(PBFieldOptions_CType*) value;
- (PBFieldOptions_Builder*) clearCtype;

- (BOOL) hasExperimentalMapKey;
- (NSString*) experimentalMapKey;
- (PBFieldOptions_Builder*) setExperimentalMapKey:(NSString*) value;
- (PBFieldOptions_Builder*) clearExperimentalMapKey;
@end

@interface PBEnumOptions : PBGeneratedMessage {
}

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBEnumOptions*) defaultInstance;
- (PBEnumOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBEnumOptions_Builder*) createBuilder;

+ (PBEnumOptions*) parseFromData:(NSData*) data;
+ (PBEnumOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBEnumOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBEnumOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBEnumOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBEnumOptions* result;
}
@property (retain) PBEnumOptions* result;

+ (PBEnumOptions_Builder*) builder;
+ (PBEnumOptions_Builder*) builderWithPrototype:(PBEnumOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBEnumOptions*) defaultInstance;

- (PBEnumOptions_Builder*) clear;
- (PBEnumOptions_Builder*) clone;

- (PBEnumOptions*) build;
- (PBEnumOptions*) buildPartial;

- (PBEnumOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBEnumOptions_Builder*) mergeFromPBEnumOptions:(PBEnumOptions*) other;
- (PBEnumOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBEnumOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBEnumValueOptions : PBGeneratedMessage {
}

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBEnumValueOptions*) defaultInstance;
- (PBEnumValueOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBEnumValueOptions_Builder*) createBuilder;

+ (PBEnumValueOptions*) parseFromData:(NSData*) data;
+ (PBEnumValueOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumValueOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBEnumValueOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBEnumValueOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBEnumValueOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBEnumValueOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBEnumValueOptions* result;
}
@property (retain) PBEnumValueOptions* result;

+ (PBEnumValueOptions_Builder*) builder;
+ (PBEnumValueOptions_Builder*) builderWithPrototype:(PBEnumValueOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBEnumValueOptions*) defaultInstance;

- (PBEnumValueOptions_Builder*) clear;
- (PBEnumValueOptions_Builder*) clone;

- (PBEnumValueOptions*) build;
- (PBEnumValueOptions*) buildPartial;

- (PBEnumValueOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBEnumValueOptions_Builder*) mergeFromPBEnumValueOptions:(PBEnumValueOptions*) other;
- (PBEnumValueOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBEnumValueOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBServiceOptions : PBGeneratedMessage {
}

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBServiceOptions*) defaultInstance;
- (PBServiceOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBServiceOptions_Builder*) createBuilder;

+ (PBServiceOptions*) parseFromData:(NSData*) data;
+ (PBServiceOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBServiceOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBServiceOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBServiceOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBServiceOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBServiceOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBServiceOptions* result;
}
@property (retain) PBServiceOptions* result;

+ (PBServiceOptions_Builder*) builder;
+ (PBServiceOptions_Builder*) builderWithPrototype:(PBServiceOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBServiceOptions*) defaultInstance;

- (PBServiceOptions_Builder*) clear;
- (PBServiceOptions_Builder*) clone;

- (PBServiceOptions*) build;
- (PBServiceOptions*) buildPartial;

- (PBServiceOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBServiceOptions_Builder*) mergeFromPBServiceOptions:(PBServiceOptions*) other;
- (PBServiceOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBServiceOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBMethodOptions : PBGeneratedMessage {
}

+ (PBDescriptor*) descriptor;
- (PBDescriptor*) descriptor;
+ (PBMethodOptions*) defaultInstance;
- (PBMethodOptions*) defaultInstance;
- (PBFieldAccessorTable*) internalGetFieldAccessorTable;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PBMethodOptions_Builder*) createBuilder;

+ (PBMethodOptions*) parseFromData:(NSData*) data;
+ (PBMethodOptions*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMethodOptions*) parseFromInputStream:(NSInputStream*) input;
+ (PBMethodOptions*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PBMethodOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PBMethodOptions*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PBMethodOptions_Builder : PBGeneratedMessage_Builder {
 @private
  PBMethodOptions* result;
}
@property (retain) PBMethodOptions* result;

+ (PBMethodOptions_Builder*) builder;
+ (PBMethodOptions_Builder*) builderWithPrototype:(PBMethodOptions*) prototype;

- (PBDescriptor*) descriptor;
- (PBMethodOptions*) defaultInstance;

- (PBMethodOptions_Builder*) clear;
- (PBMethodOptions_Builder*) clone;

- (PBMethodOptions*) build;
- (PBMethodOptions*) buildPartial;

- (PBMethodOptions_Builder*) mergeFromMessage:(id<PBMessage>) other;
- (PBMethodOptions_Builder*) mergeFromPBMethodOptions:(PBMethodOptions*) other;
- (PBMethodOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PBMethodOptions_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end