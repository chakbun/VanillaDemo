// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: plugin_pb/video.ext.proto

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

@class PB3ExtraInfo;
@class PB3PAuthInfo;
@class PB3TrendTag;
@class PB3VideoButton;
@class PB3VideoContentTop;
@class PB3VideoInfo;
GPB_ENUM_FWD_DECLARE(PB3PluginSexType);
GPB_ENUM_FWD_DECLARE(PB3VideoRecmdSource);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3VideoCmdId

/** 广播cmdId定义 // 304 */
typedef GPB_ENUM(PB3VideoCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoCmdId_IcVideoZero = 0,
};

GPBEnumDescriptor *PB3VideoCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoCmdId_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoGetType

/** 获取类型 */
typedef GPB_ENUM(PB3VideoGetType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoGetType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoGetType_VgtZero = 0,

  /** 进app后首次拉取 */
  PB3VideoGetType_VgtFirst = 1,
};

GPBEnumDescriptor *PB3VideoGetType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoGetType_IsValidValue(int32_t value);

#pragma mark - Enum PB3EIButtonType

typedef GPB_ENUM(PB3EIButtonType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3EIButtonType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3EIButtonType_EibtZero = 0,

  /** 互动按钮 */
  PB3EIButtonType_EibtSkill = 1,

  /** 聊一聊按钮 */
  PB3EIButtonType_EibtChat = 2,

  /** 撩TA */
  PB3EIButtonType_EibtLiaoTa = 3,

  /** 真心话 */
  PB3EIButtonType_EibtZhenxinhua = 4,

  /**  CP约会 */
  PB3EIButtonType_EibtCpYuehui = 5,
};

GPBEnumDescriptor *PB3EIButtonType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3EIButtonType_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoPlayerStatus

typedef GPB_ENUM(PB3VideoPlayerStatus) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoPlayerStatus_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoPlayerStatus_VpsZero = 0,

  /** 不在房 */
  PB3VideoPlayerStatus_VpsOutRoom = 1,

  /** 在房 */
  PB3VideoPlayerStatus_VpsInRoom = 2,

  /** 在麦上 */
  PB3VideoPlayerStatus_VpsOnChair = 3,

  /** 在唱歌 */
  PB3VideoPlayerStatus_VpsSinging = 4,
};

GPBEnumDescriptor *PB3VideoPlayerStatus_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoPlayerStatus_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoCTopType

typedef GPB_ENUM(PB3VideoCTopType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoCTopType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoCTopType_VctZero = 0,

  /** 活动 */
  PB3VideoCTopType_VctActivity = 1,

  /** 同城 */
  PB3VideoCTopType_VctSameCity = 2,

  /** 你关注的人 */
  PB3VideoCTopType_VctFallow = 3,
};

GPBEnumDescriptor *PB3VideoCTopType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoCTopType_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoRecReason

/** 视频推荐原因 */
typedef GPB_ENUM(PB3VideoRecReason) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoRecReason_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoRecReason_VrrZero = 0,

  /** 附近的人 */
  PB3VideoRecReason_VrrNearby = 1,

  /** 关注的人 */
  PB3VideoRecReason_VrrFocus = 2,

  /** 精选 */
  PB3VideoRecReason_VrrGood = 4,

  /** 运营位置 置顶 */
  PB3VideoRecReason_VrrTop = 3,

  /** 标签内容库 */
  PB3VideoRecReason_VrrLabel = 5,
};

GPBEnumDescriptor *PB3VideoRecReason_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoRecReason_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoButtonType

typedef GPB_ENUM(PB3VideoButtonType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoButtonType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoButtonType_VbtZero = 0,

  /** 互动 */
  PB3VideoButtonType_VbtInteraction = 1,

  /** 技能点单 */
  PB3VideoButtonType_VbtBill = 2,

  /** 私聊 */
  PB3VideoButtonType_VbtIm = 3,
};

GPBEnumDescriptor *PB3VideoButtonType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoButtonType_IsValidValue(int32_t value);

#pragma mark - Enum PB3VideoOptType

typedef GPB_ENUM(PB3VideoOptType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3VideoOptType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3VideoOptType_VotZero = 0,

  /** 开始 */
  PB3VideoOptType_VotStart = 1,

  /** 播完了某个视频 */
  PB3VideoOptType_VotComplete = 2,

  /** 停止 */
  PB3VideoOptType_VotStop = 3,

  /** 不感兴趣 */
  PB3VideoOptType_VotUninterested = 4,

  /** 加载完封面 */
  PB3VideoOptType_VotCover = 5,
};

