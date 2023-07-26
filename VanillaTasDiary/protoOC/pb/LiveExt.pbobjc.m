 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/LiveExt.pbobjc.h"
#import "pb/CommonExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3LiveExtRoot

@implementation PB3LiveExtRoot

 
 

@end

#pragma mark - PB3LiveExtRoot_FileDescriptor

static GPBFileDescriptor *PB3LiveExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3LiveCmdId

GPBEnumDescriptor *PB3LiveCmdId_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "LcNone\000LcLiveChannel\000LcLiveImCall\000LcLive"
        "Talk\000LcPlayerLiveDataUpdate\000LcPlayerMatc"
        "hTelepathy\000";
    static const int32_t values[] = {
        PB3LiveCmdId_LcNone,
        PB3LiveCmdId_LcLiveChannel,
        PB3LiveCmdId_LcLiveImCall,
        PB3LiveCmdId_LcLiveTalk,
        PB3LiveCmdId_LcPlayerLiveDataUpdate,
        PB3LiveCmdId_LcPlayerMatchTelepathy,
    };
    static const char *extraTextFormatInfo = "\001\001b\204\347\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveCmdId)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveCmdId_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveCmdId_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveCmdId_LcNone:
    case PB3LiveCmdId_LcLiveChannel:
    case PB3LiveCmdId_LcLiveImCall:
    case PB3LiveCmdId_LcLiveTalk:
    case PB3LiveCmdId_LcPlayerLiveDataUpdate:
    case PB3LiveCmdId_LcPlayerMatchTelepathy:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3LiveStickerType

