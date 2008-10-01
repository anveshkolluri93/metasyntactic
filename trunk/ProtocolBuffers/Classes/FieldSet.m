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

#import "FieldSet.h"

#import "Descriptor.pb.h"
#import "CodedInputStream.h"
#import "CodedOutputStream.h"
#import "Descriptor.h"
#import "EnumDescriptor.h"
#import "EnumValueDescriptor.h"
#import "ExtensionRegistry.h"
#import "ExtensionRegistry_ExtensionInfo.h"
#import "Field.h"
#import "FieldDescriptor.h"
#import "Message.h"
#import "Message_Builder.h"
#import "WireFormat.h"

@implementation PBFieldSet

static PBFieldSet* DEFAULT_INSTANCE = nil;

+ (void) initialize {
    if (self == [PBFieldSet class]) {
        DEFAULT_INSTANCE = [[PBFieldSet alloc] initWithFields:[NSMutableDictionary dictionary]];
    }
}


@synthesize fields;

- (void) dealloc {
    self.fields = nil;

    [super dealloc];
}


+ (PBFieldSet*) emptySet {
    return DEFAULT_INSTANCE;
}


- (id) initWithFields:(NSMutableDictionary*) fields_ {
    if (self = [super init]) {
        self.fields = fields_;
    }

    return self;
}


- (id) init {
    if (self = [super init]) {
        self.fields = [NSMutableDictionary dictionary];
    }

    return fields;
}


+ (PBFieldSet*) set {
    return [[[PBFieldSet alloc] init] autorelease];
}


- (void) clear {
    [fields removeAllObjects];
}


/** See {@link Message#getAllFields()}. */
- (NSDictionary*) getAllFields {
    return fields;
}


/** See {@link Message#hasField(Descriptors.PBFieldDescriptor)}. */
- (BOOL) hasField:(PBFieldDescriptor*) field {
    if (field.isRepeated) {
        @throw [NSException exceptionWithName:@"IllegalArgument"
                                       reason:@"hasField() can only be called on non-repeated fields." userInfo:nil];
    }

    return [fields objectForKey:field] != nil;
}


/**
 * See {@link Message#getField(Descriptors.PBFieldDescriptor)}.  This method
 * returns {@code null} if the field is a singular message type and is not
 * set; in this case it is up to the caller to fetch the message's default
 * instance.
 */
- (id) getField:(PBFieldDescriptor*) field {
    id result = [fields objectForKey:field];
    if (result == nil) {
        if (field.getObjectiveCType == ObjectiveCTypeMessage) {
            if (field.isRepeated) {
                return [NSArray array];
            } else {
                return nil;
            }
        } else {
            return field.getDefaultValue;
        }
    } else {
        return result;
    }
}


/**
 * Verifies that the given object is of the correct type to be a valid
 * value for the given field.  (For repeated fields, this checks if the
 * object is the right type to be one element of the field.)
 *
 * @throws IllegalArgumentException The value is not of the right type.
 */
- (void) verifyType:(PBFieldDescriptor*) field value:(id) value {
    BOOL isValid = NO;
    switch (field.getObjectiveCType) {
        case ObjectiveCTypeInt32:   isValid = [value isKindOfClass:[NSNumber class]]; break;
        case ObjectiveCTypeInt64:   isValid = [value isKindOfClass:[NSNumber class]]; break;
        case ObjectiveCTypeFloat32: isValid = [value isKindOfClass:[NSNumber class]]; break;
        case ObjectiveCTypeFloat64: isValid = [value isKindOfClass:[NSNumber class]]; break;
        case ObjectiveCTypeBool:    isValid = [value isKindOfClass:[NSNumber class]]; break;
        case ObjectiveCTypeString:  isValid = [value isKindOfClass:[NSString class]]; break;
        case ObjectiveCTypeData:    isValid = [value isKindOfClass:[NSData class]]; break;
        case ObjectiveCTypeEnum:
            isValid = [value isKindOfClass:[PBEnumValueDescriptor class]] &&
            [value getType] == field.getEnumType;
            break;
        case ObjectiveCTypeMessage:
            isValid = [value conformsToProtocol:@protocol(Message)] &&
            [value getDescriptorForType] == field.getMessageType;
            break;
    }

    if (!isValid) {
        // When chaining calls to setField(), it can be hard to tell from
        // the stack trace which exact call failed, since the whole chain is
        // considered one line of code.  So, let's make sure to include the
        // field name and other useful info in the exception.
        @throw [NSException exceptionWithName:@"IllegalArgument" reason:@"" userInfo:nil];
        /*
         throw new IllegalArgumentException(
         "Wrong object type used with protocol message reflection.  " +
         "Message type \"" + field.getContainingType().getFullName() +
         "\", field \"" +
         (field.isExtension() ? field.getFullName() : field.getName()) +
         "\", value was type \"" + value.getClass().getName() + "\".");
         */
    }
}


