// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/crack_egg.ext.proto

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

@class PB3Award;
@class PB3CrackEggLuck;
@class PB3CrackEggRank;
@class PB3CrackEggShift;
@class PB3CrackTheme;
GPB_ENUM_FWD_DECLARE(PB3DeviceType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3CrackEggCmdId

/** 401 */
typedef GPB_ENUM(PB3CrackEggCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CrackEggCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3CrackEggCmdId_None401 = 0,

  /** 砸蛋 CrackEggRecord 砸中猫球只推送给自己，且CrackEggRecord为nil， */
  PB3CrackEggCmdId_CrackCmdId = 401101,

  /** 砸中小奖退给房间，若匿名则推给自己，大奖推给所有人 */
  PB3CrackEggCmdId_OpenCmdId = 401102,

  /** 砸蛋 定时广播 CrackEggShift */
  PB3CrackEggCmdId_CrackShift = 401103,

  /** 砸蛋 变身时广播 CrackEggShiftNotice */
  PB3CrackEggCmdId_CrackShiftNotice = 401104,

  /** 砸蛋 定时广播 CrackEggHour */
  PB3CrackEggCmdId_CrackHour = 401107,

  /** 砸蛋 幸运砸蛋 奖池变化 CrackEggLuck */
  PB3CrackEggCmdId_CrackLuckCmdId = 401108,

  /** 砸蛋 幸运砸蛋获得, 对于自己显示特效，对于所有人(包括自己)显示公屏文案 CrackEggLuckGain */
  PB3CrackEggCmdId_CrackLuckGain = 401109,

  /** 砸蛋 幸运砸蛋定时广播 CrackEggLuckNotice */
  PB3CrackEggCmdId_CrackLuckNotice = 401110,

  /** 砸蛋 广播砸蛋时间 CrackTime */
  PB3CrackEggCmdId_CrackTime = 401111,

  /** 砸蛋 广播砸蛋幸运值达到 85% 和 100% 提示  LuckyValueNotice */
  PB3CrackEggCmdId_CrackLuckValue = 401112,
};

GPBEnumDescriptor *PB3CrackEggCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CrackEggCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3NoticeShiftReq_Operation

typedef GPB_ENUM(PB3NoticeShiftReq_Operation) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3NoticeShiftReq_Operation_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3NoticeShiftReq_Operation_Unknow = 0,
  PB3NoticeShiftReq_Operation_TurnOnNotice = 1,
  PB3NoticeShiftReq_Operation_TurnOffNotice = 2,
  PB3NoticeShiftReq_Operation_GetNoticeStatus = 3,
};

GPBEnumDescriptor *PB3NoticeShiftReq_Operation_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3NoticeShiftReq_Operation_IsValidValue(int32_t value);

#pragma mark - Enum PB3NoticeShiftRes_Status

typedef GPB_ENUM(PB3NoticeShiftRes_Status) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3NoticeShiftRes_Status_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3NoticeShiftRes_Status_Unknow = 0,
  PB3NoticeShiftRes_Status_NoticeShiftOn = 1,
  PB3NoticeShiftRes_Status_NoticeShiftOff = 2,
};

GPBEnumDescriptor *PB3NoticeShiftRes_Status_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3NoticeShiftRes_Status_IsValidValue(int32_t value);

#pragma mark - PB3CrackEggExtRoot

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
@interface PB3CrackEggExtRoot : GPBRootObject
@end

#pragma mark - PB3Award

typedef GPB_ENUM(PB3Award_FieldNumber) {
  PB3Award_FieldNumber_GiftId = 1,
  PB3Award_FieldNumber_GiftNum = 2,
  PB3Award_FieldNumber_IsFree = 3,
};

@interface PB3Award : GPBMessage

@property(nonatomic, readwrite) uint32_t giftId;

@property(nonatomic, readwrite) uint32_t giftNum;

@property(nonatomic, readwrite) BOOL isFree;

@end

