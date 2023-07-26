 
 

 
 
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

@class PB3CouponUsedData;
@class PB3HallOfFame;
@class PB3MaskInfo;
@class PB3MaskName;
@class PB3MaskPhoto;
@class PB3MaskRoomInfo;
@class PB3NobilityConf;
@class PB3NobilityDynamic;
@class PB3NobilityLog;
@class PB3NobilityPrice;
@class PB3NobilityPrivilege;
@class PB3NobilityPrivilegeConf;
@class PB3OpenNobilityPopItem;
@class PB3PlayerNobilityInfo;
@class PB3RoomRewardItem;
GPB_ENUM_FWD_DECLARE(PB3CommonOperType);
GPB_ENUM_FWD_DECLARE(PB3SexType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3NobilityCmdId

typedef GPB_ENUM(PB3NobilityCmdId) {
   
  PB3NobilityCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3NobilityCmdId_NcmdIdNull = 0,

   
  PB3NobilityCmdId_NcmdIdPlayDynamic = 508001,

   
  PB3NobilityCmdId_NcmdIdUpdatePrivilege = 508002,

   
  PB3NobilityCmdId_NcmdIdUpdateMask = 508003,

   
  PB3NobilityCmdId_NcmdIdUpdateNobility = 508004,
};

GPBEnumDescriptor *PB3NobilityCmdId_EnumDescriptor(void);

 
BOOL PB3NobilityCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3NobilityPriceType

typedef GPB_ENUM(PB3NobilityPriceType) {
   
  PB3NobilityPriceType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3NobilityPriceType_NobilityPriceTypeNull = 0,

   
  PB3NobilityPriceType_NobilityPriceTypeNormal = 1,

   
  PB3NobilityPriceType_NobilityPriceTypeNormalRenew = 2,

   
  PB3NobilityPriceType_NobilityPriceTypeIosNormal = 3,

   
  PB3NobilityPriceType_NobilityPriceTypeIosNormalRenew = 4,
};

GPBEnumDescriptor *PB3NobilityPriceType_EnumDescriptor(void);

 
BOOL PB3NobilityPriceType_IsValidValue(int32_t value);

#pragma mark - Enum PB3PrivilegeType

 
typedef GPB_ENUM(PB3PrivilegeType) {
   
  PB3PrivilegeType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3PrivilegeType_PtNull = 0,

   
  PB3PrivilegeType_PtMask = 1,

   
  PB3PrivilegeType_PtShow = 1000,

   
  PB3PrivilegeType_PtShowPay = 1001,

   
  PB3PrivilegeType_PtShowHonourableIdentity = 1002,

   
  PB3PrivilegeType_PtShowHallOfFame = 1003,

   
  PB3PrivilegeType_PtShowCardFrame = 1004,

   
  PB3PrivilegeType_PtRoomShow = 2000,

   
  PB3PrivilegeType_PtRoomShowWelcome = 2001,

   
  PB3PrivilegeType_PtRoomShowSitChar = 2002,

   
  PB3PrivilegeType_PtRoomShowCharBubble = 2003,

   
  PB3PrivilegeType_PtRoomShowSpeak = 2004,

   
  PB3PrivilegeType_PtWelfare = 3000,

   
  PB3PrivilegeType_PtWelfareHonourableVehicle = 3001,

   
  PB3PrivilegeType_PtSpecial = 4000,

   
  PB3PrivilegeType_PtSpecialCmbPay = 4001,

   
  PB3PrivilegeType_PtSpecialGift = 4002,

   
  PB3PrivilegeType_PtSpecialService = 4003,

   
  PB3PrivilegeType_PtPrivilegeMagicSkill = 4007,

   
  PB3PrivilegeType_PtPrivilege = 5000,

   
  PB3PrivilegeType_PtPrivilegeMaskRank = 5001,

   
  PB3PrivilegeType_PtPrivilegeMaskEnter = 5002,

   
  PB3PrivilegeType_PtPrivilegeMaskSitChar = 5003,

   
  PB3PrivilegeType_PtPrivilegePreventBanSpeak = 5004,

   
  PB3PrivilegeType_PtPrivilegeFriendTrack = 5005,

   
  PB3PrivilegeType_PtPrivilegePreventKickOut = 5006,

   
  PB3PrivilegeType_PtPrivilegeHideTrack = 5007,

   
  PB3PrivilegeType_PtPrivilegeMoreDealFriend = 5008,

   
  PB3PrivilegeType_PtPrivilegeNoDisturbing = 5009,

   
  PB3PrivilegeType_PtPrivilegePreventTrack = 5010,

   
  PB3PrivilegeType_PtExtra = 6000,

   
  PB3PrivilegeType_PtExtraAddHot = 6001,
};

GPBEnumDescriptor *PB3PrivilegeType_EnumDescriptor(void);

 
BOOL PB3PrivilegeType_IsValidValue(int32_t value);

#pragma mark - Enum PB3BuyNobilityType

typedef GPB_ENUM(PB3BuyNobilityType) {
   
  PB3BuyNobilityType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3BuyNobilityType_BntNull = 0,

   
  PB3BuyNobilityType_BntOpen = 1,

   
  PB3BuyNobilityType_BntRenew = 2,

   
  PB3BuyNobilityType_BntUpgrade = 3,
};

GPBEnumDescriptor *PB3BuyNobilityType_EnumDescriptor(void);

 
BOOL PB3BuyNobilityType_IsValidValue(int32_t value);

#pragma mark - Enum PB3PayNobilityType

typedef GPB_ENUM(PB3PayNobilityType) {
   
  PB3PayNobilityType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3PayNobilityType_PntNull = 0,

   
  PB3PayNobilityType_PntGold = 1,

   
  PB3PayNobilityType_PntWpay = 2,

   
  PB3PayNobilityType_PntApay = 3,

   
  PB3PayNobilityType_PntIap = 4,

   
  PB3PayNobilityType_PntCmb = 5,
};

GPBEnumDescriptor *PB3PayNobilityType_EnumDescriptor(void);

 
BOOL PB3PayNobilityType_IsValidValue(int32_t value);

#pragma mark - Enum PB3BuyNobilityGoldType

typedef GPB_ENUM(PB3BuyNobilityGoldType) {
   
  PB3BuyNobilityGoldType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3BuyNobilityGoldType_BngtIos = 0,

   
  PB3BuyNobilityGoldType_BngtH5 = 2,
};

GPBEnumDescriptor *PB3BuyNobilityGoldType_EnumDescriptor(void);

 
BOOL PB3BuyNobilityGoldType_IsValidValue(int32_t value);

#pragma mark - Enum PB3PlayerNobilityStatus

typedef GPB_ENUM(PB3PlayerNobilityStatus) {
   
  PB3PlayerNobilityStatus_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3PlayerNobilityStatus_PnsNull = 0,

   
  PB3PlayerNobilityStatus_PnsUsing = 1,

   
  PB3PlayerNobilityStatus_PnsOwned = 2,

   
  PB3PlayerNobilityStatus_PnsProtected = 3,

   
  PB3PlayerNobilityStatus_PnsOverdue = 4,
};

GPBEnumDescriptor *PB3PlayerNobilityStatus_EnumDescriptor(void);

 
BOOL PB3PlayerNobilityStatus_IsValidValue(int32_t value);

#pragma mark - Enum PB3PrivilegeSetType

typedef GPB_ENUM(PB3PrivilegeSetType) {
   
  PB3PrivilegeSetType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3PrivilegeSetType_PstNull = 0,

   
  PB3PrivilegeSetType_PstBool = 1,

   
  PB3PrivilegeSetType_PstOtherPageSet = 2,

   
  PB3PrivilegeSetType_PstProtectEnterRoom = 3,
};

GPBEnumDescriptor *PB3PrivilegeSetType_EnumDescriptor(void);

 
BOOL PB3PrivilegeSetType_IsValidValue(int32_t value);

#pragma mark - Enum PB3PrivilegeSetDataType

typedef GPB_ENUM(PB3PrivilegeSetDataType) {
   
  PB3PrivilegeSetDataType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
   
  PB3PrivilegeSetDataType_PsdtNull = 0,

   
  PB3PrivilegeSetDataType_PsdtBool = 1,

   
  PB3PrivilegeSetDataType_PsdtStringImg = 2,

   
  PB3PrivilegeSetDataType_PsdtProtectEnterRoom = 3,

   
  PB3PrivilegeSetDataType_PsdtMoreDealFriendInt = 4,
};

GPBEnumDescriptor *PB3PrivilegeSetDataType_EnumDescriptor(void);

 
BOOL PB3PrivilegeSetDataType_IsValidValue(int32_t value);

#pragma mark - PB3NobilityExtRoot

 
@interface PB3NobilityExtRoot : GPBRootObject
@end

#pragma mark - PB3NobilityConf

typedef GPB_ENUM(PB3NobilityConf_FieldNumber) {
  PB3NobilityConf_FieldNumber_NobilityId = 1,
  PB3NobilityConf_FieldNumber_Name = 2,
  PB3NobilityConf_FieldNumber_Icon = 3,
  PB3NobilityConf_FieldNumber_TimeoutIcon = 4,
  PB3NobilityConf_FieldNumber_Description_p = 5,
  PB3NobilityConf_FieldNumber_DynamicImg = 6,
  PB3NobilityConf_FieldNumber_NobilityLevel = 7,
  PB3NobilityConf_FieldNumber_PrivilegeIdsArray = 8,
  PB3NobilityConf_FieldNumber_FrameImg = 9,
  PB3NobilityConf_FieldNumber_Price = 10,
  PB3NobilityConf_FieldNumber_PcMinIcon = 11,
  PB3NobilityConf_FieldNumber_IconFrame = 12,
  PB3NobilityConf_FieldNumber_ServerNum = 13,
  PB3NobilityConf_FieldNumber_DynamicImgBottom = 14,
  PB3NobilityConf_FieldNumber_PcDynamicImg = 15,
  PB3NobilityConf_FieldNumber_PcBigIcon = 16,
  PB3NobilityConf_FieldNumber_NameColor = 17,
  PB3NobilityConf_FieldNumber_IsVipBuy = 18,
  PB3NobilityConf_FieldNumber_EnterRoomEffect = 19,
  PB3NobilityConf_FieldNumber_EnterRoomEffectIcon = 20,
  PB3NobilityConf_FieldNumber_EnterRoomScreen = 21,
  PB3NobilityConf_FieldNumber_EnterRoomEffectPc = 22,
  PB3NobilityConf_FieldNumber_EnterRoomEffectIconPc = 23,
  PB3NobilityConf_FieldNumber_EnterRoomScreenPc = 24,
};

@interface PB3NobilityConf : GPBMessage

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *timeoutIcon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *description_p;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *dynamicImg;

 
@property(nonatomic, readwrite) int32_t nobilityLevel;

 
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *privilegeIdsArray;
 
@property(nonatomic, readonly) NSUInteger privilegeIdsArray_Count;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *frameImg;

 
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32ObjectDictionary<PB3NobilityPrice*> *price;
 
@property(nonatomic, readonly) NSUInteger price_Count;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *pcMinIcon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *iconFrame;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *serverNum;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *dynamicImgBottom;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *pcDynamicImg;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *pcBigIcon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *nameColor;

 
@property(nonatomic, readwrite) BOOL isVipBuy;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffect;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffectIcon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomScreen;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffectPc;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffectIconPc;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomScreenPc;

@end

#pragma mark - PB3NobilityPrice

typedef GPB_ENUM(PB3NobilityPrice_FieldNumber) {
  PB3NobilityPrice_FieldNumber_Id_p = 1,
  PB3NobilityPrice_FieldNumber_Price = 2,
  PB3NobilityPrice_FieldNumber_Amount = 3,
  PB3NobilityPrice_FieldNumber_PresentGold = 4,
  PB3NobilityPrice_FieldNumber_ValidDays = 5,
  PB3NobilityPrice_FieldNumber_ShowPrice = 6,
  PB3NobilityPrice_FieldNumber_ShowUnitName = 7,
  PB3NobilityPrice_FieldNumber_ShowGold = 8,
  PB3NobilityPrice_FieldNumber_ShowGoldUnitName = 9,
  PB3NobilityPrice_FieldNumber_ShowPresentGold = 10,
  PB3NobilityPrice_FieldNumber_ShowPresentUnitName = 11,
  PB3NobilityPrice_FieldNumber_PriceType = 12,
};

@interface PB3NobilityPrice : GPBMessage

 
@property(nonatomic, readwrite) int32_t id_p;

 
@property(nonatomic, readwrite) int32_t price;

 
@property(nonatomic, readwrite) int32_t amount;

 
@property(nonatomic, readwrite) int32_t presentGold;

 
@property(nonatomic, readwrite) int32_t validDays;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showPrice;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showUnitName;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showGold;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showGoldUnitName;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showPresentGold;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showPresentUnitName;

 
@property(nonatomic, readwrite) PB3NobilityPriceType priceType;

@end

 
int32_t PB3NobilityPrice_PriceType_RawValue(PB3NobilityPrice *message);
 
void SetPB3NobilityPrice_PriceType_RawValue(PB3NobilityPrice *message, int32_t value);

#pragma mark - PB3NobilityPrivilegeConf

typedef GPB_ENUM(PB3NobilityPrivilegeConf_FieldNumber) {
  PB3NobilityPrivilegeConf_FieldNumber_PrivilegeId = 1,
  PB3NobilityPrivilegeConf_FieldNumber_Name = 2,
  PB3NobilityPrivilegeConf_FieldNumber_Icon = 3,
  PB3NobilityPrivilegeConf_FieldNumber_Route = 4,
  PB3NobilityPrivilegeConf_FieldNumber_Description_p = 5,
  PB3NobilityPrivilegeConf_FieldNumber_SetIcon = 6,
  PB3NobilityPrivilegeConf_FieldNumber_GrayIcon = 7,
};

@interface PB3NobilityPrivilegeConf : GPBMessage

 
@property(nonatomic, readwrite) int32_t privilegeId;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite, copy, null_resettable) NSString *route;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *description_p;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *setIcon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *grayIcon;