GPBEnumDescriptor *PB3LiveStickerType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "LstNone\000LstCloth\000LstAll\000";
    static const int32_t values[] = {
        PB3LiveStickerType_LstNone,
        PB3LiveStickerType_LstCloth,
        PB3LiveStickerType_LstAll,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveStickerType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveStickerType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveStickerType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveStickerType_LstNone:
    case PB3LiveStickerType_LstCloth:
    case PB3LiveStickerType_LstAll:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3LiveSnapshotLayer

GPBEnumDescriptor *PB3LiveSnapshotLayer_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "LslNone\000LslFrontHair\000LslNakedModel\000LslBa"
        "ckHair\000LslCloth\000";
    static const int32_t values[] = {
        PB3LiveSnapshotLayer_LslNone,
        PB3LiveSnapshotLayer_LslFrontHair,
        PB3LiveSnapshotLayer_LslNakedModel,
        PB3LiveSnapshotLayer_LslBackHair,
        PB3LiveSnapshotLayer_LslCloth,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveSnapshotLayer)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveSnapshotLayer_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveSnapshotLayer_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveSnapshotLayer_LslNone:
    case PB3LiveSnapshotLayer_LslFrontHair:
    case PB3LiveSnapshotLayer_LslNakedModel:
    case PB3LiveSnapshotLayer_LslBackHair:
    case PB3LiveSnapshotLayer_LslCloth:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3LiveChannelScene

GPBEnumDescriptor *PB3LiveChannelScene_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "ScNone\000ScImCall\000ScMatch\000";
    static const int32_t values[] = {
        PB3LiveChannelScene_ScNone,
        PB3LiveChannelScene_ScImCall,
        PB3LiveChannelScene_ScMatch,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveChannelScene)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveChannelScene_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveChannelScene_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveChannelScene_ScNone:
    case PB3LiveChannelScene_ScImCall:
    case PB3LiveChannelScene_ScMatch:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3PlayerLiveDataPush

@implementation PB3PlayerLiveDataPush

@dynamic type;
@dynamic hearts;
@dynamic freeMatchTimes;

typedef struct PB3PlayerLiveDataPush__storage_ {
  uint32_t _has_storage_[1];
  PB3PlayerLiveDataPush_PushType type;
  int64_t hearts;
  int64_t freeMatchTimes;
} PB3PlayerLiveDataPush__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = PB3PlayerLiveDataPush_PushType_EnumDescriptor,
        .number = PB3PlayerLiveDataPush_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PlayerLiveDataPush__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "hearts",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerLiveDataPush_FieldNumber_Hearts,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PlayerLiveDataPush__storage_, hearts),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "freeMatchTimes",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerLiveDataPush_FieldNumber_FreeMatchTimes,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3PlayerLiveDataPush__storage_, freeMatchTimes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerLiveDataPush class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlayerLiveDataPush__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3PlayerLiveDataPush_Type_RawValue(PB3PlayerLiveDataPush *message) {
  GPBDescriptor *descriptor = [PB3PlayerLiveDataPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PlayerLiveDataPush_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3PlayerLiveDataPush_Type_RawValue(PB3PlayerLiveDataPush *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3PlayerLiveDataPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PlayerLiveDataPush_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3PlayerLiveDataPush_PushType

GPBEnumDescriptor *PB3PlayerLiveDataPush_PushType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Hearts\000FreeMatchTimes\000";
    static const int32_t values[] = {
        PB3PlayerLiveDataPush_PushType_None,
        PB3PlayerLiveDataPush_PushType_Hearts,
        PB3PlayerLiveDataPush_PushType_FreeMatchTimes,
    };
    static const char *extraTextFormatInfo = "\003\000\004\000\001\006\000\002\016\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PlayerLiveDataPush_PushType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PlayerLiveDataPush_PushType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PlayerLiveDataPush_PushType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PlayerLiveDataPush_PushType_None:
    case PB3PlayerLiveDataPush_PushType_Hearts:
    case PB3PlayerLiveDataPush_PushType_FreeMatchTimes:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveSnapshot

@implementation PB3LiveSnapshot

@dynamic URL;
@dynamic layer;

typedef struct PB3LiveSnapshot__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveSnapshotLayer layer;
  NSString *URL;
} PB3LiveSnapshot__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "URL",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveSnapshot_FieldNumber_URL,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveSnapshot__storage_, URL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "layer",
        .dataTypeSpecific.enumDescFunc = PB3LiveSnapshotLayer_EnumDescriptor,
        .number = PB3LiveSnapshot_FieldNumber_Layer,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveSnapshot__storage_, layer),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveSnapshot class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveSnapshot__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001!!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveSnapshot_Layer_RawValue(PB3LiveSnapshot *message) {
  GPBDescriptor *descriptor = [PB3LiveSnapshot descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveSnapshot_FieldNumber_Layer];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveSnapshot_Layer_RawValue(PB3LiveSnapshot *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveSnapshot descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveSnapshot_FieldNumber_Layer];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3LiveModel

@implementation PB3LiveModel

@dynamic modelId;
@dynamic modelName;
@dynamic zipName;
@dynamic resURL;
@dynamic md5Sum;
@dynamic snapshotsArray, snapshotsArray_Count;

typedef struct PB3LiveModel__storage_ {
  uint32_t _has_storage_[1];
  NSString *modelName;
  NSString *zipName;
  NSString *resURL;
  NSString *md5Sum;
  NSMutableArray *snapshotsArray;
  int64_t modelId;
} PB3LiveModel__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "modelId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveModel_FieldNumber_ModelId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, modelId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "modelName",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveModel_FieldNumber_ModelName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, modelName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "zipName",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveModel_FieldNumber_ZipName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, zipName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "resURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveModel_FieldNumber_ResURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, resURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "md5Sum",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveModel_FieldNumber_Md5Sum,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, md5Sum),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "snapshotsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveSnapshot),
        .number = PB3LiveModel_FieldNumber_SnapshotsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3LiveModel__storage_, snapshotsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveModel class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveModel__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\004\003\241!!\000\006\003#\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveSticker

@implementation PB3LiveSticker

@dynamic stickerId;
@dynamic name;
@dynamic stickerType;
@dynamic resURL;
@dynamic hasSnapshot, snapshot;

typedef struct PB3LiveSticker__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveStickerType stickerType;
  NSString *name;
  NSString *resURL;
  PB3LiveSnapshot *snapshot;
  int64_t stickerId;
} PB3LiveSticker__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "stickerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveSticker_FieldNumber_StickerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveSticker__storage_, stickerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveSticker_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveSticker__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "stickerType",
        .dataTypeSpecific.enumDescFunc = PB3LiveStickerType_EnumDescriptor,
        .number = PB3LiveSticker_FieldNumber_StickerType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveSticker__storage_, stickerType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "resURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveSticker_FieldNumber_ResURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3LiveSticker__storage_, resURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "snapshot",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveSnapshot),
        .number = PB3LiveSticker_FieldNumber_Snapshot,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3LiveSticker__storage_, snapshot),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveSticker class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveSticker__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\004\003\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveSticker_StickerType_RawValue(PB3LiveSticker *message) {
  GPBDescriptor *descriptor = [PB3LiveSticker descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveSticker_FieldNumber_StickerType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveSticker_StickerType_RawValue(PB3LiveSticker *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveSticker descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveSticker_FieldNumber_StickerType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3LiveTalkReq

@implementation PB3LiveTalkReq

@dynamic channelId;

typedef struct PB3LiveTalkReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t channelId;
} PB3LiveTalkReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "channelId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkReq_FieldNumber_ChannelId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkReq__storage_, channelId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveTalkRes

@implementation PB3LiveTalkRes

@dynamic hasTargetPlayer, targetPlayer;
@dynamic selfShowCodeName;
@dynamic targetShowCodeName;
@dynamic timeOut;
@dynamic scene;
@dynamic matchTipsArray, matchTipsArray_Count;
@dynamic likeTarget;
@dynamic talkTime;

typedef struct PB3LiveTalkRes__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveChannelScene scene;
  PB3PlayerInfo *targetPlayer;
  NSMutableArray *matchTipsArray;
  int64_t timeOut;
  int64_t talkTime;
} PB3LiveTalkRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "targetPlayer",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerInfo),
        .number = PB3LiveTalkRes_FieldNumber_TargetPlayer,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkRes__storage_, targetPlayer),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "selfShowCodeName",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_SelfShowCodeName,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "targetShowCodeName",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_TargetShowCodeName,
        .hasIndex = 3,
        .offset = 4,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "timeOut",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_TimeOut,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3LiveTalkRes__storage_, timeOut),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "scene",
        .dataTypeSpecific.enumDescFunc = PB3LiveChannelScene_EnumDescriptor,
        .number = PB3LiveTalkRes_FieldNumber_Scene,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3LiveTalkRes__storage_, scene),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "matchTipsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_MatchTipsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3LiveTalkRes__storage_, matchTipsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "likeTarget",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_LikeTarget,
        .hasIndex = 7,
        .offset = 8,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "talkTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkRes_FieldNumber_TalkTime,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3LiveTalkRes__storage_, talkTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveTalkRes_Scene_RawValue(PB3LiveTalkRes *message) {
  GPBDescriptor *descriptor = [PB3LiveTalkRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkRes_FieldNumber_Scene];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveTalkRes_Scene_RawValue(PB3LiveTalkRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveTalkRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkRes_FieldNumber_Scene];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetVoiceIdentifyConfReq

@implementation PB3GetVoiceIdentifyConfReq


typedef struct PB3GetVoiceIdentifyConfReq__storage_ {
  uint32_t _has_storage_[1];
} PB3GetVoiceIdentifyConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetVoiceIdentifyConfReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetVoiceIdentifyConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetVoiceIdentifyConfRes

@implementation PB3GetVoiceIdentifyConfRes

@dynamic costGold;
@dynamic descURL;
@dynamic freeTimes;
@dynamic promptsArray, promptsArray_Count;
@dynamic qrCodeURL;

typedef struct PB3GetVoiceIdentifyConfRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *descURL;
  NSMutableArray *promptsArray;
  NSString *qrCodeURL;
  int64_t costGold;
  int64_t freeTimes;
} PB3GetVoiceIdentifyConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "costGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_FieldNumber_CostGold,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes__storage_, costGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "descURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_FieldNumber_DescURL,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes__storage_, descURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "freeTimes",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_FieldNumber_FreeTimes,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes__storage_, freeTimes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "promptsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3GetVoiceIdentifyConfRes_Prompt),
        .number = PB3GetVoiceIdentifyConfRes_FieldNumber_PromptsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes__storage_, promptsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "qrCodeURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_FieldNumber_QrCodeURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes__storage_, qrCodeURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetVoiceIdentifyConfRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetVoiceIdentifyConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\002\004\241!!\000\005\002\244\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetVoiceIdentifyConfRes_Prompt

@implementation PB3GetVoiceIdentifyConfRes_Prompt

@dynamic title;
@dynamic text;

typedef struct PB3GetVoiceIdentifyConfRes_Prompt__storage_ {
  uint32_t _has_storage_[1];
  NSString *title;
  NSString *text;
} PB3GetVoiceIdentifyConfRes_Prompt__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "title",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_Prompt_FieldNumber_Title,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes_Prompt__storage_, title),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "text",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceIdentifyConfRes_Prompt_FieldNumber_Text,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetVoiceIdentifyConfRes_Prompt__storage_, text),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetVoiceIdentifyConfRes_Prompt class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetVoiceIdentifyConfRes_Prompt__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(PB3GetVoiceIdentifyConfRes)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3VoiceIdentifyReq

@implementation PB3VoiceIdentifyReq

@dynamic gender;
@dynamic voiceURL;

typedef struct PB3VoiceIdentifyReq__storage_ {
  uint32_t _has_storage_[1];
  PB3SexType gender;
  NSString *voiceURL;
} PB3VoiceIdentifyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "gender",
        .dataTypeSpecific.enumDescFunc = PB3SexType_EnumDescriptor,
        .number = PB3VoiceIdentifyReq_FieldNumber_Gender,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyReq__storage_, gender),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "voiceURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3VoiceIdentifyReq_FieldNumber_VoiceURL,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyReq__storage_, voiceURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3VoiceIdentifyReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3VoiceIdentifyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002\005\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3VoiceIdentifyReq_Gender_RawValue(PB3VoiceIdentifyReq *message) {
  GPBDescriptor *descriptor = [PB3VoiceIdentifyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3VoiceIdentifyReq_FieldNumber_Gender];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3VoiceIdentifyReq_Gender_RawValue(PB3VoiceIdentifyReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3VoiceIdentifyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3VoiceIdentifyReq_FieldNumber_Gender];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3VoiceIdentifyRes

@implementation PB3VoiceIdentifyRes

@dynamic hasVoiceFeature, voiceFeature;
@dynamic hasCharacter, character;
@dynamic freeTimes;
@dynamic costGold;

typedef struct PB3VoiceIdentifyRes__storage_ {
  uint32_t _has_storage_[1];
  PB3VoiceFeature *voiceFeature;
  PB3LiveCharacter *character;
  int64_t freeTimes;
  int64_t costGold;
} PB3VoiceIdentifyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "voiceFeature",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3VoiceFeature),
        .number = PB3VoiceIdentifyRes_FieldNumber_VoiceFeature,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyRes__storage_, voiceFeature),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "character",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveCharacter),
        .number = PB3VoiceIdentifyRes_FieldNumber_Character,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyRes__storage_, character),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "freeTimes",
        .dataTypeSpecific.className = NULL,
        .number = PB3VoiceIdentifyRes_FieldNumber_FreeTimes,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyRes__storage_, freeTimes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "costGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3VoiceIdentifyRes_FieldNumber_CostGold,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3VoiceIdentifyRes__storage_, costGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3VoiceIdentifyRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3VoiceIdentifyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetLiveMatchConfReq

@implementation PB3GetLiveMatchConfReq


typedef struct PB3GetLiveMatchConfReq__storage_ {
  uint32_t _has_storage_[1];
} PB3GetLiveMatchConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetLiveMatchConfReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetLiveMatchConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetLiveMatchConfRes

@implementation PB3GetLiveMatchConfRes

@dynamic freeTimes;
@dynamic matchCostGold;
@dynamic delayCostGold;
@dynamic timeOut;
@dynamic delayCostGift;
@dynamic goldDelayTime;
@dynamic giftDelayTime;

typedef struct PB3GetLiveMatchConfRes__storage_ {
  uint32_t _has_storage_[1];
  int64_t freeTimes;
  int64_t matchCostGold;
  int64_t delayCostGold;
  int64_t timeOut;
  int64_t delayCostGift;
  int64_t goldDelayTime;
  int64_t giftDelayTime;
} PB3GetLiveMatchConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "freeTimes",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_FreeTimes,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, freeTimes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "matchCostGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_MatchCostGold,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, matchCostGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "delayCostGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_DelayCostGold,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, delayCostGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "timeOut",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_TimeOut,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, timeOut),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "delayCostGift",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_DelayCostGift,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, delayCostGift),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "goldDelayTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_GoldDelayTime,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, goldDelayTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "giftDelayTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetLiveMatchConfRes_FieldNumber_GiftDelayTime,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3GetLiveMatchConfRes__storage_, giftDelayTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetLiveMatchConfRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetLiveMatchConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveMatchReq

@implementation PB3LiveMatchReq

@dynamic oper;

typedef struct PB3LiveMatchReq__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveMatchReq_MatchOper oper;
} PB3LiveMatchReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oper",
        .dataTypeSpecific.enumDescFunc = PB3LiveMatchReq_MatchOper_EnumDescriptor,
        .number = PB3LiveMatchReq_FieldNumber_Oper,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveMatchReq__storage_, oper),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveMatchReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveMatchReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveMatchReq_Oper_RawValue(PB3LiveMatchReq *message) {
  GPBDescriptor *descriptor = [PB3LiveMatchReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveMatchReq_FieldNumber_Oper];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveMatchReq_Oper_RawValue(PB3LiveMatchReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveMatchReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveMatchReq_FieldNumber_Oper];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveMatchReq_MatchOper

GPBEnumDescriptor *PB3LiveMatchReq_MatchOper_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Apply\000Cancel\000";
    static const int32_t values[] = {
        PB3LiveMatchReq_MatchOper_None,
        PB3LiveMatchReq_MatchOper_Apply,
        PB3LiveMatchReq_MatchOper_Cancel,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveMatchReq_MatchOper)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveMatchReq_MatchOper_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveMatchReq_MatchOper_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveMatchReq_MatchOper_None:
    case PB3LiveMatchReq_MatchOper_Apply:
    case PB3LiveMatchReq_MatchOper_Cancel:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveMatchRes

@implementation PB3LiveMatchRes

@dynamic feedbackTipsArray, feedbackTipsArray_Count;
@dynamic recommendArray, recommendArray_Count;

typedef struct PB3LiveMatchRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *feedbackTipsArray;
  NSMutableArray *recommendArray;
} PB3LiveMatchRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "feedbackTipsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveMatchRes_FieldNumber_FeedbackTipsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3LiveMatchRes__storage_, feedbackTipsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "recommendArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveMatchRes_LiveRecommend),
        .number = PB3LiveMatchRes_FieldNumber_RecommendArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3LiveMatchRes__storage_, recommendArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveMatchRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveMatchRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveMatchRes_LiveRecommend

