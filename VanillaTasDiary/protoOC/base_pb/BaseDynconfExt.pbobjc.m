 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "base_pb/BaseDynconfExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3BaseDynconfExtRoot

@implementation PB3BaseDynconfExtRoot

 
 

@end

#pragma mark - PB3BaseDynconfExtRoot_FileDescriptor

static GPBFileDescriptor *PB3BaseDynconfExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"base_pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - PB3MapString

@implementation PB3MapString

@dynamic key;
@dynamic value;

typedef struct PB3MapString__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  NSString *value;
} PB3MapString__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapString_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MapString__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapString_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MapString__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MapString class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MapString__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MapBool

@implementation PB3MapBool

@dynamic key;
@dynamic value;

typedef struct PB3MapBool__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
} PB3MapBool__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapBool_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MapBool__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapBool_FieldNumber_Value,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MapBool class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MapBool__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MapNumber

@implementation PB3MapNumber

@dynamic key;
@dynamic value;

typedef struct PB3MapNumber__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
  int64_t value;
} PB3MapNumber__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapNumber_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MapNumber__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PB3MapNumber_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MapNumber__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MapNumber class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MapNumber__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetDynConfReq

@implementation PB3GetDynConfReq

@dynamic group;
@dynamic name;

typedef struct PB3GetDynConfReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *group;
  NSString *name;
} PB3GetDynConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "group",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetDynConfReq_FieldNumber_Group,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetDynConfReq__storage_, group),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetDynConfReq_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetDynConfReq__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetDynConfReq class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetDynConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetDynConfRes

@implementation PB3GetDynConfRes

@dynamic mapStringsArray, mapStringsArray_Count;
@dynamic mapBoolsArray, mapBoolsArray_Count;
@dynamic mapNumbersArray, mapNumbersArray_Count;
@dynamic group;
@dynamic name;

typedef struct PB3GetDynConfRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *mapStringsArray;
  NSMutableArray *mapBoolsArray;
  NSMutableArray *mapNumbersArray;
  NSString *group;
  NSString *name;
} PB3GetDynConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "mapStringsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MapString),
        .number = PB3GetDynConfRes_FieldNumber_MapStringsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetDynConfRes__storage_, mapStringsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "mapBoolsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MapBool),
        .number = PB3GetDynConfRes_FieldNumber_MapBoolsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetDynConfRes__storage_, mapBoolsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "mapNumbersArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MapNumber),
        .number = PB3GetDynConfRes_FieldNumber_MapNumbersArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetDynConfRes__storage_, mapNumbersArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "group",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetDynConfRes_FieldNumber_Group,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetDynConfRes__storage_, group),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetDynConfRes_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetDynConfRes__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetDynConfRes class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetDynConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\003\001\000mapStrings\000\002\000mapBools\000\003\000mapNumbers\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NoticeDynConfChangeReq

@implementation PB3NoticeDynConfChangeReq

@dynamic group;

typedef struct PB3NoticeDynConfChangeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *group;
} PB3NoticeDynConfChangeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "group",
        .dataTypeSpecific.className = NULL,
        .number = PB3NoticeDynConfChangeReq_FieldNumber_Group,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NoticeDynConfChangeReq__storage_, group),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NoticeDynConfChangeReq class]
                                     rootClass:[PB3BaseDynconfExtRoot class]
                                          file:PB3BaseDynconfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NoticeDynConfChangeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
