// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/teacher.ext.proto

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

@class PB3TeacherStudentEverListItem;
@class PB3TeacherStudentGenealogyItem;
@class PB3TeacherStudentLevCfg;
@class PB3TeacherStudentListItem;
@class PB3TeacherStudentUserItem;
GPB_ENUM_FWD_DECLARE(PB3SexType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3TeacherRelationshipType

/** 师徒关系枚举 */
typedef GPB_ENUM(PB3TeacherRelationshipType) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3TeacherRelationshipType_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 占位 */
  PB3TeacherRelationshipType_TrtNull = 0,

  /** 老师 */
  PB3TeacherRelationshipType_TrtTeacher = 1,

  /** 徒弟 */
  PB3TeacherRelationshipType_TrtStudent = 2,
};

GPBEnumDescriptor *PB3TeacherRelationshipType_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3TeacherRelationshipType_IsValidValue(int32_t value);

#pragma mark - PB3TeacherExtRoot

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
@interface PB3TeacherExtRoot : GPBRootObject
@end

#pragma mark - PB3TeacherStudentUserItem

typedef GPB_ENUM(PB3TeacherStudentUserItem_FieldNumber) {
  PB3TeacherStudentUserItem_FieldNumber_PlayerId = 1,
  PB3TeacherStudentUserItem_FieldNumber_PlayerSid = 2,
  PB3TeacherStudentUserItem_FieldNumber_Name = 3,
  PB3TeacherStudentUserItem_FieldNumber_Sex = 4,
  PB3TeacherStudentUserItem_FieldNumber_Icon = 5,
};

/**
 * 师徒信息数据
 **/
@interface PB3TeacherStudentUserItem : GPBMessage

/** 用户ID */
@property(nonatomic, readwrite) int64_t playerId;

/** 用户靓号ID */
@property(nonatomic, readwrite) int64_t playerSid;

/** 用户名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** 性别 */
@property(nonatomic, readwrite) enum PB3SexType sex;

/** 头像 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *icon;

@end

/**
 * Fetches the raw value of a @c PB3TeacherStudentUserItem's @c sex property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3TeacherStudentUserItem_Sex_RawValue(PB3TeacherStudentUserItem *message);
/**
 * Sets the raw value of an @c PB3TeacherStudentUserItem's @c sex property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3TeacherStudentUserItem_Sex_RawValue(PB3TeacherStudentUserItem *message, int32_t value);

#pragma mark - PB3GraduateListReq

typedef GPB_ENUM(PB3GraduateListReq_FieldNumber) {
  PB3GraduateListReq_FieldNumber_PlayerId = 1,
};

/**
 * 出师用户列表
 **/
@interface PB3GraduateListReq : GPBMessage

/** 用户出师列表 */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3GraduateListRes

typedef GPB_ENUM(PB3GraduateListRes_FieldNumber) {
  PB3GraduateListRes_FieldNumber_GraduateListArray = 1,
};

@interface PB3GraduateListRes : GPBMessage

/** 出师列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentUserItem*> *graduateListArray;
/** The number of items in @c graduateListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger graduateListArray_Count;

@end

#pragma mark - PB3TeacherSignReq

typedef GPB_ENUM(PB3TeacherSignReq_FieldNumber) {
  PB3TeacherSignReq_FieldNumber_RelationshipId = 1,
};

/**
 * 师徒签到
 **/
@interface PB3TeacherSignReq : GPBMessage

/** 关系Id */
@property(nonatomic, readwrite) int64_t relationshipId;

@end

#pragma mark - PB3TeacherSignRes

typedef GPB_ENUM(PB3TeacherSignRes_FieldNumber) {
  PB3TeacherSignRes_FieldNumber_RelationshipId = 1,
  PB3TeacherSignRes_FieldNumber_Exp = 2,
  PB3TeacherSignRes_FieldNumber_LevelId = 3,
  PB3TeacherSignRes_FieldNumber_SignIdsArray = 5,
  PB3TeacherSignRes_FieldNumber_SignExp = 6,
};

