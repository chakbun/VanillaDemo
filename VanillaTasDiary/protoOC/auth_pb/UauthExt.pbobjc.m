 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "auth_pb/UauthExt.pbobjc.h"
#import "UauthCommon.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"

#pragma mark - PROTOUauthExtRoot

@implementation PROTOUauthExtRoot

 
 

@end

#pragma mark - PROTOUauthExtRoot_FileDescriptor

static GPBFileDescriptor *PROTOUauthExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"uauth_pb"
                                                 objcPrefix:@"PROTO"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PROTOErrorUAuthCode

GPBEnumDescriptor *PROTOErrorUAuthCode_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "ErrorUauthZero\000ErrorUauthRegisterParam\000E"
        "rrorUauthAccountExist\000ErrorUauthSessionT"
        "imeOut\000ErrorUauthSessionNotFound\000ErrorUa"
        "uthUserNotFound\000ErrorUauthAccountNotExis"
        "t\000ErrorUauthPassWordNoCorrect\000ErrorUauth"
        "CodeIncorrect\000ErrorUauthPhoneNotExist\000Er"
        "rorUauthUserNoRight\000ErrorUauthInvalidWay"
        "\000ErrorUauthNeedLogin\000ErrorUauthGetToken\000"
        "ErrorUauthAccessToken\000ErrorUauthWrongPho"
        "neNum\000ErrorUauthServerOffLine\000ErrorUauth"
        "PhoneAlreadyExist\000ErrorIaphasNoOrder\000Err"
        "orCheckIaporder\000ErrorCheckIapbundleId\000Er"
        "rorTooFrequent\000Error3Rd\000ErrorPasswordInv"
        "alid\000ErrorWrongOldPassword\000ErrorLoginBla"
        "ck\000ErrorHasAccount\000ErrorUauthPswNoCorrec"
        "t\000ErrorUauthPhoneNoCorrect\000ErrorUserLimi"
        "tLogin\000";
    static const int32_t values[] = {
        PROTOErrorUAuthCode_ErrorUauthZero,
        PROTOErrorUAuthCode_ErrorUauthRegisterParam,
        PROTOErrorUAuthCode_ErrorUauthAccountExist,
        PROTOErrorUAuthCode_ErrorUauthSessionTimeOut,
        PROTOErrorUAuthCode_ErrorUauthSessionNotFound,
        PROTOErrorUAuthCode_ErrorUauthUserNotFound,
        PROTOErrorUAuthCode_ErrorUauthAccountNotExist,
        PROTOErrorUAuthCode_ErrorUauthPassWordNoCorrect,
        PROTOErrorUAuthCode_ErrorUauthCodeIncorrect,
        PROTOErrorUAuthCode_ErrorUauthPhoneNotExist,
        PROTOErrorUAuthCode_ErrorUauthUserNoRight,
        PROTOErrorUAuthCode_ErrorUauthInvalidWay,
        PROTOErrorUAuthCode_ErrorUauthNeedLogin,
        PROTOErrorUAuthCode_ErrorUauthGetToken,
        PROTOErrorUAuthCode_ErrorUauthAccessToken,
        PROTOErrorUAuthCode_ErrorUauthWrongPhoneNum,
        PROTOErrorUAuthCode_ErrorUauthServerOffLine,
        PROTOErrorUAuthCode_ErrorUauthPhoneAlreadyExist,
        PROTOErrorUAuthCode_ErrorIaphasNoOrder,
        PROTOErrorUAuthCode_ErrorCheckIaporder,
        PROTOErrorUAuthCode_ErrorCheckIapbundleId,
        PROTOErrorUAuthCode_ErrorTooFrequent,
        PROTOErrorUAuthCode_Error3Rd,
        PROTOErrorUAuthCode_ErrorPasswordInvalid,
        PROTOErrorUAuthCode_ErrorWrongOldPassword,
        PROTOErrorUAuthCode_ErrorLoginBlack,
        PROTOErrorUAuthCode_ErrorHasAccount,
        PROTOErrorUAuthCode_ErrorUauthPswNoCorrect,
        PROTOErrorUAuthCode_ErrorUauthPhoneNoCorrect,
        PROTOErrorUAuthCode_ErrorUserLimitLogin,
    };
    static const char *extraTextFormatInfo = "\036\000\006D\204\000\001\006Q\000\002\006P\000\003\006R\000\004\006S\000\005\006P\000\006\006S\000\007\006U\000\010\006Q\000\t\006Q\000\n\006O\000\013\006N\000\014\006M\000\r\006L\000\016\006O\000\017\006Q\000\020\006Q\000\021\006U\000\022\006c\t\000\023\013c\004\000\024\013c\006A\000\025\020\000\026\006\"\000\027\024\000\030\025\000\031\017\000\032\017\000\033\006P\000\034\006R\000\035\023\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOErrorUAuthCode)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOErrorUAuthCode_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOErrorUAuthCode_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOErrorUAuthCode_ErrorUauthZero:
    case PROTOErrorUAuthCode_ErrorUauthRegisterParam:
    case PROTOErrorUAuthCode_ErrorUauthAccountExist:
    case PROTOErrorUAuthCode_ErrorUauthSessionTimeOut:
    case PROTOErrorUAuthCode_ErrorUauthSessionNotFound:
    case PROTOErrorUAuthCode_ErrorUauthUserNotFound:
    case PROTOErrorUAuthCode_ErrorUauthAccountNotExist:
    case PROTOErrorUAuthCode_ErrorUauthPassWordNoCorrect:
    case PROTOErrorUAuthCode_ErrorUauthCodeIncorrect:
    case PROTOErrorUAuthCode_ErrorUauthPhoneNotExist:
    case PROTOErrorUAuthCode_ErrorUauthUserNoRight:
    case PROTOErrorUAuthCode_ErrorUauthInvalidWay:
    case PROTOErrorUAuthCode_ErrorUauthNeedLogin:
    case PROTOErrorUAuthCode_ErrorUauthGetToken:
    case PROTOErrorUAuthCode_ErrorUauthAccessToken:
    case PROTOErrorUAuthCode_ErrorUauthWrongPhoneNum:
    case PROTOErrorUAuthCode_ErrorUauthServerOffLine:
    case PROTOErrorUAuthCode_ErrorUauthPhoneAlreadyExist:
    case PROTOErrorUAuthCode_ErrorIaphasNoOrder:
    case PROTOErrorUAuthCode_ErrorCheckIaporder:
    case PROTOErrorUAuthCode_ErrorCheckIapbundleId:
    case PROTOErrorUAuthCode_ErrorTooFrequent:
    case PROTOErrorUAuthCode_Error3Rd:
    case PROTOErrorUAuthCode_ErrorPasswordInvalid:
    case PROTOErrorUAuthCode_ErrorWrongOldPassword:
    case PROTOErrorUAuthCode_ErrorLoginBlack:
    case PROTOErrorUAuthCode_ErrorHasAccount:
    case PROTOErrorUAuthCode_ErrorUauthPswNoCorrect:
    case PROTOErrorUAuthCode_ErrorUauthPhoneNoCorrect:
    case PROTOErrorUAuthCode_ErrorUserLimitLogin:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOIAPStatusType

GPBEnumDescriptor *PROTOIAPStatusType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "IapNone\000IapStatusFail\000IapStatusCancel\000";
    static const int32_t values[] = {
        PROTOIAPStatusType_IapNone,
        PROTOIAPStatusType_IapStatusFail,
        PROTOIAPStatusType_IapStatusCancel,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOIAPStatusType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOIAPStatusType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOIAPStatusType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOIAPStatusType_IapNone:
    case PROTOIAPStatusType_IapStatusFail:
    case PROTOIAPStatusType_IapStatusCancel:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOChargeStatus

GPBEnumDescriptor *PROTOChargeStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "CsCharging\000CsFinish\000CsRefund\000";
    static const int32_t values[] = {
        PROTOChargeStatus_CsCharging,
        PROTOChargeStatus_CsFinish,
        PROTOChargeStatus_CsRefund,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOChargeStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOChargeStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOChargeStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOChargeStatus_CsCharging:
    case PROTOChargeStatus_CsFinish:
    case PROTOChargeStatus_CsRefund:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOReportDataType

GPBEnumDescriptor *PROTOReportDataType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RdtNull\000RdtCmbVipExpedited\000";
    static const int32_t values[] = {
        PROTOReportDataType_RdtNull,
        PROTOReportDataType_RdtCmbVipExpedited,
    };
    static const char *extraTextFormatInfo = "\002\000c\204\000\001c\343\343\211\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOReportDataType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOReportDataType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOReportDataType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOReportDataType_RdtNull:
    case PROTOReportDataType_RdtCmbVipExpedited:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOVerifyType

GPBEnumDescriptor *PROTOVerifyType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "VtNull\000VtRemoteLogin\000VtProtect\000VtAnomaly"
        "Login\000";
    static const int32_t values[] = {
        PROTOVerifyType_VtNull,
        PROTOVerifyType_VtRemoteLogin,
        PROTOVerifyType_VtProtect,
        PROTOVerifyType_VtAnomalyLogin,
    };
    static const char *extraTextFormatInfo = "\003\001b\213\000\002b\207\000\003b\214\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOVerifyType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOVerifyType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOVerifyType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOVerifyType_VtNull:
    case PROTOVerifyType_VtRemoteLogin:
    case PROTOVerifyType_VtProtect:
    case PROTOVerifyType_VtAnomalyLogin:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOSMSCodeTpl

GPBEnumDescriptor *PROTOSMSCodeTpl_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "SmscodeTplZero\000SmscodeTplLogin\000SmscodeTp"
        "lResetPwd\000SmscodeTplVerifyCode\000";
    static const int32_t values[] = {
        PROTOSMSCodeTpl_SmscodeTplZero,
        PROTOSMSCodeTpl_SmscodeTplLogin,
        PROTOSMSCodeTpl_SmscodeTplResetPwd,
        PROTOSMSCodeTpl_SmscodeTplVerifyCode,
    };
    static const char *extraTextFormatInfo = "\004\000d\006\204\000\001d\006\205\000\002d\006\210\000\003d\006\212\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOSMSCodeTpl)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOSMSCodeTpl_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOSMSCodeTpl_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOSMSCodeTpl_SmscodeTplZero:
    case PROTOSMSCodeTpl_SmscodeTplLogin:
    case PROTOSMSCodeTpl_SmscodeTplResetPwd:
    case PROTOSMSCodeTpl_SmscodeTplVerifyCode:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOCertifyType

GPBEnumDescriptor *PROTOCertifyType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "CtNone\000CtIdCard\000";
    static const int32_t values[] = {
        PROTOCertifyType_CtNone,
        PROTOCertifyType_CtIdCard,
    };
    static const char *extraTextFormatInfo = "\002\000b\204\000\001b\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOCertifyType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOCertifyType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOCertifyType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOCertifyType_CtNone:
    case PROTOCertifyType_CtIdCard:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOThirdAccountBindType

GPBEnumDescriptor *PROTOThirdAccountBindType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "TabtNone\000TabtWeixin\000TabtQq\000";
    static const int32_t values[] = {
        PROTOThirdAccountBindType_TabtNone,
        PROTOThirdAccountBindType_TabtWeixin,
        PROTOThirdAccountBindType_TabtQq,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOThirdAccountBindType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOThirdAccountBindType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOThirdAccountBindType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOThirdAccountBindType_TabtNone:
    case PROTOThirdAccountBindType_TabtWeixin:
    case PROTOThirdAccountBindType_TabtQq:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PROTOUnbindThirdAccountOptType

GPBEnumDescriptor *PROTOUnbindThirdAccountOptType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UtaotSend\000UtaotVerify\000";
    static const int32_t values[] = {
        PROTOUnbindThirdAccountOptType_UtaotSend,
        PROTOUnbindThirdAccountOptType_UtaotVerify,
    };
    static const char *extraTextFormatInfo = "\002\000e\204\000\001e\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PROTOUnbindThirdAccountOptType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PROTOUnbindThirdAccountOptType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PROTOUnbindThirdAccountOptType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PROTOUnbindThirdAccountOptType_UtaotSend:
    case PROTOUnbindThirdAccountOptType_UtaotVerify:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PROTOVerifyIAPReq

@implementation PROTOVerifyIAPReq

@dynamic accountId;
@dynamic receipt;
@dynamic transactionId;
@dynamic orderNo;
@dynamic goodsId;

typedef struct PROTOVerifyIAPReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *receipt;
  NSString *transactionId;
  NSString *orderNo;
  NSString *goodsId;
  int64_t accountId;
} PROTOVerifyIAPReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "accountId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyIAPReq_FieldNumber_AccountId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVerifyIAPReq__storage_, accountId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "receipt",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyIAPReq_FieldNumber_Receipt,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOVerifyIAPReq__storage_, receipt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "transactionId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyIAPReq_FieldNumber_TransactionId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOVerifyIAPReq__storage_, transactionId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "orderNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyIAPReq_FieldNumber_OrderNo,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOVerifyIAPReq__storage_, orderNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "goodsId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyIAPReq_FieldNumber_GoodsId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOVerifyIAPReq__storage_, goodsId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVerifyIAPReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVerifyIAPReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\002\001\t\000\003\r\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVerifyIAPRes

@implementation PROTOVerifyIAPRes


typedef struct PROTOVerifyIAPRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOVerifyIAPRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVerifyIAPRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOVerifyIAPRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoldCard

@implementation PROTOGoldCard

@dynamic id_p;
@dynamic amount;
@dynamic golds;
@dynamic giveawayGolds;
@dynamic identifier;

typedef struct PROTOGoldCard__storage_ {
  uint32_t _has_storage_[1];
  int32_t id_p;
  int32_t amount;
  int32_t golds;
  int32_t giveawayGolds;
  NSString *identifier;
} PROTOGoldCard__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoldCard_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGoldCard__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "amount",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoldCard_FieldNumber_Amount,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGoldCard__storage_, amount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "golds",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoldCard_FieldNumber_Golds,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGoldCard__storage_, golds),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "giveawayGolds",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoldCard_FieldNumber_GiveawayGolds,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGoldCard__storage_, giveawayGolds),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "identifier",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoldCard_FieldNumber_Identifier,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGoldCard__storage_, identifier),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoldCard class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGoldCard__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetGoodListReq

@implementation PROTOGetGoodListReq


typedef struct PROTOGetGoodListReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetGoodListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetGoodListReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetGoodListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetGoodListRes

@implementation PROTOGetGoodListRes

@dynamic goodListArray, goodListArray_Count;
@dynamic version;

typedef struct PROTOGetGoodListRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t version;
  NSMutableArray *goodListArray;
} PROTOGetGoodListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "goodListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOGoldCard),
        .number = PROTOGetGoodListRes_FieldNumber_GoodListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOGetGoodListRes__storage_, goodListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "version",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetGoodListRes_FieldNumber_Version,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetGoodListRes__storage_, version),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetGoodListRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetGoodListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOOrderIAPReq

@implementation PROTOOrderIAPReq

@dynamic id_p;
@dynamic accountId;

typedef struct PROTOOrderIAPReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t id_p;
  int64_t accountId;
} PROTOOrderIAPReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOOrderIAPReq_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOOrderIAPReq__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "accountId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOOrderIAPReq_FieldNumber_AccountId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOOrderIAPReq__storage_, accountId),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOOrderIAPReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOOrderIAPReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\002\t\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOOrderIAPRes

@implementation PROTOOrderIAPRes

@dynamic orderNo;

typedef struct PROTOOrderIAPRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *orderNo;
} PROTOOrderIAPRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "orderNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOOrderIAPRes_FieldNumber_OrderNo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOOrderIAPRes__storage_, orderNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOOrderIAPRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOOrderIAPRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOCloseOrderIAPReq

@implementation PROTOCloseOrderIAPReq

@dynamic orderNo;
@dynamic status;

typedef struct PROTOCloseOrderIAPReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOIAPStatusType status;
  NSString *orderNo;
} PROTOCloseOrderIAPReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "orderNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCloseOrderIAPReq_FieldNumber_OrderNo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOCloseOrderIAPReq__storage_, orderNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PROTOIAPStatusType_EnumDescriptor,
        .number = PROTOCloseOrderIAPReq_FieldNumber_Status,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOCloseOrderIAPReq__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCloseOrderIAPReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOCloseOrderIAPReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOCloseOrderIAPReq_Status_RawValue(PROTOCloseOrderIAPReq *message) {
  GPBDescriptor *descriptor = [PROTOCloseOrderIAPReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCloseOrderIAPReq_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOCloseOrderIAPReq_Status_RawValue(PROTOCloseOrderIAPReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOCloseOrderIAPReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCloseOrderIAPReq_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOCloseOrderIAPRes

@implementation PROTOCloseOrderIAPRes


typedef struct PROTOCloseOrderIAPRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOCloseOrderIAPRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCloseOrderIAPRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOCloseOrderIAPRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeAccountInfoReq

@implementation PROTOVIPChargeAccountInfoReq

@dynamic id_p;

typedef struct PROTOVIPChargeAccountInfoReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t id_p;
} PROTOVIPChargeAccountInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoReq_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoReq__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeAccountInfoReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVIPChargeAccountInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeAccountInfoRes

@implementation PROTOVIPChargeAccountInfoRes

@dynamic dueBank;
@dynamic payee;
@dynamic accountNumber;
@dynamic depositBank;
@dynamic nickname;
@dynamic playerId;

typedef struct PROTOVIPChargeAccountInfoRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *dueBank;
  NSString *payee;
  NSString *accountNumber;
  NSString *depositBank;
  NSString *nickname;
  int64_t playerId;
} PROTOVIPChargeAccountInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "dueBank",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_DueBank,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, dueBank),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "payee",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_Payee,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, payee),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "accountNumber",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_AccountNumber,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, accountNumber),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "depositBank",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_DepositBank,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, depositBank),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_Nickname,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeAccountInfoRes_FieldNumber_PlayerId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOVIPChargeAccountInfoRes__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeAccountInfoRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVIPChargeAccountInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeLogReq

@implementation PROTOVIPChargeLogReq


typedef struct PROTOVIPChargeLogReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOVIPChargeLogReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeLogReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOVIPChargeLogReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeLogRes

@implementation PROTOVIPChargeLogRes

@dynamic listArray, listArray_Count;

typedef struct PROTOVIPChargeLogRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PROTOVIPChargeLogRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOVIPChargeLogs),
        .number = PROTOVIPChargeLogRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOVIPChargeLogRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeLogRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVIPChargeLogRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeLogs

@implementation PROTOVIPChargeLogs

@dynamic day;
@dynamic listArray, listArray_Count;

typedef struct PROTOVIPChargeLogs__storage_ {
  uint32_t _has_storage_[1];
  NSString *day;
  NSMutableArray *listArray;
} PROTOVIPChargeLogs__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "day",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeLogs_FieldNumber_Day,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVIPChargeLogs__storage_, day),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOVIPChargeItem),
        .number = PROTOVIPChargeLogs_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOVIPChargeLogs__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeLogs class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVIPChargeLogs__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVIPChargeItem

@implementation PROTOVIPChargeItem

@dynamic chargeAt;
@dynamic finishAt;
@dynamic rmb;
@dynamic gold;
@dynamic status;