GPBEnumDescriptor *PB3VideoOptType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3VideoOptType_IsValidValue(int32_t value);

#pragma mark - PB3VideoExtRoot

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
@interface PB3VideoExtRoot : GPBRootObject
@end

#pragma mark - PB3VideoReq

typedef GPB_ENUM(PB3VideoReq_FieldNumber) {
  PB3VideoReq_FieldNumber_GetType = 1,
  PB3VideoReq_FieldNumber_LastTrendId = 2,
  PB3VideoReq_FieldNumber_LastIdsArray = 3,
  PB3VideoReq_FieldNumber_LastIndex = 4,
};

@interface PB3VideoReq : GPBMessage

/** 拉取类型 */
@property(nonatomic, readwrite) PB3VideoGetType getType;

/** 最后一条视频动态ID */
@property(nonatomic, readwrite) int64_t lastTrendId;

/** 最后20条视频id列表 */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *lastIdsArray;
/** The number of items in @c lastIdsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger lastIdsArray_Count;

/** 倒数条数请求（5，2，1） */
@property(nonatomic, readwrite) int32_t lastIndex;

@end

/**
 * Fetches the raw value of a @c PB3VideoReq's @c getType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoReq_GetType_RawValue(PB3VideoReq *message);
/**
 * Sets the raw value of an @c PB3VideoReq's @c getType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoReq_GetType_RawValue(PB3VideoReq *message, int32_t value);

#pragma mark - PB3VideoRes

typedef GPB_ENUM(PB3VideoRes_FieldNumber) {
  PB3VideoRes_FieldNumber_InfosArray = 1,
  PB3VideoRes_FieldNumber_PreloadIdxArray = 2,
};

@interface PB3VideoRes : GPBMessage

/** 视频信息 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3VideoInfo*> *infosArray;
/** The number of items in @c infosArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger infosArray_Count;

/** 预加载位置（倒数） */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *preloadIdxArray;
/** The number of items in @c preloadIdxArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger preloadIdxArray_Count;

@end

#pragma mark - PB3VideoInfo

typedef GPB_ENUM(PB3VideoInfo_FieldNumber) {
  PB3VideoInfo_FieldNumber_TrendId = 1,
  PB3VideoInfo_FieldNumber_PlayerId = 2,
  PB3VideoInfo_FieldNumber_Name = 3,
  PB3VideoInfo_FieldNumber_Sex = 4,
  PB3VideoInfo_FieldNumber_Icon = 5,
  PB3VideoInfo_FieldNumber_VideoURL = 6,
  PB3VideoInfo_FieldNumber_LikeNum = 7,
  PB3VideoInfo_FieldNumber_CommentNum = 8,
  PB3VideoInfo_FieldNumber_Content = 9,
  PB3VideoInfo_FieldNumber_TagsArray = 10,
  PB3VideoInfo_FieldNumber_IsGaveLike = 11,
  PB3VideoInfo_FieldNumber_CoverURL = 12,
  PB3VideoInfo_FieldNumber_VideoWidth = 13,
  PB3VideoInfo_FieldNumber_VideoHeight = 14,
  PB3VideoInfo_FieldNumber_SkillId = 15,
  PB3VideoInfo_FieldNumber_IaId = 16,
  PB3VideoInfo_FieldNumber_ActivityId = 17,
  PB3VideoInfo_FieldNumber_SourceId = 18,
  PB3VideoInfo_FieldNumber_From = 19,
  PB3VideoInfo_FieldNumber_Quality = 20,
  PB3VideoInfo_FieldNumber_LabelId = 21,
  PB3VideoInfo_FieldNumber_RecmdSource = 22,
  PB3VideoInfo_FieldNumber_RecmdSourceId = 23,
  PB3VideoInfo_FieldNumber_TraceInfo = 24,
  PB3VideoInfo_FieldNumber_AuthInfoListArray = 25,
};

@interface PB3VideoInfo : GPBMessage

/** 视频ID */
@property(nonatomic, readwrite) int64_t trendId;

/** 玩家ID */
@property(nonatomic, readwrite) int64_t playerId;

/** 玩家昵称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

@property(nonatomic, readwrite) enum PB3PluginSexType sex;

/** 玩家头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 视频url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *videoURL;

/** 点赞数 */
@property(nonatomic, readwrite) int64_t likeNum;

/** 评论数 */
@property(nonatomic, readwrite) int64_t commentNum;

