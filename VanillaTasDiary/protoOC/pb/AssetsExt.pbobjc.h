// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/assets.ext.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
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

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class PB3AssetsMoney;
@class PB3AssetsPoint;
@class PB3AsstesCollection;
@class PB3AsstesDetail;
@class PB3BagItem;
@class PB3BizSettlementRecord;
@class PB3CreditScorePrivilege;
@class PB3Effect;
@class PB3EffectConfig;
@class PB3EffectLimit;
@class PB3Medal;
@class PB3NobilityEffectItem;
@class PB3PlayerAssets;
GPB_ENUM_FWD_DECLARE(PB3EffectTimeType);
GPB_ENUM_FWD_DECLARE(PB3EffectTipsType);
GPB_ENUM_FWD_DECLARE(PB3EffectType);
GPB_ENUM_FWD_DECLARE(PB3EffectUseType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3AssetsCmdId

/** 300 */
typedef GPB_ENUM(PB3AssetsCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3AssetsCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3AssetsCmdId_AssetsNone1 = 0,

  /** AssetsMoney 推送资产 */
  PB3AssetsCmdId_AssetsMoneyCmdId = 300101,

  /** AssetsBag 推送背包变化 */
  PB3AssetsCmdId_AssetsBagCmdId = 300102,

  /** BcPlayerEffect 推送个人特效变化 */
  PB3AssetsCmdId_AssetsEffectPlayer = 300103,

  /** BcRoomEffect 推送到房间特效变化 */
  PB3AssetsCmdId_AssetsEffectRoom = 300104,

  /** EffectTips 推送特效提示 */
  PB3AssetsCmdId_AssetsEffectTips = 300105,

  /** AssetsInDebt 负债变化推送 */
  PB3AssetsCmdId_AssetsInDebtCmdId = 300106,

  /** AssetsPoint 积分变化推送 */
  PB3AssetsCmdId_AssetsPointCmdId = 300107,

  /** PushFirstPayGift 今日首充推送 */
  PB3AssetsCmdId_AssetsIsPayTodayCmdId = 300108,
};

GPBEnumDescriptor *PB3AssetsCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3AssetsCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3PointType

typedef GPB_ENUM(PB3PointType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3PointType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3PointType_PointZero = 0,

  /** 商城积分 */
  PB3PointType_PointStore = 100001,

  /** 玩家积分 */
  PB3PointType_PointPlayer = 100002,
};

GPBEnumDescriptor *PB3PointType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3PointType_IsValidValue(int32_t value);

#pragma mark - Enum PB3PlayerAssetsType

/** 个人资产类型枚举 */
typedef GPB_ENUM(PB3PlayerAssetsType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3PlayerAssetsType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位（不使用） */
  PB3PlayerAssetsType_PatNone = 0,

  /** 金币券(旧金币改为金币券) */
  PB3PlayerAssetsType_PatGold = 1,

  /** 钻石 */
  PB3PlayerAssetsType_PatGiftTicket = 2,

  /** 礼物 */
  PB3PlayerAssetsType_PatGift = 3,

  /** 累计充值 */
  PB3PlayerAssetsType_PatCharge = 4,

  /** 积分 */
  PB3PlayerAssetsType_PatPoint = 5,

  /** 优惠券 */
  PB3PlayerAssetsType_PatCoupon = 6,

  /** 风险冻结钻石 */
  PB3PlayerAssetsType_PatRiskTicket = 7,

  /** 风险扣除钻石 */
  PB3PlayerAssetsType_PatRiskPenaltyTicket = 8,

  /** 1-8 服务端assets_type.go中已使用 */
  PB3PlayerAssetsType_PatDeposit = 9,

  /** 冻结中的佣金 */
  PB3PlayerAssetsType_PatFreezeDeposit = 10,

  /** 贵族金币 */
  PB3PlayerAssetsType_PatNobleGold = 11,

  /** 新金币(充值金币) */
  PB3PlayerAssetsType_PatChargeGold = 12,

  /** 扣除金币券(单独扣除金币券) */
  PB3PlayerAssetsType_PatGoldTicket = 13,

  /** 礼物皮肤 */
  PB3PlayerAssetsType_PatGiftSkin = 14,

  /** 特效 */
  PB3PlayerAssetsType_PatEffect = 15,
};

GPBEnumDescriptor *PB3PlayerAssetsType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3PlayerAssetsType_IsValidValue(int32_t value);

#pragma mark - Enum PB3AssetsType

typedef GPB_ENUM(PB3AssetsType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3AssetsType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位不使用 */
  PB3AssetsType_AtZero = 0,

  /** 锤子 */
  PB3AssetsType_AtHammer = 1,

  /** 积分 */
  PB3AssetsType_AtPoints = 2,

  /** 黄金水滴 */
  PB3AssetsType_AtHammerGold = 3,

  /** 钻石水滴 */
  PB3AssetsType_AtHammerDo = 4,

  /** 黑金水滴 */
  PB3AssetsType_AtHammerBlackGold = 5,
};

GPBEnumDescriptor *PB3AssetsType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3AssetsType_IsValidValue(int32_t value);

#pragma mark - Enum PB3BizSettlementStatusType

/** 对公结算账单状态 */
typedef GPB_ENUM(PB3BizSettlementStatusType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3BizSettlementStatusType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 全部账单 */
  PB3BizSettlementStatusType_BsstAll = 0,

  /** 待结算 */
  PB3BizSettlementStatusType_BsstNormal = 1,

  /** 对账中 */
  PB3BizSettlementStatusType_BsstChecking = 2,

  /** 已发放 */
  PB3BizSettlementStatusType_BsstSettlement = 3,

  /** 已解冻 */
  PB3BizSettlementStatusType_BsstUnfreeze = 6,
};

GPBEnumDescriptor *PB3BizSettlementStatusType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3BizSettlementStatusType_IsValidValue(int32_t value);

#pragma mark - PB3AssetsExtRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface PB3AssetsExtRoot : GPBRootObject
@end

#pragma mark - PB3AssetsMoneyReq

/**
 * 金钱资产
 **/
@interface PB3AssetsMoneyReq : GPBMessage

@end

#pragma mark - PB3AssetsMoney

typedef GPB_ENUM(PB3AssetsMoney_FieldNumber) {
  PB3AssetsMoney_FieldNumber_Gold = 1,
  PB3AssetsMoney_FieldNumber_Silver = 2,
  PB3AssetsMoney_FieldNumber_GiftTicket = 3,
  PB3AssetsMoney_FieldNumber_Charge = 4,
  PB3AssetsMoney_FieldNumber_FreezeTicket = 5,
  PB3AssetsMoney_FieldNumber_AssetsMap = 6,
  PB3AssetsMoney_FieldNumber_VipWeixinCustomService = 7,
  PB3AssetsMoney_FieldNumber_VipWeixinCustomServiceURL = 8,
  PB3AssetsMoney_FieldNumber_VipWeixinCustomServiceId = 9,
};

@interface PB3AssetsMoney : GPBMessage

/** 金币 */
@property(nonatomic, readwrite) int32_t gold;

/** 银币，暂时没有用 */
@property(nonatomic, readwrite) uint32_t silver;

/** 钻石 */
@property(nonatomic, readwrite) uint32_t giftTicket;

/** 累计金额 */
@property(nonatomic, readwrite) uint32_t charge;

/** 冻结钻石 */
@property(nonatomic, readwrite) uint32_t freezeTicket;

/** 个人资产map, key为PlayerAssetsType */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64ObjectDictionary<PB3PlayerAssets*> *assetsMap;
/** The number of items in @c assetsMap without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger assetsMap_Count;

/** vip企微客服接入金额门槛 */
@property(nonatomic, readwrite) int32_t vipWeixinCustomService;

/** vip企微客服链接 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *vipWeixinCustomServiceURL;

/** vip企微企业ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *vipWeixinCustomServiceId;

@end

#pragma mark - PB3AssetsBag

typedef GPB_ENUM(PB3AssetsBag_FieldNumber) {
  PB3AssetsBag_FieldNumber_ItemsArray = 1,
};

@interface PB3AssetsBag : GPBMessage

/** 背包道具列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3BagItem*> *itemsArray;
/** The number of items in @c itemsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger itemsArray_Count;

@end

#pragma mark - PB3AssetsMoneyRes

typedef GPB_ENUM(PB3AssetsMoneyRes_FieldNumber) {
  PB3AssetsMoneyRes_FieldNumber_Flag = 1,
  PB3AssetsMoneyRes_FieldNumber_Money = 2,
  PB3AssetsMoneyRes_FieldNumber_IsBanWithdrawal = 3,
  PB3AssetsMoneyRes_FieldNumber_BanWithdrawalTime = 4,
  PB3AssetsMoneyRes_FieldNumber_Privilege = 5,
};

/**
 * 金钱资产返回
 **/
@interface PB3AssetsMoneyRes : GPBMessage

/** 1请求返回，2推送 */
@property(nonatomic, readwrite) uint32_t flag;

@property(nonatomic, readwrite, strong, null_resettable) PB3AssetsMoney *money;
/** Test to see if @c money has been set. */
@property(nonatomic, readwrite) BOOL hasMoney;

/** (h5)是否限制提现，true:限制提现，false:没有限制 */
@property(nonatomic, readwrite) BOOL isBanWithdrawal;

/** (h5)提现限制时间，如：7天 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *banWithdrawalTime;

/** (h5)信用分特权 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScorePrivilege *privilege;
/** Test to see if @c privilege has been set. */
@property(nonatomic, readwrite) BOOL hasPrivilege;

@end

#pragma mark - PB3AssetsPointReq

/**
 * 积分资产
 **/
@interface PB3AssetsPointReq : GPBMessage

@end

#pragma mark - PB3AssetsPointRes

typedef GPB_ENUM(PB3AssetsPointRes_FieldNumber) {
  PB3AssetsPointRes_FieldNumber_Point = 5,
};

/**
 * 积分资产
 **/
@interface PB3AssetsPointRes : GPBMessage

/** 积分map,key为PointType */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32ObjectDictionary<PB3AssetsPoint*> *point;
/** The number of items in @c point without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger point_Count;

@end

#pragma mark - PB3AssetsPoint

typedef GPB_ENUM(PB3AssetsPoint_FieldNumber) {
  PB3AssetsPoint_FieldNumber_PointType = 1,
  PB3AssetsPoint_FieldNumber_Num = 3,
};

@interface PB3AssetsPoint : GPBMessage

/** 积分类型 */
@property(nonatomic, readwrite) PB3PointType pointType;

/** 数量 */
@property(nonatomic, readwrite) uint32_t num;

@end

/**
 * Fetches the raw value of a @c PB3AssetsPoint's @c pointType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3AssetsPoint_PointType_RawValue(PB3AssetsPoint *message);
/**
 * Sets the raw value of an @c PB3AssetsPoint's @c pointType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3AssetsPoint_PointType_RawValue(PB3AssetsPoint *message, int32_t value);

#pragma mark - PB3PlayerAssets

typedef GPB_ENUM(PB3PlayerAssets_FieldNumber) {
  PB3PlayerAssets_FieldNumber_AssetsType = 1,
  PB3PlayerAssets_FieldNumber_AssetsNum = 2,
};

/**
 * 个人资产结构
 **/
@interface PB3PlayerAssets : GPBMessage

/** 资产类型 */
@property(nonatomic, readwrite) PB3PlayerAssetsType assetsType;

/** 资产数量数量 */
@property(nonatomic, readwrite) int64_t assetsNum;

@end

/**
 * Fetches the raw value of a @c PB3PlayerAssets's @c assetsType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3PlayerAssets_AssetsType_RawValue(PB3PlayerAssets *message);
/**
 * Sets the raw value of an @c PB3PlayerAssets's @c assetsType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3PlayerAssets_AssetsType_RawValue(PB3PlayerAssets *message, int32_t value);

#pragma mark - PB3AssetsBagReq

/**
 * 背包请求
 **/
@interface PB3AssetsBagReq : GPBMessage

@end

#pragma mark - PB3AssetsBagRes

typedef GPB_ENUM(PB3AssetsBagRes_FieldNumber) {
  PB3AssetsBagRes_FieldNumber_Flag = 1,
  PB3AssetsBagRes_FieldNumber_ItemsArray = 2,
};

/**
 * 背包返回
 **/
@interface PB3AssetsBagRes : GPBMessage

/** 1请求返回全部，2推送单个更新 */
@property(nonatomic, readwrite) uint32_t flag;

/** 背包道具列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3BagItem*> *itemsArray;
/** The number of items in @c itemsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger itemsArray_Count;

@end

#pragma mark - PB3BcPlayerEffect

typedef GPB_ENUM(PB3BcPlayerEffect_FieldNumber) {
  PB3BcPlayerEffect_FieldNumber_PlayerId = 1,
  PB3BcPlayerEffect_FieldNumber_EffectArray = 2,
};

/**
 * 广播个人特效
 **/
@interface PB3BcPlayerEffect : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Effect*> *effectArray;
/** The number of items in @c effectArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectArray_Count;

@end

#pragma mark - PB3BcRoomEffect

typedef GPB_ENUM(PB3BcRoomEffect_FieldNumber) {
  PB3BcRoomEffect_FieldNumber_PlayerId = 1,
  PB3BcRoomEffect_FieldNumber_EffectArray = 2,
};

/**
 * 广播房间特效
 **/
@interface PB3BcRoomEffect : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Effect*> *effectArray;
/** The number of items in @c effectArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectArray_Count;

@end

#pragma mark - PB3EffectConfigReq

typedef GPB_ENUM(PB3EffectConfigReq_FieldNumber) {
  PB3EffectConfigReq_FieldNumber_EffectIdsArray = 1,
};

@interface PB3EffectConfigReq : GPBMessage

/** 特效ID */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *effectIdsArray;
/** The number of items in @c effectIdsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectIdsArray_Count;

@end

#pragma mark - PB3EffectConfigRes

typedef GPB_ENUM(PB3EffectConfigRes_FieldNumber) {
  PB3EffectConfigRes_FieldNumber_List = 1,
};

@interface PB3EffectConfigRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32ObjectDictionary<PB3EffectConfig*> *list;
/** The number of items in @c list without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger list_Count;

@end

#pragma mark - PB3EffectConfigCDNReq

@interface PB3EffectConfigCDNReq : GPBMessage

@end

#pragma mark - PB3EffectConfigCDNRes

typedef GPB_ENUM(PB3EffectConfigCDNRes_FieldNumber) {
  PB3EffectConfigCDNRes_FieldNumber_ConfURL = 1,
};

@interface PB3EffectConfigCDNRes : GPBMessage

/** CND 的URL */
@property(nonatomic, readwrite, copy, null_resettable) NSString *confURL;

@end

#pragma mark - PB3GetEffectReq

typedef GPB_ENUM(PB3GetEffectReq_FieldNumber) {
  PB3GetEffectReq_FieldNumber_PlayerId = 1,
};

@interface PB3GetEffectReq : GPBMessage

/** 发起者 */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3GetEffectRes

typedef GPB_ENUM(PB3GetEffectRes_FieldNumber) {
  PB3GetEffectRes_FieldNumber_Flag = 1,
  PB3GetEffectRes_FieldNumber_PlayerId = 2,
  PB3GetEffectRes_FieldNumber_EffectArray = 3,
  PB3GetEffectRes_FieldNumber_ProtectEffectArray = 4,
  PB3GetEffectRes_FieldNumber_EffectLimitArray = 5,
};

@interface PB3GetEffectRes : GPBMessage

@property(nonatomic, readwrite) int32_t flag;

/** 发起者 */
@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Effect*> *effectArray;
/** The number of items in @c effectArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectArray_Count;

/** 保护期特效，只有id、protect_second、protect_start_at有值 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Effect*> *protectEffectArray;
/** The number of items in @c protectEffectArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger protectEffectArray_Count;

/** 特效穿戴限制 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3EffectLimit*> *effectLimitArray;
/** The number of items in @c effectLimitArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectLimitArray_Count;

@end

#pragma mark - PB3EffectTips

typedef GPB_ENUM(PB3EffectTips_FieldNumber) {
  PB3EffectTips_FieldNumber_EffectId = 1,
  PB3EffectTips_FieldNumber_EffectName = 2,
  PB3EffectTips_FieldNumber_TipType = 3,
  PB3EffectTips_FieldNumber_TimeoutArray = 4,
  PB3EffectTips_FieldNumber_TimeoutSecond = 5,
  PB3EffectTips_FieldNumber_Type = 6,
  PB3EffectTips_FieldNumber_TimeType = 7,
  PB3EffectTips_FieldNumber_Msg = 8,
};

/**
 * 特效提示(个人)公屏
 **/
@interface PB3EffectTips : GPBMessage

@property(nonatomic, readwrite) int32_t effectId;

@property(nonatomic, readwrite, copy, null_resettable) NSString *effectName;

/** 提示类型 */
@property(nonatomic, readwrite) enum PB3EffectTipsType tipType;

/** 结束时间 [年,月, 日, 时, 分, 秒] */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *timeoutArray;
/** The number of items in @c timeoutArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger timeoutArray_Count;

/** 剩余秒数 */
@property(nonatomic, readwrite) int32_t timeoutSecond;

/** type */
@property(nonatomic, readwrite) enum PB3EffectType type;

/** 计时类型 */
@property(nonatomic, readwrite) enum PB3EffectTimeType timeType;

/** 自定义文字 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

/**
 * Fetches the raw value of a @c PB3EffectTips's @c tipType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3EffectTips_TipType_RawValue(PB3EffectTips *message);
/**
 * Sets the raw value of an @c PB3EffectTips's @c tipType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3EffectTips_TipType_RawValue(PB3EffectTips *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3EffectTips's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3EffectTips_Type_RawValue(PB3EffectTips *message);
/**
 * Sets the raw value of an @c PB3EffectTips's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3EffectTips_Type_RawValue(PB3EffectTips *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3EffectTips's @c timeType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3EffectTips_TimeType_RawValue(PB3EffectTips *message);
/**
 * Sets the raw value of an @c PB3EffectTips's @c timeType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3EffectTips_TimeType_RawValue(PB3EffectTips *message, int32_t value);

#pragma mark - PB3AsstesDetail

typedef GPB_ENUM(PB3AsstesDetail_FieldNumber) {
  PB3AsstesDetail_FieldNumber_Id_p = 1,
};

@interface PB3AsstesDetail : GPBMessage

@property(nonatomic, readwrite) int32_t id_p;

@end

#pragma mark - PB3AsstesCollection

typedef GPB_ENUM(PB3AsstesCollection_FieldNumber) {
  PB3AsstesCollection_FieldNumber_Icon = 1,
  PB3AsstesCollection_FieldNumber_ListArray = 2,
};

@interface PB3AsstesCollection : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3AsstesDetail*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3GetAssetsConfReq

@interface PB3GetAssetsConfReq : GPBMessage

@end

#pragma mark - PB3GetAssetsConfRes

typedef GPB_ENUM(PB3GetAssetsConfRes_FieldNumber) {
  PB3GetAssetsConfRes_FieldNumber_AssetsConf = 1,
};

@interface PB3GetAssetsConfRes : GPBMessage

/** sint32 对应 AssetsType */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt32ObjectDictionary<PB3AsstesCollection*> *assetsConf;
/** The number of items in @c assetsConf without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger assetsConf_Count;

@end

#pragma mark - PB3UseEffectReq

typedef GPB_ENUM(PB3UseEffectReq_FieldNumber) {
  PB3UseEffectReq_FieldNumber_Id_p = 1,
  PB3UseEffectReq_FieldNumber_UseType = 2,
};

@interface PB3UseEffectReq : GPBMessage

@property(nonatomic, readwrite) int32_t id_p;

/** 使用类型 */
@property(nonatomic, readwrite) enum PB3EffectUseType useType;

@end

/**
 * Fetches the raw value of a @c PB3UseEffectReq's @c useType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3UseEffectReq_UseType_RawValue(PB3UseEffectReq *message);
/**
 * Sets the raw value of an @c PB3UseEffectReq's @c useType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3UseEffectReq_UseType_RawValue(PB3UseEffectReq *message, int32_t value);

#pragma mark - PB3UseEffectRes

typedef GPB_ENUM(PB3UseEffectRes_FieldNumber) {
  PB3UseEffectRes_FieldNumber_Type = 1,
};

@interface PB3UseEffectRes : GPBMessage

/** type */
@property(nonatomic, readwrite) enum PB3EffectType type;

@end

/**
 * Fetches the raw value of a @c PB3UseEffectRes's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3UseEffectRes_Type_RawValue(PB3UseEffectRes *message);
/**
 * Sets the raw value of an @c PB3UseEffectRes's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3UseEffectRes_Type_RawValue(PB3UseEffectRes *message, int32_t value);

#pragma mark - PB3NobilityEffectConfReq

@interface PB3NobilityEffectConfReq : GPBMessage

@end

#pragma mark - PB3NobilityEffectConfRes

typedef GPB_ENUM(PB3NobilityEffectConfRes_FieldNumber) {
  PB3NobilityEffectConfRes_FieldNumber_ItemArray = 1,
};

@interface PB3NobilityEffectConfRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3NobilityEffectItem*> *itemArray;
/** The number of items in @c itemArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger itemArray_Count;

@end

#pragma mark - PB3NobilityEffectItem

typedef GPB_ENUM(PB3NobilityEffectItem_FieldNumber) {
  PB3NobilityEffectItem_FieldNumber_NobilityId = 1,
  PB3NobilityEffectItem_FieldNumber_EffectId = 2,
  PB3NobilityEffectItem_FieldNumber_PrivilegeId = 3,
};

@interface PB3NobilityEffectItem : GPBMessage

@property(nonatomic, readwrite) int32_t nobilityId;

@property(nonatomic, readwrite) int32_t effectId;

@property(nonatomic, readwrite) int32_t privilegeId;

@end

#pragma mark - PB3InDebtInfoReq

@interface PB3InDebtInfoReq : GPBMessage

@end

#pragma mark - PB3InDebtInfoRes

typedef GPB_ENUM(PB3InDebtInfoRes_FieldNumber) {
  PB3InDebtInfoRes_FieldNumber_InDebtTick = 1,
};

@interface PB3InDebtInfoRes : GPBMessage

/** 负债砖石金额 */
@property(nonatomic, readwrite) int64_t inDebtTick;

@end

#pragma mark - PB3AssetsInDebt

typedef GPB_ENUM(PB3AssetsInDebt_FieldNumber) {
  PB3AssetsInDebt_FieldNumber_InDebtTick = 1,
};

/**
 * 300106 推送
 **/
@interface PB3AssetsInDebt : GPBMessage

/** 负债砖石金额 */
@property(nonatomic, readwrite) int64_t inDebtTick;

@end

#pragma mark - PB3MedalEffectReq

typedef GPB_ENUM(PB3MedalEffectReq_FieldNumber) {
  PB3MedalEffectReq_FieldNumber_PlayerId = 1,
};

/**
 * 获取玩家的勋章列表
 **/
@interface PB3MedalEffectReq : GPBMessage

/** 玩家id */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3MedalEffectRes

typedef GPB_ENUM(PB3MedalEffectRes_FieldNumber) {
  PB3MedalEffectRes_FieldNumber_MedalListArray = 1,
};

@interface PB3MedalEffectRes : GPBMessage

/** 勋章列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Medal*> *medalListArray;
/** The number of items in @c medalListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger medalListArray_Count;

@end

#pragma mark - PB3Medal

typedef GPB_ENUM(PB3Medal_FieldNumber) {
  PB3Medal_FieldNumber_Id_p = 1,
  PB3Medal_FieldNumber_Name = 2,
  PB3Medal_FieldNumber_URL = 3,
  PB3Medal_FieldNumber_PcURL2 = 4,
  PB3Medal_FieldNumber_EffectDesc = 5,
  PB3Medal_FieldNumber_ExtraURL = 6,
};

@interface PB3Medal : GPBMessage

/** id */
@property(nonatomic, readwrite) int32_t id_p;

/** 名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** 资源 app,pc勋章 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *URL;

/** pc勋章动态图 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *pcURL2;

/** 勋章活动描述 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *effectDesc;

/** 预留资源/app勋章动态图/app渠道前缀动态图/APP荣耀动态图片 /心情元素3 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *extraURL;

@end

#pragma mark - PB3ProtectEffectReq

typedef GPB_ENUM(PB3ProtectEffectReq_FieldNumber) {
  PB3ProtectEffectReq_FieldNumber_PlayerId = 1,
};

@interface PB3ProtectEffectReq : GPBMessage

/** 发起者 */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3ProtectEffectRes

typedef GPB_ENUM(PB3ProtectEffectRes_FieldNumber) {
  PB3ProtectEffectRes_FieldNumber_PlayerId = 1,
  PB3ProtectEffectRes_FieldNumber_ProtectEffectArray = 2,
};

@interface PB3ProtectEffectRes : GPBMessage

/** 发起者 */
@property(nonatomic, readwrite) int64_t playerId;

/** 保护期特效，只有id、protect_second、protect_start_at有值 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Effect*> *protectEffectArray;
/** The number of items in @c protectEffectArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger protectEffectArray_Count;

@end

#pragma mark - PB3PushFirstPayGift

typedef GPB_ENUM(PB3PushFirstPayGift_FieldNumber) {
  PB3PushFirstPayGift_FieldNumber_IsPayToday = 1,
};

/**
 * 首充有礼推送
 **/
@interface PB3PushFirstPayGift : GPBMessage

/** 今日是否充值 */
@property(nonatomic, readwrite) BOOL isPayToday;

@end

#pragma mark - PB3BizSettlementRecord

typedef GPB_ENUM(PB3BizSettlementRecord_FieldNumber) {
  PB3BizSettlementRecord_FieldNumber_DateAt = 1,
  PB3BizSettlementRecord_FieldNumber_ClanId = 2,
  PB3BizSettlementRecord_FieldNumber_ClanName = 3,
  PB3BizSettlementRecord_FieldNumber_Diamond = 4,
  PB3BizSettlementRecord_FieldNumber_CheckingSettleMoney = 5,
  PB3BizSettlementRecord_FieldNumber_FinalSettleMoney = 6,
  PB3BizSettlementRecord_FieldNumber_StatusType = 7,
  PB3BizSettlementRecord_FieldNumber_UnfreezeSettleMoney = 8,
};

/**
 * 对公结算账单记录
 **/
@interface PB3BizSettlementRecord : GPBMessage

/** 日期 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *dateAt;

/** 公会ID */
@property(nonatomic, readwrite) int64_t clanId;

/** 公会名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *clanName;

/** 个人扣钻 */
@property(nonatomic, readwrite) int64_t diamond;

/** 待结算金额 单位元 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *checkingSettleMoney;

/** 最终结算金额 单位元 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *finalSettleMoney;

/** 结算状态 */
@property(nonatomic, readwrite) PB3BizSettlementStatusType statusType;

/** 已解冻金额 单位元 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *unfreezeSettleMoney;

@end

/**
 * Fetches the raw value of a @c PB3BizSettlementRecord's @c statusType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3BizSettlementRecord_StatusType_RawValue(PB3BizSettlementRecord *message);
/**
 * Sets the raw value of an @c PB3BizSettlementRecord's @c statusType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3BizSettlementRecord_StatusType_RawValue(PB3BizSettlementRecord *message, int32_t value);

#pragma mark - PB3PersonalBizSettlementListReq

typedef GPB_ENUM(PB3PersonalBizSettlementListReq_FieldNumber) {
  PB3PersonalBizSettlementListReq_FieldNumber_StatusType = 1,
  PB3PersonalBizSettlementListReq_FieldNumber_StartTime = 2,
  PB3PersonalBizSettlementListReq_FieldNumber_EndTime = 3,
  PB3PersonalBizSettlementListReq_FieldNumber_Page = 4,
  PB3PersonalBizSettlementListReq_FieldNumber_PageSize = 5,
  PB3PersonalBizSettlementListReq_FieldNumber_IsAll = 6,
};

/**
 * 个人结算账单列表
 **/
@interface PB3PersonalBizSettlementListReq : GPBMessage

/** 账单状态 */
@property(nonatomic, readwrite) PB3BizSettlementStatusType statusType;

/** 开始时间 */
@property(nonatomic, readwrite) int64_t startTime;

/** 结束时间 */
@property(nonatomic, readwrite) int64_t endTime;

/** 页数，从1开始 */
@property(nonatomic, readwrite) int32_t page;

/** 每页数量 */
@property(nonatomic, readwrite) int32_t pageSize;

/** 是否导出 */
@property(nonatomic, readwrite) BOOL isAll;

@end

/**
 * Fetches the raw value of a @c PB3PersonalBizSettlementListReq's @c statusType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3PersonalBizSettlementListReq_StatusType_RawValue(PB3PersonalBizSettlementListReq *message);
/**
 * Sets the raw value of an @c PB3PersonalBizSettlementListReq's @c statusType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3PersonalBizSettlementListReq_StatusType_RawValue(PB3PersonalBizSettlementListReq *message, int32_t value);

#pragma mark - PB3PersonalBizSettlementListRes

typedef GPB_ENUM(PB3PersonalBizSettlementListRes_FieldNumber) {
  PB3PersonalBizSettlementListRes_FieldNumber_ListArray = 1,
  PB3PersonalBizSettlementListRes_FieldNumber_Total = 2,
  PB3PersonalBizSettlementListRes_FieldNumber_DateUpdateAt = 3,
};

/**
 * 个人结算账单列表
 **/
@interface PB3PersonalBizSettlementListRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3BizSettlementRecord*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

/** 总共有多少记录 */
@property(nonatomic, readwrite) int64_t total;

/** 数据更新时间 */
@property(nonatomic, readwrite) int64_t dateUpdateAt;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
