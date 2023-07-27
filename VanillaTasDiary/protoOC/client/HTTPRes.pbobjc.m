// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: client/httpRes.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "client/HTTPRes.pbobjc.h"
#import "client/Common.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTOHTTPResRoot

@implementation PROTOHTTPResRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - PROTOHTTPResRoot_FileDescriptor

static GPBFileDescriptor *PROTOHTTPResRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"proto.client"
                                                 objcPrefix:@"PROTO"
                                                     syntax:GPBFileSyntaxProto2];
  }
  return descriptor;
}

#pragma mark - PROTOFiles

@implementation PROTOFiles

@dynamic hasNormal, normal;
@dynamic hasWidth, width;
@dynamic hasHeight, height;
@dynamic hasIsCutter, isCutter;

typedef struct PROTOFiles__storage_ {
  uint32_t _has_storage_[1];
  uint32_t width;
  uint32_t height;
  NSData *normal;
} PROTOFiles__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescriptionWithDefault fields[] = {
      {
        .defaultValue.valueData = nil,
        .core.name = "normal",
        .core.dataTypeSpecific.className = NULL,
        .core.number = PROTOFiles_FieldNumber_Normal,
        .core.hasIndex = 0,
        .core.offset = (uint32_t)offsetof(PROTOFiles__storage_, normal),
        .core.flags = GPBFieldOptional,
        .core.dataType = GPBDataTypeBytes,
      },
      {
        .defaultValue.valueUInt32 = 0U,
        .core.name = "width",
        .core.dataTypeSpecific.className = NULL,
        .core.number = PROTOFiles_FieldNumber_Width,
        .core.hasIndex = 1,
        .core.offset = (uint32_t)offsetof(PROTOFiles__storage_, width),
        .core.flags = GPBFieldOptional,
        .core.dataType = GPBDataTypeUInt32,
      },
      {
        .defaultValue.valueUInt32 = 0U,
        .core.name = "height",
        .core.dataTypeSpecific.className = NULL,
        .core.number = PROTOFiles_FieldNumber_Height,
        .core.hasIndex = 2,
        .core.offset = (uint32_t)offsetof(PROTOFiles__storage_, height),
        .core.flags = GPBFieldOptional,
        .core.dataType = GPBDataTypeUInt32,
      },
      {
        .defaultValue.valueBool = YES,
        .core.name = "isCutter",
        .core.dataTypeSpecific.className = NULL,
        .core.number = PROTOFiles_FieldNumber_IsCutter,
        .core.hasIndex = 3,
        .core.offset = 4,  // Stored in _has_storage_ to save space.
        .core.flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasDefaultValue | GPBFieldTextFormatNameCustom),
        .core.dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOFiles class]
                                     rootClass:[PROTOHTTPResRoot class]
                                          file:PROTOHTTPResRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescriptionWithDefault))
                                   storageSize:sizeof(PROTOFiles__storage_)
                                         flags:GPBDescriptorInitializationFlag_FieldsWithDefault];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\005\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHCS010001

@implementation PROTOHCS010001

@dynamic hasKey, key;
@dynamic filesArray, filesArray_Count;
@dynamic hasDynamicId, dynamicId;

typedef struct PROTOHCS010001__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  NSMutableArray *filesArray;
  uint64_t dynamicId;
} PROTOHCS010001__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010001_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOHCS010001__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "filesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOFiles),
        .number = PROTOHCS010001_FieldNumber_FilesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOHCS010001__storage_, filesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "dynamicId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010001_FieldNumber_DynamicId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOHCS010001__storage_, dynamicId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHCS010001 class]
                                     rootClass:[PROTOHTTPResRoot class]
                                          file:PROTOHTTPResRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHCS010001__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003\t\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHSC010001

@implementation PROTOHSC010001

@dynamic hasResult, result;
@dynamic hasIds, ids;
@dynamic hasDynamicId, dynamicId;
@dynamic hasPlayerId, playerId;
@dynamic hasImgStatus, imgStatus;

typedef struct PROTOHSC010001__storage_ {
  uint32_t _has_storage_[1];
  int32_t result;
  int32_t imgStatus;
  PROTOImageInfoList *ids;
  uint64_t dynamicId;
  uint64_t playerId;
} PROTOHSC010001__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "result",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC010001_FieldNumber_Result,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOHSC010001__storage_, result),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "ids",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOImageInfoList),
        .number = PROTOHSC010001_FieldNumber_Ids,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOHSC010001__storage_, ids),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "dynamicId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC010001_FieldNumber_DynamicId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOHSC010001__storage_, dynamicId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC010001_FieldNumber_PlayerId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOHSC010001__storage_, playerId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "imgStatus",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC010001_FieldNumber_ImgStatus,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOHSC010001__storage_, imgStatus),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHSC010001 class]
                                     rootClass:[PROTOHTTPResRoot class]
                                          file:PROTOHTTPResRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHSC010001__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\003\003\t\000\004\010\000\005\t\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHCS010006

@implementation PROTOHCS010006

@dynamic hasKey, key;
@dynamic filesArray, filesArray_Count;
@dynamic hasTargetId, targetId;
@dynamic hasTypes, types;
@dynamic hasRemark, remark;

typedef struct PROTOHCS010006__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  NSMutableArray *filesArray;
  NSString *types;
  NSString *remark;
  uint64_t targetId;
} PROTOHCS010006__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010006_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOHCS010006__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "filesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOFiles),
        .number = PROTOHCS010006_FieldNumber_FilesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOHCS010006__storage_, filesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "targetId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010006_FieldNumber_TargetId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOHCS010006__storage_, targetId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "types",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010006_FieldNumber_Types,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOHCS010006__storage_, types),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "remark",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS010006_FieldNumber_Remark,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOHCS010006__storage_, remark),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHCS010006 class]
                                     rootClass:[PROTOHTTPResRoot class]
                                          file:PROTOHTTPResRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHCS010006__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