/** See {@link Message.Builder#setField(Descriptors.PBFieldDescriptor,Object)}. */
- (void) setField:(PBFieldDescriptor*) field
            value:(id) value {
    if (field.isRepeated) {
        if (![value isKindOfClass:[NSArray class]]) {
            @throw [NSException exceptionWithName:@"IllegalArgument"
                                           reason:@"Wrong object type used with protocol message reflection." userInfo:nil];
        }

        // Wrap the contents in a new list so that the caller cannot change
        // the list's contents after setting it.
        NSMutableArray* newList = [NSMutableArray arrayWithArray:value];
        for (id element in newList) {
            [self verifyType:field value:element];
        }
        value = newList;
    } else {
        [self verifyType:field value:value];
    }

    [fields setObject:value forKey:field];
}


/** See {@link Message.Builder#clearField(Descriptors.PBFieldDescriptor)}. */
- (void) clearField:(PBFieldDescriptor*) field {
    [fields removeObjectForKey:field];
}


/** See {@link Message#getRepeatedFieldCount(Descriptors.PBFieldDescriptor)}. */
- (int32_t) getRepeatedFieldCount:(PBFieldDescriptor*) field {
    if (!field.isRepeated) {
        @throw [NSException exceptionWithName:@"IllegalArgument"
                                       reason:@"getRepeatedFieldCount() can only be called on repeated fields." userInfo:nil];
    }

    return [[self getField:field] count];
}


/** See {@link Message#getRepeatedField(Descriptors.PBFieldDescriptor,int)}. */
- (id) getRepeatedField:(PBFieldDescriptor*) field
                  index:(int32_t) index {
    if (!field.isRepeated) {
        @throw [NSException exceptionWithName:@"IllegalArgument"
                                       reason:@"getRepeatedField() can only be called on repeated fields." userInfo:nil];
    }

    return [[self getField:field] objectAtIndex:index];
}


/** See {@link Message.Builder#setRepeatedField(Descriptors.PBFieldDescriptor,int,Object)}. */
- (void) setRepeatedField:(PBFieldDescriptor*) field
                    index:(int32_t) index
                    value:(id) value {
    if (!field.isRepeated) {
        @throw [NSException exceptionWithName:@"IllegalArgument"
                                       reason:@"setRepeatedField() can only be called on repeated fields." userInfo:nil];
    }

    [self verifyType:field value:value];


    NSMutableArray* list = [fields objectForKey:field];
    if (list == nil) {
        @throw [NSException exceptionWithName:@"IndexOutOfBounds" reason:@"" userInfo:nil];
    }
    [list replaceObjectAtIndex:index withObject:value];
}


/** See {@link Message.Builder#addRepeatedField(Descriptors.PBFieldDescriptor,Object)}. */
- (void) addRepeatedField:(PBFieldDescriptor*) field value:(id) value {
    if (!field.isRepeated) {
        @throw [NSException exceptionWithName:@"IllegalArgument"
                                       reason:@"addRepeatedField() can only be called on repeated fields." userInfo:nil];
    }

    [self verifyType:field value:value];

    NSMutableArray* list = [fields objectForKey:field];
    if (list == nil) {
        list = [NSMutableArray array];
        [fields setObject:list forKey:field];
    }
    [list addObject:value];
}


// =================================================================
// Parsing and serialization

/**
 * See {@link Message#isInitialized()}.  Note:  Since {@code PBFieldSet}
 * itself does not have any way of knowing about required fields that
 * aren't actually present in the set, it is up to the caller to check
 * that all required fields are present.
 */
