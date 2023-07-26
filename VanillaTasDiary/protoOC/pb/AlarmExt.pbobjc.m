// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/alarm.ext.proto

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

#import "pb/AlarmExt.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3AlarmExtRoot

@implementation PB3AlarmExtRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PB3AlarmExtRoot_FileDescriptor

static GPBFileDescriptor *PB3AlarmExtRoot_FileDescriptor(void) {
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

#pragma mark - PB3AlarmHelloReq

@implementation PB3AlarmHelloReq

@dynamic name;

typedef struct PB3AlarmHelloReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
} PB3AlarmHelloReq__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3AlarmHelloReq_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3AlarmHelloReq__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3AlarmHelloReq class]
                                     rootClass:[PB3AlarmExtRoot class]
                                          file:PB3AlarmExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3AlarmHelloReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3AlarmHelloRes

@implementation PB3AlarmHelloRes

@dynamic greet;

typedef struct PB3AlarmHelloRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *greet;
} PB3AlarmHelloRes__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "greet",
        .dataTypeSpecific.className = NULL,
        .number = PB3AlarmHelloRes_FieldNumber_Greet,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3AlarmHelloRes__storage_, greet),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3AlarmHelloRes class]
                                     rootClass:[PB3AlarmExtRoot class]
                                          file:PB3AlarmExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3AlarmHelloRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
