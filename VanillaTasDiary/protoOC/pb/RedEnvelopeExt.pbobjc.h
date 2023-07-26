// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/red_envelope.ext.proto

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

@class PB3RedEnvelopeConf;
@class PB3RedEnvelopeInfo;
@class PB3RedEnvelopeLog;
@class PB3RedPlayer;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3RedEnvelopeErrCode

typedef GPB_ENUM(PB3RedEnvelopeErrCode) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3RedEnvelopeErrCode_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3RedEnvelopeErrCode_ReecZero = 0,

  /** 金币不足，请充值 */
  PB3RedEnvelopeErrCode_ReecNotEnoughMoney = 47001,

  /** 运气不好，开红包遇到锁，在请求开一次 */
  PB3RedEnvelopeErrCode_ReecOpenBadLucky = 47002,
};

GPBEnumDescriptor *PB3RedEnvelopeErrCode_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3RedEnvelopeErrCode_IsValidValue(int32_t value);

#pragma mark - Enum PB3RedEnvelopeCmdId

typedef GPB_ENUM(PB3RedEnvelopeCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3RedEnvelopeCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位不用 */
  PB3RedEnvelopeCmdId_RedEnvelopeNone1 = 0,

  /** 红包(泡泡)信息 BroadcastRedEnvelopeStatus */
  PB3RedEnvelopeCmdId_RedEnvelopeInfoCmdId = 403001,

  /** 戳红包(泡泡)成功公屏 RedEnvelopeOpen */
  PB3RedEnvelopeCmdId_RedEnvelopeOpenCmdId = 403002,
};

GPBEnumDescriptor *PB3RedEnvelopeCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3RedEnvelopeCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3BroadcastRedEnvelopeType

typedef GPB_ENUM(PB3BroadcastRedEnvelopeType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3BroadcastRedEnvelopeType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3BroadcastRedEnvelopeType_BretNull = 0,

  /** 发红包推送 */
  PB3BroadcastRedEnvelopeType_BretSend = 1,

  /** 进房间推送 */
  PB3BroadcastRedEnvelopeType_BretEnter = 2,

  /** 结束红包推送 */
  PB3BroadcastRedEnvelopeType_BretClose = 3,
};

GPBEnumDescriptor *PB3BroadcastRedEnvelopeType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3BroadcastRedEnvelopeType_IsValidValue(int32_t value);

#pragma mark - Enum PB3LevelOption

typedef GPB_ENUM(PB3LevelOption) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3LevelOption_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位不用 */
  PB3LevelOption_LvoNull = 0,

  /** 等级 且 */
  PB3LevelOption_LvoAnd = 1,

  /** 等级 或 */
  PB3LevelOption_LvoOr = 2,
};

GPBEnumDescriptor *PB3LevelOption_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3LevelOption_IsValidValue(int32_t value);

#pragma mark - Enum PB3RedEnvelopeLogType

typedef GPB_ENUM(PB3RedEnvelopeLogType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3RedEnvelopeLogType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3RedEnvelopeLogType_ReltNone = 0,

  /** 房间送出 */
  PB3RedEnvelopeLogType_ReltSend = 1,

  /** 收到 */
  PB3RedEnvelopeLogType_ReltReceive = 2,

  /** 我的送出记录 */
  PB3RedEnvelopeLogType_ReltMySend = 3,
};

GPBEnumDescriptor *PB3RedEnvelopeLogType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3RedEnvelopeLogType_IsValidValue(int32_t value);

#pragma mark - PB3RedEnvelopeExtRoot

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
@interface PB3RedEnvelopeExtRoot : GPBRootObject
@end

#pragma mark - PB3BroadcastRedEnvelopeStatus

typedef GPB_ENUM(PB3BroadcastRedEnvelopeStatus_FieldNumber) {
  PB3BroadcastRedEnvelopeStatus_FieldNumber_RedEnvelope = 1,
  PB3BroadcastRedEnvelopeStatus_FieldNumber_Type = 2,
};

@interface PB3BroadcastRedEnvelopeStatus : GPBMessage

/** 红包信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3RedEnvelopeInfo *redEnvelope;
/** Test to see if @c redEnvelope has been set. */
@property(nonatomic, readwrite) BOOL hasRedEnvelope;

/** 推送类型 */
@property(nonatomic, readwrite) PB3BroadcastRedEnvelopeType type;

@end

