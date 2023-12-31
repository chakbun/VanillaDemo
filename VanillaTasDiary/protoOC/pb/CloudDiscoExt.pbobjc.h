// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/cloud_disco.ext.proto

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

@class PB3CloudDiscoBoothSeat;
@class PB3CloudDiscoDancerInfo;
@class PB3CloudDiscoDecorateInfo;
@class PB3CloudDiscoInfo;
@class PB3CloudDiscoRank;
@class PB3MaskInfo;
GPB_ENUM_FWD_DECLARE(PB3SexType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3CloudDiscoState

/** 云蹦迪状态枚举 */
typedef GPB_ENUM(PB3CloudDiscoState) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CloudDiscoState_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 正常 */
  PB3CloudDiscoState_CdsNormal = 0,

  /** 狂欢时刻 */
  PB3CloudDiscoState_CdsRock = 1,
};

GPBEnumDescriptor *PB3CloudDiscoState_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CloudDiscoState_IsValidValue(int32_t value);

#pragma mark - Enum PB3CloudDiscoSceneType

typedef GPB_ENUM(PB3CloudDiscoSceneType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CloudDiscoSceneType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3CloudDiscoSceneType_CdstNone = 0,

  /** 房间形态变化（背景+麦位抖动+观众席变化） */
  PB3CloudDiscoSceneType_CdstRoom = 1,

  /** 观众席变化 */
  PB3CloudDiscoSceneType_CdstDancer = 2,
};

GPBEnumDescriptor *PB3CloudDiscoSceneType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CloudDiscoSceneType_IsValidValue(int32_t value);

#pragma mark - Enum PB3CloudDiscoBoothPushType

typedef GPB_ENUM(PB3CloudDiscoBoothPushType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CloudDiscoBoothPushType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位不用 */
  PB3CloudDiscoBoothPushType_CloudDiscoBoothPushNone = 0,

  /** 定时三分钟全部卡座刷新 */
  PB3CloudDiscoBoothPushType_CloudDiscoBoothPushTiming = 1,

  /** 卡座上下座位更新推送 */
  PB3CloudDiscoBoothPushType_CloudDiscoBoothPushUpDown = 2,
};

GPBEnumDescriptor *PB3CloudDiscoBoothPushType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CloudDiscoBoothPushType_IsValidValue(int32_t value);

#pragma mark - Enum PB3CloudDiscoInRoomStatus

typedef GPB_ENUM(PB3CloudDiscoInRoomStatus) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3CloudDiscoInRoomStatus_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位，不用 */
  PB3CloudDiscoInRoomStatus_InRoomStatusNone = 0,

  /** 在座位上 */
  PB3CloudDiscoInRoomStatus_InRoomStatusIn = 1,

  /** 下座位 */
  PB3CloudDiscoInRoomStatus_InRoomStatusLeave = 2,
};

GPBEnumDescriptor *PB3CloudDiscoInRoomStatus_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3CloudDiscoInRoomStatus_IsValidValue(int32_t value);

#pragma mark - PB3CloudDiscoExtRoot

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
@interface PB3CloudDiscoExtRoot : GPBRootObject
@end

#pragma mark - PB3CloudDiscoInfo

typedef GPB_ENUM(PB3CloudDiscoInfo_FieldNumber) {
  PB3CloudDiscoInfo_FieldNumber_State = 1,
  PB3CloudDiscoInfo_FieldNumber_RockVal = 2,
  PB3CloudDiscoInfo_FieldNumber_RockEndTime = 3,
  PB3CloudDiscoInfo_FieldNumber_Timestamp = 4,
  PB3CloudDiscoInfo_FieldNumber_RoomId = 5,
  PB3CloudDiscoInfo_FieldNumber_RockStartTime = 6,
  PB3CloudDiscoInfo_FieldNumber_DecorateInfo = 7,
};

/**
 * CmdId=800153, 云蹦迪信息
 **/
@interface PB3CloudDiscoInfo : GPBMessage

/** 当前状态 */
@property(nonatomic, readwrite) PB3CloudDiscoState state;

/** 狂欢时刻进度值 */
@property(nonatomic, readwrite) int64_t rockVal;

