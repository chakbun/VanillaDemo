 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "upgrade_center_pb/UpgradeExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTOUpgradeExtRoot

@implementation PROTOUpgradeExtRoot

 
 

@end

#pragma mark - PROTOUpgradeExtRoot_FileDescriptor

static GPBFileDescriptor *PROTOUpgradeExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"upgrade_pb"
                                                 objcPrefix:@"PROTO"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PROTOErrorUpgradeCode

GPBEnumDescriptor *PROTOErrorUpgradeCode_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UpZero\000UpParam\000UpTooFrequent\000";
    static const int32_t values[] = {
        PROTOErrorUpgradeCode_UpZero,
        PROTOErrorUpgradeCode_UpParam,
        PROTOErrorUpgradeCode_UpTooFrequent,
    };
    static const char *extraTextFormatInfo = "\003\000b\204\000\001b\205\000\002b\213\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOErrorUpgradeCode)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOErrorUpgradeCode_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOErrorUpgradeCode_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOErrorUpgradeCode_UpZero:
    case PROTOErrorUpgradeCode_UpParam:
    case PROTOErrorUpgradeCode_UpTooFrequent:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUpgradeCmdId

GPBEnumDescriptor *PROTOUpgradeCmdId_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UcZero\000UcBroadcastPolicy\000";
    static const int32_t values[] = {
        PROTOUpgradeCmdId_UcZero,
        PROTOUpgradeCmdId_UcBroadcastPolicy,
    };
    static const char *extraTextFormatInfo = "\002\000b\204\000\001b\217\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUpgradeCmdId)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUpgradeCmdId_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUpgradeCmdId_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUpgradeCmdId_UcZero:
    case PROTOUpgradeCmdId_UcBroadcastPolicy:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUpgradeType

GPBEnumDescriptor *PROTOUpgradeType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UtZero\000UtRecommend\000UtForced\000UtSilent\000";
    static const int32_t values[] = {
        PROTOUpgradeType_UtZero,
        PROTOUpgradeType_UtRecommend,
        PROTOUpgradeType_UtForced,
        PROTOUpgradeType_UtSilent,
    };
    static const char *extraTextFormatInfo = "\004\000b\204\000\001b\211\000\002b\206\000\003b\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUpgradeType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUpgradeType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUpgradeType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUpgradeType_UtZero:
    case PROTOUpgradeType_UtRecommend:
    case PROTOUpgradeType_UtForced:
    case PROTOUpgradeType_UtSilent:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTONetworkType

GPBEnumDescriptor *PROTONetworkType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "NtZero\000NtWifi\000Nt2G\000Nt3G\000Nt4G\000Nt5G\000";
    static const int32_t values[] = {
        PROTONetworkType_NtZero,
        PROTONetworkType_NtWifi,
        PROTONetworkType_Nt2G,
        PROTONetworkType_Nt3G,
        PROTONetworkType_Nt4G,
        PROTONetworkType_Nt5G,
    };
    static const char *extraTextFormatInfo = "\006\000b\204\000\001b\204\000\002b\202\000\003b\202\000\004b\202\000\005b\202\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTONetworkType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTONetworkType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTONetworkType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTONetworkType_NtZero:
    case PROTONetworkType_NtWifi:
    case PROTONetworkType_Nt2G:
    case PROTONetworkType_Nt3G:
    case PROTONetworkType_Nt4G:
    case PROTONetworkType_Nt5G:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOAppId

GPBEnumDescriptor *PROTOAppId_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "AppIdXiaohuxi\000AppIdMizhua\000AppIdCaiji\000";
    static const int32_t values[] = {
        PROTOAppId_AppIdXiaohuxi,
        PROTOAppId_AppIdMizhua,
        PROTOAppId_AppIdCaiji,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOAppId)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOAppId_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOAppId_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOAppId_AppIdXiaohuxi:
    case PROTOAppId_AppIdMizhua:
    case PROTOAppId_AppIdCaiji:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTODeviceType

GPBEnumDescriptor *PROTODeviceType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "DtUnknown\000DtFlashplayer\000DtAndroidPhone\000D"
        "tIosPhone\000DtWindowsAssistant\000DtRobot\000";
    static const int32_t values[] = {
        PROTODeviceType_DtUnknown,
        PROTODeviceType_DtFlashplayer,
        PROTODeviceType_DtAndroidPhone,
        PROTODeviceType_DtIosPhone,
        PROTODeviceType_DtWindowsAssistant,
        PROTODeviceType_DtRobot,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTODeviceType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTODeviceType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTODeviceType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTODeviceType_DtUnknown:
    case PROTODeviceType_DtFlashplayer:
    case PROTODeviceType_DtAndroidPhone:
    case PROTODeviceType_DtIosPhone:
    case PROTODeviceType_DtWindowsAssistant:
    case PROTODeviceType_DtRobot:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOReportType

GPBEnumDescriptor *PROTOReportType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RtZero\000RtPopWin\000RtDownloadReq\000RtDownload"
        "Ok\000RtActivation\000";
    static const int32_t values[] = {
        PROTOReportType_RtZero,
        PROTOReportType_RtPopWin,
        PROTOReportType_RtDownloadReq,
        PROTOReportType_RtDownloadOk,
        PROTOReportType_RtActivation,
    };
    static const char *extraTextFormatInfo = "\005\000b\204\000\001b\206\000\002b\213\000\003b\212\000\004b\212\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOReportType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOReportType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOReportType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOReportType_RtZero:
    case PROTOReportType_RtPopWin:
    case PROTOReportType_RtDownloadReq:
    case PROTOReportType_RtDownloadOk:
    case PROTOReportType_RtActivation:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PROTOReportDeviceReq

@implementation PROTOReportDeviceReq

@dynamic deviceId;
@dynamic deviceType;
@dynamic clientVersion;
@dynamic buildNo;
@dynamic network;
@dynamic adChannel;
@dynamic appId;
@dynamic uid;
@dynamic apiLevel;
@dynamic phoneBrand;

typedef struct PROTOReportDeviceReq__storage_ {
  uint32_t _has_storage_[1];
  PROTODeviceType deviceType;
  int32_t buildNo;
  PROTONetworkType network;
  int32_t adChannel;
  PROTOAppId appId;
  int32_t apiLevel;
  NSString *deviceId;
  NSString *clientVersion;
  NSString *phoneBrand;
  int64_t uid;
} PROTOReportDeviceReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_DeviceId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.enumDescFunc = PROTODeviceType_EnumDescriptor,
        .number = PROTOReportDeviceReq_FieldNumber_DeviceType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, deviceType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "clientVersion",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_ClientVersion,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, clientVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "buildNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_BuildNo,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, buildNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "network",
        .dataTypeSpecific.enumDescFunc = PROTONetworkType_EnumDescriptor,
        .number = PROTOReportDeviceReq_FieldNumber_Network,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, network),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "adChannel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_AdChannel,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, adChannel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "appId",
        .dataTypeSpecific.enumDescFunc = PROTOAppId_EnumDescriptor,
        .number = PROTOReportDeviceReq_FieldNumber_AppId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, appId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "uid",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_Uid,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, uid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "apiLevel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_ApiLevel,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, apiLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneBrand",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceReq_FieldNumber_PhoneBrand,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PROTOReportDeviceReq__storage_, phoneBrand),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportDeviceReq class]
                                     rootClass:[PROTOUpgradeExtRoot class]
                                          file:PROTOUpgradeExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOReportDeviceReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOReportDeviceReq_DeviceType_RawValue(PROTOReportDeviceReq *message) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_DeviceType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDeviceReq_DeviceType_RawValue(PROTOReportDeviceReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_DeviceType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PROTOReportDeviceReq_Network_RawValue(PROTOReportDeviceReq *message) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_Network];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDeviceReq_Network_RawValue(PROTOReportDeviceReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_Network];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PROTOReportDeviceReq_AppId_RawValue(PROTOReportDeviceReq *message) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_AppId];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDeviceReq_AppId_RawValue(PROTOReportDeviceReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDeviceReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceReq_FieldNumber_AppId];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOReportDeviceRes

@implementation PROTOReportDeviceRes

@dynamic policyId;
@dynamic upgradeType;
@dynamic network;
@dynamic downloadURL;
@dynamic tips;
@dynamic checkMd5;
@dynamic targetVersion;
@dynamic targetBuildNo;
@dynamic bgURL;