/**
 * Fetches the raw value of a @c PB3BroadcastRedEnvelopeStatus's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3BroadcastRedEnvelopeStatus_Type_RawValue(PB3BroadcastRedEnvelopeStatus *message);
/**
 * Sets the raw value of an @c PB3BroadcastRedEnvelopeStatus's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3BroadcastRedEnvelopeStatus_Type_RawValue(PB3BroadcastRedEnvelopeStatus *message, int32_t value);

#pragma mark - PB3RedEnvelopeInfo

typedef GPB_ENUM(PB3RedEnvelopeInfo_FieldNumber) {
  PB3RedEnvelopeInfo_FieldNumber_RedEnvelopeId = 1,
  PB3RedEnvelopeInfo_FieldNumber_RedEnvelopeNum = 2,
  PB3RedEnvelopeInfo_FieldNumber_OpenedNum = 3,
  PB3RedEnvelopeInfo_FieldNumber_GoldEach = 4,
  PB3RedEnvelopeInfo_FieldNumber_GoldTotal = 5,
  PB3RedEnvelopeInfo_FieldNumber_Greeting = 6,
  PB3RedEnvelopeInfo_FieldNumber_ValidTime = 7,
  PB3RedEnvelopeInfo_FieldNumber_WealthLevel = 8,
  PB3RedEnvelopeInfo_FieldNumber_CharmLevel = 9,
  PB3RedEnvelopeInfo_FieldNumber_LevelOption = 10,
  PB3RedEnvelopeInfo_FieldNumber_Sender = 11,
  PB3RedEnvelopeInfo_FieldNumber_SendAt = 12,
  PB3RedEnvelopeInfo_FieldNumber_EndAt = 13,
  PB3RedEnvelopeInfo_FieldNumber_GoldOpened = 14,
};

@interface PB3RedEnvelopeInfo : GPBMessage

/** 红包(泡泡)ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *redEnvelopeId;

/** 红包(泡泡)数量 */
@property(nonatomic, readwrite) int32_t redEnvelopeNum;

/** 已被抢数量 */
@property(nonatomic, readwrite) int32_t openedNum;

/** 单个红包(泡泡) */
@property(nonatomic, readwrite) int32_t goldEach;

/** 所有红包(泡泡) */
@property(nonatomic, readwrite) int64_t goldTotal;

/** 祝福语 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *greeting;

/** 有效时间 秒 */
@property(nonatomic, readwrite) int32_t validTime;

/** 财富等级 */
@property(nonatomic, readwrite) int32_t wealthLevel;

/** 魅力等级 */
@property(nonatomic, readwrite) int32_t charmLevel;

/** 等级选项 */
@property(nonatomic, readwrite) PB3LevelOption levelOption;

/** 发红包(泡泡)用户信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3RedPlayer *sender;
/** Test to see if @c sender has been set. */
@property(nonatomic, readwrite) BOOL hasSender;

/** 发红包(泡泡)时间 unix时间戳 秒 */
@property(nonatomic, readwrite) int64_t sendAt;

/** 结束时间 unix时间戳 秒 */
@property(nonatomic, readwrite) int64_t endAt;

/** 开启的红包价值 */
@property(nonatomic, readwrite) int64_t goldOpened;

@end

/**
 * Fetches the raw value of a @c PB3RedEnvelopeInfo's @c levelOption property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3RedEnvelopeInfo_LevelOption_RawValue(PB3RedEnvelopeInfo *message);
/**
 * Sets the raw value of an @c PB3RedEnvelopeInfo's @c levelOption property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3RedEnvelopeInfo_LevelOption_RawValue(PB3RedEnvelopeInfo *message, int32_t value);

#pragma mark - PB3RedEnvelopeOpen

typedef GPB_ENUM(PB3RedEnvelopeOpen_FieldNumber) {
  PB3RedEnvelopeOpen_FieldNumber_OpenId = 1,
  PB3RedEnvelopeOpen_FieldNumber_OpenId2 = 2,
  PB3RedEnvelopeOpen_FieldNumber_OpenName = 3,
  PB3RedEnvelopeOpen_FieldNumber_SendId = 4,
  PB3RedEnvelopeOpen_FieldNumber_SendId2 = 5,
  PB3RedEnvelopeOpen_FieldNumber_SendName = 6,
  PB3RedEnvelopeOpen_FieldNumber_Gold = 7,
};

@interface PB3RedEnvelopeOpen : GPBMessage

/** 戳红包者ID */
@property(nonatomic, readwrite) int64_t openId;

@property(nonatomic, readwrite) int64_t openId2;

/** 戳红包者名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *openName;

/** 发红包者ID */
@property(nonatomic, readwrite) int64_t sendId;

@property(nonatomic, readwrite) int64_t sendId2;

/** 发红包者名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *sendName;

/** 领取的数额 */
@property(nonatomic, readwrite) int32_t gold;