/** 动态内容 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *content;

/** 标签 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TrendTag*> *tagsArray;
/** The number of items in @c tagsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger tagsArray_Count;

/** 是否点过赞 */
@property(nonatomic, readwrite) BOOL isGaveLike;

/** 视频第一帧url */
@property(nonatomic, readwrite, copy, null_resettable) NSString *coverURL;

/** 视频宽 */
@property(nonatomic, readwrite) int32_t videoWidth;

/** 视频高 */
@property(nonatomic, readwrite) int32_t videoHeight;

/** 技能id */
@property(nonatomic, readwrite) int32_t skillId;

/** 互动id */
@property(nonatomic, readwrite) int32_t iaId;

/** 该条视频的活动id，没有则0 */
@property(nonatomic, readwrite) int32_t activityId;

/** 客户端在对这条视频做操作（VideoOptReq）的时候，返回该id */
@property(nonatomic, readwrite) int64_t sourceId;

/** 来源 */
@property(nonatomic, readwrite) int32_t from;

/** 品质 */
@property(nonatomic, readwrite) int32_t quality;

/** 标签ID */
@property(nonatomic, readwrite) int32_t labelId;

/** 视频推荐来源 */
@property(nonatomic, readwrite) enum PB3VideoRecmdSource recmdSource;

/** 算法ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *recmdSourceId;

/** 阿里云推荐详情 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *traceInfo;

/** 认证信息 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3PAuthInfo*> *authInfoListArray;
/** The number of items in @c authInfoListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger authInfoListArray_Count;

@end

/**
 * Fetches the raw value of a @c PB3VideoInfo's @c sex property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoInfo_Sex_RawValue(PB3VideoInfo *message);
/**
 * Sets the raw value of an @c PB3VideoInfo's @c sex property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoInfo_Sex_RawValue(PB3VideoInfo *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3VideoInfo's @c recmdSource property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoInfo_RecmdSource_RawValue(PB3VideoInfo *message);
/**
 * Sets the raw value of an @c PB3VideoInfo's @c recmdSource property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoInfo_RecmdSource_RawValue(PB3VideoInfo *message, int32_t value);

#pragma mark - PB3VideoPlayerReq

typedef GPB_ENUM(PB3VideoPlayerReq_FieldNumber) {
  PB3VideoPlayerReq_FieldNumber_TrendId = 1,
  PB3VideoPlayerReq_FieldNumber_From = 2,
  PB3VideoPlayerReq_FieldNumber_Quality = 3,
  PB3VideoPlayerReq_FieldNumber_LabelId = 4,
};

/**
 * 视频玩家信息
 **/
@interface PB3VideoPlayerReq : GPBMessage

/** 视频ID */
@property(nonatomic, readwrite) int64_t trendId;

/** 来源 */
@property(nonatomic, readwrite) int32_t from;

/** 品质 */
@property(nonatomic, readwrite) int32_t quality;

/** 标签ID */
@property(nonatomic, readwrite) int32_t labelId;

@end

#pragma mark - PB3VideoPlayerRes

typedef GPB_ENUM(PB3VideoPlayerRes_FieldNumber) {
  PB3VideoPlayerRes_FieldNumber_ContentTop = 1,
  PB3VideoPlayerRes_FieldNumber_Button = 2,
  PB3VideoPlayerRes_FieldNumber_Status = 3,
  PB3VideoPlayerRes_FieldNumber_RoomId = 4,
  PB3VideoPlayerRes_FieldNumber_RecReason = 5,
  PB3VideoPlayerRes_FieldNumber_ExtraInfoBtn = 6,
};

@interface PB3VideoPlayerRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) PB3VideoContentTop *contentTop;
/** Test to see if @c contentTop has been set. */
@property(nonatomic, readwrite) BOOL hasContentTop;

/** 底部按钮 */
@property(nonatomic, readwrite, strong, null_resettable) PB3VideoButton *button;
/** Test to see if @c button has been set. */
@property(nonatomic, readwrite) BOOL hasButton;

@property(nonatomic, readwrite) PB3VideoPlayerStatus status;

/** 玩家所在房间id */
@property(nonatomic, readwrite) int64_t roomId;

/** 推荐原因 */
@property(nonatomic, readwrite) PB3VideoRecReason recReason;

/** 新按钮 */
@property(nonatomic, readwrite, strong, null_resettable) PB3ExtraInfo *extraInfoBtn;
/** Test to see if @c extraInfoBtn has been set. */
@property(nonatomic, readwrite) BOOL hasExtraInfoBtn;

@end