/** 狂欢时刻结束时间(unix时间戳：秒) */
@property(nonatomic, readwrite) int64_t rockEndTime;

/** 服务器当前时间（unix时间戳：纳秒） */
@property(nonatomic, readwrite) int64_t timestamp;

/** 房间id */
@property(nonatomic, readwrite) int64_t roomId;

/** 狂欢时刻开始时间(unix时间戳：秒) */
@property(nonatomic, readwrite) int64_t rockStartTime;

/** 当前房间背景信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CloudDiscoDecorateInfo *decorateInfo;
/** Test to see if @c decorateInfo has been set. */
@property(nonatomic, readwrite) BOOL hasDecorateInfo;

@end

/**
 * Fetches the raw value of a @c PB3CloudDiscoInfo's @c state property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CloudDiscoInfo_State_RawValue(PB3CloudDiscoInfo *message);
/**
 * Sets the raw value of an @c PB3CloudDiscoInfo's @c state property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CloudDiscoInfo_State_RawValue(PB3CloudDiscoInfo *message, int32_t value);

#pragma mark - PB3PushCloudDiscoEnterRoom

typedef GPB_ENUM(PB3PushCloudDiscoEnterRoom_FieldNumber) {
  PB3PushCloudDiscoEnterRoom_FieldNumber_Info = 1,
  PB3PushCloudDiscoEnterRoom_FieldNumber_DancerNum = 2,
  PB3PushCloudDiscoEnterRoom_FieldNumber_IsRoomShake = 3,
  PB3PushCloudDiscoEnterRoom_FieldNumber_IsChairShake = 4,
};

/**
 * CmdId=800155, 云蹦迪进房推送
 **/
@interface PB3PushCloudDiscoEnterRoom : GPBMessage

/** 云蹦迪信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CloudDiscoInfo *info;
/** Test to see if @c info has been set. */
@property(nonatomic, readwrite) BOOL hasInfo;

/** 观众席人数上限 */
@property(nonatomic, readwrite) int64_t dancerNum;

/** 是否房间震动 */
@property(nonatomic, readwrite) BOOL isRoomShake;

/** 是否麦位震动 */
@property(nonatomic, readwrite) BOOL isChairShake;

@end

#pragma mark - PB3CloudDiscoDecorateInfo

typedef GPB_ENUM(PB3CloudDiscoDecorateInfo_FieldNumber) {
  PB3CloudDiscoDecorateInfo_FieldNumber_DecorateId = 1,
  PB3CloudDiscoDecorateInfo_FieldNumber_EndTime = 2,
};

/**
 * 房间背景信息
 **/
@interface PB3CloudDiscoDecorateInfo : GPBMessage

/** 房间背景id */
@property(nonatomic, readwrite) int64_t decorateId;

/** 结束时间 */
@property(nonatomic, readwrite) int64_t endTime;

@end

#pragma mark - PB3CloudDiscoDancerInfo

typedef GPB_ENUM(PB3CloudDiscoDancerInfo_FieldNumber) {
  PB3CloudDiscoDancerInfo_FieldNumber_EndTime = 1,
};

/**
 * 房间观众席信息
 **/
@interface PB3CloudDiscoDancerInfo : GPBMessage

/** 送礼者效果结束时间 */
@property(nonatomic, readwrite) int64_t endTime;

@end

#pragma mark - PB3PushCloudDiscoSceneInfo

typedef GPB_ENUM(PB3PushCloudDiscoSceneInfo_FieldNumber) {
  PB3PushCloudDiscoSceneInfo_FieldNumber_Timestamp = 1,
  PB3PushCloudDiscoSceneInfo_FieldNumber_SceneType = 2,
  PB3PushCloudDiscoSceneInfo_FieldNumber_DecorateInfo = 3,
  PB3PushCloudDiscoSceneInfo_FieldNumber_DancerInfo = 4,
  PB3PushCloudDiscoSceneInfo_FieldNumber_GiftFromPid = 5,
  PB3PushCloudDiscoSceneInfo_FieldNumber_GiftToPid = 6,
  PB3PushCloudDiscoSceneInfo_FieldNumber_GiftId = 7,
};

/**
 * CmdId=800154 推送云蹦迪场景信息
 **/
@interface PB3PushCloudDiscoSceneInfo : GPBMessage