- (BOOL) isInitialized {
    for (PBFieldDescriptor* field in fields) {
        id value = [fields objectForKey:field];

        if (field.getObjectiveCType == ObjectiveCTypeMessage) {
            if (field.isRepeated) {
                for (id<Message> element in value) {
                    if (![element isInitialized]) {
                        return NO;
                    }
                }
            } else {
                if (![value isInitialized]) {
                    return NO;
                }
            }
        }
    }

    return YES;
}


/**
 * Like {@link #isInitialized()}, but also checks for the presence of
 * all required fields in the given type.
 */
- (BOOL) isInitialized:(PBDescriptor*) type {
    // Check that all required fields are present.
    for (PBFieldDescriptor* field in type.getFields) {
        if (field.isRequired) {
            if (![self hasField:field]) {
                return NO;
            }
        }
    }

    // Check that embedded messages are initialized.
    return [self isInitialized];
}


/** See {@link Message.Builder#mergeFrom(Message)}. */
- (void) mergeFromMessage:(id<Message>) other {
    // Note:  We don't attempt to verify that other's fields have valid
    //   types.  Doing so would be a losing battle.  We'd have to verify
    //   all sub-messages as well, and we'd have to make copies of all of
    //   them to insure that they don't change after verification (since
    //   the Message interface itself cannot enforce immutability of
    //   implementations).
    // TODO(kenton):  Provide a function somewhere called makeDeepCopy()
    //   which allows people to make secure deep copies of messages.

    NSDictionary* otherAllFields = [other getAllFields];
    for (PBFieldDescriptor* field in otherAllFields) {
        id otherValue = [otherAllFields objectForKey:field];

        if (field.isRepeated) {
            NSMutableArray* existingValue = [fields objectForKey:field];
            if (existingValue == nil) {
                existingValue = [NSMutableArray array];
                [fields setObject:existingValue forKey:field];
            }
            [existingValue addObjectsFromArray:otherValue];
        } else if (field.getObjectiveCType == ObjectiveCTypeMessage) {
            id<Message> existingValue = [fields objectForKey:field];
            if (existingValue == nil) {
                [self setField:field value:otherValue];
            } else {
                [self setField:field
                         value:[[[[existingValue newBuilderForType] mergeFromMessage:existingValue] mergeFromMessage:otherValue] build]];
            }
        } else {
            [self setField:field value:otherValue];
        }
    }
}


/**
 * Like {@link #mergeFrom(Message)}, but merges from another {@link PBFieldSet}.
 */
- (void) mergeFromFieldSet:(PBFieldSet*) other {
    for (PBFieldDescriptor* field in other.fields) {
        id value = [other.fields objectForKey:field];

        if (field.isRepeated) {
            NSMutableArray* existingValue = [fields objectForKey:field];
            if (existingValue == nil) {
                existingValue = [NSMutableArray array];
                [fields setObject:existingValue forKey:field];
            }
            [existingValue addObjectsFromArray:value];
        } else if (field.getObjectiveCType == ObjectiveCTypeMessage) {
            id<Message> existingValue = [fields objectForKey:field];
            if (existingValue == nil) {
                [self setField:field value:value];
            } else {
                [self setField:field
                         value:[[[[existingValue newBuilderForType] mergeFromMessage:existingValue] mergeFromMessage:value] build]];
            }
        } else {
            [self setField:field value:value];
        }
    }
}


// TODO(kenton):  Move parsing code into PBAbstractMessage, since it no longer
//   uses any special knowledge from PBFieldSet.


+ (void) mergeFromCodedInputStream:(PBCodedInputStream*) input
                     unknownFields:(UnknownFieldSet_Builder*) unknownFields
                 extensionRegistry:(ExtensionRegistry*) extensionRegistry
                           builder:(id<Message_Builder>) builder {
    while (true) {
        int32_t tag = [input readTag];
        if (tag == 0) {
            break;
        }
        
        if (![self mergeFieldFromCodedInputStream:input
                                    unknownFields:unknownFields
                                extensionRegistry:extensionRegistry
                                          builder:builder
                                              tag:tag]) {
            // end group tag
            break;
        }
    }
}