@end

#pragma mark - PB3GetNobilityConfReq

typedef GPB_ENUM(PB3GetNobilityConfReq_FieldNumber) {
  PB3GetNobilityConfReq_FieldNumber_Md5 = 1,
};

 
@interface PB3GetNobilityConfReq : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *md5;

@end

#pragma mark - PB3GetNobilityConfRes

typedef GPB_ENUM(PB3GetNobilityConfRes_FieldNumber) {
  PB3GetNobilityConfRes_FieldNumber_NobilityConfArray = 1,
  PB3GetNobilityConfRes_FieldNumber_PrivilegeConfListArray = 2,
  PB3GetNobilityConfRes_FieldNumber_Md5 = 3,
  PB3GetNobilityConfRes_FieldNumber_NameListArray = 4,
  PB3GetNobilityConfRes_FieldNumber_PhotoListArray = 5,
  PB3GetNobilityConfRes_FieldNumber_MinorsSwitch = 6,
};

@interface PB3GetNobilityConfRes : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3NobilityConf*> *nobilityConfArray;
 
@property(nonatomic, readonly) NSUInteger nobilityConfArray_Count;

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3NobilityPrivilegeConf*> *privilegeConfListArray;
 
@property(nonatomic, readonly) NSUInteger privilegeConfListArray_Count;