typedef struct PROTOVIPChargeItem__storage_ {
  uint32_t _has_storage_[1];
  PROTOChargeStatus status;
  int64_t chargeAt;
  int64_t finishAt;
  int64_t rmb;
  int64_t gold;
} PROTOVIPChargeItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "chargeAt",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeItem_FieldNumber_ChargeAt,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVIPChargeItem__storage_, chargeAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "finishAt",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeItem_FieldNumber_FinishAt,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOVIPChargeItem__storage_, finishAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "rmb",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeItem_FieldNumber_Rmb,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOVIPChargeItem__storage_, rmb),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "gold",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVIPChargeItem_FieldNumber_Gold,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOVIPChargeItem__storage_, gold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PROTOChargeStatus_EnumDescriptor,
        .number = PROTOVIPChargeItem_FieldNumber_Status,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOVIPChargeItem__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVIPChargeItem class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVIPChargeItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOVIPChargeItem_Status_RawValue(PROTOVIPChargeItem *message) {
  GPBDescriptor *descriptor = [PROTOVIPChargeItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOVIPChargeItem_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOVIPChargeItem_Status_RawValue(PROTOVIPChargeItem *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOVIPChargeItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOVIPChargeItem_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOReportDataReq

@implementation PROTOReportDataReq

@dynamic type;
@dynamic data_p;

typedef struct PROTOReportDataReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOReportDataType type;
  NSData *data_p;
} PROTOReportDataReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.enumDescFunc = PROTOReportDataType_EnumDescriptor,
        .number = PROTOReportDataReq_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOReportDataReq__storage_, type),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "data_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportDataReq_FieldNumber_Data_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOReportDataReq__storage_, data_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportDataReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOReportDataReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOReportDataReq_Type_RawValue(PROTOReportDataReq *message) {
  GPBDescriptor *descriptor = [PROTOReportDataReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDataReq_FieldNumber_Type];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOReportDataReq_Type_RawValue(PROTOReportDataReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOReportDataReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOReportDataReq_FieldNumber_Type];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOReportDataRes

@implementation PROTOReportDataRes


typedef struct PROTOReportDataRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOReportDataRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportDataRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOReportDataRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetChargeReq

@implementation PROTOGetChargeReq

@dynamic orderId;
@dynamic accountId;
@dynamic gold;
@dynamic remark;
@dynamic extends, extends_Count;
@dynamic extraData, extraData_Count;
@dynamic subType;
@dynamic returnURL;

typedef struct PROTOGetChargeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *orderId;
  NSString *remark;
  NSMutableDictionary *extends;
  NSMutableDictionary *extraData;
  NSString *subType;
  NSString *returnURL;
  int64_t accountId;
  int64_t gold;
} PROTOGetChargeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "orderId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_OrderId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, orderId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "accountId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_AccountId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, accountId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "gold",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_Gold,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, gold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "remark",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_Remark,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, remark),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "extends",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_Extends,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, extends),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "extraData",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_ExtraData,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, extraData),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "subType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_SubType,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, subType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "returnURL",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeReq_FieldNumber_ReturnURL,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOGetChargeReq__storage_, returnURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetChargeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetChargeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\t\006\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetChargeRes

@implementation PROTOGetChargeRes

@dynamic code;
@dynamic detail;
@dynamic data_p;
@dynamic redirectURL;

typedef struct PROTOGetChargeRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t code;
  NSString *detail;
  NSString *data_p;
  NSString *redirectURL;
} PROTOGetChargeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeRes_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetChargeRes__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "detail",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeRes_FieldNumber_Detail,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetChargeRes__storage_, detail),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "data_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeRes_FieldNumber_Data_p,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetChargeRes__storage_, data_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "redirectURL",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetChargeRes_FieldNumber_RedirectURL,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetChargeRes__storage_, redirectURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetChargeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetChargeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\004\010\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSmsCodeReq

@implementation PROTOGetSmsCodeReq

@dynamic country;
@dynamic phoneNo;
@dynamic phoneSign;
@dynamic smsCodeTpl;

typedef struct PROTOGetSmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  PROTOSMSCodeTpl smsCodeTpl;
  NSString *phoneNo;
  NSString *phoneSign;
} PROTOGetSmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsCodeReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSmsCodeReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsCodeReq_FieldNumber_PhoneNo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetSmsCodeReq__storage_, phoneNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsCodeReq_FieldNumber_PhoneSign,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetSmsCodeReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsCodeTpl",
        .dataTypeSpecific.enumDescFunc = PROTOSMSCodeTpl_EnumDescriptor,
        .number = PROTOGetSmsCodeReq_FieldNumber_SmsCodeTpl,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetSmsCodeReq__storage_, smsCodeTpl),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSmsCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOGetSmsCodeReq_SmsCodeTpl_RawValue(PROTOGetSmsCodeReq *message) {
  GPBDescriptor *descriptor = [PROTOGetSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetSmsCodeReq_FieldNumber_SmsCodeTpl];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOGetSmsCodeReq_SmsCodeTpl_RawValue(PROTOGetSmsCodeReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOGetSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetSmsCodeReq_FieldNumber_SmsCodeTpl];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOGetSmsCodeRes

@implementation PROTOGetSmsCodeRes


typedef struct PROTOGetSmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetSmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSmsCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetSmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSmsTokenReq

@implementation PROTOGetSmsTokenReq

@dynamic country;
@dynamic phoneNo;
@dynamic smsCode;
@dynamic phoneSign;
@dynamic smsCodeTpl;

typedef struct PROTOGetSmsTokenReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  PROTOSMSCodeTpl smsCodeTpl;
  NSString *phoneNo;
  NSString *smsCode;
  NSString *phoneSign;
} PROTOGetSmsTokenReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsTokenReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsTokenReq_FieldNumber_PhoneNo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenReq__storage_, phoneNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsTokenReq_FieldNumber_SmsCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsTokenReq_FieldNumber_PhoneSign,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsCodeTpl",
        .dataTypeSpecific.enumDescFunc = PROTOSMSCodeTpl_EnumDescriptor,
        .number = PROTOGetSmsTokenReq_FieldNumber_SmsCodeTpl,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenReq__storage_, smsCodeTpl),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSmsTokenReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSmsTokenReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOGetSmsTokenReq_SmsCodeTpl_RawValue(PROTOGetSmsTokenReq *message) {
  GPBDescriptor *descriptor = [PROTOGetSmsTokenReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetSmsTokenReq_FieldNumber_SmsCodeTpl];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOGetSmsTokenReq_SmsCodeTpl_RawValue(PROTOGetSmsTokenReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOGetSmsTokenReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetSmsTokenReq_FieldNumber_SmsCodeTpl];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOGetSmsTokenRes

@implementation PROTOGetSmsTokenRes

@dynamic smsToken;

typedef struct PROTOGetSmsTokenRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *smsToken;
} PROTOGetSmsTokenRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "smsToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSmsTokenRes_FieldNumber_SmsToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSmsTokenRes__storage_, smsToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSmsTokenRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSmsTokenRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOPhoneSmsCodeReq

@implementation PROTOPhoneSmsCodeReq

@dynamic smsCodeTpl;

