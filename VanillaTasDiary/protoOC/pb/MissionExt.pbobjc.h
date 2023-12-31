// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/mission.ext.proto

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

@class PB3CreditHistory;
@class PB3CreditScoreActive;
@class PB3CreditScoreConsumeStrength;
@class PB3CreditScoreIdentity;
@class PB3CreditScoreIntimate;
@class PB3CreditScoreLevelCfg;
@class PB3CreditScorePlayer;
@class PB3CreditScorePrivilegeDetail;
@class PB3CreditScorePunish;
GPB_ENUM_FWD_DECLARE(PB3CreditScoreLevel);
GPB_ENUM_FWD_DECLARE(PB3CreditScoreStatus);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3MissionStatus

/** 任务状态 */
typedef GPB_ENUM(PB3MissionStatus) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3MissionStatus_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3MissionStatus_MsNone = 0,

  /** 进行中 */
  PB3MissionStatus_MsDoing = 1,

  /** 已完成 */
  PB3MissionStatus_MsFinished = 2,

  /** 已提交 */
  PB3MissionStatus_MsDone = 3,
};

GPBEnumDescriptor *PB3MissionStatus_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3MissionStatus_IsValidValue(int32_t value);

#pragma mark - Enum PB3MissionCalcType

/** 任务计算类型 */
typedef GPB_ENUM(PB3MissionCalcType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3MissionCalcType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3MissionCalcType_MctNone = 0,

  /** 目标 */
  PB3MissionCalcType_MctTarget = 1,

  /** 累计 */
  PB3MissionCalcType_MctAcc = 2,
};

GPBEnumDescriptor *PB3MissionCalcType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3MissionCalcType_IsValidValue(int32_t value);

#pragma mark - PB3MissionExtRoot

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
@interface PB3MissionExtRoot : GPBRootObject
@end

#pragma mark - PB3CreditScorePlayer

typedef GPB_ENUM(PB3CreditScorePlayer_FieldNumber) {
  PB3CreditScorePlayer_FieldNumber_PlayerId = 1,
  PB3CreditScorePlayer_FieldNumber_Id2 = 2,
  PB3CreditScorePlayer_FieldNumber_PlayerName = 3,
  PB3CreditScorePlayer_FieldNumber_Icon = 4,
  PB3CreditScorePlayer_FieldNumber_Score = 5,
  PB3CreditScorePlayer_FieldNumber_Level = 6,
  PB3CreditScorePlayer_FieldNumber_ScoreUpdateAt = 7,
  PB3CreditScorePlayer_FieldNumber_LastMonthScore = 8,
  PB3CreditScorePlayer_FieldNumber_ChangeScore = 9,
};

/**
 * 信用分用户基础信息
 **/
@interface PB3CreditScorePlayer : GPBMessage

/** 用户ID */
@property(nonatomic, readwrite) int64_t playerId;

/** 靓号 */
@property(nonatomic, readwrite) int64_t id2;

/** 用户名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *playerName;

/** 头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 用户信用分 */
@property(nonatomic, readwrite) int32_t score;

/** 信用分级别 */
@property(nonatomic, readwrite) enum PB3CreditScoreLevel level;

/** 信用分更新时间 */
@property(nonatomic, readwrite) int64_t scoreUpdateAt;

/** 上个月信用分(score和last_month_score相等，显示:暂无变化记录) */
@property(nonatomic, readwrite) int32_t lastMonthScore;

/** 周期变化分数(如果为0，显示:暂无变化记录) */
@property(nonatomic, readwrite) int32_t changeScore;

@end