@interface PB3TeacherSignRes : GPBMessage

/** 关系Id */
@property(nonatomic, readwrite) int64_t relationshipId;

/** 新经验值 */
@property(nonatomic, readwrite) int64_t exp;

/** 当前等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 签到成员id列表 */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *signIdsArray;
/** The number of items in @c signIdsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger signIdsArray_Count;

/** 签到经验值 */
@property(nonatomic, readwrite) int64_t signExp;

@end

#pragma mark - PB3TeacherStudentListItem

typedef GPB_ENUM(PB3TeacherStudentListItem_FieldNumber) {
  PB3TeacherStudentListItem_FieldNumber_User = 1,
  PB3TeacherStudentListItem_FieldNumber_SignIdsArray = 2,
  PB3TeacherStudentListItem_FieldNumber_LevelId = 3,
  PB3TeacherStudentListItem_FieldNumber_Exp = 4,
  PB3TeacherStudentListItem_FieldNumber_SignExp = 5,
  PB3TeacherStudentListItem_FieldNumber_CreatedAt = 6,
  PB3TeacherStudentListItem_FieldNumber_RelationshipId = 7,
};

/**
 * 师徒关系条目数据
 **/
@interface PB3TeacherStudentListItem : GPBMessage

/** 用户信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *user;
/** Test to see if @c user has been set. */
@property(nonatomic, readwrite) BOOL hasUser;

/** 签到成员id列表 */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *signIdsArray;
/** The number of items in @c signIdsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger signIdsArray_Count;

/** 当前等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 当前经验值 */
@property(nonatomic, readwrite) int64_t exp;

/** 签到经验值 */
@property(nonatomic, readwrite) int64_t signExp;

/** 关系建立时间 */
@property(nonatomic, readwrite) int64_t createdAt;

/** 关系ID */
@property(nonatomic, readwrite) int64_t relationshipId;

@end

#pragma mark - PB3TeacherStudentListReq

typedef GPB_ENUM(PB3TeacherStudentListReq_FieldNumber) {
  PB3TeacherStudentListReq_FieldNumber_PlayerId = 1,
};

/**
 * 获取师徒列表
 **/
@interface PB3TeacherStudentListReq : GPBMessage

/** 用户徒弟列表 */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3TeacherStudentListRes

typedef GPB_ENUM(PB3TeacherStudentListRes_FieldNumber) {
  PB3TeacherStudentListRes_FieldNumber_IsHaveEver = 1,
  PB3TeacherStudentListRes_FieldNumber_TeachersArray = 2,
  PB3TeacherStudentListRes_FieldNumber_StudentsArray = 3,
};

/**
 * 师徒列表返回
 **/
@interface PB3TeacherStudentListRes : GPBMessage

/** 是否有曾经列表 */
@property(nonatomic, readwrite) BOOL isHaveEver;

/** 师父列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentListItem*> *teachersArray;
/** The number of items in @c teachersArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger teachersArray_Count;

/** 徒弟列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentListItem*> *studentsArray;
/** The number of items in @c studentsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger studentsArray_Count;

@end

#pragma mark - PB3TeacherStudentEverListItem

typedef GPB_ENUM(PB3TeacherStudentEverListItem_FieldNumber) {
  PB3TeacherStudentEverListItem_FieldNumber_User = 1,
  PB3TeacherStudentEverListItem_FieldNumber_EstablishedRelationTime = 2,
  PB3TeacherStudentEverListItem_FieldNumber_SplitRelationTime = 3,
  PB3TeacherStudentEverListItem_FieldNumber_EstablishedRelation = 4,
  PB3TeacherStudentEverListItem_FieldNumber_SplitRelation = 5,
  PB3TeacherStudentEverListItem_FieldNumber_TotalExp = 6,
  PB3TeacherStudentEverListItem_FieldNumber_RelationshipId = 7,
  PB3TeacherStudentEverListItem_FieldNumber_LevelId = 8,
  PB3TeacherStudentEverListItem_FieldNumber_Tid = 9,
  PB3TeacherStudentEverListItem_FieldNumber_Sid = 10,
};

/**
 * 曾经师徒关系条目数据
 **/