@end

#pragma mark - PB3RedPlayer

typedef GPB_ENUM(PB3RedPlayer_FieldNumber) {
  PB3RedPlayer_FieldNumber_PlayerId = 1,
  PB3RedPlayer_FieldNumber_Id2 = 2,
  PB3RedPlayer_FieldNumber_Name = 3,
  PB3RedPlayer_FieldNumber_Icon = 4,
  PB3RedPlayer_FieldNumber_Sex = 5,
  PB3RedPlayer_FieldNumber_WealthLevel = 6,
  PB3RedPlayer_FieldNumber_CharmLevel = 7,
};

@interface PB3RedPlayer : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite) int64_t id2;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite) int32_t sex;

@property(nonatomic, readwrite) int32_t wealthLevel;

@property(nonatomic, readwrite) int32_t charmLevel;

@end

#pragma mark - PB3SendRedEnvelopeReq

typedef GPB_ENUM(PB3SendRedEnvelopeReq_FieldNumber) {
  PB3SendRedEnvelopeReq_FieldNumber_RedEnvelopeNum = 1,
  PB3SendRedEnvelopeReq_FieldNumber_GoldEach = 2,
  PB3SendRedEnvelopeReq_FieldNumber_Greeting = 3,
  PB3SendRedEnvelopeReq_FieldNumber_ValidTime = 4,
  PB3SendRedEnvelopeReq_FieldNumber_WealthLevel = 5,
  PB3SendRedEnvelopeReq_FieldNumber_CharmLevel = 6,
  PB3SendRedEnvelopeReq_FieldNumber_LevelOption = 7,
};

/**
 * 吐泡泡
 **/
@interface PB3SendRedEnvelopeReq : GPBMessage

/** 红包(泡泡)数量  0-999 */
@property(nonatomic, readwrite) int32_t redEnvelopeNum;

/** 单个红包(泡泡) */
@property(nonatomic, readwrite) int32_t goldEach;

/** 祝福语 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *greeting;

/** 有效时间 */
@property(nonatomic, readwrite) int32_t validTime;

/** 财富等级 */
@property(nonatomic, readwrite) int32_t wealthLevel;

/** 魅力等级 */
@property(nonatomic, readwrite) int32_t charmLevel;

/** 等级选项 */
@property(nonatomic, readwrite) PB3LevelOption levelOption;

@end

/**
 * Fetches the raw value of a @c PB3SendRedEnvelopeReq's @c levelOption property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3SendRedEnvelopeReq_LevelOption_RawValue(PB3SendRedEnvelopeReq *message);
/**
 * Sets the raw value of an @c PB3SendRedEnvelopeReq's @c levelOption property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3SendRedEnvelopeReq_LevelOption_RawValue(PB3SendRedEnvelopeReq *message, int32_t value);

#pragma mark - PB3SendRedEnvelopeRes

@interface PB3SendRedEnvelopeRes : GPBMessage

@end

#pragma mark - PB3SendRandomRedEnvelopeReq

typedef GPB_ENUM(PB3SendRandomRedEnvelopeReq_FieldNumber) {
  PB3SendRandomRedEnvelopeReq_FieldNumber_RedEnvelopeNum = 1,
  PB3SendRandomRedEnvelopeReq_FieldNumber_Gold = 2,
  PB3SendRandomRedEnvelopeReq_FieldNumber_Greeting = 3,
  PB3SendRandomRedEnvelopeReq_FieldNumber_ValidTime = 4,
  PB3SendRandomRedEnvelopeReq_FieldNumber_WealthLevel = 5,
  PB3SendRandomRedEnvelopeReq_FieldNumber_CharmLevel = 6,
  PB3SendRandomRedEnvelopeReq_FieldNumber_LevelOption = 7,
};

/**
 * 吐泡泡  随机红包
 **/
@interface PB3SendRandomRedEnvelopeReq : GPBMessage

/** 红包(泡泡)数量  0-999 */
@property(nonatomic, readwrite) int32_t redEnvelopeNum;

/** 红包金币总额 100 最少，最后两个个尾数只能是0，服务端只会扣除整百 */
@property(nonatomic, readwrite) int32_t gold;

/** 祝福语 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *greeting;

/** 有效时间 */
@property(nonatomic, readwrite) int32_t validTime;

/** 财富等级 */
@property(nonatomic, readwrite) int32_t wealthLevel;

/** 魅力等级 */
@property(nonatomic, readwrite) int32_t charmLevel;

/** 等级选项 */
@property(nonatomic, readwrite) PB3LevelOption levelOption;