/**
 * Fetches the raw value of a @c PB3VideoPlayerRes's @c status property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoPlayerRes_Status_RawValue(PB3VideoPlayerRes *message);
/**
 * Sets the raw value of an @c PB3VideoPlayerRes's @c status property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoPlayerRes_Status_RawValue(PB3VideoPlayerRes *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3VideoPlayerRes's @c recReason property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoPlayerRes_RecReason_RawValue(PB3VideoPlayerRes *message);
/**
 * Sets the raw value of an @c PB3VideoPlayerRes's @c recReason property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoPlayerRes_RecReason_RawValue(PB3VideoPlayerRes *message, int32_t value);

#pragma mark - PB3ExtraInfo

typedef GPB_ENUM(PB3ExtraInfo_FieldNumber) {
  PB3ExtraInfo_FieldNumber_ButtonType = 1,
  PB3ExtraInfo_FieldNumber_ButtonIcon = 2,
  PB3ExtraInfo_FieldNumber_ButtonContent = 3,
  PB3ExtraInfo_FieldNumber_Icon = 4,
  PB3ExtraInfo_FieldNumber_Content = 5,
  PB3ExtraInfo_FieldNumber_OrderNum = 6,
  PB3ExtraInfo_FieldNumber_SkillInfo = 7,
  PB3ExtraInfo_FieldNumber_ExpireTime = 8,
  PB3ExtraInfo_FieldNumber_JumpURL = 9,
  PB3ExtraInfo_FieldNumber_Price = 10,
};

@interface PB3ExtraInfo : GPBMessage

/** 按钮类型 */
@property(nonatomic, readwrite) PB3EIButtonType buttonType;

/** 按钮图标 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *buttonIcon;

/** 按钮内容 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *buttonContent;

/** 图标 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 内容 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *content;

/** 接单数量 */
@property(nonatomic, readwrite) int32_t orderNum;

/** 技能介绍 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *skillInfo;

/** 显示倒计时 */
@property(nonatomic, readwrite) int64_t expireTime;

/** 跳转路由 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *jumpURL;

/** 价格 */
@property(nonatomic, readwrite) int32_t price;

@end

/**
 * Fetches the raw value of a @c PB3ExtraInfo's @c buttonType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3ExtraInfo_ButtonType_RawValue(PB3ExtraInfo *message);
/**
 * Sets the raw value of an @c PB3ExtraInfo's @c buttonType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3ExtraInfo_ButtonType_RawValue(PB3ExtraInfo *message, int32_t value);

#pragma mark - PB3VideoContentTop

typedef GPB_ENUM(PB3VideoContentTop_FieldNumber) {
  PB3VideoContentTop_FieldNumber_CtType = 1,
  PB3VideoContentTop_FieldNumber_Icon = 2,
  PB3VideoContentTop_FieldNumber_Text = 3,
  PB3VideoContentTop_FieldNumber_JumpURL = 4,
};

@interface PB3VideoContentTop : GPBMessage

/** l类型 */
@property(nonatomic, readwrite) PB3VideoCTopType ctType;

/** icon，可能没有 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 文字，可能为空 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *text;

/** 跳转路由，可能为空 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *jumpURL;

@end

/**
 * Fetches the raw value of a @c PB3VideoContentTop's @c ctType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoContentTop_CtType_RawValue(PB3VideoContentTop *message);
/**
 * Sets the raw value of an @c PB3VideoContentTop's @c ctType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoContentTop_CtType_RawValue(PB3VideoContentTop *message, int32_t value);

#pragma mark - PB3VideoButton

typedef GPB_ENUM(PB3VideoButton_FieldNumber) {
  PB3VideoButton_FieldNumber_Icon = 1,
  PB3VideoButton_FieldNumber_Text = 2,
  PB3VideoButton_FieldNumber_JumpURL = 3,
  PB3VideoButton_FieldNumber_CtType = 4,
  PB3VideoButton_FieldNumber_TypeId = 5,
};

/**
 * 视频底部按钮
 **/
@interface PB3VideoButton : GPBMessage

/** 活动图标 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

/** 文字 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *text;

/** 跳转路由 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *jumpURL;

/** 类型 */
@property(nonatomic, readwrite) PB3VideoButtonType ctType;

/** 互动/技能id */
@property(nonatomic, readwrite) int64_t typeId;

@end

/**
 * Fetches the raw value of a @c PB3VideoButton's @c ctType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoButton_CtType_RawValue(PB3VideoButton *message);
/**
 * Sets the raw value of an @c PB3VideoButton's @c ctType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoButton_CtType_RawValue(PB3VideoButton *message, int32_t value);

#pragma mark - PB3VideoLikeReq

typedef GPB_ENUM(PB3VideoLikeReq_FieldNumber) {
  PB3VideoLikeReq_FieldNumber_Page = 1,
};

/**
 * 我喜欢的视频
 **/