typedef struct PROTOPhoneSmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOSMSCodeTpl smsCodeTpl;
} PROTOPhoneSmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "smsCodeTpl",
        .dataTypeSpecific.enumDescFunc = PROTOSMSCodeTpl_EnumDescriptor,
        .number = PROTOPhoneSmsCodeReq_FieldNumber_SmsCodeTpl,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOPhoneSmsCodeReq__storage_, smsCodeTpl),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOPhoneSmsCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOPhoneSmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOPhoneSmsCodeReq_SmsCodeTpl_RawValue(PROTOPhoneSmsCodeReq *message) {
  GPBDescriptor *descriptor = [PROTOPhoneSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOPhoneSmsCodeReq_FieldNumber_SmsCodeTpl];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOPhoneSmsCodeReq_SmsCodeTpl_RawValue(PROTOPhoneSmsCodeReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOPhoneSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOPhoneSmsCodeReq_FieldNumber_SmsCodeTpl];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOPhoneSmsCodeRes

@implementation PROTOPhoneSmsCodeRes


typedef struct PROTOPhoneSmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOPhoneSmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOPhoneSmsCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOPhoneSmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOCheckPhoneSmsCodeReq

@implementation PROTOCheckPhoneSmsCodeReq

@dynamic smsCodeTpl;
@dynamic smsCode;

typedef struct PROTOCheckPhoneSmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOSMSCodeTpl smsCodeTpl;
  NSString *smsCode;
} PROTOCheckPhoneSmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "smsCodeTpl",
        .dataTypeSpecific.enumDescFunc = PROTOSMSCodeTpl_EnumDescriptor,
        .number = PROTOCheckPhoneSmsCodeReq_FieldNumber_SmsCodeTpl,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOCheckPhoneSmsCodeReq__storage_, smsCodeTpl),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCheckPhoneSmsCodeReq_FieldNumber_SmsCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOCheckPhoneSmsCodeReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCheckPhoneSmsCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOCheckPhoneSmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOCheckPhoneSmsCodeReq_SmsCodeTpl_RawValue(PROTOCheckPhoneSmsCodeReq *message) {
  GPBDescriptor *descriptor = [PROTOCheckPhoneSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCheckPhoneSmsCodeReq_FieldNumber_SmsCodeTpl];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOCheckPhoneSmsCodeReq_SmsCodeTpl_RawValue(PROTOCheckPhoneSmsCodeReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOCheckPhoneSmsCodeReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCheckPhoneSmsCodeReq_FieldNumber_SmsCodeTpl];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOCheckPhoneSmsCodeRes

@implementation PROTOCheckPhoneSmsCodeRes


typedef struct PROTOCheckPhoneSmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOCheckPhoneSmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCheckPhoneSmsCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOCheckPhoneSmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOCommonSignInRes

@implementation PROTOCommonSignInRes

@dynamic loginToken;
@dynamic isNew;
@dynamic userId;
@dynamic extends, extends_Count;
@dynamic loginType;

typedef struct PROTOCommonSignInRes__storage_ {
  uint32_t _has_storage_[1];
  PROTOUauthLoginType loginType;
  NSString *loginToken;
  NSMutableDictionary *extends;
  int64_t userId;
} PROTOCommonSignInRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "loginToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCommonSignInRes_FieldNumber_LoginToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOCommonSignInRes__storage_, loginToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isNew",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCommonSignInRes_FieldNumber_IsNew,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCommonSignInRes_FieldNumber_UserId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOCommonSignInRes__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "extends",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCommonSignInRes_FieldNumber_Extends,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOCommonSignInRes__storage_, extends),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOCommonSignInRes_FieldNumber_LoginType,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOCommonSignInRes__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCommonSignInRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOCommonSignInRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOCommonSignInRes_LoginType_RawValue(PROTOCommonSignInRes *message) {
  GPBDescriptor *descriptor = [PROTOCommonSignInRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCommonSignInRes_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOCommonSignInRes_LoginType_RawValue(PROTOCommonSignInRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOCommonSignInRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCommonSignInRes_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOSignInWithAppleReq

@implementation PROTOSignInWithAppleReq

@dynamic identityToken;
@dynamic authorizationCode;
@dynamic fullName;
@dynamic deviceId;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOSignInWithAppleReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *identityToken;
  NSString *authorizationCode;
  NSString *fullName;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTOSignInWithAppleReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "identityToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_IdentityToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, identityToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "authorizationCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_AuthorizationCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, authorizationCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "fullName",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_FullName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, fullName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_DeviceId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_UMengDeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOSignInWithAppleReq_FieldNumber_YidunToken,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOSignInWithAppleReq_FieldNumber_DeviceMessage,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOSignInWithAppleReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOSignInWithAppleReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOSignInWithAppleReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOIdOrPhoneLoginReq

@implementation PROTOIdOrPhoneLoginReq

@dynamic country;
@dynamic value;
@dynamic password;
@dynamic sign;
@dynamic deviceId;
@dynamic uMengDeviceId;
@dynamic yidunToken;

typedef struct PROTOIdOrPhoneLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  NSString *value;
  NSString *password;
  NSString *sign;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
} PROTOIdOrPhoneLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_Password,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_Sign,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_DeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOIdOrPhoneLoginReq_FieldNumber_YidunToken,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOIdOrPhoneLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOIdOrPhoneLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOIdOrPhoneLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOLoginWithPhoneSMSReq

@implementation PROTOLoginWithPhoneSMSReq

@dynamic phone;
@dynamic smsToken;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic smsCode;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic phoneSign;
@dynamic hasDeviceMessage, deviceMessage;
@dynamic smsCodeTpl;

typedef struct PROTOLoginWithPhoneSMSReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  PROTOSMSCodeTpl smsCodeTpl;
  NSString *phone;
  NSString *smsToken;
  NSString *deviceId;
  NSString *smsCode;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  NSString *phoneSign;
  PROTODeviceMessage *deviceMessage;
} PROTOLoginWithPhoneSMSReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_Phone,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_SmsToken,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, smsToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_DeviceId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_DeviceType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_Channel,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_SmsCode,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_UMengDeviceId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_YidunToken,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_PhoneSign,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_DeviceMessage,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "smsCodeTpl",
        .dataTypeSpecific.enumDescFunc = PROTOSMSCodeTpl_EnumDescriptor,
        .number = PROTOLoginWithPhoneSMSReq_FieldNumber_SmsCodeTpl,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PROTOLoginWithPhoneSMSReq__storage_, smsCodeTpl),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOLoginWithPhoneSMSReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOLoginWithPhoneSMSReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOLoginWithPhoneSMSReq_SmsCodeTpl_RawValue(PROTOLoginWithPhoneSMSReq *message) {
  GPBDescriptor *descriptor = [PROTOLoginWithPhoneSMSReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOLoginWithPhoneSMSReq_FieldNumber_SmsCodeTpl];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOLoginWithPhoneSMSReq_SmsCodeTpl_RawValue(PROTOLoginWithPhoneSMSReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOLoginWithPhoneSMSReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOLoginWithPhoneSMSReq_FieldNumber_SmsCodeTpl];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOThirdLoginReq

@implementation PROTOThirdLoginReq

@dynamic code;
@dynamic accessToken;
@dynamic appId;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic loginType;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic tokenSecret;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOThirdLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  PROTOUauthLoginType loginType;
  NSString *code;
  NSString *accessToken;
  NSString *appId;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  NSString *tokenSecret;
  PROTODeviceMessage *deviceMessage;
} PROTOThirdLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "accessToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_AccessToken,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, accessToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_AppId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_DeviceId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_DeviceType,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_Channel,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOThirdLoginReq_FieldNumber_LoginType,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_YidunToken,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tokenSecret",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdLoginReq_FieldNumber_TokenSecret,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, tokenSecret),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOThirdLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PROTOThirdLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOThirdLoginReq_LoginType_RawValue(PROTOThirdLoginReq *message) {
  GPBDescriptor *descriptor = [PROTOThirdLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOThirdLoginReq_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOThirdLoginReq_LoginType_RawValue(PROTOThirdLoginReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOThirdLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOThirdLoginReq_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOChinaMobileQuickLoginReq

@implementation PROTOChinaMobileQuickLoginReq

@dynamic appId;
@dynamic token;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOChinaMobileQuickLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *appId;
  NSString *token;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTOChinaMobileQuickLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_AppId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "token",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_Token,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, token),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_DeviceId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_DeviceType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_Channel,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_YidunToken,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOChinaMobileQuickLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOChinaMobileQuickLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOChinaMobileQuickLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOChinaMobileQuickLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOChinaTelecomAuthReq

@implementation PROTOChinaTelecomAuthReq

@dynamic accessToken;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOChinaTelecomAuthReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *accessToken;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTOChinaTelecomAuthReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "accessToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_AccessToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, accessToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_DeviceId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_DeviceType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_Channel,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_UMengDeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOChinaTelecomAuthReq_FieldNumber_YidunToken,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOChinaTelecomAuthReq_FieldNumber_DeviceMessage,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOChinaTelecomAuthReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOChinaTelecomAuthReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOChinaTelecomAuthReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOUmengQuickLoginReq

@implementation PROTOUmengQuickLoginReq

@dynamic appKey;
@dynamic token;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOUmengQuickLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *appKey;
  NSString *token;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTOUmengQuickLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appKey",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_AppKey,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, appKey),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "token",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_Token,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, token),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_DeviceId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_DeviceType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_Channel,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUmengQuickLoginReq_FieldNumber_YidunToken,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOUmengQuickLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOUmengQuickLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUmengQuickLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOUmengQuickLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTODevLoginReq

@implementation PROTODevLoginReq

@dynamic name;
@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTODevLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *name;
  NSString *deviceId;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTODevLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_DeviceId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_DeviceType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_Channel,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTODevLoginReq_FieldNumber_YidunToken,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTODevLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTODevLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTODevLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTODevLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOResetPasswordReq

@implementation PROTOResetPasswordReq

@dynamic country;
@dynamic phoneNo;
@dynamic smsToken;
@dynamic password;
@dynamic sign;
@dynamic phoneSign;
@dynamic playerId;

typedef struct PROTOResetPasswordReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  NSString *phoneNo;
  NSString *smsToken;
  NSString *password;
  NSString *sign;
  NSString *phoneSign;
  int64_t playerId;
} PROTOResetPasswordReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_PhoneNo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, phoneNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_SmsToken,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, smsToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_Password,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_Sign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_PhoneSign,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordReq_FieldNumber_PlayerId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOResetPasswordReq__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOResetPasswordReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOResetPasswordReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOResetPasswordRes

@implementation PROTOResetPasswordRes


typedef struct PROTOResetPasswordRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOResetPasswordRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOResetPasswordRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOResetPasswordRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOLoginSecretReq

@implementation PROTOLoginSecretReq


typedef struct PROTOLoginSecretReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOLoginSecretReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOLoginSecretReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOLoginSecretReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOLoginSecretRes

@implementation PROTOLoginSecretRes

@dynamic key;

typedef struct PROTOLoginSecretRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *key;
} PROTOLoginSecretRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "key",
        .dataTypeSpecific.className = NULL,
        .number = PROTOLoginSecretRes_FieldNumber_Key,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOLoginSecretRes__storage_, key),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOLoginSecretRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOLoginSecretRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOUpdatePasswdReq

@implementation PROTOUpdatePasswdReq

@dynamic oldPasswd;
@dynamic newPasswd;
@dynamic sign;
@dynamic isNew;

typedef struct PROTOUpdatePasswdReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *oldPasswd;
  NSString *newPasswd;
  NSString *sign;
} PROTOUpdatePasswdReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oldPasswd",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUpdatePasswdReq_FieldNumber_OldPasswd,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOUpdatePasswdReq__storage_, oldPasswd),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "newPasswd",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUpdatePasswdReq_FieldNumber_NewPasswd,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOUpdatePasswdReq__storage_, newPasswd),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUpdatePasswdReq_FieldNumber_Sign,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOUpdatePasswdReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isNew",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUpdatePasswdReq_FieldNumber_IsNew,
        .hasIndex = 3,
        .offset = 4,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUpdatePasswdReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOUpdatePasswdReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOUpdatePasswdRes

@implementation PROTOUpdatePasswdRes


typedef struct PROTOUpdatePasswdRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOUpdatePasswdRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUpdatePasswdRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOUpdatePasswdRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOInviteReq

@implementation PROTOInviteReq

@dynamic playerId;
@dynamic type;
@dynamic extend;

typedef struct PROTOInviteReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t type;
  NSString *extend;
  int64_t playerId;
} PROTOInviteReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOInviteReq_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOInviteReq__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = PROTOInviteReq_FieldNumber_Type,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOInviteReq__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "extend",
        .dataTypeSpecific.className = NULL,
        .number = PROTOInviteReq_FieldNumber_Extend,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOInviteReq__storage_, extend),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOInviteReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOInviteReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOInviteRes

@implementation PROTOInviteRes


typedef struct PROTOInviteRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOInviteRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOInviteRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOInviteRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSyncTimeReq

@implementation PROTOGetSyncTimeReq


typedef struct PROTOGetSyncTimeReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetSyncTimeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSyncTimeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetSyncTimeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSyncTimeRes

@implementation PROTOGetSyncTimeRes


typedef struct PROTOGetSyncTimeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetSyncTimeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSyncTimeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetSyncTimeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOReportBuyNobilityReq

@implementation PROTOReportBuyNobilityReq

@dynamic roomId;
@dynamic benefitId;

typedef struct PROTOReportBuyNobilityReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t roomId;
  int64_t benefitId;
} PROTOReportBuyNobilityReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportBuyNobilityReq_FieldNumber_RoomId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOReportBuyNobilityReq__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "benefitId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOReportBuyNobilityReq_FieldNumber_BenefitId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOReportBuyNobilityReq__storage_, benefitId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportBuyNobilityReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOReportBuyNobilityReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOReportBuyNobilityRes

@implementation PROTOReportBuyNobilityRes


typedef struct PROTOReportBuyNobilityRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOReportBuyNobilityRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOReportBuyNobilityRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOReportBuyNobilityRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABNotifyReq

@implementation PROTOGoogleIABNotifyReq

@dynamic userId;
@dynamic packageName;
@dynamic hasBuyIntent, buyIntent;

typedef struct PROTOGoogleIABNotifyReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *packageName;
  PROTOGoogleIABNotifyReq_BuyIntent *buyIntent;
  int64_t userId;
} PROTOGoogleIABNotifyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABNotifyReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGoogleIABNotifyReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "packageName",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABNotifyReq_FieldNumber_PackageName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGoogleIABNotifyReq__storage_, packageName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "buyIntent",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOGoogleIABNotifyReq_BuyIntent),
        .number = PROTOGoogleIABNotifyReq_FieldNumber_BuyIntent,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGoogleIABNotifyReq__storage_, buyIntent),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABNotifyReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGoogleIABNotifyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABNotifyReq_BuyIntent

@implementation PROTOGoogleIABNotifyReq_BuyIntent

@dynamic purchaseData;
@dynamic dataSignature;

typedef struct PROTOGoogleIABNotifyReq_BuyIntent__storage_ {
  uint32_t _has_storage_[1];
  NSString *purchaseData;
  NSString *dataSignature;
} PROTOGoogleIABNotifyReq_BuyIntent__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "purchaseData",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABNotifyReq_BuyIntent_FieldNumber_PurchaseData,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGoogleIABNotifyReq_BuyIntent__storage_, purchaseData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "dataSignature",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABNotifyReq_BuyIntent_FieldNumber_DataSignature,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGoogleIABNotifyReq_BuyIntent__storage_, dataSignature),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABNotifyReq_BuyIntent class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGoogleIABNotifyReq_BuyIntent__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    [localDescriptor setupContainingMessageClassName:GPBStringifySymbol(PROTOGoogleIABNotifyReq)];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABNotifyRes

@implementation PROTOGoogleIABNotifyRes


typedef struct PROTOGoogleIABNotifyRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOGoogleIABNotifyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABNotifyRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGoogleIABNotifyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABProductItem

@implementation PROTOGoogleIABProductItem

@dynamic id_p;
@dynamic name;
@dynamic price;
@dynamic desc;

typedef struct PROTOGoogleIABProductItem__storage_ {
  uint32_t _has_storage_[1];
  NSString *id_p;
  NSString *name;
  NSString *price;
  NSString *desc;
} PROTOGoogleIABProductItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABProductItem_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGoogleIABProductItem__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABProductItem_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGoogleIABProductItem__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "price",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABProductItem_FieldNumber_Price,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGoogleIABProductItem__storage_, price),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "desc",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGoogleIABProductItem_FieldNumber_Desc,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGoogleIABProductItem__storage_, desc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABProductItem class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGoogleIABProductItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABProductItemsReq

@implementation PROTOGoogleIABProductItemsReq


typedef struct PROTOGoogleIABProductItemsReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOGoogleIABProductItemsReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABProductItemsReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGoogleIABProductItemsReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGoogleIABProductItemsRes

@implementation PROTOGoogleIABProductItemsRes

@dynamic itemsArray, itemsArray_Count;

typedef struct PROTOGoogleIABProductItemsRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *itemsArray;
} PROTOGoogleIABProductItemsRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "itemsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOGoogleIABProductItem),
        .number = PROTOGoogleIABProductItemsRes_FieldNumber_ItemsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOGoogleIABProductItemsRes__storage_, itemsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGoogleIABProductItemsRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGoogleIABProductItemsRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetWeChatAppIdReq

@implementation PROTOGetWeChatAppIdReq


typedef struct PROTOGetWeChatAppIdReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetWeChatAppIdReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetWeChatAppIdReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetWeChatAppIdReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetWeChatAppIdRes

@implementation PROTOGetWeChatAppIdRes

@dynamic appId;

typedef struct PROTOGetWeChatAppIdRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *appId;
} PROTOGetWeChatAppIdRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetWeChatAppIdRes_FieldNumber_AppId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetWeChatAppIdRes__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetWeChatAppIdRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetWeChatAppIdRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetWeChatIdLoginReq

@implementation PROTOGetWeChatIdLoginReq

@dynamic code;

typedef struct PROTOGetWeChatIdLoginReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *code;
} PROTOGetWeChatIdLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetWeChatIdLoginReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetWeChatIdLoginReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetWeChatIdLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetWeChatIdLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetWeChatIdLoginRes

@implementation PROTOGetWeChatIdLoginRes

@dynamic token;
@dynamic unionId;
@dynamic openId;

typedef struct PROTOGetWeChatIdLoginRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *token;
  NSString *unionId;
  NSString *openId;
} PROTOGetWeChatIdLoginRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "token",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetWeChatIdLoginRes_FieldNumber_Token,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetWeChatIdLoginRes__storage_, token),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "unionId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetWeChatIdLoginRes_FieldNumber_UnionId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetWeChatIdLoginRes__storage_, unionId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetWeChatIdLoginRes_FieldNumber_OpenId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetWeChatIdLoginRes__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetWeChatIdLoginRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetWeChatIdLoginRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOUserInfo

@implementation PROTOUserInfo

@dynamic nickname;
@dynamic icon;
@dynamic gender;

typedef struct PROTOUserInfo__storage_ {
  uint32_t _has_storage_[1];
  int32_t gender;
  NSString *nickname;
  NSString *icon;
} PROTOUserInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUserInfo_FieldNumber_Nickname,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOUserInfo__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUserInfo_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOUserInfo__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "gender",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUserInfo_FieldNumber_Gender,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOUserInfo__storage_, gender),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUserInfo class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOUserInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetMiniProgramLoginReq

@implementation PROTOGetMiniProgramLoginReq