@end

/**
 * Fetches the raw value of a @c PB3SendRandomRedEnvelopeReq's @c levelOption property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3SendRandomRedEnvelopeReq_LevelOption_RawValue(PB3SendRandomRedEnvelopeReq *message);
/**
 * Sets the raw value of an @c PB3SendRandomRedEnvelopeReq's @c levelOption property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3SendRandomRedEnvelopeReq_LevelOption_RawValue(PB3SendRandomRedEnvelopeReq *message, int32_t value);

#pragma mark - PB3SendRandomRedEnvelopeRes

@interface PB3SendRandomRedEnvelopeRes : GPBMessage

@end

#pragma mark - PB3OpenRedEnvelopeReq

typedef GPB_ENUM(PB3OpenRedEnvelopeReq_FieldNumber) {
  PB3OpenRedEnvelopeReq_FieldNumber_RedEnvelopeId = 1,
};

/**
 * 开泡泡
 **/
@interface PB3OpenRedEnvelopeReq : GPBMessage

/** 红包(泡泡)ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *redEnvelopeId;

@end

#pragma mark - PB3RedEnvelopeLuckyListReq

typedef GPB_ENUM(PB3RedEnvelopeLuckyListReq_FieldNumber) {
  PB3RedEnvelopeLuckyListReq_FieldNumber_RedEnvelopeId = 1,
  PB3RedEnvelopeLuckyListReq_FieldNumber_Index = 2,
};

/**
 * 领取记录接口
 **/
@interface PB3RedEnvelopeLuckyListReq : GPBMessage

/** 红包(泡泡)ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *redEnvelopeId;

/** 第一次请求传0 */
@property(nonatomic, readwrite) int32_t index;

@end

#pragma mark - PB3RedEnvelopeLuckyListRes

typedef GPB_ENUM(PB3RedEnvelopeLuckyListRes_FieldNumber) {
  PB3RedEnvelopeLuckyListRes_FieldNumber_RedEnvelopeInfo = 1,
  PB3RedEnvelopeLuckyListRes_FieldNumber_LuckyBoysArray = 2,
  PB3RedEnvelopeLuckyListRes_FieldNumber_Index = 3,
  PB3RedEnvelopeLuckyListRes_FieldNumber_Gold = 4,
  PB3RedEnvelopeLuckyListRes_FieldNumber_OpenedGold = 5,
  PB3RedEnvelopeLuckyListRes_FieldNumber_OverMsg = 6,
};

/**
 * 戳泡泡成功|领取记录接口 都返回这个结构
 **/
@interface PB3RedEnvelopeLuckyListRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3RedEnvelopeInfo *redEnvelopeInfo;
/** Test to see if @c redEnvelopeInfo has been set. */
@property(nonatomic, readwrite) BOOL hasRedEnvelopeInfo;

/** 一次最多返回50条记录，获取后面的记录用红包ID和index请求列表接口 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3RedEnvelopeLog*> *luckyBoysArray;
/** The number of items in @c luckyBoysArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger luckyBoysArray_Count;

/** -1 到底了 */
@property(nonatomic, readwrite) int32_t index;

/** 余额 */
@property(nonatomic, readwrite) int32_t gold;

/** 开启的价值 */
@property(nonatomic, readwrite) int32_t openedGold;

/** 领完显示的文字 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *overMsg;

@end

#pragma mark - PB3RedEnvelopeLogReq

typedef GPB_ENUM(PB3RedEnvelopeLogReq_FieldNumber) {
  PB3RedEnvelopeLogReq_FieldNumber_Type = 1,
};

/**
 * 泡泡记录
 **/
@interface PB3RedEnvelopeLogReq : GPBMessage

@property(nonatomic, readwrite) PB3RedEnvelopeLogType type;

@end

