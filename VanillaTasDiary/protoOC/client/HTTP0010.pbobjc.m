// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: client/http0010.proto

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

#import "client/HTTP0010.pbobjc.h"
#import "client/Common.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTOHTTP0010Root

@implementation PROTOHTTP0010Root

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - PROTOHTTP0010Root_FileDescriptor

static GPBFileDescriptor *PROTOHTTP0010Root_FileDescriptor(void) {
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

#pragma mark - PROTOHSC001017

@implementation PROTOHSC001017

@dynamic medalArray, medalArray_Count;

typedef struct PROTOHSC001017__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *medalArray;
} PROTOHSC001017__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "medalArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOMedal),
        .number = PROTOHSC001017_FieldNumber_MedalArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOHSC001017__storage_, medalArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHSC001017 class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHSC001017__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOMedal

@implementation PROTOMedal

@dynamic hasId_p, id_p;
@dynamic hasLostTime, lostTime;
@dynamic hasName, name;

typedef struct PROTOMedal__storage_ {
  uint32_t _has_storage_[1];
  int32_t lostTime;
  NSString *id_p;
  NSString *name;
} PROTOMedal__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMedal_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOMedal__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "lostTime",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMedal_FieldNumber_LostTime,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOMedal__storage_, lostTime),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMedal_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOMedal__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOMedal class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOMedal__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHSC001019

@implementation PROTOHSC001019

@dynamic hasIsWealth, isWealth;
@dynamic hasGold, gold;

typedef struct PROTOHSC001019__storage_ {
  uint32_t _has_storage_[1];
  int32_t gold;
} PROTOHSC001019__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "isWealth",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC001019_FieldNumber_IsWealth,
        .hasIndex = 0,
        .offset = 1,  // Stored in _has_storage_ to save space.
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "gold",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC001019_FieldNumber_Gold,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOHSC001019__storage_, gold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHSC001019 class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHSC001019__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOPlayerGift

@implementation PROTOPlayerGift

@dynamic hasPlayerId, playerId;
@dynamic hasGiftId, giftId;
@dynamic hasAmount, amount;
@dynamic hasGold, gold;

typedef struct PROTOPlayerGift__storage_ {
  uint32_t _has_storage_[1];
  uint32_t giftId;
  uint32_t amount;
  int64_t playerId;
  uint64_t gold;
} PROTOPlayerGift__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOPlayerGift_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOPlayerGift__storage_, playerId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "giftId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOPlayerGift_FieldNumber_GiftId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOPlayerGift__storage_, giftId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "amount",
        .dataTypeSpecific.className = NULL,
        .number = PROTOPlayerGift_FieldNumber_Amount,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOPlayerGift__storage_, amount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "gold",
        .dataTypeSpecific.className = NULL,
        .number = PROTOPlayerGift_FieldNumber_Gold,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOPlayerGift__storage_, gold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOPlayerGift class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOPlayerGift__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\001\010\000\002\006\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHSC001012

@implementation PROTOHSC001012

@dynamic listArray, listArray_Count;

typedef struct PROTOHSC001012__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PROTOHSC001012__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOPlayerGift),
        .number = PROTOHSC001012_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOHSC001012__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHSC001012 class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHSC001012__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBillInfo

@implementation PROTOBillInfo

@dynamic hasType, type;
@dynamic hasFansId, fansId;
@dynamic hasFansName, fansName;
@dynamic hasGiftId, giftId;
@dynamic hasGiftNum, giftNum;
@dynamic hasGold, gold;
@dynamic hasCreateAt, createAt;
@dynamic hasRemark, remark;
@dynamic hasFansIcon, fansIcon;

typedef struct PROTOBillInfo__storage_ {
  uint32_t _has_storage_[1];
  uint32_t type;
  uint32_t giftId;
  uint32_t giftNum;
  int32_t gold;
  uint32_t createAt;
  NSString *fansName;
  NSString *remark;
  NSString *fansIcon;
  int64_t fansId;
} PROTOBillInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "fansId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_FansId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, fansId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "fansName",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_FansName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, fansName),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "giftId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_GiftId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, giftId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "giftNum",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_GiftNum,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, giftNum),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "gold",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_Gold,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, gold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "createAt",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_CreateAt,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, createAt),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "remark",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_Remark,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, remark),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "fansIcon",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBillInfo_FieldNumber_FansIcon,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOBillInfo__storage_, fansIcon),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBillInfo class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOBillInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\006\002\006\000\003\010\000\004\006\000\005\007\000\007\010\000\t\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHCS001021

@implementation PROTOHCS001021

@dynamic hasPlayerId, playerId;
@dynamic hasType, type;
@dynamic hasPage, page;

typedef struct PROTOHCS001021__storage_ {
  uint32_t _has_storage_[1];
  uint32_t type;
  uint32_t page;
  int64_t playerId;
} PROTOHCS001021__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS001021_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOHCS001021__storage_, playerId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS001021_FieldNumber_Type,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOHCS001021__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "page",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHCS001021_FieldNumber_Page,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOHCS001021__storage_, page),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHCS001021 class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHCS001021__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOHSC001021

@implementation PROTOHSC001021

@dynamic hasType, type;
@dynamic hasPage, page;
@dynamic dataArray, dataArray_Count;

typedef struct PROTOHSC001021__storage_ {
  uint32_t _has_storage_[1];
  uint32_t type;
  uint32_t page;
  NSMutableArray *dataArray;
} PROTOHSC001021__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC001021_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOHSC001021__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "page",
        .dataTypeSpecific.className = NULL,
        .number = PROTOHSC001021_FieldNumber_Page,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOHSC001021__storage_, page),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "dataArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOBillInfo),
        .number = PROTOHSC001021_FieldNumber_DataArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOHSC001021__storage_, dataArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOHSC001021 class]
                                     rootClass:[PROTOHTTP0010Root class]
                                          file:PROTOHTTP0010Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOHSC001021__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)