/**
 * Fetches the raw value of a @c PB3CreditScorePlayer's @c level property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CreditScorePlayer_Level_RawValue(PB3CreditScorePlayer *message);
/**
 * Sets the raw value of an @c PB3CreditScorePlayer's @c level property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CreditScorePlayer_Level_RawValue(PB3CreditScorePlayer *message, int32_t value);

#pragma mark - PB3CreditScoreIdentity

typedef GPB_ENUM(PB3CreditScoreIdentity_FieldNumber) {
  PB3CreditScoreIdentity_FieldNumber_Score = 1,
  PB3CreditScoreIdentity_FieldNumber_IsCertification = 2,
  PB3CreditScoreIdentity_FieldNumber_IsClan = 3,
  PB3CreditScoreIdentity_FieldNumber_IsNobility = 4,
  PB3CreditScoreIdentity_FieldNumber_Total = 5,
  PB3CreditScoreIdentity_FieldNumber_IsPublicSettle = 6,
};

/**
 * 信用分身份证明
 **/
@interface PB3CreditScoreIdentity : GPBMessage

/** 身份证明得分 */
@property(nonatomic, readwrite) int32_t score;

/** 是否实名 */
@property(nonatomic, readwrite) BOOL isCertification;

/** 是否公会成员 */
@property(nonatomic, readwrite) BOOL isClan;

/** 是否开通爵位 */
@property(nonatomic, readwrite) BOOL isNobility;

/** 总分 */
@property(nonatomic, readwrite) int32_t total;

/** 是否对公 */
@property(nonatomic, readwrite) BOOL isPublicSettle;

@end

#pragma mark - PB3CreditScoreActive

typedef GPB_ENUM(PB3CreditScoreActive_FieldNumber) {
  PB3CreditScoreActive_FieldNumber_Score = 1,
  PB3CreditScoreActive_FieldNumber_ActiveDays = 2,
  PB3CreditScoreActive_FieldNumber_Total = 3,
};

/**
 * 信用分行为累计
 **/
@interface PB3CreditScoreActive : GPBMessage

/** 活跃得分 */
@property(nonatomic, readwrite) int32_t score;

/** 活跃天数(如果是-1，显示:本月活跃数据，下个月结算) */
@property(nonatomic, readwrite) int32_t activeDays;

/** 总分 */
@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3CreditScoreConsumeStrength

typedef GPB_ENUM(PB3CreditScoreConsumeStrength_FieldNumber) {
  PB3CreditScoreConsumeStrength_FieldNumber_Score = 1,
  PB3CreditScoreConsumeStrength_FieldNumber_WealthLevel = 2,
  PB3CreditScoreConsumeStrength_FieldNumber_CharmLevel = 3,
  PB3CreditScoreConsumeStrength_FieldNumber_Total = 4,
};

/**
 * 信用分消费实力
 **/
@interface PB3CreditScoreConsumeStrength : GPBMessage

/** 消费实力得分 */
@property(nonatomic, readwrite) int32_t score;

/** 财富等级 */
@property(nonatomic, readwrite) int32_t wealthLevel;

/** 魅力等级 */
@property(nonatomic, readwrite) int32_t charmLevel;

/** 总分 */
@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3CreditScorePunish

typedef GPB_ENUM(PB3CreditScorePunish_FieldNumber) {
  PB3CreditScorePunish_FieldNumber_Score = 1,
  PB3CreditScorePunish_FieldNumber_IsPunish = 2,
  PB3CreditScorePunish_FieldNumber_Total = 3,
};

/**
 * 信用分违规次数
 **/
@interface PB3CreditScorePunish : GPBMessage

/** 违规得分 */
@property(nonatomic, readwrite) int32_t score;

/** 30天内是否有违规记录 */
@property(nonatomic, readwrite) BOOL isPunish;

/** 总分 */
@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3CreditScoreIntimate

typedef GPB_ENUM(PB3CreditScoreIntimate_FieldNumber) {
  PB3CreditScoreIntimate_FieldNumber_Score = 1,
  PB3CreditScoreIntimate_FieldNumber_IntimateNum = 2,
  PB3CreditScoreIntimate_FieldNumber_Total = 3,
};

/**
 * 信用分人脉关系
 **/
@interface PB3CreditScoreIntimate : GPBMessage

/** 人脉得分 */
@property(nonatomic, readwrite) int32_t score;

