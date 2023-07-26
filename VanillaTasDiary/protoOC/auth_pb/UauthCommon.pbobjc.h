 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PROTOUauthWeightType

 
typedef GPB_ENUM(PROTOUauthWeightType) {
   
  PROTOUauthWeightType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PROTOUauthWeightType_UwtH5 = 0,

   
  PROTOUauthWeightType_UwtInner = 1,

   
  PROTOUauthWeightType_UwtAll = 2,
};

GPBEnumDescriptor *PROTOUauthWeightType_EnumDescriptor(void);

 
BOOL PROTOUauthWeightType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthPayType

 
typedef GPB_ENUM(PROTOUauthPayType) {
   
  PROTOUauthPayType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthPayType_UptWx = 0,
  PROTOUauthPayType_UptAli = 1,

   
  PROTOUauthPayType_UptAll = 2,
};

GPBEnumDescriptor *PROTOUauthPayType_EnumDescriptor(void);

 
BOOL PROTOUauthPayType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUPayChannelType

typedef GPB_ENUM(PROTOUPayChannelType) {
   
  PROTOUPayChannelType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUPayChannelType_UpctNull = 0,

   
  PROTOUPayChannelType_UpctZfbzfH5 = 2,

   
  PROTOUPayChannelType_UpctZfbzfApp = 3,

   
  PROTOUPayChannelType_UpctWxzfApp = 4,

   
  PROTOUPayChannelType_UpctWxzfH5 = 5,

   
  PROTOUPayChannelType_UpctIap = 6,

   
  PROTOUPayChannelType_UpctPlay = 8,

   
  PROTOUPayChannelType_UpctPalzf = 10,

   
  PROTOUPayChannelType_UpctBoing = 11,

   
  PROTOUPayChannelType_UpctUnionzf = 12,

   
  PROTOUPayChannelType_UpctCmbpay = 13,

   
  PROTOUPayChannelType_UpctMycard = 14,

   
  PROTOUPayChannelType_UpctPayssion = 22,

   
  PROTOUPayChannelType_UpctAgent = 253,

   
  PROTOUPayChannelType_UpctManual = 254,

   
  PROTOUPayChannelType_UpctDevtest = 255,
};

GPBEnumDescriptor *PROTOUPayChannelType_EnumDescriptor(void);

 
BOOL PROTOUPayChannelType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthAccountType

typedef GPB_ENUM(PROTOUauthAccountType) {
   
  PROTOUauthAccountType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthAccountType_AtDev = 0,

   
  PROTOUauthAccountType_AtNative = 1,

   
  PROTOUauthAccountType_AtQq = 2,

   
  PROTOUauthAccountType_AtWeixin = 3,

   
  PROTOUauthAccountType_AtChinaMobile = 10,

   
  PROTOUauthAccountType_AtChinaTelecom = 11,

   
  PROTOUauthAccountType_AtUmeng = 12,

   
  PROTOUauthAccountType_AtGoogle = 100,

   
  PROTOUauthAccountType_AtFacebook = 101,

   
  PROTOUauthAccountType_AtCaiji = 102,

   
  PROTOUauthAccountType_AtApple = 103,

   
  PROTOUauthAccountType_AtWechatSubscription = 104,

   
  PROTOUauthAccountType_AtQqMiniProgram = 105,

   
  PROTOUauthAccountType_AtWxMiniProgram = 106,

   
  PROTOUauthAccountType_AtQqWeb = 107,

   
  PROTOUauthAccountType_AtWeixinWeb = 108,

   
  PROTOUauthAccountType_AtRobot = 200,

   
  PROTOUauthAccountType_AtPhoneSubsidiary = 203,

   
  PROTOUauthAccountType_AtGuest = 204,

   
  PROTOUauthAccountType_AtTwitter = 205,

   
  PROTOUauthAccountType_AtEmail = 206,
};

GPBEnumDescriptor *PROTOUauthAccountType_EnumDescriptor(void);

 
BOOL PROTOUauthAccountType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthLoginType

typedef GPB_ENUM(PROTOUauthLoginType) {
   
  PROTOUauthLoginType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthLoginType_LtDev = 0,

   
  PROTOUauthLoginType_LtNative = 1,
  PROTOUauthLoginType_LtQq = 2,
  PROTOUauthLoginType_LtWeixin = 3,

   
  PROTOUauthLoginType_LtSms = 4,

   
  PROTOUauthLoginType_LtQuick = 5,

   
  PROTOUauthLoginType_LtApple = 6,

   
  PROTOUauthLoginType_LtFacebook = 7,

   
  PROTOUauthLoginType_LtPhonePassword = 8,

   
  PROTOUauthLoginType_LtWechatSubscription = 9,

   
  PROTOUauthLoginType_LtGoogle = 10,

   
  PROTOUauthLoginType_LtQqSmallProgram = 11,

   
  PROTOUauthLoginType_LtWxMiniProgram = 12,

   
  PROTOUauthLoginType_LtQqWeb = 13,

   
  PROTOUauthLoginType_LtWeixinWeb = 14,

   
  PROTOUauthLoginType_LtGuest = 15,

   
  PROTOUauthLoginType_LtTwitter = 16,

   
  PROTOUauthLoginType_LtSes = 17,

   
  PROTOUauthLoginType_LtEmailPassword = 18,
};

GPBEnumDescriptor *PROTOUauthLoginType_EnumDescriptor(void);

 
BOOL PROTOUauthLoginType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthDeviceType

 
typedef GPB_ENUM(PROTOUauthDeviceType) {
   
  PROTOUauthDeviceType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthDeviceType_DtUnknown = 0,
  PROTOUauthDeviceType_DtFlashplayer = 1,
  PROTOUauthDeviceType_DtAndroidPhone = 20,
  PROTOUauthDeviceType_DtIosPhone = 40,

   
  PROTOUauthDeviceType_DtWindowsAssistant = 80,

   
  PROTOUauthDeviceType_DtWindowsPc = 90,
  PROTOUauthDeviceType_DtRobot = 100,

   
  PROTOUauthDeviceType_DtWechatSubscription = 110,

   
  PROTOUauthDeviceType_DtQqMiniProgram = 120,

   
  PROTOUauthDeviceType_DtWxMiniProgram = 130,

   
  PROTOUauthDeviceType_DtWeb = 140,
};

GPBEnumDescriptor *PROTOUauthDeviceType_EnumDescriptor(void);

 
BOOL PROTOUauthDeviceType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthSexType

typedef GPB_ENUM(PROTOUauthSexType) {
   
  PROTOUauthSexType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthSexType_Unknown = 0,
  PROTOUauthSexType_Mail = 1,
  PROTOUauthSexType_Femail = 2,
};

GPBEnumDescriptor *PROTOUauthSexType_EnumDescriptor(void);

 
BOOL PROTOUauthSexType_IsValidValue(int32_t value);

#pragma mark - Enum PROTOUauthAccountFlags

typedef GPB_ENUM(PROTOUauthAccountFlags) {
   
  PROTOUauthAccountFlags_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PROTOUauthAccountFlags_AfZero = 0,

   
  PROTOUauthAccountFlags_AfPhoneVerified = 1,

   
  PROTOUauthAccountFlags_AfBindDevice = 2,
};

GPBEnumDescriptor *PROTOUauthAccountFlags_EnumDescriptor(void);

 
BOOL PROTOUauthAccountFlags_IsValidValue(int32_t value);

#pragma mark - PROTOUauthCommonRoot

 
@interface PROTOUauthCommonRoot : GPBRootObject
@end

#pragma mark - PROTOUauthLoginPassword

typedef GPB_ENUM(PROTOUauthLoginPassword_FieldNumber) {
  PROTOUauthLoginPassword_FieldNumber_Password = 1,
  PROTOUauthLoginPassword_FieldNumber_Time = 2,
  PROTOUauthLoginPassword_FieldNumber_Rand = 3,
};

@interface PROTOUauthLoginPassword : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *password;

@property(nonatomic, readwrite) int64_t time;

@property(nonatomic, readwrite) int32_t rand;

@end

#pragma mark - PROTODeviceMessage

typedef GPB_ENUM(PROTODeviceMessage_FieldNumber) {
  PROTODeviceMessage_FieldNumber_Oaid = 1,
  PROTODeviceMessage_FieldNumber_AndroidId = 2,
  PROTODeviceMessage_FieldNumber_Idfa = 3,
  PROTODeviceMessage_FieldNumber_Idfv = 4,
};

@interface PROTODeviceMessage : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *oaid;

@property(nonatomic, readwrite, copy, null_resettable) NSString *androidId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *idfa;

@property(nonatomic, readwrite, copy, null_resettable) NSString *idfv;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

 