@implementation PB3LiveMatchRes_LiveRecommend

@dynamic playerId;
@dynamic icon;
@dynamic router;

typedef struct PB3LiveMatchRes_LiveRecommend__storage_ {
  uint32_t _has_storage_[1];
  NSString *icon;
  NSString *router;
  int64_t playerId;
} PB3LiveMatchRes_LiveRecommend__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveMatchRes_LiveRecommend_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveMatchRes_LiveRecommend__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveMatchRes_LiveRecommend_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveMatchRes_LiveRecommend__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "router",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveMatchRes_LiveRecommend_FieldNumber_Router,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveMatchRes_LiveRecommend__storage_, router),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveMatchRes_LiveRecommend class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveMatchRes_LiveRecommend__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(PB3LiveMatchRes)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveCallInviteReq

@implementation PB3LiveCallInviteReq

@dynamic targetPlayerId;
@dynamic oper;

typedef struct PB3LiveCallInviteReq__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveCallInviteReq_InviteOper oper;
  int64_t targetPlayerId;
} PB3LiveCallInviteReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "targetPlayerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveCallInviteReq_FieldNumber_TargetPlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveCallInviteReq__storage_, targetPlayerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "oper",
        .dataTypeSpecific.enumDescFunc = PB3LiveCallInviteReq_InviteOper_EnumDescriptor,
        .number = PB3LiveCallInviteReq_FieldNumber_Oper,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveCallInviteReq__storage_, oper),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveCallInviteReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveCallInviteReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveCallInviteReq_Oper_RawValue(PB3LiveCallInviteReq *message) {
  GPBDescriptor *descriptor = [PB3LiveCallInviteReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveCallInviteReq_FieldNumber_Oper];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveCallInviteReq_Oper_RawValue(PB3LiveCallInviteReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveCallInviteReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveCallInviteReq_FieldNumber_Oper];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveCallInviteReq_InviteOper

GPBEnumDescriptor *PB3LiveCallInviteReq_InviteOper_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Apply\000Cancel\000";
    static const int32_t values[] = {
        PB3LiveCallInviteReq_InviteOper_None,
        PB3LiveCallInviteReq_InviteOper_Apply,
        PB3LiveCallInviteReq_InviteOper_Cancel,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveCallInviteReq_InviteOper)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveCallInviteReq_InviteOper_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveCallInviteReq_InviteOper_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveCallInviteReq_InviteOper_None:
    case PB3LiveCallInviteReq_InviteOper_Apply:
    case PB3LiveCallInviteReq_InviteOper_Cancel:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveCallInviteRes

@implementation PB3LiveCallInviteRes

@dynamic hasTargetPlayerInfo, targetPlayerInfo;

typedef struct PB3LiveCallInviteRes__storage_ {
  uint32_t _has_storage_[1];
  PB3PlayerInfo *targetPlayerInfo;
} PB3LiveCallInviteRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "targetPlayerInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerInfo),
        .number = PB3LiveCallInviteRes_FieldNumber_TargetPlayerInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveCallInviteRes__storage_, targetPlayerInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveCallInviteRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveCallInviteRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveCallReplyReq

@implementation PB3LiveCallReplyReq

@dynamic oper;
@dynamic targetPlayerId;

typedef struct PB3LiveCallReplyReq__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveCallReplyReq_ReplyOper oper;
  int64_t targetPlayerId;
} PB3LiveCallReplyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oper",
        .dataTypeSpecific.enumDescFunc = PB3LiveCallReplyReq_ReplyOper_EnumDescriptor,
        .number = PB3LiveCallReplyReq_FieldNumber_Oper,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveCallReplyReq__storage_, oper),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "targetPlayerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveCallReplyReq_FieldNumber_TargetPlayerId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveCallReplyReq__storage_, targetPlayerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveCallReplyReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveCallReplyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveCallReplyReq_Oper_RawValue(PB3LiveCallReplyReq *message) {
  GPBDescriptor *descriptor = [PB3LiveCallReplyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveCallReplyReq_FieldNumber_Oper];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveCallReplyReq_Oper_RawValue(PB3LiveCallReplyReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveCallReplyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveCallReplyReq_FieldNumber_Oper];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveCallReplyReq_ReplyOper

GPBEnumDescriptor *PB3LiveCallReplyReq_ReplyOper_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Receive\000Deny\000Ignore\000";
    static const int32_t values[] = {
        PB3LiveCallReplyReq_ReplyOper_None,
        PB3LiveCallReplyReq_ReplyOper_Receive,
        PB3LiveCallReplyReq_ReplyOper_Deny,
        PB3LiveCallReplyReq_ReplyOper_Ignore,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveCallReplyReq_ReplyOper)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveCallReplyReq_ReplyOper_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveCallReplyReq_ReplyOper_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveCallReplyReq_ReplyOper_None:
    case PB3LiveCallReplyReq_ReplyOper_Receive:
    case PB3LiveCallReplyReq_ReplyOper_Deny:
    case PB3LiveCallReplyReq_ReplyOper_Ignore:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveCallReplyRes

@implementation PB3LiveCallReplyRes


typedef struct PB3LiveCallReplyRes__storage_ {
  uint32_t _has_storage_[1];
} PB3LiveCallReplyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveCallReplyRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3LiveCallReplyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveTalkSyncReq

@implementation PB3LiveTalkSyncReq