@property(nonatomic, readwrite, copy, null_resettable) NSString *md5;

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3MaskName*> *nameListArray;
 
@property(nonatomic, readonly) NSUInteger nameListArray_Count;

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3MaskPhoto*> *photoListArray;
 
@property(nonatomic, readonly) NSUInteger photoListArray_Count;

 
@property(nonatomic, readwrite) BOOL minorsSwitch;

@end

#pragma mark - PB3BuyNobilityReq

typedef GPB_ENUM(PB3BuyNobilityReq_FieldNumber) {
  PB3BuyNobilityReq_FieldNumber_NobilityId = 1,
  PB3BuyNobilityReq_FieldNumber_BuyType = 2,
  PB3BuyNobilityReq_FieldNumber_PayType = 3,
  PB3BuyNobilityReq_FieldNumber_Price = 4,
  PB3BuyNobilityReq_FieldNumber_RoomId = 5,
  PB3BuyNobilityReq_FieldNumber_BenefitId = 6,
  PB3BuyNobilityReq_FieldNumber_BuyGoldType = 7,
  PB3BuyNobilityReq_FieldNumber_Coupon = 8,
};

 
@interface PB3BuyNobilityReq : GPBMessage

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite) PB3BuyNobilityType buyType;

 
@property(nonatomic, readwrite) PB3PayNobilityType payType;

 
@property(nonatomic, readwrite, strong, null_resettable) PB3NobilityPrice *price;
 