@interface PB3TeacherStudentEverListItem : GPBMessage

/** 用户信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *user;
/** Test to see if @c user has been set. */
@property(nonatomic, readwrite) BOOL hasUser;

/** 建立关系时间（时间戳，秒） */
@property(nonatomic, readwrite) int64_t establishedRelationTime;

/** 解除关系时间（时间戳，秒） */
@property(nonatomic, readwrite) int64_t splitRelationTime;

/** 建立关系 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *establishedRelation;

/** 解除关系理由 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *splitRelation;

/** 总经验值 */
@property(nonatomic, readwrite) int64_t totalExp;

/** 关系ID */
@property(nonatomic, readwrite) int64_t relationshipId;

/** 等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 师父ID */
@property(nonatomic, readwrite) int64_t tid;

/** 徒弟ID */
@property(nonatomic, readwrite) int64_t sid;

@end

#pragma mark - PB3TeacherStudentEverListReq

typedef GPB_ENUM(PB3TeacherStudentEverListReq_FieldNumber) {
  PB3TeacherStudentEverListReq_FieldNumber_Page = 1,
};

/**
 * 获取我曾经的师父和徒弟列表
 **/
@interface PB3TeacherStudentEverListReq : GPBMessage

/** 分页请求 */
@property(nonatomic, readwrite) int32_t page;

@end

#pragma mark - PB3TeacherStudentEverListRes

typedef GPB_ENUM(PB3TeacherStudentEverListRes_FieldNumber) {
  PB3TeacherStudentEverListRes_FieldNumber_ListArray = 1,
  PB3TeacherStudentEverListRes_FieldNumber_Total = 2,
};

/**
 * 我曾经的师父和徒弟列表返回
 **/
@interface PB3TeacherStudentEverListRes : GPBMessage

/** 曾经关系列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentEverListItem*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

/** 列表总条目 */
@property(nonatomic, readwrite) int32_t total;

@end

#pragma mark - PB3TeacherStudentLevCfg

typedef GPB_ENUM(PB3TeacherStudentLevCfg_FieldNumber) {
  PB3TeacherStudentLevCfg_FieldNumber_LevelId = 1,
  PB3TeacherStudentLevCfg_FieldNumber_Level = 2,
  PB3TeacherStudentLevCfg_FieldNumber_TeacherTitle = 3,
  PB3TeacherStudentLevCfg_FieldNumber_StudentTitle = 4,
  PB3TeacherStudentLevCfg_FieldNumber_UpgradeExp = 5,
  PB3TeacherStudentLevCfg_FieldNumber_OnChairBackImageURL = 6,
  PB3TeacherStudentLevCfg_FieldNumber_OnChairBackImageURLPc = 7,
  PB3TeacherStudentLevCfg_FieldNumber_OnChairContentColor = 8,
  PB3TeacherStudentLevCfg_FieldNumber_OnChairNameColor = 9,
  PB3TeacherStudentLevCfg_FieldNumber_AnimationSourceURL = 10,
  PB3TeacherStudentLevCfg_FieldNumber_AnimationSourceURLPc = 11,
  PB3TeacherStudentLevCfg_FieldNumber_EnterRoomEffect = 12,
  PB3TeacherStudentLevCfg_FieldNumber_EnterRoomEffectPc = 13,
  PB3TeacherStudentLevCfg_FieldNumber_EffectNameColor = 14,
  PB3TeacherStudentLevCfg_FieldNumber_EffectTextColor = 15,
  PB3TeacherStudentLevCfg_FieldNumber_EffectText = 16,
  PB3TeacherStudentLevCfg_FieldNumber_GiftId = 17,
};

/**
 * 师徒等级配置
 **/
@interface PB3TeacherStudentLevCfg : GPBMessage

/** 等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 等级 */
@property(nonatomic, readwrite) int32_t level;

/** 师父称号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *teacherTitle;

/** 徒弟称号 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *studentTitle;

/** 升级所需经验值 */
@property(nonatomic, readwrite) int64_t upgradeExp;