/** Called by {@code #mergeFieldFrom()} to parse a MessageSet extension. */
+ (void) mergeMessageSetExtensionFromCodedStream:(PBCodedInputStream*) input
                                   unknownFields:(UnknownFieldSet_Builder*) unknownFields
                               extensionRegistry:(ExtensionRegistry*) extensionRegistry
                                         builder:(id<Message_Builder>) builder {
    @throw [NSException exceptionWithName:@"" reason:@"" userInfo:nil];
    /*
     PBDescriptor type = builder.getDescriptorForType();
     
     // The wire format for MessageSet is:
     //   message MessageSet {
     //     repeated group Item = 1 {
     //       required int32 typeId = 2;
     //       required bytes message = 3;
     //     }
     //   }
     // "typeId" is the extension's field number.  The extension can only be
     // a message type, where "message" contains the encoded bytes of that
     // message.
     //
     // In practice, we will probably never see a MessageSet item in which
     // the message appears before the type ID, or where either field does not
     // appear exactly once.  However, in theory such cases are valid, so we
     // should be prepared to accept them.
     
     int typeId = 0;
     ByteString rawBytes = null;  // If we encounter "message" before "typeId"
     Message.Builder subBuilder = null;
     PBFieldDescriptor field = null;
     
     while (true) {
     int tag = input.readTag();
     if (tag == 0) {
     break;
     }
     
     if (tag == WireFormat.MESSAGE_SET_TYPE_ID_TAG) {
     typeId = input.readUInt32();
     // Zero is not a valid type ID.
     if (typeId != 0) {
     ExtensionRegistry.ExtensionInfo extension =
     extensionRegistry.findExtensionByNumber(type, typeId);
     if (extension != null) {
     field = extension.descriptor;
     subBuilder = extension.defaultInstance.newBuilderForType();
     Message originalMessage = (Message)builder.getField(field);
     if (originalMessage != null) {
     subBuilder.mergeFrom(originalMessage);
     }
     if (rawBytes != null) {
     // We already encountered the message.  Parse it now.
     subBuilder.mergeFrom(
     PBCodedInputStream.newInstance(rawBytes.newInput()));
     rawBytes = null;
     }
     } else {
     // Unknown extension number.  If we already saw data, put it
     // in rawBytes.
     if (rawBytes != null) {
     unknownFields.mergeField(typeId,
     UnknownFieldSet.PBField.newBuilder()
     .addLengthDelimited(rawBytes)
     .build());
     rawBytes = null;
     }
     }
     }
     } else if (tag == WireFormat.MESSAGE_SET_MESSAGE_TAG) {
     if (typeId == 0) {
     // We haven't seen a type ID yet, so we have to store the raw bytes
     // for now.
     rawBytes = input.readBytes();
     } else if (subBuilder == null) {
     // We don't know how to parse this.  Ignore it.
     unknownFields.mergeField(typeId,
     UnknownFieldSet.PBField.newBuilder()
     .addLengthDelimited(input.readBytes())
     .build());
     } else {
     // We already know the type, so we can parse directly from the input
     // with no copying.  Hooray!
     input.readMessage(subBuilder, extensionRegistry);
     }
     } else {
     // Unknown tag.  Skip it.
     if (!input.skipField(tag)) {
     break;  // end of group
     }
     }
     }
     
     input.checkLastTagWas(WireFormat.MESSAGE_SET_ITEM_END_TAG);
     
     if (subBuilder != null) {
     builder.setField(field, subBuilder.build());
     }
     */
}


/**
 * Like {@link #mergeFrom(PBCodedInputStream, UnknownFieldSet.Builder,
 * ExtensionRegistry, Message.Builder)}, but parses a single field.
 * @param tag The tag, which should have already been read.
 * @return {@code true} unless the tag is an end-group tag.
 */