@property(nonatomic, readwrite) BOOL hasPrice;

 
@property(nonatomic, readwrite) int64_t roomId;

 
@property(nonatomic, readwrite) int64_t benefitId;

 
@property(nonatomic, readwrite) PB3BuyNobilityGoldType buyGoldType;

 
@property(nonatomic, readwrite, strong, null_resettable) PB3CouponUsedData *coupon;
 
@property(nonatomic, readwrite) BOOL hasCoupon;

@end

 
int32_t PB3BuyNobilityReq_BuyType_RawValue(PB3BuyNobilityReq *message);
 
void SetPB3BuyNobilityReq_BuyType_RawValue(PB3BuyNobilityReq *message, int32_t value);

 
int32_t PB3BuyNobilityReq_PayType_RawValue(PB3BuyNobilityReq *message);
 
void SetPB3BuyNobilityReq_PayType_RawValue(PB3BuyNobilityReq *message, int32_t value);

 
int32_t PB3BuyNobilityReq_BuyGoldType_RawValue(PB3BuyNobilityReq *message);
 
void SetPB3BuyNobilityReq_BuyGoldType_RawValue(PB3BuyNobilityReq *message, int32_t value);

#pragma mark - PB3BuyNobilityRes

typedef GPB_ENUM(PB3BuyNobilityRes_FieldNumber) {
  PB3BuyNobilityRes_FieldNumber_NobilityDynamic = 1,
};

@interface PB3BuyNobilityRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3NobilityDynamic *nobilityDynamic;
 
@property(nonatomic, readwrite) BOOL hasNobilityDynamic;

@end

#pragma mark - PB3PlayerNobilityInfo

typedef GPB_ENUM(PB3PlayerNobilityInfo_FieldNumber) {
  PB3PlayerNobilityInfo_FieldNumber_NobilityId = 1,
  PB3PlayerNobilityInfo_FieldNumber_CreateAt = 2,
  PB3PlayerNobilityInfo_FieldNumber_Status = 3,
  PB3PlayerNobilityInfo_FieldNumber_EndAt = 4,
  PB3PlayerNobilityInfo_FieldNumber_ProtectAt = 5,
  PB3PlayerNobilityInfo_FieldNumber_OpenDays = 6,
  PB3PlayerNobilityInfo_FieldNumber_ShowEndAt = 7,
  PB3PlayerNobilityInfo_FieldNumber_ProtectDays = 8,
};

@interface PB3PlayerNobilityInfo : GPBMessage

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite) int64_t createAt;

 
@property(nonatomic, readwrite) PB3PlayerNobilityStatus status;

 
@property(nonatomic, readwrite) int64_t endAt;

 
@property(nonatomic, readwrite) int64_t protectAt;

 
@property(nonatomic, readwrite) int32_t openDays;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *showEndAt;

 
@property(nonatomic, readwrite) int32_t protectDays;

@end

 
int32_t PB3PlayerNobilityInfo_Status_RawValue(PB3PlayerNobilityInfo *message);
 
void SetPB3PlayerNobilityInfo_Status_RawValue(PB3PlayerNobilityInfo *message, int32_t value);

#pragma mark - PB3PlayerNobilityInfoReq

typedef GPB_ENUM(PB3PlayerNobilityInfoReq_FieldNumber) {
  PB3PlayerNobilityInfoReq_FieldNumber_PlayerId = 1,
};

 
@interface PB3PlayerNobilityInfoReq : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3PlayerNobilityInfoRes

typedef GPB_ENUM(PB3PlayerNobilityInfoRes_FieldNumber) {
  PB3PlayerNobilityInfoRes_FieldNumber_NobilityInfo = 1,
  PB3PlayerNobilityInfoRes_FieldNumber_MaskInfo = 2,
};

@interface PB3PlayerNobilityInfoRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3PlayerNobilityInfo *nobilityInfo;
 
@property(nonatomic, readwrite) BOOL hasNobilityInfo;

 
@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
 
@property(nonatomic, readwrite) BOOL hasMaskInfo;

@end

#pragma mark - PB3PlayerNobilityInfoListReq

 
@interface PB3PlayerNobilityInfoListReq : GPBMessage

@end

#pragma mark - PB3PlayerNobilityInfoListRes

typedef GPB_ENUM(PB3PlayerNobilityInfoListRes_FieldNumber) {
  PB3PlayerNobilityInfoListRes_FieldNumber_ListArray = 1,
};

@interface PB3PlayerNobilityInfoListRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3PlayerNobilityInfo*> *listArray;
 
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3NobilityPrivilege

typedef GPB_ENUM(PB3NobilityPrivilege_FieldNumber) {
  PB3NobilityPrivilege_FieldNumber_Privilege = 1,
  PB3NobilityPrivilege_FieldNumber_IsCustomSet = 2,
  PB3NobilityPrivilege_FieldNumber_SetType = 3,
  PB3NobilityPrivilege_FieldNumber_Status = 4,
  PB3NobilityPrivilege_FieldNumber_Tips = 5,
  PB3NobilityPrivilege_FieldNumber_DataType = 6,
  PB3NobilityPrivilege_FieldNumber_ExtraData = 7,
  PB3NobilityPrivilege_FieldNumber_ShowArrow = 8,
  PB3NobilityPrivilege_FieldNumber_Img = 9,
};

@interface PB3NobilityPrivilege : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) PB3NobilityPrivilegeConf *privilege;
 
