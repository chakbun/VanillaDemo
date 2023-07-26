 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/PcindexExt.pbobjc.h"
#import "pb/CommonExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3PcindexExtRoot

@implementation PB3PcindexExtRoot

 
 

@end

#pragma mark - PB3PcindexExtRoot_FileDescriptor

static GPBFileDescriptor *PB3PcindexExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3NavPosition

GPBEnumDescriptor *PB3NavPosition_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "NpIndexDefault\000NpIndexSubWin\000";
    static const int32_t values[] = {
        PB3NavPosition_NpIndexDefault,
        PB3NavPosition_NpIndexSubWin,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3NavPosition)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3NavPosition_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3NavPosition_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3NavPosition_NpIndexDefault:
    case PB3NavPosition_NpIndexSubWin:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3ModIndexEntry

@implementation PB3ModIndexEntry

@dynamic index;
@dynamic name;
@dynamic expandWeight;
@dynamic dataSourceAttribute;
@dynamic linkAppModId;
@dynamic sortIcon;
@dynamic nameIsVisible;

typedef struct PB3ModIndexEntry__storage_ {
  uint32_t _has_storage_[1];
  int32_t index;
  int32_t expandWeight;
  int32_t linkAppModId;
  NSString *name;
  NSString *dataSourceAttribute;
} PB3ModIndexEntry__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "index",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_Index,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ModIndexEntry__storage_, index),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ModIndexEntry__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "expandWeight",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_ExpandWeight,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3ModIndexEntry__storage_, expandWeight),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "dataSourceAttribute",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_DataSourceAttribute,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3ModIndexEntry__storage_, dataSourceAttribute),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "linkAppModId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_LinkAppModId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3ModIndexEntry__storage_, linkAppModId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "sortIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_SortIcon,
        .hasIndex = 5,
        .offset = 6,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "nameIsVisible",
        .dataTypeSpecific.className = NULL,
        .number = PB3ModIndexEntry_FieldNumber_NameIsVisible,
        .hasIndex = 7,
        .offset = 8,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ModIndexEntry class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ModIndexEntry__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BarIndexEntry

@implementation PB3BarIndexEntry

@dynamic modsArray, modsArray_Count;
@dynamic index;
@dynamic name;
@dynamic attribute;
@dynamic isSelected;
@dynamic position;

typedef struct PB3BarIndexEntry__storage_ {
  uint32_t _has_storage_[1];
  int32_t index;
  int32_t attribute;
  PB3NavPosition position;
  NSMutableArray *modsArray;
  NSString *name;
} PB3BarIndexEntry__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "modsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3ModIndexEntry),
        .number = PB3BarIndexEntry_FieldNumber_ModsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BarIndexEntry__storage_, modsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "index",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarIndexEntry_FieldNumber_Index,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BarIndexEntry__storage_, index),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarIndexEntry_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BarIndexEntry__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "attribute",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarIndexEntry_FieldNumber_Attribute,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3BarIndexEntry__storage_, attribute),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "isSelected",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarIndexEntry_FieldNumber_IsSelected,
        .hasIndex = 3,
        .offset = 4,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "position",
        .dataTypeSpecific.enumDescFunc = PB3NavPosition_EnumDescriptor,
        .number = PB3BarIndexEntry_FieldNumber_Position,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3BarIndexEntry__storage_, position),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BarIndexEntry class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BarIndexEntry__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3BarIndexEntry_Position_RawValue(PB3BarIndexEntry *message) {
  GPBDescriptor *descriptor = [PB3BarIndexEntry descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BarIndexEntry_FieldNumber_Position];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3BarIndexEntry_Position_RawValue(PB3BarIndexEntry *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3BarIndexEntry descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BarIndexEntry_FieldNumber_Position];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3NavigationBarV2Req

@implementation PB3NavigationBarV2Req


typedef struct PB3NavigationBarV2Req__storage_ {
  uint32_t _has_storage_[1];
} PB3NavigationBarV2Req__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NavigationBarV2Req class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3NavigationBarV2Req__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NavigationBarV2Res

@implementation PB3NavigationBarV2Res

@dynamic tabsArray, tabsArray_Count;

typedef struct PB3NavigationBarV2Res__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *tabsArray;
} PB3NavigationBarV2Res__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "tabsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3BarIndexEntry),
        .number = PB3NavigationBarV2Res_FieldNumber_TabsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3NavigationBarV2Res__storage_, tabsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NavigationBarV2Res class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NavigationBarV2Res__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BarListV2Req

@implementation PB3BarListV2Req

@dynamic barIndex;
@dynamic modIndex;
@dynamic page;

typedef struct PB3BarListV2Req__storage_ {
  uint32_t _has_storage_[1];
  int32_t barIndex;
  int32_t modIndex;
  int32_t page;
} PB3BarListV2Req__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "barIndex",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Req_FieldNumber_BarIndex,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BarListV2Req__storage_, barIndex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "modIndex",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Req_FieldNumber_ModIndex,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BarListV2Req__storage_, modIndex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "page",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Req_FieldNumber_Page,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3BarListV2Req__storage_, page),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BarListV2Req class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BarListV2Req__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BarListV2Res

