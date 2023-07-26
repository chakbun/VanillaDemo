// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/conf.ext.proto

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

@class PB3Service;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - PB3ConfExtRoot

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
@interface PB3ConfExtRoot : GPBRootObject
@end

#pragma mark - PB3Service

typedef GPB_ENUM(PB3Service_FieldNumber) {
  PB3Service_FieldNumber_Name = 1,
  PB3Service_FieldNumber_Data_p = 2,
  PB3Service_FieldNumber_Md5 = 3,
};

@interface PB3Service : GPBMessage

/** 传入对应的配置名（后台按需开放给前端），如商城--store */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** 这里是返回的数据 json格式 */
@property(nonatomic, readwrite, copy, null_resettable) NSData *data_p;

/** 这里是数据的md5，如果是重复拿数据，可传入md5进行对比，相同不会返回，不同才会返回数据 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *md5;

@end

#pragma mark - PB3ConfReq

typedef GPB_ENUM(PB3ConfReq_FieldNumber) {
  PB3ConfReq_FieldNumber_ServicesArray = 1,
};

/**
 * 请求 只传入name，可选传入md5
 **/
@interface PB3ConfReq : GPBMessage

/** 微服 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Service*> *servicesArray;
/** The number of items in @c servicesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger servicesArray_Count;

@end

#pragma mark - PB3ConfRes

typedef GPB_ENUM(PB3ConfRes_FieldNumber) {
  PB3ConfRes_FieldNumber_ServicesArray = 1,
};

@interface PB3ConfRes : GPBMessage

/** 数据 */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3Service*> *servicesArray;
/** The number of items in @c servicesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger servicesArray_Count;

@end

#pragma mark - PB3OSConfigReq

typedef GPB_ENUM(PB3OSConfigReq_FieldNumber) {
  PB3OSConfigReq_FieldNumber_OsType = 1,
  PB3OSConfigReq_FieldNumber_ReqVersion = 2,
};

@interface PB3OSConfigReq : GPBMessage

/** 操作系统 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *osType;

/** 请求的版本 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *reqVersion;

@end

#pragma mark - PB3OSConfigRes

typedef GPB_ENUM(PB3OSConfigRes_FieldNumber) {
  PB3OSConfigRes_FieldNumber_CruVersion = 1,
};

@interface PB3OSConfigRes : GPBMessage

/** 当前版本 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *cruVersion;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)