@property(nonatomic, readwrite) BOOL hasPrivilege;

 
@property(nonatomic, readwrite) BOOL isCustomSet;

 
@property(nonatomic, readwrite) PB3PrivilegeSetType setType;

 
@property(nonatomic, readwrite) BOOL status;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *tips;

 
@property(nonatomic, readwrite) PB3PrivilegeSetDataType dataType;

 
@property(nonatomic, readwrite, copy, null_resettable) NSData *extraData;

 
@property(nonatomic, readwrite) BOOL showArrow;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *img;

@end

 
int32_t PB3NobilityPrivilege_SetType_RawValue(PB3NobilityPrivilege *message);
 
void SetPB3NobilityPrivilege_SetType_RawValue(PB3NobilityPrivilege *message, int32_t value);

 
int32_t PB3NobilityPrivilege_DataType_RawValue(PB3NobilityPrivilege *message);
 
void SetPB3NobilityPrivilege_DataType_RawValue(PB3NobilityPrivilege *message, int32_t value);

#pragma mark - PB3NobilityPrivilegeReq

 
@interface PB3NobilityPrivilegeReq : GPBMessage

@end

#pragma mark - PB3NobilityPrivilegeRes

typedef GPB_ENUM(PB3NobilityPrivilegeRes_FieldNumber) {
  PB3NobilityPrivilegeRes_FieldNumber_ListArray = 1,
};

@interface PB3NobilityPrivilegeRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3NobilityPrivilege*> *listArray;
 
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3UpdateMaskInfoReq

typedef GPB_ENUM(PB3UpdateMaskInfoReq_FieldNumber) {
  PB3UpdateMaskInfoReq_FieldNumber_MaskNameId = 1,
  PB3UpdateMaskInfoReq_FieldNumber_MaskIconId = 2,
};

 
@interface PB3UpdateMaskInfoReq : GPBMessage

 
@property(nonatomic, readwrite) int32_t maskNameId;

 
@property(nonatomic, readwrite) int32_t maskIconId;

@end

#pragma mark - PB3UpdateMaskInfoRes

@interface PB3UpdateMaskInfoRes : GPBMessage

@end

#pragma mark - PB3UpdateBoolPrivilegeReq

typedef GPB_ENUM(PB3UpdateBoolPrivilegeReq_FieldNumber) {
  PB3UpdateBoolPrivilegeReq_FieldNumber_PrivilegeId = 1,
  PB3UpdateBoolPrivilegeReq_FieldNumber_Status = 2,
};

 
@interface PB3UpdateBoolPrivilegeReq : GPBMessage

@property(nonatomic, readwrite) int32_t privilegeId;

@property(nonatomic, readwrite) BOOL status;

@end

#pragma mark - PB3UpdateBoolPrivilegeRes

@interface PB3UpdateBoolPrivilegeRes : GPBMessage

@end

#pragma mark - PB3NobilityDynamic

typedef GPB_ENUM(PB3NobilityDynamic_FieldNumber) {
  PB3NobilityDynamic_FieldNumber_NobilityId = 1,
  PB3NobilityDynamic_FieldNumber_PlayerId = 2,
  PB3NobilityDynamic_FieldNumber_Id2 = 3,
  PB3NobilityDynamic_FieldNumber_Name = 4,
  PB3NobilityDynamic_FieldNumber_Icon = 5,
  PB3NobilityDynamic_FieldNumber_BuyType = 6,
  PB3NobilityDynamic_FieldNumber_Msg = 7,
  PB3NobilityDynamic_FieldNumber_RoomId = 8,
  PB3NobilityDynamic_FieldNumber_OrderId = 9,
};

@interface PB3NobilityDynamic : GPBMessage

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite) int64_t playerId;

 
@property(nonatomic, readwrite) int64_t id2;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

 
@property(nonatomic, readwrite) PB3BuyNobilityType buyType;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

 
@property(nonatomic, readwrite) int64_t roomId;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *orderId;

@end

 
int32_t PB3NobilityDynamic_BuyType_RawValue(PB3NobilityDynamic *message);
 
void SetPB3NobilityDynamic_BuyType_RawValue(PB3NobilityDynamic *message, int32_t value);

#pragma mark - PB3UpdatePrivilege

typedef GPB_ENUM(PB3UpdatePrivilege_FieldNumber) {
  PB3UpdatePrivilege_FieldNumber_PrivilegeId = 1,
  PB3UpdatePrivilege_FieldNumber_Status = 2,
  PB3UpdatePrivilege_FieldNumber_PlayerId = 3,
};

@interface PB3UpdatePrivilege : GPBMessage

@property(nonatomic, readwrite) int32_t privilegeId;

@property(nonatomic, readwrite) BOOL status;

@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3NoticeUpdateMask

typedef GPB_ENUM(PB3NoticeUpdateMask_FieldNumber) {
  PB3NoticeUpdateMask_FieldNumber_MaskInfo = 1,
};

@interface PB3NoticeUpdateMask : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
 
@property(nonatomic, readwrite) BOOL hasMaskInfo;

@end

#pragma mark - PB3NoticeNobility

typedef GPB_ENUM(PB3NoticeNobility_FieldNumber) {
  PB3NoticeNobility_FieldNumber_NobilityInfo = 1,
  PB3NoticeNobility_FieldNumber_MaskInfo = 2,
  PB3NoticeNobility_FieldNumber_PlayerId = 3,
};

@interface PB3NoticeNobility : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) PB3PlayerNobilityInfo *nobilityInfo;
 
@property(nonatomic, readwrite) BOOL hasNobilityInfo;

 
@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
 
@property(nonatomic, readwrite) BOOL hasMaskInfo;

 
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3RoomNobilityInfo