@implementation PB3BarListV2Res

@dynamic barsArray, barsArray_Count;
@dynamic sortIcon;
@dynamic isVisible;
@dynamic nameIsVisible;

typedef struct PB3BarListV2Res__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *barsArray;
} PB3BarListV2Res__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "barsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3IndexEntry),
        .number = PB3BarListV2Res_FieldNumber_BarsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BarListV2Res__storage_, barsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "sortIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Res_FieldNumber_SortIcon,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "isVisible",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Res_FieldNumber_IsVisible,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "nameIsVisible",
        .dataTypeSpecific.className = NULL,
        .number = PB3BarListV2Res_FieldNumber_NameIsVisible,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BarListV2Res class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BarListV2Res__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpgradeVersionReq

@implementation PB3UpgradeVersionReq

@dynamic uid;
@dynamic sourceVersion;
@dynamic channel;

typedef struct PB3UpgradeVersionReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *sourceVersion;
  NSString *channel;
  int64_t uid;
} PB3UpgradeVersionReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "uid",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionReq_FieldNumber_Uid,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionReq__storage_, uid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "sourceVersion",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionReq_FieldNumber_SourceVersion,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionReq__storage_, sourceVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionReq_FieldNumber_Channel,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpgradeVersionReq class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpgradeVersionReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpgradeVersionRes

@implementation PB3UpgradeVersionRes

@dynamic vid;
@dynamic targetVersion;
@dynamic type;
@dynamic description_p;
@dynamic pkg;

typedef struct PB3UpgradeVersionRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t vid;
  NSString *targetVersion;
  NSString *type;
  NSString *description_p;
  NSString *pkg;
} PB3UpgradeVersionRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "vid",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionRes_FieldNumber_Vid,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionRes__storage_, vid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "targetVersion",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionRes_FieldNumber_TargetVersion,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionRes__storage_, targetVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionRes_FieldNumber_Type,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionRes__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionRes_FieldNumber_Description_p,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionRes__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pkg",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeVersionRes_FieldNumber_Pkg,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3UpgradeVersionRes__storage_, pkg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpgradeVersionRes class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpgradeVersionRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpgradeCountReq

@implementation PB3UpgradeCountReq

@dynamic uid;
@dynamic vid;
@dynamic targetVersion;

typedef struct PB3UpgradeCountReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t vid;
  NSString *targetVersion;
  int64_t uid;
} PB3UpgradeCountReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "uid",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeCountReq_FieldNumber_Uid,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpgradeCountReq__storage_, uid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "vid",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeCountReq_FieldNumber_Vid,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3UpgradeCountReq__storage_, vid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "targetVersion",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpgradeCountReq_FieldNumber_TargetVersion,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3UpgradeCountReq__storage_, targetVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpgradeCountReq class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpgradeCountReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpgradeCountRes

@implementation PB3UpgradeCountRes


typedef struct PB3UpgradeCountRes__storage_ {
  uint32_t _has_storage_[1];
} PB3UpgradeCountRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpgradeCountRes class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3UpgradeCountRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3IndexBannerV2Req

@implementation PB3IndexBannerV2Req

@dynamic modIndex;

typedef struct PB3IndexBannerV2Req__storage_ {
  uint32_t _has_storage_[1];
  int32_t modIndex;
} PB3IndexBannerV2Req__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "modIndex",
        .dataTypeSpecific.className = NULL,
        .number = PB3IndexBannerV2Req_FieldNumber_ModIndex,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3IndexBannerV2Req__storage_, modIndex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3IndexBannerV2Req class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3IndexBannerV2Req__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3IndexBannerV2

@implementation PB3IndexBannerV2

@dynamic name;
@dynamic bannerURL;
@dynamic tranURL;

typedef struct PB3IndexBannerV2__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
  NSString *bannerURL;
  NSString *tranURL;
} PB3IndexBannerV2__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3IndexBannerV2_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3IndexBannerV2__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "bannerURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3IndexBannerV2_FieldNumber_BannerURL,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3IndexBannerV2__storage_, bannerURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tranURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3IndexBannerV2_FieldNumber_TranURL,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3IndexBannerV2__storage_, tranURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3IndexBannerV2 class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3IndexBannerV2__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\002\006\241!!\000\003\004\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3IndexBannerV2Res

@implementation PB3IndexBannerV2Res

@dynamic listArray, listArray_Count;

typedef struct PB3IndexBannerV2Res__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PB3IndexBannerV2Res__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3IndexBannerV2),
        .number = PB3IndexBannerV2Res_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3IndexBannerV2Res__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3IndexBannerV2Res class]
                                     rootClass:[PB3PcindexExtRoot class]
                                          file:PB3PcindexExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3IndexBannerV2Res__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 