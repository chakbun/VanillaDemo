 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/CloudDiscoExt.pbobjc.h"
#import "pb/CommonExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3CloudDiscoExtRoot

@implementation PB3CloudDiscoExtRoot

 
 

@end

#pragma mark - PB3CloudDiscoExtRoot_FileDescriptor

static GPBFileDescriptor *PB3CloudDiscoExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3CloudDiscoState

GPBEnumDescriptor *PB3CloudDiscoState_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "CdsNormal\000CdsRock\000";
    static const int32_t values[] = {
        PB3CloudDiscoState_CdsNormal,
        PB3CloudDiscoState_CdsRock,
    };
    static const char *extraTextFormatInfo = "\002\000c\206\000\001c\204\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3CloudDiscoState)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3CloudDiscoState_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3CloudDiscoState_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3CloudDiscoState_CdsNormal:
    case PB3CloudDiscoState_CdsRock:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3CloudDiscoSceneType

GPBEnumDescriptor *PB3CloudDiscoSceneType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "CdstNone\000CdstRoom\000CdstDancer\000";
    static const int32_t values[] = {
        PB3CloudDiscoSceneType_CdstNone,
        PB3CloudDiscoSceneType_CdstRoom,
        PB3CloudDiscoSceneType_CdstDancer,
    };
    static const char *extraTextFormatInfo = "\003\000d\204\000\001d\204\000\002d\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3CloudDiscoSceneType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3CloudDiscoSceneType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3CloudDiscoSceneType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3CloudDiscoSceneType_CdstNone:
    case PB3CloudDiscoSceneType_CdstRoom:
    case PB3CloudDiscoSceneType_CdstDancer:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3CloudDiscoBoothPushType

GPBEnumDescriptor *PB3CloudDiscoBoothPushType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "CloudDiscoBoothPushNone\000CloudDiscoBoothP"
        "ushTiming\000CloudDiscoBoothPushUpDown\000";
    static const int32_t values[] = {
        PB3CloudDiscoBoothPushType_CloudDiscoBoothPushNone,
        PB3CloudDiscoBoothPushType_CloudDiscoBoothPushTiming,
        PB3CloudDiscoBoothPushType_CloudDiscoBoothPushUpDown,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3CloudDiscoBoothPushType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3CloudDiscoBoothPushType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3CloudDiscoBoothPushType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3CloudDiscoBoothPushType_CloudDiscoBoothPushNone:
    case PB3CloudDiscoBoothPushType_CloudDiscoBoothPushTiming:
    case PB3CloudDiscoBoothPushType_CloudDiscoBoothPushUpDown:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3CloudDiscoInRoomStatus

GPBEnumDescriptor *PB3CloudDiscoInRoomStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "InRoomStatusNone\000InRoomStatusIn\000InRoomSt"
        "atusLeave\000";
    static const int32_t values[] = {
        PB3CloudDiscoInRoomStatus_InRoomStatusNone,
        PB3CloudDiscoInRoomStatus_InRoomStatusIn,
        PB3CloudDiscoInRoomStatus_InRoomStatusLeave,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3CloudDiscoInRoomStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3CloudDiscoInRoomStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3CloudDiscoInRoomStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3CloudDiscoInRoomStatus_InRoomStatusNone:
    case PB3CloudDiscoInRoomStatus_InRoomStatusIn:
    case PB3CloudDiscoInRoomStatus_InRoomStatusLeave:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3CloudDiscoInfo

@implementation PB3CloudDiscoInfo

@dynamic state;
@dynamic rockVal;
@dynamic rockEndTime;
@dynamic timestamp;
@dynamic roomId;
@dynamic rockStartTime;
@dynamic hasDecorateInfo, decorateInfo;

typedef struct PB3CloudDiscoInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3CloudDiscoState state;
  PB3CloudDiscoDecorateInfo *decorateInfo;
  int64_t rockVal;
  int64_t rockEndTime;
  int64_t timestamp;
  int64_t roomId;
  int64_t rockStartTime;
} PB3CloudDiscoInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "state",
        .dataTypeSpecific.enumDescFunc = PB3CloudDiscoState_EnumDescriptor,
        .number = PB3CloudDiscoInfo_FieldNumber_State,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, state),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "rockVal",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoInfo_FieldNumber_RockVal,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, rockVal),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "rockEndTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoInfo_FieldNumber_RockEndTime,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, rockEndTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "timestamp",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoInfo_FieldNumber_Timestamp,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoInfo_FieldNumber_RoomId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "rockStartTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoInfo_FieldNumber_RockStartTime,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, rockStartTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "decorateInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoDecorateInfo),
        .number = PB3CloudDiscoInfo_FieldNumber_DecorateInfo,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3CloudDiscoInfo__storage_, decorateInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoInfo class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3CloudDiscoInfo_State_RawValue(PB3CloudDiscoInfo *message) {
  GPBDescriptor *descriptor = [PB3CloudDiscoInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoInfo_FieldNumber_State];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3CloudDiscoInfo_State_RawValue(PB3CloudDiscoInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3CloudDiscoInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoInfo_FieldNumber_State];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3PushCloudDiscoEnterRoom

@implementation PB3PushCloudDiscoEnterRoom

@dynamic hasInfo, info;
@dynamic dancerNum;
@dynamic isRoomShake;
@dynamic isChairShake;

typedef struct PB3PushCloudDiscoEnterRoom__storage_ {
  uint32_t _has_storage_[1];
  PB3CloudDiscoInfo *info;
  int64_t dancerNum;
} PB3PushCloudDiscoEnterRoom__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "info",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoInfo),
        .number = PB3PushCloudDiscoEnterRoom_FieldNumber_Info,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoEnterRoom__storage_, info),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "dancerNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoEnterRoom_FieldNumber_DancerNum,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoEnterRoom__storage_, dancerNum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "isRoomShake",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoEnterRoom_FieldNumber_IsRoomShake,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "isChairShake",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoEnterRoom_FieldNumber_IsChairShake,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PushCloudDiscoEnterRoom class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PushCloudDiscoEnterRoom__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CloudDiscoDecorateInfo