/** 挚友数量 */
@property(nonatomic, readwrite) int32_t intimateNum;

/** 总分 */
@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3CreditScorePrivilegeDetail

typedef GPB_ENUM(PB3CreditScorePrivilegeDetail_FieldNumber) {
  PB3CreditScorePrivilegeDetail_FieldNumber_PrivilegeDetail = 1,
};

/**
 * 信用分特权
 **/
@interface PB3CreditScorePrivilegeDetail : GPBMessage

/** 特权描述 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *privilegeDetail;

@end

#pragma mark - PB3CreditScoreLevelCfg

typedef GPB_ENUM(PB3CreditScoreLevelCfg_FieldNumber) {
  PB3CreditScoreLevelCfg_FieldNumber_BadScore = 1,
  PB3CreditScoreLevelCfg_FieldNumber_GeneralScore = 2,
  PB3CreditScoreLevelCfg_FieldNumber_GoodScore = 3,
  PB3CreditScoreLevelCfg_FieldNumber_VeryGoodScore = 4,
  PB3CreditScoreLevelCfg_FieldNumber_ExcellentScore = 5,
};

/**
 * 信用分等级
 **/
@interface PB3CreditScoreLevelCfg : GPBMessage

/** 较差的分数的上限 */
@property(nonatomic, readwrite) int32_t badScore;

/** 一般的分数的上限 */
@property(nonatomic, readwrite) int32_t generalScore;

/** 良好的分数的上限 */
@property(nonatomic, readwrite) int32_t goodScore;

/** 优秀的分数的上限 */
@property(nonatomic, readwrite) int32_t veryGoodScore;

/** 极好的分数的上限 */
@property(nonatomic, readwrite) int32_t excellentScore;

@end

#pragma mark - PB3CreditScoreInfoReq

@interface PB3CreditScoreInfoReq : GPBMessage

@end

#pragma mark - PB3CreditScoreInfoRes

typedef GPB_ENUM(PB3CreditScoreInfoRes_FieldNumber) {
  PB3CreditScoreInfoRes_FieldNumber_Status = 1,
  PB3CreditScoreInfoRes_FieldNumber_TotalScore = 2,
  PB3CreditScoreInfoRes_FieldNumber_Player = 3,
  PB3CreditScoreInfoRes_FieldNumber_Identity = 4,
  PB3CreditScoreInfoRes_FieldNumber_Active = 5,
  PB3CreditScoreInfoRes_FieldNumber_Strength = 6,
  PB3CreditScoreInfoRes_FieldNumber_Publish = 7,
  PB3CreditScoreInfoRes_FieldNumber_Intimate = 8,
  PB3CreditScoreInfoRes_FieldNumber_Privilege = 9,
  PB3CreditScoreInfoRes_FieldNumber_LevelCfg = 10,
};

/**
 * 信用分数据
 **/
@interface PB3CreditScoreInfoRes : GPBMessage

/** 激活状态 */
@property(nonatomic, readwrite) enum PB3CreditScoreStatus status;

/** 总分 */
@property(nonatomic, readwrite) int32_t totalScore;

/** 用户信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScorePlayer *player;
/** Test to see if @c player has been set. */
@property(nonatomic, readwrite) BOOL hasPlayer;

/** 身份证明 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScoreIdentity *identity;
/** Test to see if @c identity has been set. */
@property(nonatomic, readwrite) BOOL hasIdentity;

/** 行为累计 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScoreActive *active;
/** Test to see if @c active has been set. */
@property(nonatomic, readwrite) BOOL hasActive;

/** 消费实力 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScoreConsumeStrength *strength;
/** Test to see if @c strength has been set. */
@property(nonatomic, readwrite) BOOL hasStrength;

/** 违规记录 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScorePunish *publish;
/** Test to see if @c publish has been set. */
@property(nonatomic, readwrite) BOOL hasPublish;