@dynamic code;
@dynamic appid;
@dynamic loginType;
@dynamic hasUserInfo, userInfo;
@dynamic encryptedData;
@dynamic iv;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOGetMiniProgramLoginReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOUauthLoginType loginType;
  NSString *code;
  NSString *appid;
  PROTOUserInfo *userInfo;
  NSString *encryptedData;
  NSString *iv;
  PROTODeviceMessage *deviceMessage;
} PROTOGetMiniProgramLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "appid",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_Appid,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, appid),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_LoginType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "userInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOUserInfo),
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_UserInfo,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, userInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "encryptedData",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_EncryptedData,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, encryptedData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "iv",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_Iv,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, iv),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOGetMiniProgramLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOGetMiniProgramLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetMiniProgramLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetMiniProgramLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOGetMiniProgramLoginReq_LoginType_RawValue(PROTOGetMiniProgramLoginReq *message) {
  GPBDescriptor *descriptor = [PROTOGetMiniProgramLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetMiniProgramLoginReq_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOGetMiniProgramLoginReq_LoginType_RawValue(PROTOGetMiniProgramLoginReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOGetMiniProgramLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetMiniProgramLoginReq_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOMiniProgramPhoneReq

@implementation PROTOMiniProgramPhoneReq

@dynamic encryptedData;
@dynamic iv;
@dynamic loginType;
@dynamic code;

typedef struct PROTOMiniProgramPhoneReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOUauthLoginType loginType;
  NSString *encryptedData;
  NSString *iv;
  NSString *code;
} PROTOMiniProgramPhoneReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "encryptedData",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMiniProgramPhoneReq_FieldNumber_EncryptedData,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOMiniProgramPhoneReq__storage_, encryptedData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "iv",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMiniProgramPhoneReq_FieldNumber_Iv,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOMiniProgramPhoneReq__storage_, iv),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOMiniProgramPhoneReq_FieldNumber_LoginType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOMiniProgramPhoneReq__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOMiniProgramPhoneReq_FieldNumber_Code,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOMiniProgramPhoneReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOMiniProgramPhoneReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOMiniProgramPhoneReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOMiniProgramPhoneReq_LoginType_RawValue(PROTOMiniProgramPhoneReq *message) {
  GPBDescriptor *descriptor = [PROTOMiniProgramPhoneReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOMiniProgramPhoneReq_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOMiniProgramPhoneReq_LoginType_RawValue(PROTOMiniProgramPhoneReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOMiniProgramPhoneReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOMiniProgramPhoneReq_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOMiniProgramPhoneRes

@implementation PROTOMiniProgramPhoneRes


typedef struct PROTOMiniProgramPhoneRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOMiniProgramPhoneRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOMiniProgramPhoneRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOMiniProgramPhoneRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOApplyCertifyReq

@implementation PROTOApplyCertifyReq

@dynamic certifyType;
@dynamic idCard;
@dynamic name;

typedef struct PROTOApplyCertifyReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOCertifyType certifyType;
  NSString *idCard;
  NSString *name;
} PROTOApplyCertifyReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "certifyType",
        .dataTypeSpecific.enumDescFunc = PROTOCertifyType_EnumDescriptor,
        .number = PROTOApplyCertifyReq_FieldNumber_CertifyType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyReq__storage_, certifyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "idCard",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyReq_FieldNumber_IdCard,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyReq__storage_, idCard),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyReq_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyReq__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOApplyCertifyReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOApplyCertifyReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOApplyCertifyReq_CertifyType_RawValue(PROTOApplyCertifyReq *message) {
  GPBDescriptor *descriptor = [PROTOApplyCertifyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOApplyCertifyReq_FieldNumber_CertifyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOApplyCertifyReq_CertifyType_RawValue(PROTOApplyCertifyReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOApplyCertifyReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOApplyCertifyReq_FieldNumber_CertifyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOApplyCertifyRes

@implementation PROTOApplyCertifyRes

@dynamic faceId;
@dynamic tradeNo;
@dynamic nonce;
@dynamic userId;
@dynamic sign;

typedef struct PROTOApplyCertifyRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *faceId;
  NSString *tradeNo;
  NSString *nonce;
  NSString *userId;
  NSString *sign;
} PROTOApplyCertifyRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "faceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyRes_FieldNumber_FaceId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyRes__storage_, faceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "tradeNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyRes_FieldNumber_TradeNo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyRes__storage_, tradeNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nonce",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyRes_FieldNumber_Nonce,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyRes__storage_, nonce),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyRes_FieldNumber_UserId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyRes__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifyRes_FieldNumber_Sign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOApplyCertifyRes__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOApplyCertifyRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOApplyCertifyRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOApplyCertifySignReq

@implementation PROTOApplyCertifySignReq

@dynamic certifyType;
@dynamic idCard;
@dynamic idCardSign;
@dynamic name;
@dynamic nameSign;

typedef struct PROTOApplyCertifySignReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOCertifyType certifyType;
  NSString *idCard;
  NSString *idCardSign;
  NSString *name;
  NSString *nameSign;
} PROTOApplyCertifySignReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "certifyType",
        .dataTypeSpecific.enumDescFunc = PROTOCertifyType_EnumDescriptor,
        .number = PROTOApplyCertifySignReq_FieldNumber_CertifyType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOApplyCertifySignReq__storage_, certifyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "idCard",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifySignReq_FieldNumber_IdCard,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOApplyCertifySignReq__storage_, idCard),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "idCardSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifySignReq_FieldNumber_IdCardSign,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOApplyCertifySignReq__storage_, idCardSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifySignReq_FieldNumber_Name,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOApplyCertifySignReq__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nameSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOApplyCertifySignReq_FieldNumber_NameSign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOApplyCertifySignReq__storage_, nameSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOApplyCertifySignReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOApplyCertifySignReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOApplyCertifySignReq_CertifyType_RawValue(PROTOApplyCertifySignReq *message) {
  GPBDescriptor *descriptor = [PROTOApplyCertifySignReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOApplyCertifySignReq_FieldNumber_CertifyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOApplyCertifySignReq_CertifyType_RawValue(PROTOApplyCertifySignReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOApplyCertifySignReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOApplyCertifySignReq_FieldNumber_CertifyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOCertifyResultReq

@implementation PROTOCertifyResultReq


typedef struct PROTOCertifyResultReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOCertifyResultReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCertifyResultReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOCertifyResultReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOCertifyResultRes

@implementation PROTOCertifyResultRes

@dynamic certifyType;
@dynamic idCard;
@dynamic name;

typedef struct PROTOCertifyResultRes__storage_ {
  uint32_t _has_storage_[1];
  PROTOCertifyType certifyType;
  NSString *idCard;
  NSString *name;
} PROTOCertifyResultRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "certifyType",
        .dataTypeSpecific.enumDescFunc = PROTOCertifyType_EnumDescriptor,
        .number = PROTOCertifyResultRes_FieldNumber_CertifyType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOCertifyResultRes__storage_, certifyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "idCard",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCertifyResultRes_FieldNumber_IdCard,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOCertifyResultRes__storage_, idCard),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PROTOCertifyResultRes_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOCertifyResultRes__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOCertifyResultRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOCertifyResultRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOCertifyResultRes_CertifyType_RawValue(PROTOCertifyResultRes *message) {
  GPBDescriptor *descriptor = [PROTOCertifyResultRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCertifyResultRes_FieldNumber_CertifyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOCertifyResultRes_CertifyType_RawValue(PROTOCertifyResultRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOCertifyResultRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOCertifyResultRes_FieldNumber_CertifyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOAccountPhoneSmsCodeReq

@implementation PROTOAccountPhoneSmsCodeReq


typedef struct PROTOAccountPhoneSmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountPhoneSmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountPhoneSmsCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountPhoneSmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountPhoneSmsCodeRes

@implementation PROTOAccountPhoneSmsCodeRes


typedef struct PROTOAccountPhoneSmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountPhoneSmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountPhoneSmsCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountPhoneSmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountSubsidiaryLoginReq

@implementation PROTOAccountSubsidiaryLoginReq

@dynamic deviceId;
@dynamic deviceType;
@dynamic channel;
@dynamic smsCode;
@dynamic uMengDeviceId;
@dynamic yidunToken;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOAccountSubsidiaryLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *deviceId;
  NSString *smsCode;
  NSString *uMengDeviceId;
  NSString *yidunToken;
  PROTODeviceMessage *deviceMessage;
} PROTOAccountSubsidiaryLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "deviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_DeviceId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, deviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_DeviceType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_Channel,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_SmsCode,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "uMengDeviceId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_UMengDeviceId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, uMengDeviceId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "yidunToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_YidunToken,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, yidunToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOAccountSubsidiaryLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOAccountSubsidiaryLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountSubsidiaryLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOAccountSubsidiaryLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetGuestLoginReq

@implementation PROTOGetGuestLoginReq

@dynamic guestKey;
@dynamic sign;
@dynamic deviceType;
@dynamic channel;
@dynamic hasDeviceMessage, deviceMessage;

typedef struct PROTOGetGuestLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t deviceType;
  int32_t channel;
  NSString *guestKey;
  NSString *sign;
  PROTODeviceMessage *deviceMessage;
} PROTOGetGuestLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "guestKey",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetGuestLoginReq_FieldNumber_GuestKey,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetGuestLoginReq__storage_, guestKey),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetGuestLoginReq_FieldNumber_Sign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetGuestLoginReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetGuestLoginReq_FieldNumber_DeviceType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetGuestLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "channel",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetGuestLoginReq_FieldNumber_Channel,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetGuestLoginReq__storage_, channel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "deviceMessage",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTODeviceMessage),
        .number = PROTOGetGuestLoginReq_FieldNumber_DeviceMessage,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetGuestLoginReq__storage_, deviceMessage),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetGuestLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetGuestLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindPhoneSMSReq

@implementation PROTOAccountBindPhoneSMSReq

@dynamic phone;
@dynamic smsCode;
@dynamic verifyOld;
@dynamic phoneSign;

typedef struct PROTOAccountBindPhoneSMSReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *phone;
  NSString *smsCode;
  NSString *phoneSign;
} PROTOAccountBindPhoneSMSReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindPhoneSMSReq_FieldNumber_Phone,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOAccountBindPhoneSMSReq__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindPhoneSMSReq_FieldNumber_SmsCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOAccountBindPhoneSMSReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "verifyOld",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindPhoneSMSReq_FieldNumber_VerifyOld,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindPhoneSMSReq_FieldNumber_PhoneSign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOAccountBindPhoneSMSReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindPhoneSMSReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOAccountBindPhoneSMSReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindPhoneSMSRes

@implementation PROTOAccountBindPhoneSMSRes


typedef struct PROTOAccountBindPhoneSMSRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountBindPhoneSMSRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindPhoneSMSRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountBindPhoneSMSRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindThirdReq

@implementation PROTOAccountBindThirdReq

@dynamic code;
@dynamic accessToken;
@dynamic appId;
@dynamic loginType;
@dynamic tokenSecret;

typedef struct PROTOAccountBindThirdReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOUauthLoginType loginType;
  NSString *code;
  NSString *accessToken;
  NSString *appId;
  NSString *tokenSecret;
} PROTOAccountBindThirdReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindThirdReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOAccountBindThirdReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "accessToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindThirdReq_FieldNumber_AccessToken,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOAccountBindThirdReq__storage_, accessToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindThirdReq_FieldNumber_AppId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOAccountBindThirdReq__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOAccountBindThirdReq_FieldNumber_LoginType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOAccountBindThirdReq__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "tokenSecret",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindThirdReq_FieldNumber_TokenSecret,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOAccountBindThirdReq__storage_, tokenSecret),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindThirdReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOAccountBindThirdReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOAccountBindThirdReq_LoginType_RawValue(PROTOAccountBindThirdReq *message) {
  GPBDescriptor *descriptor = [PROTOAccountBindThirdReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOAccountBindThirdReq_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOAccountBindThirdReq_LoginType_RawValue(PROTOAccountBindThirdReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOAccountBindThirdReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOAccountBindThirdReq_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOAccountBindThirdRes

@implementation PROTOAccountBindThirdRes


typedef struct PROTOAccountBindThirdRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountBindThirdRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindThirdRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountBindThirdRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindListReq

@implementation PROTOAccountBindListReq


typedef struct PROTOAccountBindListReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountBindListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindListReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountBindListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindListRes

@implementation PROTOAccountBindListRes

@dynamic listArray, listArray_Count;
@dynamic phone;
@dynamic email;

typedef struct PROTOAccountBindListRes__storage_ {
  uint32_t _has_storage_[1];
  GPBEnumArray *listArray;
  NSString *phone;
  NSString *email;
} PROTOAccountBindListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOAccountBindListRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOAccountBindListRes__storage_, listArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindListRes_FieldNumber_Phone,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOAccountBindListRes__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindListRes_FieldNumber_Email,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOAccountBindListRes__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindListRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOAccountBindListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBindPhoneSmsCodeReq

@implementation PROTOBindPhoneSmsCodeReq

@dynamic country;
@dynamic phoneNo;
@dynamic verifyOld;
@dynamic phoneSign;

typedef struct PROTOBindPhoneSmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  NSString *phoneNo;
  NSString *phoneSign;
} PROTOBindPhoneSmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindPhoneSmsCodeReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOBindPhoneSmsCodeReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "phoneNo",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindPhoneSmsCodeReq_FieldNumber_PhoneNo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOBindPhoneSmsCodeReq__storage_, phoneNo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "verifyOld",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindPhoneSmsCodeReq_FieldNumber_VerifyOld,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "phoneSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindPhoneSmsCodeReq_FieldNumber_PhoneSign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOBindPhoneSmsCodeReq__storage_, phoneSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindPhoneSmsCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOBindPhoneSmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBindPhoneSmsCodeRes

@implementation PROTOBindPhoneSmsCodeRes


typedef struct PROTOBindPhoneSmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOBindPhoneSmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindPhoneSmsCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOBindPhoneSmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBindEmailSesCodeReq

@implementation PROTOBindEmailSesCodeReq

@dynamic email;
@dynamic emailSign;
@dynamic verifyOld;

typedef struct PROTOBindEmailSesCodeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *email;
  NSString *emailSign;
} PROTOBindEmailSesCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindEmailSesCodeReq_FieldNumber_Email,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOBindEmailSesCodeReq__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "emailSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindEmailSesCodeReq_FieldNumber_EmailSign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOBindEmailSesCodeReq__storage_, emailSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "verifyOld",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindEmailSesCodeReq_FieldNumber_VerifyOld,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindEmailSesCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOBindEmailSesCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBindEmailSesCodeRes

@implementation PROTOBindEmailSesCodeRes


typedef struct PROTOBindEmailSesCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOBindEmailSesCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindEmailSesCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOBindEmailSesCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindEmailSESReq

@implementation PROTOAccountBindEmailSESReq

@dynamic email;
@dynamic emailSign;
@dynamic sesCode;
@dynamic verifyOld;

typedef struct PROTOAccountBindEmailSESReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *email;
  NSString *emailSign;
  NSString *sesCode;
} PROTOAccountBindEmailSESReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindEmailSESReq_FieldNumber_Email,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOAccountBindEmailSESReq__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "emailSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindEmailSESReq_FieldNumber_EmailSign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOAccountBindEmailSESReq__storage_, emailSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sesCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindEmailSESReq_FieldNumber_SesCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOAccountBindEmailSESReq__storage_, sesCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "verifyOld",
        .dataTypeSpecific.className = NULL,
        .number = PROTOAccountBindEmailSESReq_FieldNumber_VerifyOld,
        .hasIndex = 3,
        .offset = 4,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindEmailSESReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOAccountBindEmailSESReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOAccountBindEmailSESRes

@implementation PROTOAccountBindEmailSESRes


typedef struct PROTOAccountBindEmailSESRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOAccountBindEmailSESRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOAccountBindEmailSESRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOAccountBindEmailSESRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetAccountRegisterReq

@implementation PROTOGetAccountRegisterReq

@dynamic country;
@dynamic value;
@dynamic password;
@dynamic deviceType;
@dynamic nickname;
@dynamic registerType;
@dynamic code;
@dynamic sign;
@dynamic valueSign;

typedef struct PROTOGetAccountRegisterReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  int32_t deviceType;
  PROTOUauthLoginType registerType;
  NSString *value;
  NSString *password;
  NSString *nickname;
  NSString *code;
  NSString *sign;
  NSString *valueSign;
} PROTOGetAccountRegisterReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Password,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_DeviceType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Nickname,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "registerType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOGetAccountRegisterReq_FieldNumber_RegisterType,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, registerType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Code,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_Sign,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "valueSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountRegisterReq_FieldNumber_ValueSign,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PROTOGetAccountRegisterReq__storage_, valueSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetAccountRegisterReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetAccountRegisterReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOGetAccountRegisterReq_RegisterType_RawValue(PROTOGetAccountRegisterReq *message) {
  GPBDescriptor *descriptor = [PROTOGetAccountRegisterReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetAccountRegisterReq_FieldNumber_RegisterType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOGetAccountRegisterReq_RegisterType_RawValue(PROTOGetAccountRegisterReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOGetAccountRegisterReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetAccountRegisterReq_FieldNumber_RegisterType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOGetAccountPasswordLoginReq

@implementation PROTOGetAccountPasswordLoginReq

@dynamic country;
@dynamic value;
@dynamic password;
@dynamic loginType;
@dynamic deviceType;
@dynamic sign;
@dynamic valueSign;

typedef struct PROTOGetAccountPasswordLoginReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t country;
  PROTOUauthLoginType loginType;
  int32_t deviceType;
  NSString *value;
  NSString *password;
  NSString *sign;
  NSString *valueSign;
} PROTOGetAccountPasswordLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "country",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_Country,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, country),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "value",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_Value,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, value),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_Password,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "loginType",
        .dataTypeSpecific.enumDescFunc = PROTOUauthLoginType_EnumDescriptor,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_LoginType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, loginType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "deviceType",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_DeviceType,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, deviceType),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_Sign,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "valueSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetAccountPasswordLoginReq_FieldNumber_ValueSign,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PROTOGetAccountPasswordLoginReq__storage_, valueSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetAccountPasswordLoginReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetAccountPasswordLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOGetAccountPasswordLoginReq_LoginType_RawValue(PROTOGetAccountPasswordLoginReq *message) {
  GPBDescriptor *descriptor = [PROTOGetAccountPasswordLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetAccountPasswordLoginReq_FieldNumber_LoginType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOGetAccountPasswordLoginReq_LoginType_RawValue(PROTOGetAccountPasswordLoginReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOGetAccountPasswordLoginReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOGetAccountPasswordLoginReq_FieldNumber_LoginType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOGetSesCodeReq

@implementation PROTOGetSesCodeReq

@dynamic email;
@dynamic emailSign;

typedef struct PROTOGetSesCodeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *email;
  NSString *emailSign;
} PROTOGetSesCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesCodeReq_FieldNumber_Email,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSesCodeReq__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "emailSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesCodeReq_FieldNumber_EmailSign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetSesCodeReq__storage_, emailSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSesCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSesCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSesCodeRes

@implementation PROTOGetSesCodeRes


typedef struct PROTOGetSesCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOGetSesCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSesCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOGetSesCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSesTokenReq

@implementation PROTOGetSesTokenReq

@dynamic email;
@dynamic emailSign;
@dynamic sesCode;

typedef struct PROTOGetSesTokenReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *email;
  NSString *emailSign;
  NSString *sesCode;
} PROTOGetSesTokenReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesTokenReq_FieldNumber_Email,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSesTokenReq__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "emailSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesTokenReq_FieldNumber_EmailSign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOGetSesTokenReq__storage_, emailSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sesCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesTokenReq_FieldNumber_SesCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOGetSesTokenReq__storage_, sesCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSesTokenReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSesTokenReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOGetSesTokenRes

@implementation PROTOGetSesTokenRes

@dynamic sesToken;

typedef struct PROTOGetSesTokenRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *sesToken;
} PROTOGetSesTokenRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "sesToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOGetSesTokenRes_FieldNumber_SesToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOGetSesTokenRes__storage_, sesToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOGetSesTokenRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOGetSesTokenRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOResetPasswordBySesReq

@implementation PROTOResetPasswordBySesReq

@dynamic email;
@dynamic emailSign;
@dynamic sesToken;
@dynamic password;
@dynamic sign;

typedef struct PROTOResetPasswordBySesReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *email;
  NSString *emailSign;
  NSString *sesToken;
  NSString *password;
  NSString *sign;
} PROTOResetPasswordBySesReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "email",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordBySesReq_FieldNumber_Email,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOResetPasswordBySesReq__storage_, email),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "emailSign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordBySesReq_FieldNumber_EmailSign,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOResetPasswordBySesReq__storage_, emailSign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sesToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordBySesReq_FieldNumber_SesToken,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOResetPasswordBySesReq__storage_, sesToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "password",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordBySesReq_FieldNumber_Password,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOResetPasswordBySesReq__storage_, password),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sign",
        .dataTypeSpecific.className = NULL,
        .number = PROTOResetPasswordBySesReq_FieldNumber_Sign,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PROTOResetPasswordBySesReq__storage_, sign),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOResetPasswordBySesReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOResetPasswordBySesReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOResetPasswordBySesRes

@implementation PROTOResetPasswordBySesRes


typedef struct PROTOResetPasswordBySesRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOResetPasswordBySesRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOResetPasswordBySesRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOResetPasswordBySesRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTORemoteLoginSendCodeReq

@implementation PROTORemoteLoginSendCodeReq

@dynamic userId;

typedef struct PROTORemoteLoginSendCodeReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t userId;
} PROTORemoteLoginSendCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = PROTORemoteLoginSendCodeReq_FieldNumber_UserId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTORemoteLoginSendCodeReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORemoteLoginSendCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTORemoteLoginSendCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTORemoteLoginSendCodeRes

@implementation PROTORemoteLoginSendCodeRes


typedef struct PROTORemoteLoginSendCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PROTORemoteLoginSendCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORemoteLoginSendCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTORemoteLoginSendCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTORemoteLoginConfirmCodeReq

@implementation PROTORemoteLoginConfirmCodeReq

@dynamic code;
@dynamic userId;

typedef struct PROTORemoteLoginConfirmCodeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *code;
  int64_t userId;
} PROTORemoteLoginConfirmCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTORemoteLoginConfirmCodeReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTORemoteLoginConfirmCodeReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "userId",
        .dataTypeSpecific.className = NULL,
        .number = PROTORemoteLoginConfirmCodeReq_FieldNumber_UserId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTORemoteLoginConfirmCodeReq__storage_, userId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORemoteLoginConfirmCodeReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTORemoteLoginConfirmCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTORemoteLoginConfirmCodeRes

@implementation PROTORemoteLoginConfirmCodeRes

@dynamic hasRes, res;