typedef GPB_ENUM(PB3RoomNobilityInfo_FieldNumber) {
  PB3RoomNobilityInfo_FieldNumber_MaskInfo = 1,
  PB3RoomNobilityInfo_FieldNumber_OpenNobilityAt = 2,
  PB3RoomNobilityInfo_FieldNumber_IsStealthEnter = 3,
  PB3RoomNobilityInfo_FieldNumber_IsStealthSit = 4,
  PB3RoomNobilityInfo_FieldNumber_NobilityId = 5,
  PB3RoomNobilityInfo_FieldNumber_Level = 6,
  PB3RoomNobilityInfo_FieldNumber_ChairId = 7,
};

@interface PB3RoomNobilityInfo : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
 
@property(nonatomic, readwrite) BOOL hasMaskInfo;

 
@property(nonatomic, readwrite) int64_t openNobilityAt;

 
@property(nonatomic, readwrite) BOOL isStealthEnter;

 
@property(nonatomic, readwrite) BOOL isStealthSit;

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite) int32_t level;

 
@property(nonatomic, readwrite) int32_t chairId;

@end

#pragma mark - PB3HallOfFame

typedef GPB_ENUM(PB3HallOfFame_FieldNumber) {
  PB3HallOfFame_FieldNumber_PlayerId = 1,
  PB3HallOfFame_FieldNumber_Name = 2,
  PB3HallOfFame_FieldNumber_Icon = 3,
  PB3HallOfFame_FieldNumber_JoinTimestamp = 4,
  PB3HallOfFame_FieldNumber_JoinDays = 5,
  PB3HallOfFame_FieldNumber_NobilityId = 6,
};

@interface PB3HallOfFame : GPBMessage

 
@property(nonatomic, readwrite) int64_t playerId;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

 
@property(nonatomic, readwrite) int64_t joinTimestamp;

 
@property(nonatomic, readwrite) int32_t joinDays;

 
@property(nonatomic, readwrite) int32_t nobilityId;

@end

#pragma mark - PB3HallOfFameReq

typedef GPB_ENUM(PB3HallOfFameReq_FieldNumber) {
  PB3HallOfFameReq_FieldNumber_Page = 1,
};

@interface PB3HallOfFameReq : GPBMessage

 
@property(nonatomic, readwrite) int32_t page;

@end

#pragma mark - PB3HallOfFameRes

typedef GPB_ENUM(PB3HallOfFameRes_FieldNumber) {
  PB3HallOfFameRes_FieldNumber_FamousArray = 1,
  PB3HallOfFameRes_FieldNumber_MyNobility = 2,
  PB3HallOfFameRes_FieldNumber_SumFamous = 3,
};

@interface PB3HallOfFameRes : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3HallOfFame*> *famousArray;
 
@property(nonatomic, readonly) NSUInteger famousArray_Count;

 
@property(nonatomic, readwrite, strong, null_resettable) PB3HallOfFame *myNobility;
 
@property(nonatomic, readwrite) BOOL hasMyNobility;

 
@property(nonatomic, readwrite) int32_t sumFamous;

@end

#pragma mark - PB3RoomRankMaskSetReq

typedef GPB_ENUM(PB3RoomRankMaskSetReq_FieldNumber) {
  PB3RoomRankMaskSetReq_FieldNumber_Oper = 1,
  PB3RoomRankMaskSetReq_FieldNumber_RoomIdsArray = 2,
};

@interface PB3RoomRankMaskSetReq : GPBMessage

@property(nonatomic, readwrite) enum PB3CommonOperType oper;

 
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *roomIdsArray;
 
@property(nonatomic, readonly) NSUInteger roomIdsArray_Count;

@end

 
int32_t PB3RoomRankMaskSetReq_Oper_RawValue(PB3RoomRankMaskSetReq *message);
 
void SetPB3RoomRankMaskSetReq_Oper_RawValue(PB3RoomRankMaskSetReq *message, int32_t value);

#pragma mark - PB3RoomRankMaskSetRes

@interface PB3RoomRankMaskSetRes : GPBMessage

@end

#pragma mark - PB3RoomRankMaskListReq

@interface PB3RoomRankMaskListReq : GPBMessage

@end

#pragma mark - PB3RoomRankMaskListRes

typedef GPB_ENUM(PB3RoomRankMaskListRes_FieldNumber) {
  PB3RoomRankMaskListRes_FieldNumber_RoomsArray = 1,
};

@interface PB3RoomRankMaskListRes : GPBMessage

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3MaskRoomInfo*> *roomsArray;
 
@property(nonatomic, readonly) NSUInteger roomsArray_Count;

@end

#pragma mark - PB3MaskRoomInfo

typedef GPB_ENUM(PB3MaskRoomInfo_FieldNumber) {
  PB3MaskRoomInfo_FieldNumber_Id_p = 1,
  PB3MaskRoomInfo_FieldNumber_Icon = 2,
  PB3MaskRoomInfo_FieldNumber_Name = 3,
  PB3MaskRoomInfo_FieldNumber_Greeting = 4,
};

@interface PB3MaskRoomInfo : GPBMessage

 
@property(nonatomic, readwrite) int64_t id_p;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *greeting;

@end

#pragma mark - PB3MaskName

typedef GPB_ENUM(PB3MaskName_FieldNumber) {
  PB3MaskName_FieldNumber_Id_p = 1,
  PB3MaskName_FieldNumber_Name = 2,
  PB3MaskName_FieldNumber_IsDefault = 3,
};

@interface PB3MaskName : GPBMessage

@property(nonatomic, readwrite) int32_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite) BOOL isDefault;

@end

#pragma mark - PB3MaskPhoto

