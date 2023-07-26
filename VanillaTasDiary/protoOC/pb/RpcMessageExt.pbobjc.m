 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import "pb/RpcMessageExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTORpcMessageExtRoot

@implementation PROTORpcMessageExtRoot

 
 

@end

#pragma mark - PROTORpcMessageExtRoot_FileDescriptor

static GPBFileDescriptor *PROTORpcMessageExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PROTO"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - PROTORPCInput

@implementation PROTORPCInput

@dynamic obj;
@dynamic func;
@dynamic req;
@dynamic opt, opt_Count;

typedef struct PROTORPCInput__storage_ {
  uint32_t _has_storage_[1];
  NSString *obj;
  NSString *func;
  NSData *req;
  NSMutableDictionary *opt;
} PROTORPCInput__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "obj",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCInput_FieldNumber_Obj,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTORPCInput__storage_, obj),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "func",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCInput_FieldNumber_Func,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTORPCInput__storage_, func),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "req",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCInput_FieldNumber_Req,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTORPCInput__storage_, req),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "opt",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCInput_FieldNumber_Opt,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTORPCInput__storage_, opt),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORPCInput class]
                                     rootClass:[PROTORpcMessageExtRoot class]
                                          file:PROTORpcMessageExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTORPCInput__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTORPCOutput

@implementation PROTORPCOutput

@dynamic ret;
@dynamic rsp;
@dynamic opt, opt_Count;
@dynamic desc;
@dynamic obj;
@dynamic func;

typedef struct PROTORPCOutput__storage_ {
  uint32_t _has_storage_[1];
  int32_t ret;
  NSData *rsp;
  NSMutableDictionary *opt;
  NSString *desc;
  NSString *obj;
  NSString *func;
} PROTORPCOutput__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "ret",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Ret,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, ret),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "rsp",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Rsp,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, rsp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "opt",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Opt,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, opt),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "desc",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Desc,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, desc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "obj",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Obj,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, obj),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "func",
        .dataTypeSpecific.className = NULL,
        .number = PROTORPCOutput_FieldNumber_Func,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTORPCOutput__storage_, func),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORPCOutput class]
                                     rootClass:[PROTORpcMessageExtRoot class]
                                          file:PROTORpcMessageExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTORPCOutput__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
