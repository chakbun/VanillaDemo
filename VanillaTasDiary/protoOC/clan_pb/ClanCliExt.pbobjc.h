// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: clan_pb/clan_cli.ext.proto

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

@class PB3HourRank;
@class PB3HourRankType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3ClanCmdId

/** 公会广播cmdId定义 // 800 */
typedef GPB_ENUM(PB3ClanCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3ClanCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3ClanCmdId_CcZero = 0,

  /** RC_PlayerEnter = 100001; // 广播有人进房间 */
  PB3ClanCmdId_CcRemoveMasterHall = 800001,

  /** 未读公会消息 */
  PB3ClanCmdId_CcUnReadAnnouncementMsg = 800002,
};

GPBEnumDescriptor *PB3ClanCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3ClanCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3HourRankTime

typedef GPB_ENUM(PB3HourRankTime) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3HourRankTime_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 当前小时 */
  PB3HourRankTime_ThisHour = 0,

  /** 上一个小时 */
  PB3HourRankTime_LastHour = 1,
};

GPBEnumDescriptor *PB3HourRankTime_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3HourRankTime_IsValidValue(int32_t value);

#pragma mark - PB3ClanCliExtRoot

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
@interface PB3ClanCliExtRoot : GPBRootObject
@end

#pragma mark - PB3HourRankTypeReq

/**
 * 小时榜分类
 **/
@interface PB3HourRankTypeReq : GPBMessage

@end

#pragma mark - PB3HourRankTypeRes

typedef GPB_ENUM(PB3HourRankTypeRes_FieldNumber) {
  PB3HourRankTypeRes_FieldNumber_RankTypeArray = 1,
};

@interface PB3HourRankTypeRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3HourRankType*> *rankTypeArray;
/** The number of items in @c rankTypeArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger rankTypeArray_Count;

@end

#pragma mark - PB3HourRankType

typedef GPB_ENUM(PB3HourRankType_FieldNumber) {
  PB3HourRankType_FieldNumber_RankType = 1,
  PB3HourRankType_FieldNumber_RankName = 2,
  PB3HourRankType_FieldNumber_Theme = 3,
};

@interface PB3HourRankType : GPBMessage

/** 小时榜类型 */
@property(nonatomic, readwrite) int64_t rankType;

/** 类型名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *rankName;

/** 主题 RGB */
@property(nonatomic, readwrite, copy, null_resettable) NSString *theme;

@end

#pragma mark - PB3HourRankReq

typedef GPB_ENUM(PB3HourRankReq_FieldNumber) {
  PB3HourRankReq_FieldNumber_RoomId = 1,
  PB3HourRankReq_FieldNumber_RankType = 2,
  PB3HourRankReq_FieldNumber_HourTime = 3,
};

/**
 * 小时榜
 **/
@interface PB3HourRankReq : GPBMessage

/** 房间ID */
@property(nonatomic, readwrite) int64_t roomId;

/** 小时榜类型 */
@property(nonatomic, readwrite) int64_t rankType;

/** 获取哪个时间排行榜 */
@property(nonatomic, readwrite) PB3HourRankTime hourTime;

@end

/**
 * Fetches the raw value of a @c PB3HourRankReq's @c hourTime property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3HourRankReq_HourTime_RawValue(PB3HourRankReq *message);
/**
 * Sets the raw value of an @c PB3HourRankReq's @c hourTime property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3HourRankReq_HourTime_RawValue(PB3HourRankReq *message, int32_t value);

#pragma mark - PB3HourRankRes

typedef GPB_ENUM(PB3HourRankRes_FieldNumber) {
  PB3HourRankRes_FieldNumber_HourRankArray = 1,
  PB3HourRankRes_FieldNumber_CurrentRank = 2,
  PB3HourRankRes_FieldNumber_CurrentDate = 3,
  PB3HourRankRes_FieldNumber_BalanceDate = 4,
};

@interface PB3HourRankRes : GPBMessage

/** 前10名 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3HourRank*> *hourRankArray;
/** The number of items in @c hourRankArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger hourRankArray_Count;

/** 当前房间排名 */
@property(nonatomic, readwrite, strong, null_resettable) PB3HourRank *currentRank;
/** Test to see if @c currentRank has been set. */
@property(nonatomic, readwrite) BOOL hasCurrentRank;

/** 当前服务器时间戳 */
@property(nonatomic, readwrite) int64_t currentDate;

/** 结算时间戳 */
@property(nonatomic, readwrite) int64_t balanceDate;

@end

#pragma mark - PB3HourRank

typedef GPB_ENUM(PB3HourRank_FieldNumber) {
  PB3HourRank_FieldNumber_RankNum = 1,
  PB3HourRank_FieldNumber_RoomId = 2,
  PB3HourRank_FieldNumber_RoomName = 3,
  PB3HourRank_FieldNumber_RoomImage = 4,
  PB3HourRank_FieldNumber_FirstGapText = 5,
};

@interface PB3HourRank : GPBMessage

/** 排名 */
@property(nonatomic, readwrite) int64_t rankNum;

/** 房间ID */
@property(nonatomic, readwrite) int64_t roomId;

/** 房间名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomName;

/** 房间头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomImage;

/** 距第一名差距 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *firstGapText;

@end

#pragma mark - PB3UnReadAnnouncementMsgReq

/**
 * 是否有未读消息
 **/
@interface PB3UnReadAnnouncementMsgReq : GPBMessage

@end

#pragma mark - PB3UnReadAnnouncementMsgRes

typedef GPB_ENUM(PB3UnReadAnnouncementMsgRes_FieldNumber) {
  PB3UnReadAnnouncementMsgRes_FieldNumber_Has = 1,
  PB3UnReadAnnouncementMsgRes_FieldNumber_MsgCount = 2,
};

/**
 * cmdId=800002 未读公会消息
 **/
@interface PB3UnReadAnnouncementMsgRes : GPBMessage

@property(nonatomic, readwrite) BOOL has;

@property(nonatomic, readwrite) int32_t msgCount;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)