/** 上坑特效背景图片 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *onChairBackImageURL;

/** 上坑特效背景图片(pc) */
@property(nonatomic, readwrite, copy, null_resettable) NSString *onChairBackImageURLPc;

/** 上坑特效普通文案颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *onChairContentColor;

/** 上坑特效昵称颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *onChairNameColor;

/** 心跳动画资源 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *animationSourceURL;

/** 心跳动画资源(pc) */
@property(nonatomic, readwrite, copy, null_resettable) NSString *animationSourceURLPc;

/** 进房横幅特效app */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffect;

/** 进房横幅特效pc */
@property(nonatomic, readwrite, copy, null_resettable) NSString *enterRoomEffectPc;

/** 进房横幅特效名字颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *effectNameColor;

/** 进房横幅特效文字颜色 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *effectTextColor;

/** 进房横幅后面文字内容 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *effectText;

/** 礼物ID */
@property(nonatomic, readwrite) int32_t giftId;

@end

#pragma mark - PB3TeacherStudentLevCfgReq

/**
 * 获取师徒等级配置
 **/
@interface PB3TeacherStudentLevCfgReq : GPBMessage

@end

#pragma mark - PB3TeacherStudentLevCfgRes

typedef GPB_ENUM(PB3TeacherStudentLevCfgRes_FieldNumber) {
  PB3TeacherStudentLevCfgRes_FieldNumber_CfgListArray = 1,
};

@interface PB3TeacherStudentLevCfgRes : GPBMessage

/** 师徒等级配置列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentLevCfg*> *cfgListArray;
/** The number of items in @c cfgListArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger cfgListArray_Count;

@end

#pragma mark - PB3TeacherLevelUpPush

typedef GPB_ENUM(PB3TeacherLevelUpPush_FieldNumber) {
  PB3TeacherLevelUpPush_FieldNumber_TargetInfo = 1,
  PB3TeacherLevelUpPush_FieldNumber_IsTeacher = 2,
  PB3TeacherLevelUpPush_FieldNumber_Msg = 3,
};

/**
 * 师徒关系升级推送 friend.ext.proto, TeacherLevelUpPush_CMD_ID
 **/
@interface PB3TeacherLevelUpPush : GPBMessage

/** 对方信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *targetInfo;
/** Test to see if @c targetInfo has been set. */
@property(nonatomic, readwrite) BOOL hasTargetInfo;

/** 对方是否是师父 */
@property(nonatomic, readwrite) BOOL isTeacher;

/** 升级消息提示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3GraduateApprenticePush

typedef GPB_ENUM(PB3GraduateApprenticePush_FieldNumber) {
  PB3GraduateApprenticePush_FieldNumber_TargetInfo = 1,
  PB3GraduateApprenticePush_FieldNumber_Msg = 2,
};

/**
 * 师徒关系出师推送 friend.ext.proto, GraduateApprenticePush_CMD_ID
 **/
@interface PB3GraduateApprenticePush : GPBMessage

/** 对方信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *targetInfo;
/** Test to see if @c targetInfo has been set. */
@property(nonatomic, readwrite) BOOL hasTargetInfo;

/** 出师消息提示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3TeacherStudentDetailReq

typedef GPB_ENUM(PB3TeacherStudentDetailReq_FieldNumber) {
  PB3TeacherStudentDetailReq_FieldNumber_RelationshipId = 1,
};

/**
 * 获取师徒详情页信息
 **/
@interface PB3TeacherStudentDetailReq : GPBMessage

/** 关系ID */
@property(nonatomic, readwrite) int64_t relationshipId;

@end

#pragma mark - PB3TeacherStudentDetailRes

