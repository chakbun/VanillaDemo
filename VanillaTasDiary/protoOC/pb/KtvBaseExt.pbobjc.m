 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/KtvBaseExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3KtvBaseExtRoot

@implementation PB3KtvBaseExtRoot

 
 

@end

#pragma mark - PB3KtvBaseExtRoot_FileDescriptor

static GPBFileDescriptor *PB3KtvBaseExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3MusicRightFilterType

GPBEnumDescriptor *PB3MusicRightFilterType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PrftNone\000PrftPlay\000PrftSing\000";
    static const int32_t values[] = {
        PB3MusicRightFilterType_PrftNone,
        PB3MusicRightFilterType_PrftPlay,
        PB3MusicRightFilterType_PrftSing,
    };
    static const char *extraTextFormatInfo = "\003\000d\204\000\001d\204\000\002d\204\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3MusicRightFilterType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3MusicRightFilterType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3MusicRightFilterType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3MusicRightFilterType_PrftNone:
    case PB3MusicRightFilterType_PrftPlay:
    case PB3MusicRightFilterType_PrftSing:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3MusicRecommendType

GPBEnumDescriptor *PB3MusicRecommendType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "MrtNone\000MrtFeatured\000MrtOther\000";
    static const int32_t values[] = {
        PB3MusicRecommendType_MrtNone,
        PB3MusicRecommendType_MrtFeatured,
        PB3MusicRecommendType_MrtOther,
    };
    static const char *extraTextFormatInfo = "\003\000c\204\000\001c\210\000\002c\205\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3MusicRecommendType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3MusicRecommendType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3MusicRecommendType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3MusicRecommendType_MrtNone:
    case PB3MusicRecommendType_MrtFeatured:
    case PB3MusicRecommendType_MrtOther:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3AlbumCoverInfoDimension

GPBEnumDescriptor *PB3AlbumCoverInfoDimension_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "AcidNone\000AcidMini\000AcidSmall\000AcidMedium\000";
    static const int32_t values[] = {
        PB3AlbumCoverInfoDimension_AcidNone,
        PB3AlbumCoverInfoDimension_AcidMini,
        PB3AlbumCoverInfoDimension_AcidSmall,
        PB3AlbumCoverInfoDimension_AcidMedium,
    };
    static const char *extraTextFormatInfo = "\004\000d\204\000\001d\204\000\002d\205\000\003d\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3AlbumCoverInfoDimension)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3AlbumCoverInfoDimension_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3AlbumCoverInfoDimension_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3AlbumCoverInfoDimension_AcidNone:
    case PB3AlbumCoverInfoDimension_AcidMini:
    case PB3AlbumCoverInfoDimension_AcidSmall:
    case PB3AlbumCoverInfoDimension_AcidMedium:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3MusicPlaySourceType

GPBEnumDescriptor *PB3MusicPlaySourceType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "MpstNone\000MpstLib\000MpstYsd\000";
    static const int32_t values[] = {
        PB3MusicPlaySourceType_MpstNone,
        PB3MusicPlaySourceType_MpstLib,
        PB3MusicPlaySourceType_MpstYsd,
    };
    static const char *extraTextFormatInfo = "\003\000d\204\000\001d\203\000\002d\203\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3MusicPlaySourceType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3MusicPlaySourceType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3MusicPlaySourceType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3MusicPlaySourceType_MpstNone:
    case PB3MusicPlaySourceType_MpstLib:
    case PB3MusicPlaySourceType_MpstYsd:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3MusicOriginType

GPBEnumDescriptor *PB3MusicOriginType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "MotNone\000MotLib\000MotYsd\000";
    static const int32_t values[] = {
        PB3MusicOriginType_MotNone,
        PB3MusicOriginType_MotLib,
        PB3MusicOriginType_MotYsd,
    };
    static const char *extraTextFormatInfo = "\003\000c\204\000\001c\203\000\002c\203\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3MusicOriginType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3MusicOriginType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3MusicOriginType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3MusicOriginType_MotNone:
    case PB3MusicOriginType_MotLib:
    case PB3MusicOriginType_MotYsd:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3PlaylistBaseInfo