typedef GPB_ENUM(PB3MaskPhoto_FieldNumber) {
  PB3MaskPhoto_FieldNumber_Id_p = 1,
  PB3MaskPhoto_FieldNumber_Icon = 2,
  PB3MaskPhoto_FieldNumber_DynamicImg = 3,
  PB3MaskPhoto_FieldNumber_Name = 4,
  PB3MaskPhoto_FieldNumber_IsDefault = 5,
};

@interface PB3MaskPhoto : GPBMessage

@property(nonatomic, readwrite) int32_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite, copy, null_resettable) NSString *dynamicImg;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite) BOOL isDefault;

@end

#pragma mark - PB3BuyNobilityLogReq

typedef GPB_ENUM(PB3BuyNobilityLogReq_FieldNumber) {
  PB3BuyNobilityLogReq_FieldNumber_Index = 1,
};

@interface PB3BuyNobilityLogReq : GPBMessage

@property(nonatomic, readwrite) int32_t index;

@end

#pragma mark - PB3BuyNobilityLogRes

typedef GPB_ENUM(PB3BuyNobilityLogRes_FieldNumber) {
  PB3BuyNobilityLogRes_FieldNumber_ListArray = 1,
  PB3BuyNobilityLogRes_FieldNumber_NextIndex = 2,
};

@interface PB3BuyNobilityLogRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3NobilityLog*> *listArray;
 
@property(nonatomic, readonly) NSUInteger listArray_Count;

@property(nonatomic, readwrite) int32_t nextIndex;

@end

#pragma mark - PB3NobilityLog

typedef GPB_ENUM(PB3NobilityLog_FieldNumber) {
  PB3NobilityLog_FieldNumber_NobilityId = 1,
  PB3NobilityLog_FieldNumber_BuyType = 2,
  PB3NobilityLog_FieldNumber_Num = 3,
  PB3NobilityLog_FieldNumber_PayType = 4,
  PB3NobilityLog_FieldNumber_BuyGold = 5,
  PB3NobilityLog_FieldNumber_RefundGold = 6,
  PB3NobilityLog_FieldNumber_BuyTime = 7,
  PB3NobilityLog_FieldNumber_EndTime = 8,
  PB3NobilityLog_FieldNumber_Status = 9,
  PB3NobilityLog_FieldNumber_BuyRmb = 10,
};

@interface PB3NobilityLog : GPBMessage

 
@property(nonatomic, readwrite) int32_t nobilityId;

 
@property(nonatomic, readwrite) PB3BuyNobilityType buyType;

 
@property(nonatomic, readwrite) int32_t num;

 
@property(nonatomic, readwrite) PB3PayNobilityType payType;

 
@property(nonatomic, readwrite) int64_t buyGold;

 
@property(nonatomic, readwrite) int64_t refundGold;

 
@property(nonatomic, readwrite) int64_t buyTime;

 
@property(nonatomic, readwrite) int64_t endTime;

 
@property(nonatomic, readwrite) PB3PlayerNobilityStatus status;

 
@property(nonatomic, readwrite) int64_t buyRmb;

@end

 
int32_t PB3NobilityLog_BuyType_RawValue(PB3NobilityLog *message);
 
void SetPB3NobilityLog_BuyType_RawValue(PB3NobilityLog *message, int32_t value);

 
int32_t PB3NobilityLog_PayType_RawValue(PB3NobilityLog *message);
 
void SetPB3NobilityLog_PayType_RawValue(PB3NobilityLog *message, int32_t value);

 
int32_t PB3NobilityLog_Status_RawValue(PB3NobilityLog *message);
 
void SetPB3NobilityLog_Status_RawValue(PB3NobilityLog *message, int32_t value);

#pragma mark - PB3MinNobilityReq

typedef GPB_ENUM(PB3MinNobilityReq_FieldNumber) {
  PB3MinNobilityReq_FieldNumber_PrivilegeId = 2,
};

@interface PB3MinNobilityReq : GPBMessage

@property(nonatomic, readwrite) int32_t privilegeId;

@end

#pragma mark - PB3MinNobilityRes

typedef GPB_ENUM(PB3MinNobilityRes_FieldNumber) {
  PB3MinNobilityRes_FieldNumber_NobilityId = 1,
};

@interface PB3MinNobilityRes : GPBMessage

@property(nonatomic, readwrite) int32_t nobilityId;

@end

#pragma mark - PB3FollowToRoomReq

 
@interface PB3FollowToRoomReq : GPBMessage

@end

#pragma mark - PB3FollowToRoomRes

typedef GPB_ENUM(PB3FollowToRoomRes_FieldNumber) {
  PB3FollowToRoomRes_FieldNumber_BanFollowMe = 1,
  PB3FollowToRoomRes_FieldNumber_FriendFollow = 2,
};

@interface PB3FollowToRoomRes : GPBMessage

 
@property(nonatomic, readwrite) BOOL banFollowMe;

 
@property(nonatomic, readwrite) BOOL friendFollow;

@end

#pragma mark - PB3SetFollowToRoomReq

typedef GPB_ENUM(PB3SetFollowToRoomReq_FieldNumber) {
  PB3SetFollowToRoomReq_FieldNumber_BanFollowMe = 1,
  PB3SetFollowToRoomReq_FieldNumber_FriendFollow = 2,
};

 
@interface PB3SetFollowToRoomReq : GPBMessage

 
@property(nonatomic, readwrite) BOOL banFollowMe;

 
@property(nonatomic, readwrite) BOOL friendFollow;

@end

#pragma mark - PB3SetFollowToRoomRes

@interface PB3SetFollowToRoomRes : GPBMessage

@end

#pragma mark - PB3CustomerServiceReq

@interface PB3CustomerServiceReq : GPBMessage

@end

#pragma mark - PB3CustomerServiceRes