@dynamic oper;
@dynamic actionIdx;

typedef struct PB3LiveTalkSyncReq__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveTalkSyncReq_SyncOper oper;
  int64_t actionIdx;
} PB3LiveTalkSyncReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oper",
        .dataTypeSpecific.enumDescFunc = PB3LiveTalkSyncReq_SyncOper_EnumDescriptor,
        .number = PB3LiveTalkSyncReq_FieldNumber_Oper,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkSyncReq__storage_, oper),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "actionIdx",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkSyncReq_FieldNumber_ActionIdx,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveTalkSyncReq__storage_, actionIdx),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkSyncReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkSyncReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveTalkSyncReq_Oper_RawValue(PB3LiveTalkSyncReq *message) {
  GPBDescriptor *descriptor = [PB3LiveTalkSyncReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkSyncReq_FieldNumber_Oper];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveTalkSyncReq_Oper_RawValue(PB3LiveTalkSyncReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveTalkSyncReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkSyncReq_FieldNumber_Oper];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveTalkSyncReq_SyncOper

GPBEnumDescriptor *PB3LiveTalkSyncReq_SyncOper_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Like\000InviteShow\000ShowSelf\000Hangup\000Tou"
        "chSelfHead\000TouchTargetHead\000TouchSelfBody"
        "\000TouchTargetBody\000";
    static const int32_t values[] = {
        PB3LiveTalkSyncReq_SyncOper_None,
        PB3LiveTalkSyncReq_SyncOper_Like,
        PB3LiveTalkSyncReq_SyncOper_InviteShow,
        PB3LiveTalkSyncReq_SyncOper_ShowSelf,
        PB3LiveTalkSyncReq_SyncOper_Hangup,
        PB3LiveTalkSyncReq_SyncOper_TouchSelfHead,
        PB3LiveTalkSyncReq_SyncOper_TouchTargetHead,
        PB3LiveTalkSyncReq_SyncOper_TouchSelfBody,
        PB3LiveTalkSyncReq_SyncOper_TouchTargetBody,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveTalkSyncReq_SyncOper)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveTalkSyncReq_SyncOper_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveTalkSyncReq_SyncOper_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveTalkSyncReq_SyncOper_None:
    case PB3LiveTalkSyncReq_SyncOper_Like:
    case PB3LiveTalkSyncReq_SyncOper_InviteShow:
    case PB3LiveTalkSyncReq_SyncOper_ShowSelf:
    case PB3LiveTalkSyncReq_SyncOper_Hangup:
    case PB3LiveTalkSyncReq_SyncOper_TouchSelfHead:
    case PB3LiveTalkSyncReq_SyncOper_TouchTargetHead:
    case PB3LiveTalkSyncReq_SyncOper_TouchSelfBody:
    case PB3LiveTalkSyncReq_SyncOper_TouchTargetBody:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveTalkSyncRes

@implementation PB3LiveTalkSyncRes

@dynamic talkTime;

typedef struct PB3LiveTalkSyncRes__storage_ {
  uint32_t _has_storage_[1];
  int64_t talkTime;
} PB3LiveTalkSyncRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "talkTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkSyncRes_FieldNumber_TalkTime,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkSyncRes__storage_, talkTime),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkSyncRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkSyncRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\004\204\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveTalkDelayReq

@implementation PB3LiveTalkDelayReq


typedef struct PB3LiveTalkDelayReq__storage_ {
  uint32_t _has_storage_[1];
} PB3LiveTalkDelayReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkDelayReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3LiveTalkDelayReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveTalkDelayRes

@implementation PB3LiveTalkDelayRes

@dynamic timeOut;
@dynamic costGold;

typedef struct PB3LiveTalkDelayRes__storage_ {
  uint32_t _has_storage_[1];
  int64_t timeOut;
  int64_t costGold;
} PB3LiveTalkDelayRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "timeOut",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkDelayRes_FieldNumber_TimeOut,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkDelayRes__storage_, timeOut),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "costGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkDelayRes_FieldNumber_CostGold,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveTalkDelayRes__storage_, costGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkDelayRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkDelayRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportFeedbackReq

@implementation PB3ReportFeedbackReq

@dynamic content;
@dynamic tipsArray, tipsArray_Count;
@dynamic targetId;
@dynamic feedBack;

typedef struct PB3ReportFeedbackReq__storage_ {
  uint32_t _has_storage_[1];
  PB3ReportFeedbackReq_Feedback feedBack;
  NSString *content;
  NSMutableArray *tipsArray;
  int64_t targetId;
} PB3ReportFeedbackReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "content",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportFeedbackReq_FieldNumber_Content,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportFeedbackReq__storage_, content),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tipsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportFeedbackReq_FieldNumber_TipsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3ReportFeedbackReq__storage_, tipsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportFeedbackReq_FieldNumber_TargetId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReportFeedbackReq__storage_, targetId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "feedBack",
        .dataTypeSpecific.enumDescFunc = PB3ReportFeedbackReq_Feedback_EnumDescriptor,
        .number = PB3ReportFeedbackReq_FieldNumber_FeedBack,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3ReportFeedbackReq__storage_, feedBack),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportFeedbackReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportFeedbackReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3ReportFeedbackReq_FeedBack_RawValue(PB3ReportFeedbackReq *message) {
  GPBDescriptor *descriptor = [PB3ReportFeedbackReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportFeedbackReq_FieldNumber_FeedBack];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3ReportFeedbackReq_FeedBack_RawValue(PB3ReportFeedbackReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3ReportFeedbackReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportFeedbackReq_FieldNumber_FeedBack];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3ReportFeedbackReq_Feedback

GPBEnumDescriptor *PB3ReportFeedbackReq_Feedback_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000Satisfy\000UnSatisfy\000";
    static const int32_t values[] = {
        PB3ReportFeedbackReq_Feedback_None,
        PB3ReportFeedbackReq_Feedback_Satisfy,
        PB3ReportFeedbackReq_Feedback_UnSatisfy,
    };
    static const char *extraTextFormatInfo = "\003\000\004\000\001\007\000\002\t\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3ReportFeedbackReq_Feedback)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3ReportFeedbackReq_Feedback_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3ReportFeedbackReq_Feedback_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3ReportFeedbackReq_Feedback_None:
    case PB3ReportFeedbackReq_Feedback_Satisfy:
    case PB3ReportFeedbackReq_Feedback_UnSatisfy:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3ReportFeedbackRes

@implementation PB3ReportFeedbackRes


typedef struct PB3ReportFeedbackRes__storage_ {
  uint32_t _has_storage_[1];
} PB3ReportFeedbackRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportFeedbackRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ReportFeedbackRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ClearCharacterReq

@implementation PB3ClearCharacterReq


typedef struct PB3ClearCharacterReq__storage_ {
  uint32_t _has_storage_[1];
} PB3ClearCharacterReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ClearCharacterReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ClearCharacterReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ClearCharacterRes

@implementation PB3ClearCharacterRes


typedef struct PB3ClearCharacterRes__storage_ {
  uint32_t _has_storage_[1];
} PB3ClearCharacterRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ClearCharacterRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ClearCharacterRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ResetCodenameReq

@implementation PB3ResetCodenameReq


typedef struct PB3ResetCodenameReq__storage_ {
  uint32_t _has_storage_[1];
} PB3ResetCodenameReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ResetCodenameReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ResetCodenameReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ResetCodenameRes

@implementation PB3ResetCodenameRes

@dynamic codeName;

typedef struct PB3ResetCodenameRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *codeName;
} PB3ResetCodenameRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "codeName",
        .dataTypeSpecific.className = NULL,
        .number = PB3ResetCodenameRes_FieldNumber_CodeName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ResetCodenameRes__storage_, codeName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ResetCodenameRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ResetCodenameRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetVoiceFeatureReq

@implementation PB3GetVoiceFeatureReq


typedef struct PB3GetVoiceFeatureReq__storage_ {
  uint32_t _has_storage_[1];
} PB3GetVoiceFeatureReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetVoiceFeatureReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetVoiceFeatureReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetVoiceFeatureRes

@implementation PB3GetVoiceFeatureRes

@dynamic hasFeature, feature;
@dynamic freeClearTimes;
@dynamic clearCostGold;
@dynamic qrCodeURL;

typedef struct PB3GetVoiceFeatureRes__storage_ {
  uint32_t _has_storage_[1];
  PB3VoiceFeature *feature;
  NSString *qrCodeURL;
  int64_t freeClearTimes;
  int64_t clearCostGold;
} PB3GetVoiceFeatureRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "feature",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3VoiceFeature),
        .number = PB3GetVoiceFeatureRes_FieldNumber_Feature,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetVoiceFeatureRes__storage_, feature),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "freeClearTimes",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceFeatureRes_FieldNumber_FreeClearTimes,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetVoiceFeatureRes__storage_, freeClearTimes),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "clearCostGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceFeatureRes_FieldNumber_ClearCostGold,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetVoiceFeatureRes__storage_, clearCostGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "qrCodeURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetVoiceFeatureRes_FieldNumber_QrCodeURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetVoiceFeatureRes__storage_, qrCodeURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetVoiceFeatureRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetVoiceFeatureRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\005\002\244\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CanLiveCallInviteReq

@implementation PB3CanLiveCallInviteReq

@dynamic targetId;

typedef struct PB3CanLiveCallInviteReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t targetId;
} PB3CanLiveCallInviteReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "targetId",
        .dataTypeSpecific.className = NULL,
        .number = PB3CanLiveCallInviteReq_FieldNumber_TargetId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CanLiveCallInviteReq__storage_, targetId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CanLiveCallInviteReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CanLiveCallInviteReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CanLiveCallInviteRes

@implementation PB3CanLiveCallInviteRes


typedef struct PB3CanLiveCallInviteRes__storage_ {
  uint32_t _has_storage_[1];
} PB3CanLiveCallInviteRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CanLiveCallInviteRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3CanLiveCallInviteRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3LiveChannelPush

@implementation PB3LiveChannelPush

@dynamic channelId;
@dynamic token;
@dynamic scene;
@dynamic caller;