/** 人脉关系 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScoreIntimate *intimate;
/** Test to see if @c intimate has been set. */
@property(nonatomic, readwrite) BOOL hasIntimate;

/** 特权描述 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScorePrivilegeDetail *privilege;
/** Test to see if @c privilege has been set. */
@property(nonatomic, readwrite) BOOL hasPrivilege;

/** 信用分等级配置 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CreditScoreLevelCfg *levelCfg;
/** Test to see if @c levelCfg has been set. */
@property(nonatomic, readwrite) BOOL hasLevelCfg;

@end

/**
 * Fetches the raw value of a @c PB3CreditScoreInfoRes's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CreditScoreInfoRes_Status_RawValue(PB3CreditScoreInfoRes *message);
/**
 * Sets the raw value of an @c PB3CreditScoreInfoRes's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CreditScoreInfoRes_Status_RawValue(PB3CreditScoreInfoRes *message, int32_t value);

#pragma mark - PB3ActiveCreditScoreReq

@interface PB3ActiveCreditScoreReq : GPBMessage

@end

#pragma mark - PB3ActiveCreditScoreRes

typedef GPB_ENUM(PB3ActiveCreditScoreRes_FieldNumber) {
  PB3ActiveCreditScoreRes_FieldNumber_Status = 1,
};

@interface PB3ActiveCreditScoreRes : GPBMessage

/** 激活状态 */
@property(nonatomic, readwrite) enum PB3CreditScoreStatus status;

@end

/**
 * Fetches the raw value of a @c PB3ActiveCreditScoreRes's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3ActiveCreditScoreRes_Status_RawValue(PB3ActiveCreditScoreRes *message);
/**
 * Sets the raw value of an @c PB3ActiveCreditScoreRes's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3ActiveCreditScoreRes_Status_RawValue(PB3ActiveCreditScoreRes *message, int32_t value);

#pragma mark - PB3CreditHistoryReq

typedef GPB_ENUM(PB3CreditHistoryReq_FieldNumber) {
  PB3CreditHistoryReq_FieldNumber_Page = 1,
  PB3CreditHistoryReq_FieldNumber_PageSize = 2,
};

@interface PB3CreditHistoryReq : GPBMessage

/** 分页 */
@property(nonatomic, readwrite) int32_t page;

@property(nonatomic, readwrite) int32_t pageSize;

@end

#pragma mark - PB3CreditHistoryRes

typedef GPB_ENUM(PB3CreditHistoryRes_FieldNumber) {
  PB3CreditHistoryRes_FieldNumber_HistoryArray = 1,
  PB3CreditHistoryRes_FieldNumber_Total = 2,
};

@interface PB3CreditHistoryRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CreditHistory*> *historyArray;
/** The number of items in @c historyArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger historyArray_Count;

@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3CreditHistory

typedef GPB_ENUM(PB3CreditHistory_FieldNumber) {
  PB3CreditHistory_FieldNumber_Timestamp = 1,
  PB3CreditHistory_FieldNumber_FinalScore = 2,
  PB3CreditHistory_FieldNumber_Desc = 3,
  PB3CreditHistory_FieldNumber_IsRed = 4,
};

@interface PB3CreditHistory : GPBMessage

/** 时间戳 */
@property(nonatomic, readwrite) int64_t timestamp;

/** 最终分数 */
@property(nonatomic, readwrite) int64_t finalScore;

/** 变动描述 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *desc;

/** 是否标红 */
@property(nonatomic, readwrite) BOOL isRed;

@end

#pragma mark - PB3CreditScoreRankRateReq

@interface PB3CreditScoreRankRateReq : GPBMessage

@end

#pragma mark - PB3CreditScoreRankRateRes

typedef GPB_ENUM(PB3CreditScoreRankRateRes_FieldNumber) {
  PB3CreditScoreRankRateRes_FieldNumber_Rate = 1,
};

@interface PB3CreditScoreRankRateRes : GPBMessage

/** 比例 */
@property(nonatomic, readwrite) int32_t rate;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