typedef GPB_ENUM(PB3CustomerServiceRes_FieldNumber) {
  PB3CustomerServiceRes_FieldNumber_Name = 1,
  PB3CustomerServiceRes_FieldNumber_Icon = 2,
  PB3CustomerServiceRes_FieldNumber_Description_p = 3,
  PB3CustomerServiceRes_FieldNumber_Route = 4,
};

@interface PB3CustomerServiceRes : GPBMessage

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *description_p;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *route;

@end

#pragma mark - PB3OpenNobilityPopItem

typedef GPB_ENUM(PB3OpenNobilityPopItem_FieldNumber) {
  PB3OpenNobilityPopItem_FieldNumber_Title = 1,
  PB3OpenNobilityPopItem_FieldNumber_Msg = 2,
  PB3OpenNobilityPopItem_FieldNumber_Background = 3,
  PB3OpenNobilityPopItem_FieldNumber_Image = 4,
};

@interface PB3OpenNobilityPopItem : GPBMessage

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *title;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *background;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *image;

@end

#pragma mark - PB3AfterOpenNobilityPopReq

typedef GPB_ENUM(PB3AfterOpenNobilityPopReq_FieldNumber) {
  PB3AfterOpenNobilityPopReq_FieldNumber_OrderId = 1,
};

@interface PB3AfterOpenNobilityPopReq : GPBMessage

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *orderId;

@end

#pragma mark - PB3AfterOpenNobilityPopRes

typedef GPB_ENUM(PB3AfterOpenNobilityPopRes_FieldNumber) {
  PB3AfterOpenNobilityPopRes_FieldNumber_ListArray = 1,
};

@interface PB3AfterOpenNobilityPopRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3OpenNobilityPopItem*> *listArray;
 
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3NobilityRoomRewardReq

typedef GPB_ENUM(PB3NobilityRoomRewardReq_FieldNumber) {
  PB3NobilityRoomRewardReq_FieldNumber_Index = 1,
};

@interface PB3NobilityRoomRewardReq : GPBMessage

 
@property(nonatomic, readwrite) int32_t index;

@end

#pragma mark - PB3NobilityRoomRewardRes

typedef GPB_ENUM(PB3NobilityRoomRewardRes_FieldNumber) {
  PB3NobilityRoomRewardRes_FieldNumber_NextIndex = 1,
  PB3NobilityRoomRewardRes_FieldNumber_ListArray = 2,
};

@interface PB3NobilityRoomRewardRes : GPBMessage

 
@property(nonatomic, readwrite) int32_t nextIndex;

 
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3RoomRewardItem*> *listArray;
 
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3RoomRewardItem

typedef GPB_ENUM(PB3RoomRewardItem_FieldNumber) {
  PB3RoomRewardItem_FieldNumber_PlayerId = 1,
  PB3RoomRewardItem_FieldNumber_PlayerId2 = 2,
  PB3RoomRewardItem_FieldNumber_Name = 3,
  PB3RoomRewardItem_FieldNumber_Icon = 4,
  PB3RoomRewardItem_FieldNumber_Sex = 5,
  PB3RoomRewardItem_FieldNumber_CreateAt = 6,
  PB3RoomRewardItem_FieldNumber_Tick = 7,
  PB3RoomRewardItem_FieldNumber_BuyType = 8,
  PB3RoomRewardItem_FieldNumber_NobilityName = 9,
  PB3RoomRewardItem_FieldNumber_Day = 10,
  PB3RoomRewardItem_FieldNumber_BenefitId = 11,
  PB3RoomRewardItem_FieldNumber_BenefitId2 = 12,
  PB3RoomRewardItem_FieldNumber_BenefitName = 13,
};

@interface PB3RoomRewardItem : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite) int64_t playerId2;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite) enum PB3SexType sex;

 
@property(nonatomic, readwrite) int64_t createAt;

 
@property(nonatomic, readwrite) int64_t tick;

 
@property(nonatomic, readwrite) PB3BuyNobilityType buyType;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *nobilityName;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *day;

 
@property(nonatomic, readwrite) int64_t benefitId;

 
@property(nonatomic, readwrite) int64_t benefitId2;

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *benefitName;

@end

 
int32_t PB3RoomRewardItem_Sex_RawValue(PB3RoomRewardItem *message);
 
void SetPB3RoomRewardItem_Sex_RawValue(PB3RoomRewardItem *message, int32_t value);

 
int32_t PB3RoomRewardItem_BuyType_RawValue(PB3RoomRewardItem *message);
 
void SetPB3RoomRewardItem_BuyType_RawValue(PB3RoomRewardItem *message, int32_t value);

#pragma mark - PB3NobilityGainReq

@interface PB3NobilityGainReq : GPBMessage

@end

#pragma mark - PB3NobilityGainRes

typedef GPB_ENUM(PB3NobilityGainRes_FieldNumber) {
  PB3NobilityGainRes_FieldNumber_NobilityGain = 1,
  PB3NobilityGainRes_FieldNumber_IsShow = 2,
};

@interface PB3NobilityGainRes : GPBMessage

 
@property(nonatomic, readwrite) int64_t nobilityGain;

 
@property(nonatomic, readwrite) BOOL isShow;

@end

#pragma mark - PB3GetNobilityConfCDNReq

@interface PB3GetNobilityConfCDNReq : GPBMessage

@end

#pragma mark - PB3GetNobilityConfCDNRes

typedef GPB_ENUM(PB3GetNobilityConfCDNRes_FieldNumber) {
  PB3GetNobilityConfCDNRes_FieldNumber_OssURL = 1,
};

@interface PB3GetNobilityConfCDNRes : GPBMessage

 
@property(nonatomic, readwrite, copy, null_resettable) NSString *ossURL;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

 