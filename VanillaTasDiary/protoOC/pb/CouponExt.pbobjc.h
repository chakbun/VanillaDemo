// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/coupon.ext.proto

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

@class PB3CouponBaseCfg;
@class PB3CouponCliCfg;
@class PB3CouponInfo;
GPB_ENUM_FWD_DECLARE(PB3CouponDiscountType);
GPB_ENUM_FWD_DECLARE(PB3CouponJumpType);
GPB_ENUM_FWD_DECLARE(PB3CouponPackageType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3CouponCmdId

typedef GPB_ENUM(PB3CouponCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CouponCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3CouponCmdId_PushNone = 0,

  /** 推送优惠券列表 PushCouponList */
  PB3CouponCmdId_CouponListCmdId = 80001,
};

GPBEnumDescriptor *PB3CouponCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CouponCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3CouponErrCode

/** 错误码 */
typedef GPB_ENUM(PB3CouponErrCode) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CouponErrCode_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 成功 */
  PB3CouponErrCode_CodeSuccess = 0,
};

GPBEnumDescriptor *PB3CouponErrCode_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CouponErrCode_IsValidValue(int32_t value);

#pragma mark - PB3CouponExtRoot

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
@interface PB3CouponExtRoot : GPBRootObject
@end

#pragma mark - PB3CouponCfgUrlReq

typedef GPB_ENUM(PB3CouponCfgUrlReq_FieldNumber) {
  PB3CouponCfgUrlReq_FieldNumber_CfgURL = 1,
};

/**
 * 获取优惠券配置Url 推送cmdid SysConfType.TypeCouponCfg（system.ext.proto）, 配置结构为acm.ext.proto的CouponCliCfg
 **/
@interface PB3CouponCfgUrlReq : GPBMessage

/** CDN的URL */
@property(nonatomic, readwrite, copy, null_resettable) NSString *cfgURL;

@end

#pragma mark - PB3CouponCfgUrlRes

typedef GPB_ENUM(PB3CouponCfgUrlRes_FieldNumber) {
  PB3CouponCfgUrlRes_FieldNumber_CfgURL = 1,
};

@interface PB3CouponCfgUrlRes : GPBMessage

/** CDN的URL（当为空时，表示当前为最新配置） */
@property(nonatomic, readwrite, copy, null_resettable) NSString *cfgURL;

@end

#pragma mark - PB3CouponCfgReq

/**
 * 获取优惠券配置
 **/
@interface PB3CouponCfgReq : GPBMessage

@end

#pragma mark - PB3CouponCfgRes

typedef GPB_ENUM(PB3CouponCfgRes_FieldNumber) {
  PB3CouponCfgRes_FieldNumber_CfgListArray = 1,
};

@interface PB3CouponCfgRes : GPBMessage

/** 客户端配置 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CouponCliCfg*> *cfgListArray;
/** The number of items in @c cfgListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger cfgListArray_Count;

@end

#pragma mark - PB3CouponInfo

typedef GPB_ENUM(PB3CouponInfo_FieldNumber) {
  PB3CouponInfo_FieldNumber_Id_p = 1,
  PB3CouponInfo_FieldNumber_CfgId = 2,
  PB3CouponInfo_FieldNumber_Num = 3,
  PB3CouponInfo_FieldNumber_ValidTime = 4,
  PB3CouponInfo_FieldNumber_InvalidTime = 5,
  PB3CouponInfo_FieldNumber_IsNew = 6,
};

/**
 * 优惠券信息
 **/
@interface PB3CouponInfo : GPBMessage

/** 优惠券id */
@property(nonatomic, readwrite) int64_t id_p;

/** 优惠券配置id */
@property(nonatomic, readwrite) int64_t cfgId;

/** 优惠券数量 */
@property(nonatomic, readwrite) int32_t num;

/** 生效时间（unix时间戳，单位：秒） */
@property(nonatomic, readwrite) int64_t validTime;

/** 失效时间（unix时间戳，单位：秒） */
@property(nonatomic, readwrite) int64_t invalidTime;

/** 是否新获得(新获得为true，否则为false) */
@property(nonatomic, readwrite) BOOL isNew;

@end

#pragma mark - PB3CouponBagReq

typedef GPB_ENUM(PB3CouponBagReq_FieldNumber) {
  PB3CouponBagReq_FieldNumber_IsRead = 1,
};

/**
 * 获取优惠券券包信息
 **/
@interface PB3CouponBagReq : GPBMessage

/** 是否设置已读，打开券包面板时设为true，否则设为false */
@property(nonatomic, readwrite) BOOL isRead;

@end

#pragma mark - PB3CouponBagRes

typedef GPB_ENUM(PB3CouponBagRes_FieldNumber) {
  PB3CouponBagRes_FieldNumber_CouponListArray = 1,
};

@interface PB3CouponBagRes : GPBMessage

/** 优惠券信息列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CouponInfo*> *couponListArray;
/** The number of items in @c couponListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger couponListArray_Count;

@end

#pragma mark - PB3PushCouponList

typedef GPB_ENUM(PB3PushCouponList_FieldNumber) {
  PB3PushCouponList_FieldNumber_CouponListArray = 1,
};

/**
 * 优惠券列表推送
 **/
@interface PB3PushCouponList : GPBMessage