#pragma mark - PB3CrackEggRecord

typedef GPB_ENUM(PB3CrackEggRecord_FieldNumber) {
  PB3CrackEggRecord_FieldNumber_PlayerId = 1,
  PB3CrackEggRecord_FieldNumber_PlayerNickname = 2,
  PB3CrackEggRecord_FieldNumber_AwardId = 3,
  PB3CrackEggRecord_FieldNumber_AwardNum = 4,
  PB3CrackEggRecord_FieldNumber_Msg = 5,
  PB3CrackEggRecord_FieldNumber_FreeId = 6,
  PB3CrackEggRecord_FieldNumber_FreeNum = 7,
  PB3CrackEggRecord_FieldNumber_RoomId = 8,
  PB3CrackEggRecord_FieldNumber_ShowMe = 9,
  PB3CrackEggRecord_FieldNumber_DeviceType = 10,
  PB3CrackEggRecord_FieldNumber_MsgSignArray = 11,
};

@interface PB3CrackEggRecord : GPBMessage

/** 玩家 */
@property(nonatomic, readwrite) uint64_t playerId;

/** 玩家昵称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *playerNickname;

/** 物品id */
@property(nonatomic, readwrite) uint32_t awardId;

/** 物品数量 */
@property(nonatomic, readwrite) int64_t awardNum;

/** 广播 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

/** 免费礼物Id */
@property(nonatomic, readwrite) uint32_t freeId;

/** 免费礼物数量 */
@property(nonatomic, readwrite) int64_t freeNum;

/** 房间ID */
@property(nonatomic, readwrite) int64_t roomId;

/** 是否屏幕中间显示tips  格式：幸运星能释放，恭喜获得惊喜礼物“礼物名五个字” */
@property(nonatomic, readwrite) BOOL showMe;

/** 设备类型 */
@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

/** msg字段里的所有替换符(用于新旧版兼容) */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<NSString*> *msgSignArray;
/** The number of items in @c msgSignArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger msgSignArray_Count;

@end

/**
 * Fetches the raw value of a @c PB3CrackEggRecord's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CrackEggRecord_DeviceType_RawValue(PB3CrackEggRecord *message);
/**
 * Sets the raw value of an @c PB3CrackEggRecord's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CrackEggRecord_DeviceType_RawValue(PB3CrackEggRecord *message, int32_t value);

#pragma mark - PB3CrackEggNotice

typedef GPB_ENUM(PB3CrackEggNotice_FieldNumber) {
  PB3CrackEggNotice_FieldNumber_Code = 1,
  PB3CrackEggNotice_FieldNumber_Msg = 2,
};

/**
 * 砸蛋开始通知
 **/
@interface PB3CrackEggNotice : GPBMessage

/** 1-砸蛋开启 2-砸蛋关闭 3-开放并且公屏 */
@property(nonatomic, readwrite) int32_t code;

/** 说明 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CrackTime

typedef GPB_ENUM(PB3CrackTime_FieldNumber) {
  PB3CrackTime_FieldNumber_Time = 1,
};

@interface PB3CrackTime : GPBMessage

/** 客户端砸蛋时间间隔，毫秒 */
@property(nonatomic, readwrite) int32_t time;

@end

#pragma mark - PB3CrackEggReq

typedef GPB_ENUM(PB3CrackEggReq_FieldNumber) {
  PB3CrackEggReq_FieldNumber_Open = 1,
  PB3CrackEggReq_FieldNumber_AssetsType = 2,
};

/**
 * 砸蛋
 **/
@interface PB3CrackEggReq : GPBMessage

/** 是否公开砸蛋 */
@property(nonatomic, readwrite) BOOL open;

/** 新加字段，默认0普通锤子, 3为黄金水滴 4钻石水滴 5黑金水滴 查看AssetsType */
@property(nonatomic, readwrite) int32_t assetsType;

@end

#pragma mark - PB3CrackEggRes