@implementation PB3PlaylistBaseInfo

@dynamic playlistId;
@dynamic title;

typedef struct PB3PlaylistBaseInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *playlistId;
  NSString *title;
} PB3PlaylistBaseInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playlistId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlaylistBaseInfo_FieldNumber_PlaylistId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PlaylistBaseInfo__storage_, playlistId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "title",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlaylistBaseInfo_FieldNumber_Title,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PlaylistBaseInfo__storage_, title),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlaylistBaseInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlaylistBaseInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3AlbumCoverInfo

@implementation PB3AlbumCoverInfo

@dynamic dimension;
@dynamic URL;

typedef struct PB3AlbumCoverInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3AlbumCoverInfoDimension dimension;
  NSString *URL;
} PB3AlbumCoverInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "dimension",
        .dataTypeSpecific.enumDescFunc = PB3AlbumCoverInfoDimension_EnumDescriptor,
        .number = PB3AlbumCoverInfo_FieldNumber_Dimension,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3AlbumCoverInfo__storage_, dimension),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "URL",
        .dataTypeSpecific.className = NULL,
        .number = PB3AlbumCoverInfo_FieldNumber_URL,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3AlbumCoverInfo__storage_, URL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3AlbumCoverInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3AlbumCoverInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002!!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3AlbumCoverInfo_Dimension_RawValue(PB3AlbumCoverInfo *message) {
  GPBDescriptor *descriptor = [PB3AlbumCoverInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3AlbumCoverInfo_FieldNumber_Dimension];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3AlbumCoverInfo_Dimension_RawValue(PB3AlbumCoverInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3AlbumCoverInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3AlbumCoverInfo_FieldNumber_Dimension];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3MusicAlbumInfo

@implementation PB3MusicAlbumInfo

@dynamic name;
@dynamic coverInfoListArray, coverInfoListArray_Count;

typedef struct PB3MusicAlbumInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
  NSMutableArray *coverInfoListArray;
} PB3MusicAlbumInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicAlbumInfo_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MusicAlbumInfo__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "coverInfoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3AlbumCoverInfo),
        .number = PB3MusicAlbumInfo_FieldNumber_CoverInfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3MusicAlbumInfo__storage_, coverInfoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MusicAlbumInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MusicAlbumInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MusicBaseInfo

@implementation PB3MusicBaseInfo

@dynamic musicBaseId;
@dynamic musicId;
@dynamic name;
@dynamic singersArray, singersArray_Count;
@dynamic duration;
@dynamic singerImageURL;
@dynamic hasAlbumInfo, albumInfo;
@dynamic rightListArray, rightListArray_Count;
@dynamic recommendType;