+ (BOOL) mergeFieldFromCodedInputStream:(PBCodedInputStream*) input
                          unknownFields:(UnknownFieldSet_Builder*) unknownFields
                      extensionRegistry:(ExtensionRegistry*) extensionRegistry
                                builder:(id<Message_Builder>) builder
                                    tag:(int32_t) tag {
    PBDescriptor* type = [builder getDescriptorForType];

    if (type.getOptions.getMessageSetWireFormat &&
        tag == WireFormatMessageSetItemTag) {
        [self mergeMessageSetExtensionFromCodedStream:input
                                        unknownFields:unknownFields
                                    extensionRegistry:extensionRegistry
                                              builder:builder];
        return true;
    }

    int32_t wireType = WireFormatGetTagWireType(tag);
    int32_t fieldNumber = WireFormatGetTagFieldNumber(tag);

    PBFieldDescriptor* field;
   id<Message> defaultInstance = nil;

    if ([type isExtensionNumber:fieldNumber]) {
        PBExtensionRegistry_ExtensionInfo* extension = [extensionRegistry findExtensionByNumber:type fieldNumber:fieldNumber];
        if (extension == nil) {
            field = nil;
        } else {
            field = extension.descriptor;
            defaultInstance = extension.defaultInstance;
        }
    } else {
        field = [type findFieldByNumber:fieldNumber];
    }

    if (field == nil ||
        wireType != WireFormatGetWireFormatForFieldType(field.getType)) {
        // Unknown field or wrong wire type.  Skip.
        return [unknownFields mergeFieldFrom:tag input:input];
    } else {
        id value;
        switch (field.getType) {
            case FieldDescriptorTypeGroup: {
                id<Message_Builder> subBuilder;
                if (defaultInstance != nil) {
                    subBuilder = [defaultInstance newBuilderForType];
                } else {
                    subBuilder = [builder newBuilderForField:field];
                }
                if (!field.isRepeated) {
                    [subBuilder mergeFromMessage:[builder getField:field]];
                }
                [input readGroup:field.getNumber builder:subBuilder extensionRegistry:extensionRegistry];
                value = [subBuilder build];
                break;
            }
            case FieldDescriptorTypeMessage: {
                id<Message_Builder> subBuilder;
                if (defaultInstance != nil) {
                    subBuilder = [defaultInstance newBuilderForType];
                } else {
                    subBuilder = [builder newBuilderForField:field];
                }
                if (!field.isRepeated) {
                    [subBuilder mergeFromMessage:[builder getField:field]];
                }
                [input readMessage:subBuilder extensionRegistry:extensionRegistry];
                value = [subBuilder build];
                break;
            }
            case FieldDescriptorTypeEnum: {
                int32_t rawValue = [input readEnum];
                value = [field.getEnumType findValueByNumber:rawValue];
                // If the number isn't recognized as a valid value for this enum,
                // drop it.
                if (value == nil) {
                    [unknownFields mergeVarintField:fieldNumber value:rawValue];
                    return true;
                }
                break;
            }
            default:
                value = [input readPrimitiveField:field.getType];
                break;
        }

        if (field.isRepeated) {
            [builder addRepeatedField:field value:value];
        } else {
            [builder setField:field value:value];
        }
    }

    return true;
}


/** See {@link Message#writeTo(PBCodedOutputStream)}. */
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
    for (PBFieldDescriptor* field in fields) {
        id value = [fields objectForKey:field];
        [self writeField:field value:value output:output];
    }
}


/** Write a single field. */
- (void) writeField:(PBFieldDescriptor*) field value:(id) value output:(PBCodedOutputStream*) output {
    if (field.isExtension &&
        field.getContainingType.getOptions.getMessageSetWireFormat) {
        [output writeMessageSetExtension:field.getNumber value:value];
    } else {
        if (field.isRepeated) {
            for (id element in value) {
                [output writeField:field.getType number:field.getNumber value:element];
            }
        } else {
            [output writeField:field.getType number:field.getNumber value:value];
        }
    }
}

/**
 * See {@link Message#getSerializedSize()}.  It's up to the caller to cache
 * the resulting size if desired.
 */
- (int32_t) getSerializedSize {
    int32_t size = 0;
    for (PBFieldDescriptor* field in fields) {
        id value = [fields objectForKey:field];

        if (field.isExtension &&
            field.getContainingType.getOptions.getMessageSetWireFormat) {
            size += computeMessageSetExtensionSize(field.getNumber, value);
        } else {
            if (field.isRepeated) {
                for (id element in value) {
                    size += computeFieldSize(field.getType, field.getNumber, element);
                }
            } else {
                size += computeFieldSize(field.getType, field.getNumber, value);
            }
        }
    }
    return size;
}


@end