typedef struct PB3LiveChannelPush__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveChannelScene scene;
  NSString *token;
  int64_t channelId;
  int64_t caller;
} PB3LiveChannelPush__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "channelId",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveChannelPush_FieldNumber_ChannelId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveChannelPush__storage_, channelId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "token",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveChannelPush_FieldNumber_Token,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveChannelPush__storage_, token),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "scene",
        .dataTypeSpecific.enumDescFunc = PB3LiveChannelScene_EnumDescriptor,
        .number = PB3LiveChannelPush_FieldNumber_Scene,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveChannelPush__storage_, scene),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "caller",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveChannelPush_FieldNumber_Caller,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3LiveChannelPush__storage_, caller),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveChannelPush class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveChannelPush__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveChannelPush_Scene_RawValue(PB3LiveChannelPush *message) {
  GPBDescriptor *descriptor = [PB3LiveChannelPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveChannelPush_FieldNumber_Scene];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveChannelPush_Scene_RawValue(PB3LiveChannelPush *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveChannelPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveChannelPush_FieldNumber_Scene];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3LiveIMPush

@implementation PB3LiveIMPush

@dynamic type;
@dynamic hasTargetPlayerInfo, targetPlayerInfo;
@dynamic caller;

typedef struct PB3LiveIMPush__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveIMPush_PushType type;
  PB3PlayerInfo *targetPlayerInfo;
  int64_t caller;
} PB3LiveIMPush__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = PB3LiveIMPush_PushType_EnumDescriptor,
        .number = PB3LiveIMPush_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveIMPush__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "targetPlayerInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerInfo),
        .number = PB3LiveIMPush_FieldNumber_TargetPlayerInfo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveIMPush__storage_, targetPlayerInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "caller",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveIMPush_FieldNumber_Caller,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveIMPush__storage_, caller),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveIMPush class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveIMPush__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveIMPush_Type_RawValue(PB3LiveIMPush *message) {
  GPBDescriptor *descriptor = [PB3LiveIMPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveIMPush_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveIMPush_Type_RawValue(PB3LiveIMPush *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveIMPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveIMPush_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveIMPush_PushType

GPBEnumDescriptor *PB3LiveIMPush_PushType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000SomeoneCallMe\000TargetCancel\000TargetRe"
        "ceive\000TargetDeny\000";
    static const int32_t values[] = {
        PB3LiveIMPush_PushType_None,
        PB3LiveIMPush_PushType_SomeoneCallMe,
        PB3LiveIMPush_PushType_TargetCancel,
        PB3LiveIMPush_PushType_TargetReceive,
        PB3LiveIMPush_PushType_TargetDeny,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveIMPush_PushType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveIMPush_PushType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveIMPush_PushType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveIMPush_PushType_None:
    case PB3LiveIMPush_PushType_SomeoneCallMe:
    case PB3LiveIMPush_PushType_TargetCancel:
    case PB3LiveIMPush_PushType_TargetReceive:
    case PB3LiveIMPush_PushType_TargetDeny:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3LiveTalkPush

@implementation PB3LiveTalkPush

@dynamic type;
@dynamic timeOut;
@dynamic actionIdx;
@dynamic talkTime;
@dynamic hasTargetPlayer, targetPlayer;

typedef struct PB3LiveTalkPush__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveTalkPush_PushType type;
  PB3PlayerInfo *targetPlayer;
  int64_t timeOut;
  int64_t actionIdx;
  int64_t talkTime;
} PB3LiveTalkPush__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = PB3LiveTalkPush_PushType_EnumDescriptor,
        .number = PB3LiveTalkPush_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3LiveTalkPush__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "timeOut",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkPush_FieldNumber_TimeOut,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3LiveTalkPush__storage_, timeOut),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "actionIdx",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkPush_FieldNumber_ActionIdx,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3LiveTalkPush__storage_, actionIdx),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "talkTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3LiveTalkPush_FieldNumber_TalkTime,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3LiveTalkPush__storage_, talkTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "targetPlayer",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerInfo),
        .number = PB3LiveTalkPush_FieldNumber_TargetPlayer,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3LiveTalkPush__storage_, targetPlayer),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3LiveTalkPush class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3LiveTalkPush__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3LiveTalkPush_Type_RawValue(PB3LiveTalkPush *message) {
  GPBDescriptor *descriptor = [PB3LiveTalkPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkPush_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3LiveTalkPush_Type_RawValue(PB3LiveTalkPush *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3LiveTalkPush descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3LiveTalkPush_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - Enum PB3LiveTalkPush_PushType

GPBEnumDescriptor *PB3LiveTalkPush_PushType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "None\000TargetConnSucc\000TargetConnFail\000Targe"
        "tExposed\000TargetLikeYou\000TargetHangup\000Time"
        "out\000TargetHeadTouched\000TargetBodyTouched\000"
        "SelfHeadTouched\000SelfBodyTouched\000DualExpo"
        "sed\000TargetInviteShow\000TimeoutDelayed\000";
    static const int32_t values[] = {
        PB3LiveTalkPush_PushType_None,
        PB3LiveTalkPush_PushType_TargetConnSucc,
        PB3LiveTalkPush_PushType_TargetConnFail,
        PB3LiveTalkPush_PushType_TargetExposed,
        PB3LiveTalkPush_PushType_TargetLikeYou,
        PB3LiveTalkPush_PushType_TargetHangup,
        PB3LiveTalkPush_PushType_Timeout,
        PB3LiveTalkPush_PushType_TargetHeadTouched,
        PB3LiveTalkPush_PushType_TargetBodyTouched,
        PB3LiveTalkPush_PushType_SelfHeadTouched,
        PB3LiveTalkPush_PushType_SelfBodyTouched,
        PB3LiveTalkPush_PushType_DualExposed,
        PB3LiveTalkPush_PushType_TargetInviteShow,
        PB3LiveTalkPush_PushType_TimeoutDelayed,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3LiveTalkPush_PushType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3LiveTalkPush_PushType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3LiveTalkPush_PushType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3LiveTalkPush_PushType_None:
    case PB3LiveTalkPush_PushType_TargetConnSucc:
    case PB3LiveTalkPush_PushType_TargetConnFail:
    case PB3LiveTalkPush_PushType_TargetExposed:
    case PB3LiveTalkPush_PushType_TargetLikeYou:
    case PB3LiveTalkPush_PushType_TargetHangup:
    case PB3LiveTalkPush_PushType_Timeout:
    case PB3LiveTalkPush_PushType_TargetHeadTouched:
    case PB3LiveTalkPush_PushType_TargetBodyTouched:
    case PB3LiveTalkPush_PushType_SelfHeadTouched:
    case PB3LiveTalkPush_PushType_SelfBodyTouched:
    case PB3LiveTalkPush_PushType_DualExposed:
    case PB3LiveTalkPush_PushType_TargetInviteShow:
    case PB3LiveTalkPush_PushType_TimeoutDelayed:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3GetLiveAssetsConfReq

@implementation PB3GetLiveAssetsConfReq


typedef struct PB3GetLiveAssetsConfReq__storage_ {
  uint32_t _has_storage_[1];
} PB3GetLiveAssetsConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetLiveAssetsConfReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetLiveAssetsConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetLiveAssetsConfRes

@implementation PB3GetLiveAssetsConfRes

@dynamic models, models_Count;
@dynamic stickers, stickers_Count;

typedef struct PB3GetLiveAssetsConfRes__storage_ {
  uint32_t _has_storage_[1];
  GPBInt64ObjectDictionary *models;
  GPBInt64ObjectDictionary *stickers;
} PB3GetLiveAssetsConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "models",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveModel),
        .number = PB3GetLiveAssetsConfRes_FieldNumber_Models,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetLiveAssetsConfRes__storage_, models),
        .flags = GPBFieldMapKeyInt64,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "stickers",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveSticker),
        .number = PB3GetLiveAssetsConfRes_FieldNumber_Stickers,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetLiveAssetsConfRes__storage_, stickers),
        .flags = GPBFieldMapKeyInt64,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetLiveAssetsConfRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetLiveAssetsConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RestoreLiveStatusReq

@implementation PB3RestoreLiveStatusReq