typedef GPB_ENUM(PB3TeacherStudentDetailRes_FieldNumber) {
  PB3TeacherStudentDetailRes_FieldNumber_TargetInfo = 1,
  PB3TeacherStudentDetailRes_FieldNumber_IsTeacher = 2,
  PB3TeacherStudentDetailRes_FieldNumber_Exp = 3,
  PB3TeacherStudentDetailRes_FieldNumber_LevelId = 4,
  PB3TeacherStudentDetailRes_FieldNumber_SignIdsArray = 5,
  PB3TeacherStudentDetailRes_FieldNumber_CreatedAt = 6,
  PB3TeacherStudentDetailRes_FieldNumber_SignExp = 7,
};

@interface PB3TeacherStudentDetailRes : GPBMessage

/** 对方信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *targetInfo;
/** Test to see if @c targetInfo has been set. */
@property(nonatomic, readwrite) BOOL hasTargetInfo;

/** 对方是否是师父 */
@property(nonatomic, readwrite) BOOL isTeacher;

/** 当前经验值 */
@property(nonatomic, readwrite) int64_t exp;

/** 当前等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 签到成员id列表 */
@property(nonatomic, readwrite, strong, null_resettable) GPBInt64Array *signIdsArray;
/** The number of items in @c signIdsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger signIdsArray_Count;

/** 关系建立时间 */
@property(nonatomic, readwrite) int64_t createdAt;

/** 签到经验值 */
@property(nonatomic, readwrite) int64_t signExp;

@end

#pragma mark - PB3TeacherStudentGenealogyItem

typedef GPB_ENUM(PB3TeacherStudentGenealogyItem_FieldNumber) {
  PB3TeacherStudentGenealogyItem_FieldNumber_User = 1,
  PB3TeacherStudentGenealogyItem_FieldNumber_LevelId = 2,
  PB3TeacherStudentGenealogyItem_FieldNumber_LevelName = 3,
  PB3TeacherStudentGenealogyItem_FieldNumber_Exp = 4,
  PB3TeacherStudentGenealogyItem_FieldNumber_CreatedAt = 5,
  PB3TeacherStudentGenealogyItem_FieldNumber_RelationshipId = 6,
};

@interface PB3TeacherStudentGenealogyItem : GPBMessage

/** 用户信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentUserItem *user;
/** Test to see if @c user has been set. */
@property(nonatomic, readwrite) BOOL hasUser;

/** 当前等级ID */
@property(nonatomic, readwrite) int32_t levelId;

/** 当前等级名称 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *levelName;

/** 当前经验值 */
@property(nonatomic, readwrite) int64_t exp;

/** 关系建立时间 */
@property(nonatomic, readwrite) int64_t createdAt;

/** 关系ID */
@property(nonatomic, readwrite) int64_t relationshipId;

@end

#pragma mark - PB3TeacherStudentGenealogyReq

typedef GPB_ENUM(PB3TeacherStudentGenealogyReq_FieldNumber) {
  PB3TeacherStudentGenealogyReq_FieldNumber_PlayerId = 1,
};

/**
 * 获取宗谱列表
 **/
@interface PB3TeacherStudentGenealogyReq : GPBMessage

/** 用户出师列表 */
@property(nonatomic, readwrite) int64_t playerId;

@end

#pragma mark - PB3TeacherStudentGenealogyRes

typedef GPB_ENUM(PB3TeacherStudentGenealogyRes_FieldNumber) {
  PB3TeacherStudentGenealogyRes_FieldNumber_TagetUser = 1,
  PB3TeacherStudentGenealogyRes_FieldNumber_TeachersArray = 2,
  PB3TeacherStudentGenealogyRes_FieldNumber_StudentsArray = 3,
};

@interface PB3TeacherStudentGenealogyRes : GPBMessage

/** 对方信息 */
@property(nonatomic, readwrite, strong, null_resettable) PB3TeacherStudentGenealogyItem *tagetUser;
/** Test to see if @c tagetUser has been set. */
@property(nonatomic, readwrite) BOOL hasTagetUser;

/** 师父列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentGenealogyItem*> *teachersArray;
/** The number of items in @c teachersArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger teachersArray_Count;

/** 徒弟列表 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3TeacherStudentGenealogyItem*> *studentsArray;
/** The number of items in @c studentsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger studentsArray_Count;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