typedef GPB_ENUM(PB3CrackEggRes_FieldNumber) {
  PB3CrackEggRes_FieldNumber_AwardsArray = 1,
  PB3CrackEggRes_FieldNumber_Gold = 2,
  PB3CrackEggRes_FieldNumber_LuckyValueRatio = 3,
  PB3CrackEggRes_FieldNumber_AddLuckyValue = 4,
};

@interface PB3CrackEggRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Award*> *awardsArray;
/** The number of items in @c awardsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger awardsArray_Count;

@property(nonatomic, readwrite) int32_t gold;

/** 幸运星百分比 0 - 100 */
@property(nonatomic, readwrite) int32_t luckyValueRatio;

/** 幸运星增加的值 */
@property(nonatomic, readwrite) int32_t addLuckyValue;

@end

#pragma mark - PB3CrackEggShiftReq

typedef GPB_ENUM(PB3CrackEggShiftReq_FieldNumber) {
  PB3CrackEggShiftReq_FieldNumber_OpType = 1,
};

/**
 * 砸蛋幸运砸单
 **/
@interface PB3CrackEggShiftReq : GPBMessage

/** 透传类型 */
@property(nonatomic, readwrite) int32_t opType;

@end

#pragma mark - PB3CrackEggShiftRes

typedef GPB_ENUM(PB3CrackEggShiftRes_FieldNumber) {
  PB3CrackEggShiftRes_FieldNumber_OpType = 1,
  PB3CrackEggShiftRes_FieldNumber_Shift = 2,
  PB3CrackEggShiftRes_FieldNumber_CrackeggExchangeURL = 3,
  PB3CrackEggShiftRes_FieldNumber_CrackeggMillionForestURL = 4,
  PB3CrackEggShiftRes_FieldNumber_CrackeggDescriptionURL = 5,
};

/**
 * 进房间
 **/
@interface PB3CrackEggShiftRes : GPBMessage

/** 透传类型 */
@property(nonatomic, readwrite) int32_t opType;

/** 变身数据 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CrackEggShift *shift;
/** Test to see if @c shift has been set. */
@property(nonatomic, readwrite) BOOL hasShift;

/** 浇花，道具兑换入口跳转url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *crackeggExchangeURL;

/** 浇花，百万森林跳转url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *crackeggMillionForestURL;

/** 浇花说明跳转url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *crackeggDescriptionURL;

@end

#pragma mark - PB3CrackEggShift

typedef GPB_ENUM(PB3CrackEggShift_FieldNumber) {
  PB3CrackEggShift_FieldNumber_Num = 1,
  PB3CrackEggShift_FieldNumber_MaxNum = 2,
  PB3CrackEggShift_FieldNumber_Timeout = 3,
};

@interface PB3CrackEggShift : GPBMessage

/** 当前进度 */
@property(nonatomic, readwrite) int64_t num;

/** 最大进度 */
@property(nonatomic, readwrite) int64_t maxNum;

/** 最大进度 */
@property(nonatomic, readwrite) int64_t timeout;

@end

#pragma mark - PB3CrackEggHour

typedef GPB_ENUM(PB3CrackEggHour_FieldNumber) {
  PB3CrackEggHour_FieldNumber_Code = 1,
  PB3CrackEggHour_FieldNumber_Msg = 2,
};

/**
 * 砸蛋准点广播
 **/
@interface PB3CrackEggHour : GPBMessage

/** 0-23小时 */
@property(nonatomic, readwrite) int32_t code;

/** 说明 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CrackEggShiftNotice

typedef GPB_ENUM(PB3CrackEggShiftNotice_FieldNumber) {
  PB3CrackEggShiftNotice_FieldNumber_Msg = 1,
};

@interface PB3CrackEggShiftNotice : GPBMessage

/** 说明 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CrackEggLuck

typedef GPB_ENUM(PB3CrackEggLuck_FieldNumber) {
  PB3CrackEggLuck_FieldNumber_Gold = 1,
  PB3CrackEggLuck_FieldNumber_Mtime = 2,
};

/**
 * 砸蛋幸运砸单
 **/
