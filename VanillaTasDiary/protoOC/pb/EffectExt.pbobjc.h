// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/effect.ext.proto

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

@class PB3EffectHonour;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3EffectCmdId

/** 700 */
typedef GPB_ENUM(PB3EffectCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3EffectCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3EffectCmdId_EffectNone1 = 0,

  /** 有新的保护期特效，assets.ext.proto -> Effect ，id、protect_second、protect_start_at有值 */
  PB3EffectCmdId_EffectCmdAddProtect = 700101,

  /** 保护期特效过期，assets.ext.proto -> Effect ，只有 id 有值 */
  PB3EffectCmdId_EffectCmdDelProtect = 700102,
};

GPBEnumDescriptor *PB3EffectCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3EffectCmdId_IsValidValue(int32_t value);

#pragma mark - PB3EffectExtRoot

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
@interface PB3EffectExtRoot : GPBRootObject
@end

#pragma mark - PB3EffectHonourHeavenReq

typedef GPB_ENUM(PB3EffectHonourHeavenReq_FieldNumber) {
  PB3EffectHonourHeavenReq_FieldNumber_Page = 1,
  PB3EffectHonourHeavenReq_FieldNumber_PageSize = 2,
};

@interface PB3EffectHonourHeavenReq : GPBMessage

/** 页码 */
@property(nonatomic, readwrite) int32_t page;

/** 每页数量 */
@property(nonatomic, readwrite) int32_t pageSize;

@end

#pragma mark - PB3EffectHonourHeavenRes

typedef GPB_ENUM(PB3EffectHonourHeavenRes_FieldNumber) {
  PB3EffectHonourHeavenRes_FieldNumber_EffectHonourArray = 1,
  PB3EffectHonourHeavenRes_FieldNumber_Total = 2,
};

@interface PB3EffectHonourHeavenRes : GPBMessage

/** 荣耀殿堂信息 如果请求为空，表示到底，没数据了 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3EffectHonour*> *effectHonourArray;
/** The number of items in @c effectHonourArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger effectHonourArray_Count;

/** 总数 */
@property(nonatomic, readwrite) int64_t total;

@end

#pragma mark - PB3EffectHonourDecReq

typedef GPB_ENUM(PB3EffectHonourDecReq_FieldNumber) {
  PB3EffectHonourDecReq_FieldNumber_EffectId = 1,
  PB3EffectHonourDecReq_FieldNumber_EffectDecOwn = 2,
  PB3EffectHonourDecReq_FieldNumber_IsAllow = 3,
};

/**
 * 用户自定义荣耀宣言
 **/
@interface PB3EffectHonourDecReq : GPBMessage

/** 特效ID */
@property(nonatomic, readwrite) int32_t effectId;

/** 用户自定义荣耀宣言 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *effectDecOwn;

/** 获取到审核状态为-1（未通过）时，请求该接口修改审核状态，该字段传入值规定为-1 */
@property(nonatomic, readwrite) int32_t isAllow;

@end

#pragma mark - PB3EffectHonourDecRes

@interface PB3EffectHonourDecRes : GPBMessage

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