@implementation PB3CloudDiscoDecorateInfo

@dynamic decorateId;
@dynamic endTime;

typedef struct PB3CloudDiscoDecorateInfo__storage_ {
  uint32_t _has_storage_[1];
  int64_t decorateId;
  int64_t endTime;
} PB3CloudDiscoDecorateInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "decorateId",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoDecorateInfo_FieldNumber_DecorateId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoDecorateInfo__storage_, decorateId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "endTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoDecorateInfo_FieldNumber_EndTime,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoDecorateInfo__storage_, endTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoDecorateInfo class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoDecorateInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CloudDiscoDancerInfo

@implementation PB3CloudDiscoDancerInfo

@dynamic endTime;

typedef struct PB3CloudDiscoDancerInfo__storage_ {
  uint32_t _has_storage_[1];
  int64_t endTime;
} PB3CloudDiscoDancerInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "endTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoDancerInfo_FieldNumber_EndTime,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoDancerInfo__storage_, endTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoDancerInfo class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoDancerInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PushCloudDiscoSceneInfo

@implementation PB3PushCloudDiscoSceneInfo

@dynamic timestamp;
@dynamic sceneType;
@dynamic hasDecorateInfo, decorateInfo;
@dynamic hasDancerInfo, dancerInfo;
@dynamic giftFromPid;
@dynamic giftToPid;
@dynamic giftId;

typedef struct PB3PushCloudDiscoSceneInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3CloudDiscoSceneType sceneType;
  PB3CloudDiscoDecorateInfo *decorateInfo;
  PB3CloudDiscoDancerInfo *dancerInfo;
  int64_t timestamp;
  int64_t giftFromPid;
  int64_t giftToPid;
  int64_t giftId;
} PB3PushCloudDiscoSceneInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "timestamp",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_Timestamp,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "sceneType",
        .dataTypeSpecific.enumDescFunc = PB3CloudDiscoSceneType_EnumDescriptor,
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_SceneType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, sceneType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "decorateInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoDecorateInfo),
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_DecorateInfo,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, decorateInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "dancerInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoDancerInfo),
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_DancerInfo,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, dancerInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "giftFromPid",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_GiftFromPid,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, giftFromPid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "giftToPid",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_GiftToPid,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, giftToPid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "giftId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoSceneInfo_FieldNumber_GiftId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoSceneInfo__storage_, giftId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PushCloudDiscoSceneInfo class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PushCloudDiscoSceneInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3PushCloudDiscoSceneInfo_SceneType_RawValue(PB3PushCloudDiscoSceneInfo *message) {
  GPBDescriptor *descriptor = [PB3PushCloudDiscoSceneInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PushCloudDiscoSceneInfo_FieldNumber_SceneType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3PushCloudDiscoSceneInfo_SceneType_RawValue(PB3PushCloudDiscoSceneInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3PushCloudDiscoSceneInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PushCloudDiscoSceneInfo_FieldNumber_SceneType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3PushCloudDiscoDancerCfg

@implementation PB3PushCloudDiscoDancerCfg

@dynamic num;

typedef struct PB3PushCloudDiscoDancerCfg__storage_ {
  uint32_t _has_storage_[1];
  int64_t num;
} PB3PushCloudDiscoDancerCfg__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "num",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoDancerCfg_FieldNumber_Num,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoDancerCfg__storage_, num),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PushCloudDiscoDancerCfg class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PushCloudDiscoDancerCfg__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PushCloudDiscoRockBroadcast

@implementation PB3PushCloudDiscoRockBroadcast

@dynamic roomId;
@dynamic roomName;
@dynamic roomIcon;
@dynamic msg;

typedef struct PB3PushCloudDiscoRockBroadcast__storage_ {
  uint32_t _has_storage_[1];
  NSString *roomName;
  NSString *roomIcon;
  NSString *msg;
  int64_t roomId;
} PB3PushCloudDiscoRockBroadcast__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoRockBroadcast__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "roomName",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoRockBroadcast__storage_, roomName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "roomIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomIcon,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoRockBroadcast__storage_, roomIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "msg",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushCloudDiscoRockBroadcast_FieldNumber_Msg,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3PushCloudDiscoRockBroadcast__storage_, msg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PushCloudDiscoRockBroadcast class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PushCloudDiscoRockBroadcast__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CloudDiscoRankListReq

@implementation PB3CloudDiscoRankListReq


typedef struct PB3CloudDiscoRankListReq__storage_ {
  uint32_t _has_storage_[1];
} PB3CloudDiscoRankListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoRankListReq class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3CloudDiscoRankListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CloudDiscoRankListRes

@implementation PB3CloudDiscoRankListRes

@dynamic listArray, listArray_Count;
@dynamic hasMy, my;
@dynamic myRank;
@dynamic nextTime;
@dynamic threshold;

typedef struct PB3CloudDiscoRankListRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t myRank;
  NSMutableArray *listArray;
  PB3CloudDiscoRank *my;
  int64_t nextTime;
  int64_t threshold;
} PB3CloudDiscoRankListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoRank),
        .number = PB3CloudDiscoRankListRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRankListRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "my",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoRank),
        .number = PB3CloudDiscoRankListRes_FieldNumber_My,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRankListRes__storage_, my),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "myRank",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRankListRes_FieldNumber_MyRank,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRankListRes__storage_, myRank),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "nextTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRankListRes_FieldNumber_NextTime,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRankListRes__storage_, nextTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "threshold",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRankListRes_FieldNumber_Threshold,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRankListRes__storage_, threshold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoRankListRes class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoRankListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CloudDiscoRank

@implementation PB3CloudDiscoRank

@dynamic id_p;
@dynamic name;
@dynamic sex;
@dynamic wealthLevel;
@dynamic icon;
@dynamic score;
@dynamic gapScore;
@dynamic hasMaskInfo, maskInfo;