typedef struct PROTORemoteLoginConfirmCodeRes__storage_ {
  uint32_t _has_storage_[1];
  PROTOCommonSignInRes *res;
} PROTORemoteLoginConfirmCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "res",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOCommonSignInRes),
        .number = PROTORemoteLoginConfirmCodeRes_FieldNumber_Res,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTORemoteLoginConfirmCodeRes__storage_, res),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTORemoteLoginConfirmCodeRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTORemoteLoginConfirmCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVerifyCancelSignInWithAppleReq

@implementation PROTOVerifyCancelSignInWithAppleReq

@dynamic identityToken;
@dynamic authorizationCode;

typedef struct PROTOVerifyCancelSignInWithAppleReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *identityToken;
  NSString *authorizationCode;
} PROTOVerifyCancelSignInWithAppleReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "identityToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyCancelSignInWithAppleReq_FieldNumber_IdentityToken,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOVerifyCancelSignInWithAppleReq__storage_, identityToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "authorizationCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOVerifyCancelSignInWithAppleReq_FieldNumber_AuthorizationCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOVerifyCancelSignInWithAppleReq__storage_, authorizationCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVerifyCancelSignInWithAppleReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOVerifyCancelSignInWithAppleReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOVerifyCancelSignInWithAppleRes

@implementation PROTOVerifyCancelSignInWithAppleRes


typedef struct PROTOVerifyCancelSignInWithAppleRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOVerifyCancelSignInWithAppleRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOVerifyCancelSignInWithAppleRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOVerifyCancelSignInWithAppleRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOWechatCodeLoginTicketReq

@implementation PROTOWechatCodeLoginTicketReq

@dynamic appId;

typedef struct PROTOWechatCodeLoginTicketReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *appId;
} PROTOWechatCodeLoginTicketReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOWechatCodeLoginTicketReq_FieldNumber_AppId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOWechatCodeLoginTicketReq__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOWechatCodeLoginTicketReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOWechatCodeLoginTicketReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOWechatCodeLoginTicketRes

@implementation PROTOWechatCodeLoginTicketRes

@dynamic ticket;

typedef struct PROTOWechatCodeLoginTicketRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *ticket;
} PROTOWechatCodeLoginTicketRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "ticket",
        .dataTypeSpecific.className = NULL,
        .number = PROTOWechatCodeLoginTicketRes_FieldNumber_Ticket,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOWechatCodeLoginTicketRes__storage_, ticket),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOWechatCodeLoginTicketRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOWechatCodeLoginTicketRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOThirdAccountBindWeChatInfo

@implementation PROTOThirdAccountBindWeChatInfo

@dynamic nickname;

typedef struct PROTOThirdAccountBindWeChatInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *nickname;
} PROTOThirdAccountBindWeChatInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdAccountBindWeChatInfo_FieldNumber_Nickname,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindWeChatInfo__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindWeChatInfo class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdAccountBindWeChatInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOThirdAccountBindQqInfo

@implementation PROTOThirdAccountBindQqInfo

@dynamic nickname;

typedef struct PROTOThirdAccountBindQqInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *nickname;
} PROTOThirdAccountBindQqInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PROTOThirdAccountBindQqInfo_FieldNumber_Nickname,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindQqInfo__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindQqInfo class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdAccountBindQqInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOThirdAccountBindInfo

@implementation PROTOThirdAccountBindInfo

@dynamic bindInfoOneOfCase;
@dynamic wechatInfo;
@dynamic qqInfo;

typedef struct PROTOThirdAccountBindInfo__storage_ {
  uint32_t _has_storage_[2];
  PROTOThirdAccountBindWeChatInfo *wechatInfo;
  PROTOThirdAccountBindQqInfo *qqInfo;
} PROTOThirdAccountBindInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "wechatInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOThirdAccountBindWeChatInfo),
        .number = PROTOThirdAccountBindInfo_FieldNumber_WechatInfo,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindInfo__storage_, wechatInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "qqInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOThirdAccountBindQqInfo),
        .number = PROTOThirdAccountBindInfo_FieldNumber_QqInfo,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindInfo__storage_, qqInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindInfo class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdAccountBindInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    static const char *oneofs[] = {
      "bindInfo",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

void PROTOThirdAccountBindInfo_ClearBindInfoOneOfCase(PROTOThirdAccountBindInfo *message) {
  GPBDescriptor *descriptor = [message descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBMaybeClearOneof(message, oneof, -1, 0);
}
#pragma mark - PROTOThirdAccountBindInfoData

@implementation PROTOThirdAccountBindInfoData

@dynamic bindType;
@dynamic hasInfo, info;

typedef struct PROTOThirdAccountBindInfoData__storage_ {
  uint32_t _has_storage_[1];
  PROTOThirdAccountBindType bindType;
  PROTOThirdAccountBindInfo *info;
} PROTOThirdAccountBindInfoData__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "bindType",
        .dataTypeSpecific.enumDescFunc = PROTOThirdAccountBindType_EnumDescriptor,
        .number = PROTOThirdAccountBindInfoData_FieldNumber_BindType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindInfoData__storage_, bindType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "info",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOThirdAccountBindInfo),
        .number = PROTOThirdAccountBindInfoData_FieldNumber_Info,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindInfoData__storage_, info),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindInfoData class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdAccountBindInfoData__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOThirdAccountBindInfoData_BindType_RawValue(PROTOThirdAccountBindInfoData *message) {
  GPBDescriptor *descriptor = [PROTOThirdAccountBindInfoData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOThirdAccountBindInfoData_FieldNumber_BindType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOThirdAccountBindInfoData_BindType_RawValue(PROTOThirdAccountBindInfoData *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOThirdAccountBindInfoData descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOThirdAccountBindInfoData_FieldNumber_BindType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOThirdAccountBindInfoReq

@implementation PROTOThirdAccountBindInfoReq


typedef struct PROTOThirdAccountBindInfoReq__storage_ {
  uint32_t _has_storage_[1];
} PROTOThirdAccountBindInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindInfoReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOThirdAccountBindInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOThirdAccountBindInfoRes

@implementation PROTOThirdAccountBindInfoRes

@dynamic infoDataArray, infoDataArray_Count;

typedef struct PROTOThirdAccountBindInfoRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *infoDataArray;
} PROTOThirdAccountBindInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "infoDataArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PROTOThirdAccountBindInfoData),
        .number = PROTOThirdAccountBindInfoRes_FieldNumber_InfoDataArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PROTOThirdAccountBindInfoRes__storage_, infoDataArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOThirdAccountBindInfoRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOThirdAccountBindInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOBindThirdAccountReq

@implementation PROTOBindThirdAccountReq

@dynamic bindType;
@dynamic appId;
@dynamic code;
@dynamic accessToken;

typedef struct PROTOBindThirdAccountReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOThirdAccountBindType bindType;
  NSString *appId;
  NSString *code;
  NSString *accessToken;
} PROTOBindThirdAccountReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "bindType",
        .dataTypeSpecific.enumDescFunc = PROTOThirdAccountBindType_EnumDescriptor,
        .number = PROTOBindThirdAccountReq_FieldNumber_BindType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOBindThirdAccountReq__storage_, bindType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "appId",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindThirdAccountReq_FieldNumber_AppId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOBindThirdAccountReq__storage_, appId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindThirdAccountReq_FieldNumber_Code,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PROTOBindThirdAccountReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "accessToken",
        .dataTypeSpecific.className = NULL,
        .number = PROTOBindThirdAccountReq_FieldNumber_AccessToken,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PROTOBindThirdAccountReq__storage_, accessToken),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindThirdAccountReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOBindThirdAccountReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOBindThirdAccountReq_BindType_RawValue(PROTOBindThirdAccountReq *message) {
  GPBDescriptor *descriptor = [PROTOBindThirdAccountReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBindThirdAccountReq_FieldNumber_BindType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOBindThirdAccountReq_BindType_RawValue(PROTOBindThirdAccountReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOBindThirdAccountReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOBindThirdAccountReq_FieldNumber_BindType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOBindThirdAccountRes

@implementation PROTOBindThirdAccountRes


typedef struct PROTOBindThirdAccountRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOBindThirdAccountRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOBindThirdAccountRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOBindThirdAccountRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PROTOUnbindThirdAccountReq

@implementation PROTOUnbindThirdAccountReq

@dynamic optType;
@dynamic smsCode;

typedef struct PROTOUnbindThirdAccountReq__storage_ {
  uint32_t _has_storage_[1];
  PROTOUnbindThirdAccountOptType optType;
  NSString *smsCode;
} PROTOUnbindThirdAccountReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "optType",
        .dataTypeSpecific.enumDescFunc = PROTOUnbindThirdAccountOptType_EnumDescriptor,
        .number = PROTOUnbindThirdAccountReq_FieldNumber_OptType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PROTOUnbindThirdAccountReq__storage_, optType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PROTOUnbindThirdAccountReq_FieldNumber_SmsCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PROTOUnbindThirdAccountReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUnbindThirdAccountReq class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PROTOUnbindThirdAccountReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PROTOUnbindThirdAccountReq_OptType_RawValue(PROTOUnbindThirdAccountReq *message) {
  GPBDescriptor *descriptor = [PROTOUnbindThirdAccountReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOUnbindThirdAccountReq_FieldNumber_OptType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPROTOUnbindThirdAccountReq_OptType_RawValue(PROTOUnbindThirdAccountReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PROTOUnbindThirdAccountReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PROTOUnbindThirdAccountReq_FieldNumber_OptType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PROTOUnbindThirdAccountRes

@implementation PROTOUnbindThirdAccountRes


typedef struct PROTOUnbindThirdAccountRes__storage_ {
  uint32_t _has_storage_[1];
} PROTOUnbindThirdAccountRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PROTOUnbindThirdAccountRes class]
                                     rootClass:[PROTOUauthExtRoot class]
                                          file:PROTOUauthExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PROTOUnbindThirdAccountRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
