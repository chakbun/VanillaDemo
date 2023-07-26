 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "auth_pb/UauthCommon.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PROTOUauthCommonRoot

@implementation PROTOUauthCommonRoot

 
 

@end

#pragma mark - PROTOUauthCommonRoot_FileDescriptor

static GPBFileDescriptor *PROTOUauthCommonRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"uauth_pb"
                                                 objcPrefix:@"PROTO"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PROTOUauthWeightType

GPBEnumDescriptor *PROTOUauthWeightType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UwtH5\000UwtInner\000UwtAll\000";
    static const int32_t values[] = {
        PROTOUauthWeightType_UwtH5,
        PROTOUauthWeightType_UwtInner,
        PROTOUauthWeightType_UwtAll,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthWeightType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthWeightType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthWeightType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthWeightType_UwtH5:
    case PROTOUauthWeightType_UwtInner:
    case PROTOUauthWeightType_UwtAll:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthPayType

GPBEnumDescriptor *PROTOUauthPayType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UptWx\000UptAli\000UptAll\000";
    static const int32_t values[] = {
        PROTOUauthPayType_UptWx,
        PROTOUauthPayType_UptAli,
        PROTOUauthPayType_UptAll,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthPayType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthPayType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthPayType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthPayType_UptWx:
    case PROTOUauthPayType_UptAli:
    case PROTOUauthPayType_UptAll:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUPayChannelType

GPBEnumDescriptor *PROTOUPayChannelType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UpctNull\000UpctZfbzfH5\000UpctZfbzfApp\000UpctWx"
        "zfApp\000UpctWxzfH5\000UpctIap\000UpctPlay\000UpctPa"
        "lzf\000UpctBoing\000UpctUnionzf\000UpctCmbpay\000Upc"
        "tMycard\000UpctPayssion\000UpctAgent\000UpctManua"
        "l\000UpctDevtest\000";
    static const int32_t values[] = {
        PROTOUPayChannelType_UpctNull,
        PROTOUPayChannelType_UpctZfbzfH5,
        PROTOUPayChannelType_UpctZfbzfApp,
        PROTOUPayChannelType_UpctWxzfApp,
        PROTOUPayChannelType_UpctWxzfH5,
        PROTOUPayChannelType_UpctIap,
        PROTOUPayChannelType_UpctPlay,
        PROTOUPayChannelType_UpctPalzf,
        PROTOUPayChannelType_UpctBoing,
        PROTOUPayChannelType_UpctUnionzf,
        PROTOUPayChannelType_UpctCmbpay,
        PROTOUPayChannelType_UpctMycard,
        PROTOUPayChannelType_UpctPayssion,
        PROTOUPayChannelType_UpctAgent,
        PROTOUPayChannelType_UpctManual,
        PROTOUPayChannelType_UpctDevtest,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUPayChannelType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUPayChannelType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUPayChannelType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUPayChannelType_UpctNull:
    case PROTOUPayChannelType_UpctZfbzfH5:
    case PROTOUPayChannelType_UpctZfbzfApp:
    case PROTOUPayChannelType_UpctWxzfApp:
    case PROTOUPayChannelType_UpctWxzfH5:
    case PROTOUPayChannelType_UpctIap:
    case PROTOUPayChannelType_UpctPlay:
    case PROTOUPayChannelType_UpctPalzf:
    case PROTOUPayChannelType_UpctBoing:
    case PROTOUPayChannelType_UpctUnionzf:
    case PROTOUPayChannelType_UpctCmbpay:
    case PROTOUPayChannelType_UpctMycard:
    case PROTOUPayChannelType_UpctPayssion:
    case PROTOUPayChannelType_UpctAgent:
    case PROTOUPayChannelType_UpctManual:
    case PROTOUPayChannelType_UpctDevtest:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthAccountType

GPBEnumDescriptor *PROTOUauthAccountType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "AtDev\000AtNative\000AtQq\000AtWeixin\000AtChinaMobi"
        "le\000AtChinaTelecom\000AtUmeng\000AtGoogle\000AtFac"
        "ebook\000AtCaiji\000AtApple\000AtWechatSubscripti"
        "on\000AtQqMiniProgram\000AtWxMiniProgram\000AtQqW"
        "eb\000AtWeixinWeb\000AtRobot\000AtPhoneSubsidiary"
        "\000AtGuest\000AtTwitter\000AtEmail\000";
    static const int32_t values[] = {
        PROTOUauthAccountType_AtDev,
        PROTOUauthAccountType_AtNative,
        PROTOUauthAccountType_AtQq,
        PROTOUauthAccountType_AtWeixin,
        PROTOUauthAccountType_AtChinaMobile,
        PROTOUauthAccountType_AtChinaTelecom,
        PROTOUauthAccountType_AtUmeng,
        PROTOUauthAccountType_AtGoogle,
        PROTOUauthAccountType_AtFacebook,
        PROTOUauthAccountType_AtCaiji,
        PROTOUauthAccountType_AtApple,
        PROTOUauthAccountType_AtWechatSubscription,
        PROTOUauthAccountType_AtQqMiniProgram,
        PROTOUauthAccountType_AtWxMiniProgram,
        PROTOUauthAccountType_AtQqWeb,
        PROTOUauthAccountType_AtWeixinWeb,
        PROTOUauthAccountType_AtRobot,
        PROTOUauthAccountType_AtPhoneSubsidiary,
        PROTOUauthAccountType_AtGuest,
        PROTOUauthAccountType_AtTwitter,
        PROTOUauthAccountType_AtEmail,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthAccountType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthAccountType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthAccountType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthAccountType_AtDev:
    case PROTOUauthAccountType_AtNative:
    case PROTOUauthAccountType_AtQq:
    case PROTOUauthAccountType_AtWeixin:
    case PROTOUauthAccountType_AtChinaMobile:
    case PROTOUauthAccountType_AtChinaTelecom:
    case PROTOUauthAccountType_AtUmeng:
    case PROTOUauthAccountType_AtGoogle:
    case PROTOUauthAccountType_AtFacebook:
    case PROTOUauthAccountType_AtCaiji:
    case PROTOUauthAccountType_AtApple:
    case PROTOUauthAccountType_AtWechatSubscription:
    case PROTOUauthAccountType_AtQqMiniProgram:
    case PROTOUauthAccountType_AtWxMiniProgram:
    case PROTOUauthAccountType_AtQqWeb:
    case PROTOUauthAccountType_AtWeixinWeb:
    case PROTOUauthAccountType_AtRobot:
    case PROTOUauthAccountType_AtPhoneSubsidiary:
    case PROTOUauthAccountType_AtGuest:
    case PROTOUauthAccountType_AtTwitter:
    case PROTOUauthAccountType_AtEmail:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthLoginType

GPBEnumDescriptor *PROTOUauthLoginType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "LtDev\000LtNative\000LtQq\000LtWeixin\000LtSms\000LtQui"
        "ck\000LtApple\000LtFacebook\000LtPhonePassword\000Lt"
        "WechatSubscription\000LtGoogle\000LtQqSmallPro"
        "gram\000LtWxMiniProgram\000LtQqWeb\000LtWeixinWeb"
        "\000LtGuest\000LtTwitter\000LtSes\000LtEmailPassword"
        "\000";
    static const int32_t values[] = {
        PROTOUauthLoginType_LtDev,
        PROTOUauthLoginType_LtNative,
        PROTOUauthLoginType_LtQq,
        PROTOUauthLoginType_LtWeixin,
        PROTOUauthLoginType_LtSms,
        PROTOUauthLoginType_LtQuick,
        PROTOUauthLoginType_LtApple,
        PROTOUauthLoginType_LtFacebook,
        PROTOUauthLoginType_LtPhonePassword,
        PROTOUauthLoginType_LtWechatSubscription,
        PROTOUauthLoginType_LtGoogle,
        PROTOUauthLoginType_LtQqSmallProgram,
        PROTOUauthLoginType_LtWxMiniProgram,
        PROTOUauthLoginType_LtQqWeb,
        PROTOUauthLoginType_LtWeixinWeb,
        PROTOUauthLoginType_LtGuest,
        PROTOUauthLoginType_LtTwitter,
        PROTOUauthLoginType_LtSes,
        PROTOUauthLoginType_LtEmailPassword,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthLoginType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthLoginType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthLoginType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthLoginType_LtDev:
    case PROTOUauthLoginType_LtNative:
    case PROTOUauthLoginType_LtQq:
    case PROTOUauthLoginType_LtWeixin:
    case PROTOUauthLoginType_LtSms:
    case PROTOUauthLoginType_LtQuick:
    case PROTOUauthLoginType_LtApple:
    case PROTOUauthLoginType_LtFacebook:
    case PROTOUauthLoginType_LtPhonePassword:
    case PROTOUauthLoginType_LtWechatSubscription:
    case PROTOUauthLoginType_LtGoogle:
    case PROTOUauthLoginType_LtQqSmallProgram:
    case PROTOUauthLoginType_LtWxMiniProgram:
    case PROTOUauthLoginType_LtQqWeb:
    case PROTOUauthLoginType_LtWeixinWeb:
    case PROTOUauthLoginType_LtGuest:
    case PROTOUauthLoginType_LtTwitter:
    case PROTOUauthLoginType_LtSes:
    case PROTOUauthLoginType_LtEmailPassword:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthDeviceType

GPBEnumDescriptor *PROTOUauthDeviceType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "DtUnknown\000DtFlashplayer\000DtAndroidPhone\000D"
        "tIosPhone\000DtWindowsAssistant\000DtWindowsPc"
        "\000DtRobot\000DtWechatSubscription\000DtQqMiniPr"
        "ogram\000DtWxMiniProgram\000DtWeb\000";
    static const int32_t values[] = {
        PROTOUauthDeviceType_DtUnknown,
        PROTOUauthDeviceType_DtFlashplayer,
        PROTOUauthDeviceType_DtAndroidPhone,
        PROTOUauthDeviceType_DtIosPhone,
        PROTOUauthDeviceType_DtWindowsAssistant,
        PROTOUauthDeviceType_DtWindowsPc,
        PROTOUauthDeviceType_DtRobot,
        PROTOUauthDeviceType_DtWechatSubscription,
        PROTOUauthDeviceType_DtQqMiniProgram,
        PROTOUauthDeviceType_DtWxMiniProgram,
        PROTOUauthDeviceType_DtWeb,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthDeviceType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthDeviceType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthDeviceType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthDeviceType_DtUnknown:
    case PROTOUauthDeviceType_DtFlashplayer:
    case PROTOUauthDeviceType_DtAndroidPhone:
    case PROTOUauthDeviceType_DtIosPhone:
    case PROTOUauthDeviceType_DtWindowsAssistant:
    case PROTOUauthDeviceType_DtWindowsPc:
    case PROTOUauthDeviceType_DtRobot:
    case PROTOUauthDeviceType_DtWechatSubscription:
    case PROTOUauthDeviceType_DtQqMiniProgram:
    case PROTOUauthDeviceType_DtWxMiniProgram:
    case PROTOUauthDeviceType_DtWeb:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthSexType

GPBEnumDescriptor *PROTOUauthSexType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "Unknown\000Mail\000Femail\000";
    static const int32_t values[] = {
        PROTOUauthSexType_Unknown,
        PROTOUauthSexType_Mail,
        PROTOUauthSexType_Femail,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthSexType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthSexType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthSexType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthSexType_Unknown:
    case PROTOUauthSexType_Mail:
    case PROTOUauthSexType_Femail:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUauthAccountFlags

GPBEnumDescriptor *PROTOUauthAccountFlags_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "AfZero\000AfPhoneVerified\000AfBindDevice\000";
    static const int32_t values[] = {
        PROTOUauthAccountFlags_AfZero,
        PROTOUauthAccountFlags_AfPhoneVerified,
        PROTOUauthAccountFlags_AfBindDevice,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUauthAccountFlags)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUauthAccountFlags_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUauthAccountFlags_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUauthAccountFlags_AfZero:
    case PROTOUauthAccountFlags_AfPhoneVerified:
    case PROTOUauthAccountFlags_AfBindDevice:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PROTOUauthLoginPassword

@implementation PROTOUauthLoginPassword

@dynamic password;
@dynamic time;
@dynamic rand;

typedef struct PROTOUauthLoginPassword__storage_ {
  uint32_t _has_storage_[1];
  int32_t rand;
  NSString *password;
  int64_t time;
} PROTOUauthLoginPassword__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUauthLoginPassword_FieldNumber_Password,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOUauthLoginPassword__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "time",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUauthLoginPassword_FieldNumber_Time,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOUauthLoginPassword__storage_, time),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "rand",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUauthLoginPassword_FieldNumber_Rand,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOUauthLoginPassword__storage_, rand),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUauthLoginPassword class]
                                     rootClass:[PROTOUauthCommonRoot class]
                                          file:PROTOUauthCommonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOUauthLoginPassword__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTODeviceMessage

@implementation PROTODeviceMessage

@dynamic oaid;
@dynamic androidId;
@dynamic idfa;
@dynamic idfv;

typedef struct PROTODeviceMessage__storage_ {
  uint32_t _has_storage_[1];
  NSString *oaid;
  NSString *androidId;
  NSString *idfa;
  NSString *idfv;
} PROTODeviceMessage__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oaid",
        .dataTypeSpecific.className = NULL,
        .number = PROTODeviceMessage_FieldNumber_Oaid,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTODeviceMessage__storage_, oaid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "androidId",
        .dataTypeSpecific.className = NULL,
        .number = PROTODeviceMessage_FieldNumber_AndroidId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTODeviceMessage__storage_, androidId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "idfa",
        .dataTypeSpecific.className = NULL,
        .number = PROTODeviceMessage_FieldNumber_Idfa,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTODeviceMessage__storage_, idfa),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "idfv",
        .dataTypeSpecific.className = NULL,
        .number = PROTODeviceMessage_FieldNumber_Idfv,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTODeviceMessage__storage_, idfv),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTODeviceMessage class]
                                     rootClass:[PROTOUauthCommonRoot class]
                                          file:PROTOUauthCommonRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTODeviceMessage__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