@interface PB3CrackEggLuck : GPBMessage

/** 累计金币 */
@property(nonatomic, readwrite) int32_t gold;

/** 最后操作时间 */
@property(nonatomic, readwrite) int64_t mtime;

@end

#pragma mark - PB3CrackEggLuckGain

typedef GPB_ENUM(PB3CrackEggLuckGain_FieldNumber) {
  PB3CrackEggLuckGain_FieldNumber_Id_p = 1,
  PB3CrackEggLuckGain_FieldNumber_PlayerId = 2,
  PB3CrackEggLuckGain_FieldNumber_PlayerNickname = 3,
  PB3CrackEggLuckGain_FieldNumber_Gold = 4,
  PB3CrackEggLuckGain_FieldNumber_GiftId = 5,
  PB3CrackEggLuckGain_FieldNumber_GiftNum = 6,
  PB3CrackEggLuckGain_FieldNumber_Msg = 7,
};

/**
 * 砸蛋幸运砸单获得通知
 **/
@interface PB3CrackEggLuckGain : GPBMessage

/** 惟一id */
@property(nonatomic, readwrite) int32_t id_p;

/** 玩家 */
@property(nonatomic, readwrite) uint64_t playerId;

/** 玩家昵称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *playerNickname;

/** 金币 */
@property(nonatomic, readwrite) int32_t gold;

/** 礼物 */
@property(nonatomic, readwrite) int32_t giftId;

/** 礼物数量 */
@property(nonatomic, readwrite) int32_t giftNum;

/** 广播 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CrackEggLuckReq

typedef GPB_ENUM(PB3CrackEggLuckReq_FieldNumber) {
  PB3CrackEggLuckReq_FieldNumber_OpType = 1,
};

/**
 * 砸蛋幸运砸单
 **/
@interface PB3CrackEggLuckReq : GPBMessage

/** 透传类型 */
@property(nonatomic, readwrite) int32_t opType;

@end

#pragma mark - PB3CrackEggLuckRes

typedef GPB_ENUM(PB3CrackEggLuckRes_FieldNumber) {
  PB3CrackEggLuckRes_FieldNumber_OpType = 1,
  PB3CrackEggLuckRes_FieldNumber_Luck = 2,
};

@interface PB3CrackEggLuckRes : GPBMessage

/** 透传类型 */
@property(nonatomic, readwrite) int32_t opType;

/** 幸运数据 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CrackEggLuck *luck;
/** Test to see if @c luck has been set. */
@property(nonatomic, readwrite) BOOL hasLuck;

@end

#pragma mark - PB3CrackEggLuckNotice

typedef GPB_ENUM(PB3CrackEggLuckNotice_FieldNumber) {
  PB3CrackEggLuckNotice_FieldNumber_Gold = 1,
  PB3CrackEggLuckNotice_FieldNumber_Msg = 2,
};

/**
 * 砸蛋幸运砸蛋
 **/
@interface PB3CrackEggLuckNotice : GPBMessage

/** 幸运 */
@property(nonatomic, readwrite) int32_t gold;

/** 说明 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CrackEggRank

typedef GPB_ENUM(PB3CrackEggRank_FieldNumber) {
  PB3CrackEggRank_FieldNumber_Id_p = 1,
  PB3CrackEggRank_FieldNumber_Name = 2,
  PB3CrackEggRank_FieldNumber_Level = 3,
  PB3CrackEggRank_FieldNumber_ResTime = 4,
  PB3CrackEggRank_FieldNumber_GapVal = 5,
  PB3CrackEggRank_FieldNumber_Icon = 6,
  PB3CrackEggRank_FieldNumber_Desc = 7,
};

/**
 * 砸蛋排行榜
 **/
@interface PB3CrackEggRank : GPBMessage

@property(nonatomic, readwrite) int64_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite) uint32_t level;