typedef struct PB3RestoreLiveStatusReq__storage_ {
  uint32_t _has_storage_[1];
} PB3RestoreLiveStatusReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RestoreLiveStatusReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RestoreLiveStatusReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RestoreLiveStatusRes

@implementation PB3RestoreLiveStatusRes

@dynamic hasTalk, talk;
@dynamic hasIm, im;

typedef struct PB3RestoreLiveStatusRes__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveChannelPush *talk;
  PB3LiveIMPush *im;
} PB3RestoreLiveStatusRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "talk",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveChannelPush),
        .number = PB3RestoreLiveStatusRes_FieldNumber_Talk,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RestoreLiveStatusRes__storage_, talk),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "im",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveIMPush),
        .number = PB3RestoreLiveStatusRes_FieldNumber_Im,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RestoreLiveStatusRes__storage_, im),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RestoreLiveStatusRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RestoreLiveStatusRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SwitchTelepathyReq

@implementation PB3SwitchTelepathyReq

@dynamic telepathic;

typedef struct PB3SwitchTelepathyReq__storage_ {
  uint32_t _has_storage_[1];
} PB3SwitchTelepathyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "telepathic",
        .dataTypeSpecific.className = NULL,
        .number = PB3SwitchTelepathyReq_FieldNumber_Telepathic,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SwitchTelepathyReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SwitchTelepathyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SwitchTelepathyRes

@implementation PB3SwitchTelepathyRes


typedef struct PB3SwitchTelepathyRes__storage_ {
  uint32_t _has_storage_[1];
} PB3SwitchTelepathyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SwitchTelepathyRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3SwitchTelepathyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportClickChatTelepathyReq

@implementation PB3ReportClickChatTelepathyReq

@dynamic telepathyId;

typedef struct PB3ReportClickChatTelepathyReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t telepathyId;
} PB3ReportClickChatTelepathyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "telepathyId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportClickChatTelepathyReq_FieldNumber_TelepathyId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportClickChatTelepathyReq__storage_, telepathyId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportClickChatTelepathyReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportClickChatTelepathyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportClickChatTelepathyRes

@implementation PB3ReportClickChatTelepathyRes


typedef struct PB3ReportClickChatTelepathyRes__storage_ {
  uint32_t _has_storage_[1];
} PB3ReportClickChatTelepathyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportClickChatTelepathyRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ReportClickChatTelepathyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PushTelepathyPopupData

@implementation PB3PushTelepathyPopupData

@dynamic playerId;
@dynamic icon;
@dynamic nickname;
@dynamic constellation;
@dynamic matchingDegree;
@dynamic telepathyId;
@dynamic gender;
@dynamic switch_p;
@dynamic greetingsId;
@dynamic greetings;
@dynamic labelArray, labelArray_Count;

typedef struct PB3PushTelepathyPopupData__storage_ {
  uint32_t _has_storage_[1];
  PB3SexType gender;
  NSString *icon;
  NSString *nickname;
  NSString *constellation;
  NSString *matchingDegree;
  NSString *greetings;
  NSMutableArray *labelArray;
  int64_t playerId;
  int64_t telepathyId;
  int64_t greetingsId;
} PB3PushTelepathyPopupData__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_Nickname,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "constellation",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_Constellation,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, constellation),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "matchingDegree",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_MatchingDegree,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, matchingDegree),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "telepathyId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_TelepathyId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, telepathyId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "gender",
        .dataTypeSpecific.enumDescFunc = PB3SexType_EnumDescriptor,
        .number = PB3PushTelepathyPopupData_FieldNumber_Gender,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, gender),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "switch_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_Switch_p,
        .hasIndex = 7,
        .offset = 8,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "greetingsId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_GreetingsId,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, greetingsId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "greetings",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_Greetings,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, greetings),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "labelArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3PushTelepathyPopupData_FieldNumber_LabelArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3PushTelepathyPopupData__storage_, labelArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PushTelepathyPopupData class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PushTelepathyPopupData__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3PushTelepathyPopupData_Gender_RawValue(PB3PushTelepathyPopupData *message) {
  GPBDescriptor *descriptor = [PB3PushTelepathyPopupData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PushTelepathyPopupData_FieldNumber_Gender];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3PushTelepathyPopupData_Gender_RawValue(PB3PushTelepathyPopupData *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3PushTelepathyPopupData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PushTelepathyPopupData_FieldNumber_Gender];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3ReportGreetingsUsedReq

@implementation PB3ReportGreetingsUsedReq

@dynamic greetingsId;

typedef struct PB3ReportGreetingsUsedReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t greetingsId;
} PB3ReportGreetingsUsedReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "greetingsId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportGreetingsUsedReq_FieldNumber_GreetingsId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportGreetingsUsedReq__storage_, greetingsId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportGreetingsUsedReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportGreetingsUsedReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportGreetingsUsedRes

@implementation PB3ReportGreetingsUsedRes


typedef struct PB3ReportGreetingsUsedRes__storage_ {
  uint32_t _has_storage_[1];
} PB3ReportGreetingsUsedRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportGreetingsUsedRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3ReportGreetingsUsedRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetPlayerLiveCharacterReq

@implementation PB3GetPlayerLiveCharacterReq

@dynamic playerId;

typedef struct PB3GetPlayerLiveCharacterReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t playerId;
} PB3GetPlayerLiveCharacterReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetPlayerLiveCharacterReq_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetPlayerLiveCharacterReq__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetPlayerLiveCharacterReq class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetPlayerLiveCharacterReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetPlayerLiveCharacterRes

@implementation PB3GetPlayerLiveCharacterRes

@dynamic hasCharacter, character;

typedef struct PB3GetPlayerLiveCharacterRes__storage_ {
  uint32_t _has_storage_[1];
  PB3LiveCharacter *character;
} PB3GetPlayerLiveCharacterRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "character",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3LiveCharacter),
        .number = PB3GetPlayerLiveCharacterRes_FieldNumber_Character,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetPlayerLiveCharacterRes__storage_, character),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetPlayerLiveCharacterRes class]
                                     rootClass:[PB3LiveExtRoot class]
                                          file:PB3LiveExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetPlayerLiveCharacterRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 