@interface PB3VideoLikeReq : GPBMessage

/** 从1开始 */
@property(nonatomic, readwrite) int32_t page;

@end

#pragma mark - PB3VideoLikeRes

typedef GPB_ENUM(PB3VideoLikeRes_FieldNumber) {
  PB3VideoLikeRes_FieldNumber_NextPage = 1,
  PB3VideoLikeRes_FieldNumber_InfosArray = 2,
};

@interface PB3VideoLikeRes : GPBMessage

/** 下一页页码，如果没有下一页，则为-1 */
@property(nonatomic, readwrite) int32_t nextPage;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3VideoInfo*> *infosArray;
/** The number of items in @c infosArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger infosArray_Count;

@end

#pragma mark - PB3VideoOptReq

typedef GPB_ENUM(PB3VideoOptReq_FieldNumber) {
  PB3VideoOptReq_FieldNumber_OptType = 1,
  PB3VideoOptReq_FieldNumber_TrendId = 2,
  PB3VideoOptReq_FieldNumber_Second = 3,
  PB3VideoOptReq_FieldNumber_LeftNum = 4,
  PB3VideoOptReq_FieldNumber_SourceId = 5,
  PB3VideoOptReq_FieldNumber_RecmdSource = 6,
  PB3VideoOptReq_FieldNumber_RecmdSourceId = 7,
  PB3VideoOptReq_FieldNumber_TraceInfo = 8,
  PB3VideoOptReq_FieldNumber_FirstPlay = 9,
};

/**
 * 用户播放、结束播放视频
 **/
@interface PB3VideoOptReq : GPBMessage

@property(nonatomic, readwrite) PB3VideoOptType optType;

@property(nonatomic, readwrite) int64_t trendId;

/** 视频剩余秒数 */
@property(nonatomic, readwrite) int64_t second;

/** 客户端本地还剩下多少个视频没有划过 */
@property(nonatomic, readwrite) int32_t leftNum;

/** VideoInfo 里的 source_id */
@property(nonatomic, readwrite) int64_t sourceId;

/** 视频推荐来源 */
@property(nonatomic, readwrite) enum PB3VideoRecmdSource recmdSource;

/** 算法ID */
@property(nonatomic, readwrite, copy, null_resettable) NSString *recmdSourceId;

/** 阿里云推荐详情 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *traceInfo;

/** 首次完播 */
@property(nonatomic, readwrite) BOOL firstPlay;

@end

/**
 * Fetches the raw value of a @c PB3VideoOptReq's @c optType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoOptReq_OptType_RawValue(PB3VideoOptReq *message);
/**
 * Sets the raw value of an @c PB3VideoOptReq's @c optType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoOptReq_OptType_RawValue(PB3VideoOptReq *message, int32_t value);

/**
 * Fetches the raw value of a @c PB3VideoOptReq's @c recmdSource property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoOptReq_RecmdSource_RawValue(PB3VideoOptReq *message);
/**
 * Sets the raw value of an @c PB3VideoOptReq's @c recmdSource property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoOptReq_RecmdSource_RawValue(PB3VideoOptReq *message, int32_t value);

#pragma mark - PB3VideoOptRes

@interface PB3VideoOptRes : GPBMessage

@end

#pragma mark - PB3VideoButtonReportReq

typedef GPB_ENUM(PB3VideoButtonReportReq_FieldNumber) {
  PB3VideoButtonReportReq_FieldNumber_Btn = 1,
  PB3VideoButtonReportReq_FieldNumber_TrendId = 2,
};

@interface PB3VideoButtonReportReq : GPBMessage

/** 按钮类型 */
@property(nonatomic, readwrite) PB3EIButtonType btn;

/** 视频ID */
@property(nonatomic, readwrite) int64_t trendId;

@end

/**
 * Fetches the raw value of a @c PB3VideoButtonReportReq's @c btn property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3VideoButtonReportReq_Btn_RawValue(PB3VideoButtonReportReq *message);
/**
 * Sets the raw value of an @c PB3VideoButtonReportReq's @c btn property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3VideoButtonReportReq_Btn_RawValue(PB3VideoButtonReportReq *message, int32_t value);

#pragma mark - PB3VideoButtonReportRes

@interface PB3VideoButtonReportRes : GPBMessage

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