@property(nonatomic, readwrite) uint32_t resTime;

/** 差距值 */
@property(nonatomic, readwrite) uint32_t gapVal;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 描述 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *desc;

@end

#pragma mark - PB3CrackEggRankReq

typedef GPB_ENUM(PB3CrackEggRankReq_FieldNumber) {
  PB3CrackEggRankReq_FieldNumber_OpType = 1,
};

/**
 * 砸蛋幸运砸单
 **/
@interface PB3CrackEggRankReq : GPBMessage

/** 透传类型:0-今天; 1-昨天; 2-幸运砸蛋 */
@property(nonatomic, readwrite) int32_t opType;

@end

#pragma mark - PB3CrackEggRankRes

typedef GPB_ENUM(PB3CrackEggRankRes_FieldNumber) {
  PB3CrackEggRankRes_FieldNumber_OpType = 1,
  PB3CrackEggRankRes_FieldNumber_ListArray = 2,
};

@interface PB3CrackEggRankRes : GPBMessage

/** 透传类型:0-今天; 1-昨天; 2-幸运砸蛋 */
@property(nonatomic, readwrite) int32_t opType;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CrackEggRank*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3GetCrackTimeReq

@interface PB3GetCrackTimeReq : GPBMessage

@end

#pragma mark - PB3GetCrackTimeRes

typedef GPB_ENUM(PB3GetCrackTimeRes_FieldNumber) {
  PB3GetCrackTimeRes_FieldNumber_Time = 1,
};

@interface PB3GetCrackTimeRes : GPBMessage

/** 砸蛋间隔时间 */
@property(nonatomic, readwrite) int32_t time;

@end

#pragma mark - PB3CrackCopywritingReq

/**
 * 砸蛋文案
 **/
@interface PB3CrackCopywritingReq : GPBMessage

@end

#pragma mark - PB3CrackCopywritingRes

typedef GPB_ENUM(PB3CrackCopywritingRes_FieldNumber) {
  PB3CrackCopywritingRes_FieldNumber_Keyword = 1,
  PB3CrackCopywritingRes_FieldNumber_CopywritingURL = 2,
};

@interface PB3CrackCopywritingRes : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *keyword;

/** 文案文件url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *copywritingURL;

@end

#pragma mark - PB3CrackTheme

typedef GPB_ENUM(PB3CrackTheme_FieldNumber) {
  PB3CrackTheme_FieldNumber_Id_p = 1,
  PB3CrackTheme_FieldNumber_Name = 2,
  PB3CrackTheme_FieldNumber_Type = 3,
  PB3CrackTheme_FieldNumber_Status = 4,
  PB3CrackTheme_FieldNumber_StartTime = 5,
  PB3CrackTheme_FieldNumber_EndTime = 6,
  PB3CrackTheme_FieldNumber_Key = 7,
  PB3CrackTheme_FieldNumber_IosURL = 8,
  PB3CrackTheme_FieldNumber_AndroidURL = 9,
  PB3CrackTheme_FieldNumber_PcURL = 10,
  PB3CrackTheme_FieldNumber_ProgressCol = 11,
  PB3CrackTheme_FieldNumber_ProgressBorderCol = 12,
  PB3CrackTheme_FieldNumber_ProgressBackgCol = 13,
  PB3CrackTheme_FieldNumber_BuyCol = 14,
  PB3CrackTheme_FieldNumber_OnCol = 15,
  PB3CrackTheme_FieldNumber_OffCol = 16,
  PB3CrackTheme_FieldNumber_LuckCol = 17,
};

/**
 * 新主题结构，旧的在 activity.ext.proto: Theme
 **/
@interface PB3CrackTheme : GPBMessage

@property(nonatomic, readwrite) int32_t id_p;

/** 主题名字 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** 主题类型 1- 砸蛋 2-pc砸蛋 */
@property(nonatomic, readwrite) int32_t type;

/** 状态 */
@property(nonatomic, readwrite) BOOL status;

