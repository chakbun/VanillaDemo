// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/conf.ext.proto

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

#import "pb/ConfExt.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3ConfExtRoot

@implementation PB3ConfExtRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PB3ConfExtRoot_FileDescriptor

static GPBFileDescriptor *PB3ConfExtRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - PB3Service

@implementation PB3Service

@dynamic name;
@dynamic data_p;
@dynamic md5;

typedef struct PB3Service__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
  NSData *data_p;
  NSString *md5;
} PB3Service__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3Service_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3Service__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "data_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3Service_FieldNumber_Data_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3Service__storage_, data_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "md5",
        .dataTypeSpecific.className = NULL,
        .number = PB3Service_FieldNumber_Md5,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3Service__storage_, md5),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3Service class]
                                     rootClass:[PB3ConfExtRoot class]
                                          file:PB3ConfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3Service__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ConfReq

@implementation PB3ConfReq

@dynamic servicesArray, servicesArray_Count;

typedef struct PB3ConfReq__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *servicesArray;
} PB3ConfReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "servicesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3Service),
        .number = PB3ConfReq_FieldNumber_ServicesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3ConfReq__storage_, servicesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ConfReq class]
                                     rootClass:[PB3ConfExtRoot class]
                                          file:PB3ConfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ConfRes

@implementation PB3ConfRes

@dynamic servicesArray, servicesArray_Count;

typedef struct PB3ConfRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *servicesArray;
} PB3ConfRes__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "servicesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3Service),
        .number = PB3ConfRes_FieldNumber_ServicesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3ConfRes__storage_, servicesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ConfRes class]
                                     rootClass:[PB3ConfExtRoot class]
                                          file:PB3ConfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3OSConfigReq

@implementation PB3OSConfigReq

@dynamic osType;
@dynamic reqVersion;

typedef struct PB3OSConfigReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *osType;
  NSString *reqVersion;
} PB3OSConfigReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "osType",
        .dataTypeSpecific.className = NULL,
        .number = PB3OSConfigReq_FieldNumber_OsType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3OSConfigReq__storage_, osType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "reqVersion",
        .dataTypeSpecific.className = NULL,
        .number = PB3OSConfigReq_FieldNumber_ReqVersion,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3OSConfigReq__storage_, reqVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3OSConfigReq class]
                                     rootClass:[PB3ConfExtRoot class]
                                          file:PB3ConfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3OSConfigReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3OSConfigRes

@implementation PB3OSConfigRes

@dynamic cruVersion;

typedef struct PB3OSConfigRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *cruVersion;
} PB3OSConfigRes__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "cruVersion",
        .dataTypeSpecific.className = NULL,
        .number = PB3OSConfigRes_FieldNumber_CruVersion,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3OSConfigRes__storage_, cruVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3OSConfigRes class]
                                     rootClass:[PB3ConfExtRoot class]
                                          file:PB3ConfExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3OSConfigRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