typedef struct PB3CloudDiscoRank__storage_ {
  uint32_t _has_storage_[1];
  PB3SexType sex;
  int32_t wealthLevel;
  NSString *name;
  NSString *icon;
  PB3MaskInfo *maskInfo;
  int64_t id_p;
  int64_t score;
  int64_t gapScore;
} PB3CloudDiscoRank__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sex",
        .dataTypeSpecific.enumDescFunc = PB3SexType_EnumDescriptor,
        .number = PB3CloudDiscoRank_FieldNumber_Sex,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, sex),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "wealthLevel",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_WealthLevel,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, wealthLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_Icon,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "score",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_Score,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, score),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "gapScore",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoRank_FieldNumber_GapScore,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, gapScore),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3CloudDiscoRank_FieldNumber_MaskInfo,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3CloudDiscoRank__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoRank class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoRank__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3CloudDiscoRank_Sex_RawValue(PB3CloudDiscoRank *message) {
  GPBDescriptor *descriptor = [PB3CloudDiscoRank descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoRank_FieldNumber_Sex];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3CloudDiscoRank_Sex_RawValue(PB3CloudDiscoRank *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3CloudDiscoRank descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoRank_FieldNumber_Sex];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3CloudDiscoBooth

@implementation PB3CloudDiscoBooth

@dynamic listArray, listArray_Count;
@dynamic timestamp;
@dynamic type;

typedef struct PB3CloudDiscoBooth__storage_ {
  uint32_t _has_storage_[1];
  PB3CloudDiscoBoothPushType type;
  NSMutableArray *listArray;
  int64_t timestamp;
} PB3CloudDiscoBooth__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoBoothSeat),
        .number = PB3CloudDiscoBooth_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBooth__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "timestamp",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoBooth_FieldNumber_Timestamp,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBooth__storage_, timestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = PB3CloudDiscoBoothPushType_EnumDescriptor,
        .number = PB3CloudDiscoBooth_FieldNumber_Type,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBooth__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoBooth class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoBooth__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3CloudDiscoBooth_Type_RawValue(PB3CloudDiscoBooth *message) {
  GPBDescriptor *descriptor = [PB3CloudDiscoBooth descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoBooth_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3CloudDiscoBooth_Type_RawValue(PB3CloudDiscoBooth *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3CloudDiscoBooth descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoBooth_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3CloudDiscoBoothSeat

@implementation PB3CloudDiscoBoothSeat

@dynamic id_p;
@dynamic icon;
@dynamic name;
@dynamic status;
@dynamic rank;
@dynamic hasMaskInfo, maskInfo;
@dynamic pickUpListArray, pickUpListArray_Count;

typedef struct PB3CloudDiscoBoothSeat__storage_ {
  uint32_t _has_storage_[1];
  PB3CloudDiscoInRoomStatus status;
  int32_t rank;
  NSString *icon;
  NSString *name;
  PB3MaskInfo *maskInfo;
  NSMutableArray *pickUpListArray;
  int64_t id_p;
} PB3CloudDiscoBoothSeat__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoBoothSeat_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoBoothSeat_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoBoothSeat_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PB3CloudDiscoInRoomStatus_EnumDescriptor,
        .number = PB3CloudDiscoBoothSeat_FieldNumber_Status,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "rank",
        .dataTypeSpecific.className = NULL,
        .number = PB3CloudDiscoBoothSeat_FieldNumber_Rank,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, rank),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3CloudDiscoBoothSeat_FieldNumber_MaskInfo,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pickUpListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CloudDiscoBoothSeat),
        .number = PB3CloudDiscoBoothSeat_FieldNumber_PickUpListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3CloudDiscoBoothSeat__storage_, pickUpListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CloudDiscoBoothSeat class]
                                     rootClass:[PB3CloudDiscoExtRoot class]
                                          file:PB3CloudDiscoExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CloudDiscoBoothSeat__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3CloudDiscoBoothSeat_Status_RawValue(PB3CloudDiscoBoothSeat *message) {
  GPBDescriptor *descriptor = [PB3CloudDiscoBoothSeat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoBoothSeat_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3CloudDiscoBoothSeat_Status_RawValue(PB3CloudDiscoBoothSeat *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3CloudDiscoBoothSeat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3CloudDiscoBoothSeat_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

 