/** 优惠券信息列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CouponInfo*> *couponListArray;
/** The number of items in @c couponListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger couponListArray_Count;

@end

#pragma mark - PB3CouponBaseCfg

typedef GPB_ENUM(PB3CouponBaseCfg_FieldNumber) {
  PB3CouponBaseCfg_FieldNumber_Id_p = 1,
  PB3CouponBaseCfg_FieldNumber_Name = 2,
  PB3CouponBaseCfg_FieldNumber_DiscountType = 3,
  PB3CouponBaseCfg_FieldNumber_FullMoney = 4,
  PB3CouponBaseCfg_FieldNumber_SubMoney = 5,
  PB3CouponBaseCfg_FieldNumber_Discount = 6,
  PB3CouponBaseCfg_FieldNumber_JumpType = 7,
  PB3CouponBaseCfg_FieldNumber_JumpURL = 8,
  PB3CouponBaseCfg_FieldNumber_UsageRemark = 9,
  PB3CouponBaseCfg_FieldNumber_Sort = 10,
  PB3CouponBaseCfg_FieldNumber_DiscountUnit = 11,
};

/**
 * 优惠券基础配置
 **/
@interface PB3CouponBaseCfg : GPBMessage

/** 优惠券ID */
@property(nonatomic, readwrite) int64_t id_p;

/** 优惠券名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** 优惠方式 */
@property(nonatomic, readwrite) enum PB3CouponDiscountType discountType;

/** 最低满足金额(元)(-1无限制) */
@property(nonatomic, readwrite) int32_t fullMoney;

/** 减金额(元) */
@property(nonatomic, readwrite) int32_t subMoney;

/** 折扣(百位数) */
@property(nonatomic, readwrite) int32_t discount;

/** 跳转场景类型 */
@property(nonatomic, readwrite) enum PB3CouponJumpType jumpType;

/** 跳转路由 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *jumpURL;

/** 使用说明 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *usageRemark;

/** 排序 */
@property(nonatomic, readwrite) int32_t sort;

/** 折扣单位（元，折） */
@property(nonatomic, readwrite, copy, null_resettable) NSString *discountUnit;

@end

/**
 * Fetches the raw value of a @c PB3CouponBaseCfg's @c discountType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CouponBaseCfg_DiscountType_RawValue(PB3CouponBaseCfg *message);
/**
 * Sets the raw value of an @c PB3CouponBaseCfg's @c discountType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CouponBaseCfg_DiscountType_RawValue(PB3CouponBaseCfg *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3CouponBaseCfg's @c jumpType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CouponBaseCfg_JumpType_RawValue(PB3CouponBaseCfg *message);
/**
 * Sets the raw value of an @c PB3CouponBaseCfg's @c jumpType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CouponBaseCfg_JumpType_RawValue(PB3CouponBaseCfg *message, int32_t value);

#pragma mark - PB3CouponPackageInfoReq

/**
 * 获取优惠券礼包信息
 **/
@interface PB3CouponPackageInfoReq : GPBMessage

@end

#pragma mark - PB3CouponPackageInfoRes

typedef GPB_ENUM(PB3CouponPackageInfoRes_FieldNumber) {
  PB3CouponPackageInfoRes_FieldNumber_PackageId = 1,
  PB3CouponPackageInfoRes_FieldNumber_PackageName = 2,
  PB3CouponPackageInfoRes_FieldNumber_PackageType = 3,
  PB3CouponPackageInfoRes_FieldNumber_CfgListArray = 4,
};

@interface PB3CouponPackageInfoRes : GPBMessage

/** 礼包id */
@property(nonatomic, readwrite) int64_t packageId;

/** 礼包名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *packageName;

/** 优惠券礼包类型 */
@property(nonatomic, readwrite) enum PB3CouponPackageType packageType;

/** 优惠券基础配置 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CouponBaseCfg*> *cfgListArray;
/** The number of items in @c cfgListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger cfgListArray_Count;

@end

/**
 * Fetches the raw value of a @c PB3CouponPackageInfoRes's @c packageType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CouponPackageInfoRes_PackageType_RawValue(PB3CouponPackageInfoRes *message);
/**
 * Sets the raw value of an @c PB3CouponPackageInfoRes's @c packageType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CouponPackageInfoRes_PackageType_RawValue(PB3CouponPackageInfoRes *message, int32_t value);

#pragma mark - PB3GainCouponPackageReq

typedef GPB_ENUM(PB3GainCouponPackageReq_FieldNumber) {
  PB3GainCouponPackageReq_FieldNumber_PackageId = 1,
};

/**
 * 领取优惠券礼包
 **/
@interface PB3GainCouponPackageReq : GPBMessage

/** 礼包id */
@property(nonatomic, readwrite) int64_t packageId;

@end

#pragma mark - PB3GainCouponPackageRes

@interface PB3GainCouponPackageRes : GPBMessage

@end

#pragma mark - PB3ShowCouponReq

typedef GPB_ENUM(PB3ShowCouponReq_FieldNumber) {
  PB3ShowCouponReq_FieldNumber_IdListArray = 1,
};

/**
 * 优惠券曝光
 **/
@interface PB3ShowCouponReq : GPBMessage

/** 优惠券id */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *idListArray;
/** The number of items in @c idListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger idListArray_Count;

@end

#pragma mark - PB3ShowCouponRes

@interface PB3ShowCouponRes : GPBMessage

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