/** 服务器当前时间（unix时间戳：纳秒） */
@property(nonatomic, readwrite) int64_t timestamp;

/** 场景变化类型 */
@property(nonatomic, readwrite) PB3CloudDiscoSceneType sceneType;

/** 房间背景信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CloudDiscoDecorateInfo *decorateInfo;
/** Test to see if @c decorateInfo has been set. */
@property(nonatomic, readwrite) BOOL hasDecorateInfo;

/** 观众席场景信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3CloudDiscoDancerInfo *dancerInfo;
/** Test to see if @c dancerInfo has been set. */
@property(nonatomic, readwrite) BOOL hasDancerInfo;

/** 送礼用户id */
@property(nonatomic, readwrite) int64_t giftFromPid;

/** 收礼用户id */
@property(nonatomic, readwrite) int64_t giftToPid;

/** 礼物id */
@property(nonatomic, readwrite) int64_t giftId;

@end

/**
 * Fetches the raw value of a @c PB3PushCloudDiscoSceneInfo's @c sceneType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3PushCloudDiscoSceneInfo_SceneType_RawValue(PB3PushCloudDiscoSceneInfo *message);
/**
 * Sets the raw value of an @c PB3PushCloudDiscoSceneInfo's @c sceneType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3PushCloudDiscoSceneInfo_SceneType_RawValue(PB3PushCloudDiscoSceneInfo *message, int32_t value);

#pragma mark - PB3PushCloudDiscoDancerCfg

typedef GPB_ENUM(PB3PushCloudDiscoDancerCfg_FieldNumber) {
  PB3PushCloudDiscoDancerCfg_FieldNumber_Num = 1,
};

/**
 * CmdId=800156 推送云蹦迪观众席配置
 **/
@interface PB3PushCloudDiscoDancerCfg : GPBMessage

/** 观众席人数上限 */
@property(nonatomic, readwrite) int64_t num;

@end

#pragma mark - PB3PushCloudDiscoRockBroadcast

typedef GPB_ENUM(PB3PushCloudDiscoRockBroadcast_FieldNumber) {
  PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomId = 1,
  PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomName = 2,
  PB3PushCloudDiscoRockBroadcast_FieldNumber_RoomIcon = 3,
  PB3PushCloudDiscoRockBroadcast_FieldNumber_Msg = 4,
};

/**
 * CmdId=800157 推送云蹦迪狂欢时刻广播通知
 **/
@interface PB3PushCloudDiscoRockBroadcast : GPBMessage

/** 房间id */
@property(nonatomic, readwrite) int64_t roomId;

/** 房间名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomName;

/** 房间头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *roomIcon;

/** 广播消息 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3CloudDiscoRankListReq

@interface PB3CloudDiscoRankListReq : GPBMessage

@end

#pragma mark - PB3CloudDiscoRankListRes

typedef GPB_ENUM(PB3CloudDiscoRankListRes_FieldNumber) {
  PB3CloudDiscoRankListRes_FieldNumber_ListArray = 1,
  PB3CloudDiscoRankListRes_FieldNumber_My = 2,
  PB3CloudDiscoRankListRes_FieldNumber_MyRank = 3,
  PB3CloudDiscoRankListRes_FieldNumber_NextTime = 4,
  PB3CloudDiscoRankListRes_FieldNumber_Threshold = 5,
};

/**
 * 直接返回前100名
 **/
@interface PB3CloudDiscoRankListRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CloudDiscoRank*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) PB3CloudDiscoRank *my;
/** Test to see if @c my has been set. */
@property(nonatomic, readwrite) BOOL hasMy;

/** 0 = 99+ */
@property(nonatomic, readwrite) int32_t myRank;

/** 下次结算时间戳 （秒） */
@property(nonatomic, readwrite) int64_t nextTime;

/** 卡座门槛 */
@property(nonatomic, readwrite) int64_t threshold;

@end

#pragma mark - PB3CloudDiscoRank