/**
 * Fetches the raw value of a @c PB3RedEnvelopeLogReq's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3RedEnvelopeLogReq_Type_RawValue(PB3RedEnvelopeLogReq *message);
/**
 * Sets the raw value of an @c PB3RedEnvelopeLogReq's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3RedEnvelopeLogReq_Type_RawValue(PB3RedEnvelopeLogReq *message, int32_t value);

#pragma mark - PB3RedEnvelopeLogRes

typedef GPB_ENUM(PB3RedEnvelopeLogRes_FieldNumber) {
  PB3RedEnvelopeLogRes_FieldNumber_ListArray = 1,
  PB3RedEnvelopeLogRes_FieldNumber_Type = 2,
};

@interface PB3RedEnvelopeLogRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3RedEnvelopeLog*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@property(nonatomic, readwrite) PB3RedEnvelopeLogType type;

@end

/**
 * Fetches the raw value of a @c PB3RedEnvelopeLogRes's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3RedEnvelopeLogRes_Type_RawValue(PB3RedEnvelopeLogRes *message);
/**
 * Sets the raw value of an @c PB3RedEnvelopeLogRes's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3RedEnvelopeLogRes_Type_RawValue(PB3RedEnvelopeLogRes *message, int32_t value);

#pragma mark - PB3RedEnvelopeLog

typedef GPB_ENUM(PB3RedEnvelopeLog_FieldNumber) {
  PB3RedEnvelopeLog_FieldNumber_Player = 1,
  PB3RedEnvelopeLog_FieldNumber_Gold = 2,
  PB3RedEnvelopeLog_FieldNumber_CreateAt = 3,
  PB3RedEnvelopeLog_FieldNumber_Num = 4,
  PB3RedEnvelopeLog_FieldNumber_NumTotal = 5,
  PB3RedEnvelopeLog_FieldNumber_GoldTotal = 6,
};

@interface PB3RedEnvelopeLog : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3RedPlayer *player;
/** Test to see if @c player has been set. */
@property(nonatomic, readwrite) BOOL hasPlayer;

/** 领取|退回 */
@property(nonatomic, readwrite) int32_t gold;

/** unix时间戳 秒 */
@property(nonatomic, readwrite) int64_t createAt;

/** 领取数量 */
@property(nonatomic, readwrite) int32_t num;

/** 总数量 */
@property(nonatomic, readwrite) int32_t numTotal;

/** 总 */
@property(nonatomic, readwrite) int32_t goldTotal;

@end

#pragma mark - PB3RedEnvelopeConf

typedef GPB_ENUM(PB3RedEnvelopeConf_FieldNumber) {
  PB3RedEnvelopeConf_FieldNumber_ValidTimesArray = 1,
  PB3RedEnvelopeConf_FieldNumber_TaxRate = 2,
};

@interface PB3RedEnvelopeConf : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) GPBInt32Array *validTimesArray;
/** The number of items in @c validTimesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger validTimesArray_Count;

/** 官方扣除的税率 tax_rate=百分数*100， 例：20%，则 tax_rate=2000 */
@property(nonatomic, readwrite) int32_t taxRate;

@end

#pragma mark - PB3RedEnvelopeConfReq

/**
 * 泡泡配置
 **/
@interface PB3RedEnvelopeConfReq : GPBMessage

@end

#pragma mark - PB3RedEnvelopeConfRes

typedef GPB_ENUM(PB3RedEnvelopeConfRes_FieldNumber) {
  PB3RedEnvelopeConfRes_FieldNumber_Config = 1,
};

@interface PB3RedEnvelopeConfRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3RedEnvelopeConf *config;
/** Test to see if @c config has been set. */
@property(nonatomic, readwrite) BOOL hasConfig;

@end

#pragma mark - PB3CloseRedEnvelopeReq

typedef GPB_ENUM(PB3CloseRedEnvelopeReq_FieldNumber) {
  PB3CloseRedEnvelopeReq_FieldNumber_RedEnvelopeId = 1,
};

/**
 * 撤销泡泡
 **/
@interface PB3CloseRedEnvelopeReq : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *redEnvelopeId;

@end

#pragma mark - PB3CloseRedEnvelopeRes

@interface PB3CloseRedEnvelopeRes : GPBMessage

@end

#pragma mark - PB3BreakRedEnvelopeReq

typedef GPB_ENUM(PB3BreakRedEnvelopeReq_FieldNumber) {
  PB3BreakRedEnvelopeReq_FieldNumber_RedEnvelopeId = 1,
};

/**
 * 戳泡泡
 **/
@interface PB3BreakRedEnvelopeReq : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *redEnvelopeId;

@end

#pragma mark - PB3BreakRedEnvelopeRes

typedef GPB_ENUM(PB3BreakRedEnvelopeRes_FieldNumber) {
  PB3BreakRedEnvelopeRes_FieldNumber_CanOpen = 1,
  PB3BreakRedEnvelopeRes_FieldNumber_RedEnvelope = 2,
};

@interface PB3BreakRedEnvelopeRes : GPBMessage

/** true 没有开过泡泡 false 开过泡泡 */
@property(nonatomic, readwrite) BOOL canOpen;

/** 红包对象 */
@property(nonatomic, readwrite, strong, null_resettable) PB3RedEnvelopeInfo *redEnvelope;
/** Test to see if @c redEnvelope has been set. */
@property(nonatomic, readwrite) BOOL hasRedEnvelope;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