typedef struct PROTOReportDeviceRes__storage_ {
  uint32_t _has_storage_[1];
  PROTOUpgradeType upgradeType;
  PROTONetworkType network;
  int32_t targetBuildNo;
  NSString *downloadURL;
  NSString *tips;
  NSString *checkMd5;
  NSString *targetVersion;
  NSString *bgURL;
  int64_t policyId;
} PROTOReportDeviceRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "policyId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_PolicyId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, policyId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "upgradeType",
        .dataTypeSpecific.enumDescFunc = PROTOUpgradeType_EnumDescriptor,
        .number = PROTOReportDeviceRes_FieldNumber_UpgradeType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, upgradeType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "network",
        .dataTypeSpecific.enumDescFunc = PROTONetworkType_EnumDescriptor,
        .number = PROTOReportDeviceRes_FieldNumber_Network,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, network),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "downloadURL",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_DownloadURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, downloadURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tips",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_Tips,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, tips),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "checkMd5",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_CheckMd5,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, checkMd5),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetVersion",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_TargetVersion,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, targetVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetBuildNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_TargetBuildNo,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, targetBuildNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "bgURL",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDeviceRes_FieldNumber_BgURL,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOReportDeviceRes__storage_, bgURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportDeviceRes class]
                                     rootClass:[PROTOUpgradeExtRoot class]
                                          file:PROTOUpgradeExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOReportDeviceRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\004\010\241!!\000\t\002\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOReportDeviceRes_UpgradeType_RawValue(PROTOReportDeviceRes *message) {
  GPBDescriptor *descriptor = [PROTOReportDeviceRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceRes_FieldNumber_UpgradeType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDeviceRes_UpgradeType_RawValue(PROTOReportDeviceRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDeviceRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceRes_FieldNumber_UpgradeType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PROTOReportDeviceRes_Network_RawValue(PROTOReportDeviceRes *message) {
  GPBDescriptor *descriptor = [PROTOReportDeviceRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceRes_FieldNumber_Network];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDeviceRes_Network_RawValue(PROTOReportDeviceRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDeviceRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDeviceRes_FieldNumber_Network];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOReportPolicyReq

@implementation PROTOReportPolicyReq

@dynamic deviceId;
@dynamic policyId;
@dynamic reportType;

typedef struct PROTOReportPolicyReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOReportType reportType;
  NSString *deviceId;
  int64_t policyId;
} PROTOReportPolicyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportPolicyReq_FieldNumber_DeviceId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOReportPolicyReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "policyId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportPolicyReq_FieldNumber_PolicyId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOReportPolicyReq__storage_, policyId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "reportType",
        .dataTypeSpecific.enumDescFunc = PROTOReportType_EnumDescriptor,
        .number = PROTOReportPolicyReq_FieldNumber_ReportType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOReportPolicyReq__storage_, reportType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportPolicyReq class]
                                     rootClass:[PROTOUpgradeExtRoot class]
                                          file:PROTOUpgradeExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOReportPolicyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOReportPolicyReq_ReportType_RawValue(PROTOReportPolicyReq *message) {
  GPBDescriptor *descriptor = [PROTOReportPolicyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportPolicyReq_FieldNumber_ReportType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportPolicyReq_ReportType_RawValue(PROTOReportPolicyReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportPolicyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportPolicyReq_FieldNumber_ReportType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOReportPolicyRes

@implementation PROTOReportPolicyRes


typedef struct PROTOReportPolicyRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOReportPolicyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportPolicyRes class]
                                     rootClass:[PROTOUpgradeExtRoot class]
                                          file:PROTOUpgradeExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOReportPolicyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBroadcastPolicy

@implementation PROTOBroadcastPolicy

@dynamic policyId;
@dynamic deviceType;
@dynamic clientVersion;
@dynamic buildNo;
@dynamic network;
@dynamic adChannel;
@dynamic appId;
@dynamic apiLevel;
@dynamic phoneBrand;

typedef struct PROTOBroadcastPolicy__storage_ {
  uint32_t _has_storage_[1];
  PROTODeviceType deviceType;
  int32_t buildNo;
  PROTONetworkType network;
  int32_t adChannel;
  PROTOAppId appId;
  int32_t apiLevel;
  NSString *clientVersion;
  NSString *phoneBrand;
  int64_t policyId;
} PROTOBroadcastPolicy__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "policyId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_PolicyId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, policyId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.enumDescFunc = PROTODeviceType_EnumDescriptor,
        .number = PROTOBroadcastPolicy_FieldNumber_DeviceType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, deviceType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "clientVersion",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_ClientVersion,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, clientVersion),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "buildNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_BuildNo,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, buildNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "network",
        .dataTypeSpecific.enumDescFunc = PROTONetworkType_EnumDescriptor,
        .number = PROTOBroadcastPolicy_FieldNumber_Network,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, network),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "adChannel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_AdChannel,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, adChannel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "appId",
        .dataTypeSpecific.enumDescFunc = PROTOAppId_EnumDescriptor,
        .number = PROTOBroadcastPolicy_FieldNumber_AppId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, appId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "apiLevel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_ApiLevel,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, apiLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneBrand",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBroadcastPolicy_FieldNumber_PhoneBrand,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOBroadcastPolicy__storage_, phoneBrand),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBroadcastPolicy class]
                                     rootClass:[PROTOUpgradeExtRoot class]
                                          file:PROTOUpgradeExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOBroadcastPolicy__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOBroadcastPolicy_DeviceType_RawValue(PROTOBroadcastPolicy *message) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_DeviceType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOBroadcastPolicy_DeviceType_RawValue(PROTOBroadcastPolicy *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_DeviceType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PROTOBroadcastPolicy_Network_RawValue(PROTOBroadcastPolicy *message) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_Network];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOBroadcastPolicy_Network_RawValue(PROTOBroadcastPolicy *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_Network];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PROTOBroadcastPolicy_AppId_RawValue(PROTOBroadcastPolicy *message) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_AppId];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOBroadcastPolicy_AppId_RawValue(PROTOBroadcastPolicy *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOBroadcastPolicy descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBroadcastPolicy_FieldNumber_AppId];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}


#pragma clang diagnostic pop

 
