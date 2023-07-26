 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/KtvExt.pbobjc.h"
#import "pb/KtvBaseExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3KtvExtRoot

@implementation PB3KtvExtRoot

 
 

@end

#pragma mark - PB3KtvExtRoot_FileDescriptor

static GPBFileDescriptor *PB3KtvExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3BgmPlayerFavoritesOperateType

GPBEnumDescriptor *PB3BgmPlayerFavoritesOperateType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "KfotNone\000KfotAdd\000KfotCancel\000";
    static const int32_t values[] = {
        PB3BgmPlayerFavoritesOperateType_KfotNone,
        PB3BgmPlayerFavoritesOperateType_KfotAdd,
        PB3BgmPlayerFavoritesOperateType_KfotCancel,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3BgmPlayerFavoritesOperateType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3BgmPlayerFavoritesOperateType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3BgmPlayerFavoritesOperateType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3BgmPlayerFavoritesOperateType_KfotNone:
    case PB3BgmPlayerFavoritesOperateType_KfotAdd:
    case PB3BgmPlayerFavoritesOperateType_KfotCancel:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3BgmPlayerPlaylistDetailReq

@implementation PB3BgmPlayerPlaylistDetailReq

@dynamic scrollToken;

typedef struct PB3BgmPlayerPlaylistDetailReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *scrollToken;
} PB3BgmPlayerPlaylistDetailReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "scrollToken",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerPlaylistDetailReq_FieldNumber_ScrollToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BgmPlayerPlaylistDetailReq__storage_, scrollToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerPlaylistDetailReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerPlaylistDetailReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerPlaylistDetailRes

@implementation PB3BgmPlayerPlaylistDetailRes

@dynamic musicBaseInfoArray, musicBaseInfoArray_Count;
@dynamic scrollToken;
@dynamic limit;

typedef struct PB3BgmPlayerPlaylistDetailRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *musicBaseInfoArray;
  NSString *scrollToken;
  int64_t limit;
} PB3BgmPlayerPlaylistDetailRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseInfoArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicBaseInfo),
        .number = PB3BgmPlayerPlaylistDetailRes_FieldNumber_MusicBaseInfoArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BgmPlayerPlaylistDetailRes__storage_, musicBaseInfoArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "scrollToken",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerPlaylistDetailRes_FieldNumber_ScrollToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BgmPlayerPlaylistDetailRes__storage_, scrollToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "limit",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerPlaylistDetailRes_FieldNumber_Limit,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BgmPlayerPlaylistDetailRes__storage_, limit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerPlaylistDetailRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerPlaylistDetailRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerMusicDetailsReq

@implementation PB3BgmPlayerMusicDetailsReq

@dynamic musicBaseIdsArray, musicBaseIdsArray_Count;

typedef struct PB3BgmPlayerMusicDetailsReq__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *musicBaseIdsArray;
} PB3BgmPlayerMusicDetailsReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseIdsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerMusicDetailsReq_FieldNumber_MusicBaseIdsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BgmPlayerMusicDetailsReq__storage_, musicBaseIdsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerMusicDetailsReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerMusicDetailsReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerMusicDetailsRes

@implementation PB3BgmPlayerMusicDetailsRes

@dynamic musicDetailInfoListArray, musicDetailInfoListArray_Count;

typedef struct PB3BgmPlayerMusicDetailsRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *musicDetailInfoListArray;
} PB3BgmPlayerMusicDetailsRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicDetailInfoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicDetailInfo),
        .number = PB3BgmPlayerMusicDetailsRes_FieldNumber_MusicDetailInfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BgmPlayerMusicDetailsRes__storage_, musicDetailInfoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerMusicDetailsRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerMusicDetailsRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerSearchMusicsReq

@implementation PB3BgmPlayerSearchMusicsReq

@dynamic keyword;
@dynamic scrollToken;

typedef struct PB3BgmPlayerSearchMusicsReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *keyword;
  NSString *scrollToken;
} PB3BgmPlayerSearchMusicsReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "keyword",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerSearchMusicsReq_FieldNumber_Keyword,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BgmPlayerSearchMusicsReq__storage_, keyword),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "scrollToken",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerSearchMusicsReq_FieldNumber_ScrollToken,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BgmPlayerSearchMusicsReq__storage_, scrollToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerSearchMusicsReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerSearchMusicsReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerSearchMusicsRes

@implementation PB3BgmPlayerSearchMusicsRes

@dynamic musicBaseInfoListArray, musicBaseInfoListArray_Count;
@dynamic scrollToken;
@dynamic limit;

typedef struct PB3BgmPlayerSearchMusicsRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *musicBaseInfoListArray;
  NSString *scrollToken;
  int64_t limit;
} PB3BgmPlayerSearchMusicsRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseInfoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicBaseInfo),
        .number = PB3BgmPlayerSearchMusicsRes_FieldNumber_MusicBaseInfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BgmPlayerSearchMusicsRes__storage_, musicBaseInfoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "scrollToken",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerSearchMusicsRes_FieldNumber_ScrollToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BgmPlayerSearchMusicsRes__storage_, scrollToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "limit",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerSearchMusicsRes_FieldNumber_Limit,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BgmPlayerSearchMusicsRes__storage_, limit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerSearchMusicsRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerSearchMusicsRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerFavoritesListReq

@implementation PB3BgmPlayerFavoritesListReq


typedef struct PB3BgmPlayerFavoritesListReq__storage_ {
  uint32_t _has_storage_[1];
} PB3BgmPlayerFavoritesListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerFavoritesListReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3BgmPlayerFavoritesListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerFavoritesListRes

@implementation PB3BgmPlayerFavoritesListRes

@dynamic musicBaseInfoArray, musicBaseInfoArray_Count;

typedef struct PB3BgmPlayerFavoritesListRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *musicBaseInfoArray;
} PB3BgmPlayerFavoritesListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "musicBaseInfoArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicBaseInfo),
        .number = PB3BgmPlayerFavoritesListRes_FieldNumber_MusicBaseInfoArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BgmPlayerFavoritesListRes__storage_, musicBaseInfoArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerFavoritesListRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerFavoritesListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BgmPlayerFavoritesOperateReq

@implementation PB3BgmPlayerFavoritesOperateReq

@dynamic operateType;
@dynamic musicBaseId;

typedef struct PB3BgmPlayerFavoritesOperateReq__storage_ {
  uint32_t _has_storage_[1];
  PB3BgmPlayerFavoritesOperateType operateType;
  NSString *musicBaseId;
} PB3BgmPlayerFavoritesOperateReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "operateType",
        .dataTypeSpecific.enumDescFunc = PB3BgmPlayerFavoritesOperateType_EnumDescriptor,
        .number = PB3BgmPlayerFavoritesOperateReq_FieldNumber_OperateType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BgmPlayerFavoritesOperateReq__storage_, operateType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "musicBaseId",
        .dataTypeSpecific.className = NULL,
        .number = PB3BgmPlayerFavoritesOperateReq_FieldNumber_MusicBaseId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BgmPlayerFavoritesOperateReq__storage_, musicBaseId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerFavoritesOperateReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BgmPlayerFavoritesOperateReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3BgmPlayerFavoritesOperateReq_OperateType_RawValue(PB3BgmPlayerFavoritesOperateReq *message) {
  GPBDescriptor *descriptor = [PB3BgmPlayerFavoritesOperateReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BgmPlayerFavoritesOperateReq_FieldNumber_OperateType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3BgmPlayerFavoritesOperateReq_OperateType_RawValue(PB3BgmPlayerFavoritesOperateReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3BgmPlayerFavoritesOperateReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BgmPlayerFavoritesOperateReq_FieldNumber_OperateType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3BgmPlayerFavoritesOperateRes

@implementation PB3BgmPlayerFavoritesOperateRes


typedef struct PB3BgmPlayerFavoritesOperateRes__storage_ {
  uint32_t _has_storage_[1];
} PB3BgmPlayerFavoritesOperateRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BgmPlayerFavoritesOperateRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3BgmPlayerFavoritesOperateRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3KtvMusicSuggestionsReq

@implementation PB3KtvMusicSuggestionsReq

@dynamic keyword;

typedef struct PB3KtvMusicSuggestionsReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *keyword;
} PB3KtvMusicSuggestionsReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "keyword",
        .dataTypeSpecific.className = NULL,
        .number = PB3KtvMusicSuggestionsReq_FieldNumber_Keyword,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3KtvMusicSuggestionsReq__storage_, keyword),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3KtvMusicSuggestionsReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3KtvMusicSuggestionsReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3KtvMusicSuggestionsRes

@implementation PB3KtvMusicSuggestionsRes

@dynamic suggestionInfoListArray, suggestionInfoListArray_Count;

typedef struct PB3KtvMusicSuggestionsRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *suggestionInfoListArray;
} PB3KtvMusicSuggestionsRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "suggestionInfoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MusicSuggestionInfo),
        .number = PB3KtvMusicSuggestionsRes_FieldNumber_SuggestionInfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3KtvMusicSuggestionsRes__storage_, suggestionInfoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3KtvMusicSuggestionsRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3KtvMusicSuggestionsRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3KtvBackendLibraryInfo