typedef struct PB3MusicBaseInfo__storage_ {
  uint32_t _has_storage_[1];
  int32_t duration;
  PB3MusicRecommendType recommendType;
  NSString *musicBaseId;
  NSString *musicId;
  NSString *name;
  NSMutableArray *singersArray;
  NSString *singerImageURL;
  PB3MusicAlbumInfo *albumInfo;
  GPBEnumArray *rightListArray;
} PB3MusicBaseInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseId",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_MusicBaseId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, musicBaseId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "musicId",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_MusicId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, musicId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "singersArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_SingersArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, singersArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "duration",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_Duration,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, duration),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "singerImageURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicBaseInfo_FieldNumber_SingerImageURL,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, singerImageURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "albumInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicAlbumInfo),
        .number = PB3MusicBaseInfo_FieldNumber_AlbumInfo,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, albumInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "rightListArray",
        .dataTypeSpecific.enumDescFunc = PB3MusicRightFilterType_EnumDescriptor,
        .number = PB3MusicBaseInfo_FieldNumber_RightListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, rightListArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "recommendType",
        .dataTypeSpecific.enumDescFunc = PB3MusicRecommendType_EnumDescriptor,
        .number = PB3MusicBaseInfo_FieldNumber_RecommendType,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3MusicBaseInfo__storage_, recommendType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MusicBaseInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MusicBaseInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\006\006\245\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3MusicBaseInfo_RecommendType_RawValue(PB3MusicBaseInfo *message) {
  GPBDescriptor *descriptor = [PB3MusicBaseInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3MusicBaseInfo_FieldNumber_RecommendType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3MusicBaseInfo_RecommendType_RawValue(PB3MusicBaseInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3MusicBaseInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3MusicBaseInfo_FieldNumber_RecommendType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3MusicChorusClip

@implementation PB3MusicChorusClip

@dynamic startTime;
@dynamic endTime;

typedef struct PB3MusicChorusClip__storage_ {
  uint32_t _has_storage_[1];
  int64_t startTime;
  int64_t endTime;
} PB3MusicChorusClip__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "startTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicChorusClip_FieldNumber_StartTime,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MusicChorusClip__storage_, startTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "endTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicChorusClip_FieldNumber_EndTime,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MusicChorusClip__storage_, endTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MusicChorusClip class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MusicChorusClip__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MusicDetailInfo

@implementation PB3MusicDetailInfo

@dynamic hasMusicBaseInfo, musicBaseInfo;
@dynamic playToken;
@dynamic lyricsURL;
@dynamic midiURL;
@dynamic chorusClipListArray, chorusClipListArray_Count;
@dynamic preludeInterval;
@dynamic genreListArray, genreListArray_Count;
@dynamic playSource;

typedef struct PB3MusicDetailInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3MusicPlaySourceType playSource;
  PB3MusicBaseInfo *musicBaseInfo;
  NSString *playToken;
  NSString *lyricsURL;
  NSString *midiURL;
  NSMutableArray *chorusClipListArray;
  NSMutableArray *genreListArray;
  int64_t preludeInterval;
} PB3MusicDetailInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicBaseInfo),
        .number = PB3MusicDetailInfo_FieldNumber_MusicBaseInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, musicBaseInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "playToken",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicDetailInfo_FieldNumber_PlayToken,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, playToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "lyricsURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicDetailInfo_FieldNumber_LyricsURL,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, lyricsURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "midiURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicDetailInfo_FieldNumber_MidiURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, midiURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "chorusClipListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicChorusClip),
        .number = PB3MusicDetailInfo_FieldNumber_ChorusClipListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, chorusClipListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "preludeInterval",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicDetailInfo_FieldNumber_PreludeInterval,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, preludeInterval),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "genreListArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicDetailInfo_FieldNumber_GenreListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, genreListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "playSource",
        .dataTypeSpecific.enumDescFunc = PB3MusicPlaySourceType_EnumDescriptor,
        .number = PB3MusicDetailInfo_FieldNumber_PlaySource,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3MusicDetailInfo__storage_, playSource),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MusicDetailInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MusicDetailInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\003\006\241!!\000\004\004\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3MusicDetailInfo_PlaySource_RawValue(PB3MusicDetailInfo *message) {
  GPBDescriptor *descriptor = [PB3MusicDetailInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3MusicDetailInfo_FieldNumber_PlaySource];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3MusicDetailInfo_PlaySource_RawValue(PB3MusicDetailInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3MusicDetailInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3MusicDetailInfo_FieldNumber_PlaySource];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3MusicSuggestionInfo

@implementation PB3MusicSuggestionInfo

@dynamic suggestion;

typedef struct PB3MusicSuggestionInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *suggestion;
} PB3MusicSuggestionInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "suggestion",
        .dataTypeSpecific.className = NULL,
        .number = PB3MusicSuggestionInfo_FieldNumber_Suggestion,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MusicSuggestionInfo__storage_, suggestion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MusicSuggestionInfo class]
                                     rootClass:[PB3KtvBaseExtRoot class]
                                          file:PB3KtvBaseExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MusicSuggestionInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