typedef GPB_ENUM(PB3CloudDiscoRank_FieldNumber) {
  PB3CloudDiscoRank_FieldNumber_Id_p = 1,
  PB3CloudDiscoRank_FieldNumber_Name = 2,
  PB3CloudDiscoRank_FieldNumber_Sex = 3,
  PB3CloudDiscoRank_FieldNumber_WealthLevel = 4,
  PB3CloudDiscoRank_FieldNumber_Icon = 5,
  PB3CloudDiscoRank_FieldNumber_Score = 6,
  PB3CloudDiscoRank_FieldNumber_GapScore = 7,
  PB3CloudDiscoRank_FieldNumber_MaskInfo = 8,
};

@interface PB3CloudDiscoRank : GPBMessage

@property(nonatomic, readwrite) int64_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite) enum PB3SexType sex;

@property(nonatomic, readwrite) int32_t wealthLevel;

/** 头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 当前分数 */
@property(nonatomic, readwrite) int64_t score;

/** 距离前一名的分数 */
@property(nonatomic, readwrite) int64_t gapScore;

/** 马甲信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
/** Test to see if @c maskInfo has been set. */
@property(nonatomic, readwrite) BOOL hasMaskInfo;

@end

/**
 * Fetches the raw value of a @c PB3CloudDiscoRank's @c sex property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CloudDiscoRank_Sex_RawValue(PB3CloudDiscoRank *message);
/**
 * Sets the raw value of an @c PB3CloudDiscoRank's @c sex property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CloudDiscoRank_Sex_RawValue(PB3CloudDiscoRank *message, int32_t value);

#pragma mark - PB3CloudDiscoBooth

typedef GPB_ENUM(PB3CloudDiscoBooth_FieldNumber) {
  PB3CloudDiscoBooth_FieldNumber_ListArray = 1,
  PB3CloudDiscoBooth_FieldNumber_Timestamp = 2,
  PB3CloudDiscoBooth_FieldNumber_Type = 3,
};

@interface PB3CloudDiscoBooth : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CloudDiscoBoothSeat*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

/** 服务器当前时间（unix时间戳：秒） */
@property(nonatomic, readwrite) int64_t timestamp;

@property(nonatomic, readwrite) PB3CloudDiscoBoothPushType type;

@end

/**
 * Fetches the raw value of a @c PB3CloudDiscoBooth's @c type property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CloudDiscoBooth_Type_RawValue(PB3CloudDiscoBooth *message);
/**
 * Sets the raw value of an @c PB3CloudDiscoBooth's @c type property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CloudDiscoBooth_Type_RawValue(PB3CloudDiscoBooth *message, int32_t value);

#pragma mark - PB3CloudDiscoBoothSeat

typedef GPB_ENUM(PB3CloudDiscoBoothSeat_FieldNumber) {
  PB3CloudDiscoBoothSeat_FieldNumber_Id_p = 1,
  PB3CloudDiscoBoothSeat_FieldNumber_Icon = 2,
  PB3CloudDiscoBoothSeat_FieldNumber_Name = 3,
  PB3CloudDiscoBoothSeat_FieldNumber_Status = 4,
  PB3CloudDiscoBoothSeat_FieldNumber_Rank = 5,
  PB3CloudDiscoBoothSeat_FieldNumber_MaskInfo = 6,
  PB3CloudDiscoBoothSeat_FieldNumber_PickUpListArray = 7,
};

@interface PB3CloudDiscoBoothSeat : GPBMessage

@property(nonatomic, readwrite) int64_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite) PB3CloudDiscoInRoomStatus status;

/** 卡座排名 1-4 */
@property(nonatomic, readwrite) int32_t rank;

@property(nonatomic, readwrite, strong, null_resettable) PB3MaskInfo *maskInfo;
/** Test to see if @c maskInfo has been set. */
@property(nonatomic, readwrite) BOOL hasMaskInfo;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3CloudDiscoBoothSeat*> *pickUpListArray;
/** The number of items in @c pickUpListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger pickUpListArray_Count;

@end

/**
 * Fetches the raw value of a @c PB3CloudDiscoBoothSeat's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3CloudDiscoBoothSeat_Status_RawValue(PB3CloudDiscoBoothSeat *message);
/**
 * Sets the raw value of an @c PB3CloudDiscoBoothSeat's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3CloudDiscoBoothSeat_Status_RawValue(PB3CloudDiscoBoothSeat *message, int32_t value);

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
