// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: client/http0003.proto

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

#import "client/HTTP0003.pbobjc.h"
#import "client/Common.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTOHTTP0003Root

@implementation PROTOHTTP0003Root

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - PROTOHTTP0003Root_FileDescriptor

static GPBFileDescriptor *PROTOHTTP0003Root_FileDescriptor(void) {
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

#pragma mark - PROTOTaskGiftPoint

@implementation PROTOTaskGiftPoint

@dynamic hasGiftId, giftId;
@dynamic hasGiftNum, giftNum;
@dynamic hasPoint, point;
@dynamic hasPlayerId, playerId;

typedef struct PROTOTaskGiftPoint__storage_ {
  uint32_t _has_storage_[1];
  uint32_t giftId;
  uint32_t giftNum;
  uint32_t point;
  int64_t playerId;
} PROTOTaskGiftPoint__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "giftId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskGiftPoint_FieldNumber_GiftId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOTaskGiftPoint__storage_, giftId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "giftNum",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskGiftPoint_FieldNumber_GiftNum,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOTaskGiftPoint__storage_, giftNum),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "point",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskGiftPoint_FieldNumber_Point,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOTaskGiftPoint__storage_, point),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskGiftPoint_FieldNumber_PlayerId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOTaskGiftPoint__storage_, playerId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOTaskGiftPoint class]
                                     rootClass:[PROTOHTTP0003Root class]
                                          file:PROTOHTTP0003Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOTaskGiftPoint__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\003\001\006\000\002\007\000\004\010\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOTaskPlayerInfo

@implementation PROTOTaskPlayerInfo

@dynamic hasStatus, status;
@dynamic hasId_p, id_p;
@dynamic hasName, name;
@dynamic hasPointTotal, pointTotal;
@dynamic stepsArray, stepsArray_Count;
@dynamic datasArray, datasArray_Count;

typedef struct PROTOTaskPlayerInfo__storage_ {
  uint32_t _has_storage_[1];
  uint32_t status;
  uint32_t pointTotal;
  NSString *name;
  NSMutableArray *stepsArray;
  NSMutableArray *datasArray;
  int64_t id_p;
} PROTOTaskPlayerInfo__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "status",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskPlayerInfo_FieldNumber_Status,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, status),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskPlayerInfo_FieldNumber_Id_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskPlayerInfo_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "stepsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOTaskGiftStep),
        .number = PROTOTaskPlayerInfo_FieldNumber_StepsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, stepsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "datasArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOTaskGiftPoint),
        .number = PROTOTaskPlayerInfo_FieldNumber_DatasArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, datasArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pointTotal",
        .dataTypeSpecific.className = NULL,
        .number = PROTOTaskPlayerInfo_FieldNumber_PointTotal,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOTaskPlayerInfo__storage_, pointTotal),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeUInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOTaskPlayerInfo class]
                                     rootClass:[PROTOHTTP0003Root class]
                                          file:PROTOHTTP0003Root_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOTaskPlayerInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\006\n\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