/** 开始时间 */
@property(nonatomic, readwrite) int64_t startTime;

/** 结束时间 */
@property(nonatomic, readwrite) int64_t endTime;

/** 唯一标志 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *key;

/** iOS动态压缩包地址 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *iosURL;

/** 安卓动态压缩包地址 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *androidURL;

/** PC动态压缩包地址 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *pcURL;

/** 进度条的颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *progressCol;

/** 进度条边框的颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *progressBorderCol;

/** 进度条底色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *progressBackgCol;

/** 购买页文本颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *buyCol;

/** 开关开启颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *onCol;

/** 开关关闭颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *offCol;

/** 幸运星文本颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *luckCol;

@end

#pragma mark - PB3GetCrackThemeReq

/**
 * 获取主题配置  有配置使用配置，没有使用默认
 **/
@interface PB3GetCrackThemeReq : GPBMessage

@end

#pragma mark - PB3GetCrackThemeRes

typedef GPB_ENUM(PB3GetCrackThemeRes_FieldNumber) {
  PB3GetCrackThemeRes_FieldNumber_ThemesArray = 1,
};

@interface PB3GetCrackThemeRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CrackTheme*> *themesArray;
/** The number of items in @c themesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger themesArray_Count;

@end

#pragma mark - PB3NoticeShiftReq

typedef GPB_ENUM(PB3NoticeShiftReq_FieldNumber) {
  PB3NoticeShiftReq_FieldNumber_PlayerId = 1,
  PB3NoticeShiftReq_FieldNumber_Oper = 2,
};

@interface PB3NoticeShiftReq : GPBMessage

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite) PB3NoticeShiftReq_Operation oper;

@end

/**
 * Fetches the raw value of a @c PB3NoticeShiftReq's @c oper property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3NoticeShiftReq_Oper_RawValue(PB3NoticeShiftReq *message);
/**
 * Sets the raw value of an @c PB3NoticeShiftReq's @c oper property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3NoticeShiftReq_Oper_RawValue(PB3NoticeShiftReq *message, int32_t value);

#pragma mark - PB3NoticeShiftRes

typedef GPB_ENUM(PB3NoticeShiftRes_FieldNumber) {
  PB3NoticeShiftRes_FieldNumber_Status = 1,
};

@interface PB3NoticeShiftRes : GPBMessage

@property(nonatomic, readwrite) PB3NoticeShiftRes_Status status;

@end

/**
 * Fetches the raw value of a @c PB3NoticeShiftRes's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3NoticeShiftRes_Status_RawValue(PB3NoticeShiftRes *message);
/**
 * Sets the raw value of an @c PB3NoticeShiftRes's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3NoticeShiftRes_Status_RawValue(PB3NoticeShiftRes *message, int32_t value);

#pragma mark - PB3LuckyValueRes

typedef GPB_ENUM(PB3LuckyValueRes_FieldNumber) {
  PB3LuckyValueRes_FieldNumber_LuckyValueRatio = 1,
};

/**
 * 幸运值查询
 **/
@interface PB3LuckyValueRes : GPBMessage

/** 幸运星百分比 0 - 100 */
@property(nonatomic, readwrite) int32_t luckyValueRatio;

@end

#pragma mark - PB3LuckyValueReq

@interface PB3LuckyValueReq : GPBMessage

@end

#pragma mark - PB3LuckyValueNotice

typedef GPB_ENUM(PB3LuckyValueNotice_FieldNumber) {
  PB3LuckyValueNotice_FieldNumber_Ratio = 1,
  PB3LuckyValueNotice_FieldNumber_Msg = 2,
};

/**
 * 幸运值通知
 **/
@interface PB3LuckyValueNotice : GPBMessage

/** 幸运值每跨过一个阶段推送当前幸运值百分比 */
@property(nonatomic, readwrite) int32_t ratio;

/** 有就弹 幸运星点亮必有惊喜， 再来一次必有惊喜 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