@implementation PB3KtvBackendLibraryInfo

@dynamic id_p;
@dynamic URL1;
@dynamic URL2;

typedef struct PB3KtvBackendLibraryInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *id_p;
  NSString *URL1;
  NSString *URL2;
} PB3KtvBackendLibraryInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3KtvBackendLibraryInfo_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3KtvBackendLibraryInfo__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "URL1",
        .dataTypeSpecific.className = NULL,
        .number = PB3KtvBackendLibraryInfo_FieldNumber_URL1,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3KtvBackendLibraryInfo__storage_, URL1),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "URL2",
        .dataTypeSpecific.className = NULL,
        .number = PB3KtvBackendLibraryInfo_FieldNumber_URL2,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3KtvBackendLibraryInfo__storage_, URL2),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3KtvBackendLibraryInfo class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3KtvBackendLibraryInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\002!!!\201\000\003!!!\201\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3KtvBackendLibraryReq

@implementation PB3KtvBackendLibraryReq

@dynamic originType;
@dynamic infoListArray, infoListArray_Count;

typedef struct PB3KtvBackendLibraryReq__storage_ {
  uint32_t _has_storage_[1];
  PB3MusicOriginType originType;
  NSMutableArray *infoListArray;
} PB3KtvBackendLibraryReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "originType",
        .dataTypeSpecific.enumDescFunc = PB3MusicOriginType_EnumDescriptor,
        .number = PB3KtvBackendLibraryReq_FieldNumber_OriginType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3KtvBackendLibraryReq__storage_, originType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "infoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3KtvBackendLibraryInfo),
        .number = PB3KtvBackendLibraryReq_FieldNumber_InfoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3KtvBackendLibraryReq__storage_, infoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3KtvBackendLibraryReq class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3KtvBackendLibraryReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3KtvBackendLibraryReq_OriginType_RawValue(PB3KtvBackendLibraryReq *message) {
  GPBDescriptor *descriptor = [PB3KtvBackendLibraryReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3KtvBackendLibraryReq_FieldNumber_OriginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3KtvBackendLibraryReq_OriginType_RawValue(PB3KtvBackendLibraryReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3KtvBackendLibraryReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3KtvBackendLibraryReq_FieldNumber_OriginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3KtvBackendLibraryRes

@implementation PB3KtvBackendLibraryRes


typedef struct PB3KtvBackendLibraryRes__storage_ {
  uint32_t _has_storage_[1];
} PB3KtvBackendLibraryRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3KtvBackendLibraryRes class]
                                     rootClass:[PB3KtvExtRoot class]
                                          file:PB3KtvExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3KtvBackendLibraryRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
