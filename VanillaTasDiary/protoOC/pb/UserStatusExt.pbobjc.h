// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: pb/user_status.ext.proto

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

@class PB3UserConInfo;
GPB_ENUM_FWD_DECLARE(PB3DeviceType);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Enum PB3UserStatusErr

typedef GPB_ENUM(PB3UserStatusErr) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3UserStatusErr_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  /** 成功 */
  PB3UserStatusErr_UserStatusSuccess = 0,

  /** key失效, 请重新登录 */
  PB3UserStatusErr_ErrUserStatusKeyExpired = 37001,

  /** 被封号 */
  PB3UserStatusErr_ErrUserStatusBanAccount = 37002,

  /** 封ip */
  PB3UserStatusErr_ErrUserStatusBanIp = 37003,

  /** 需要重新登录 */
  PB3UserStatusErr_ErrUserStatusRelogin = 37004,

  /** 被踢下线 */
  PB3UserStatusErr_ErrUserStatusTakeLeave = 37005,

  /** 封设备 */
  PB3UserStatusErr_ErrUserStatusBanDevice = 37006,

  /** 封手机 */
  PB3UserStatusErr_ErrUserStatusBanPhone = 37009,

  /** 封身份证 */
  PB3UserStatusErr_ErrUserStatusBanIdCard = 37010,
};

GPBEnumDescriptor *PB3UserStatusErr_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3UserStatusErr_IsValidValue(int32_t value);

#pragma mark - Enum PB3UserStatusCmdId

/** 用户广播cmdId定义 501 */
typedef GPB_ENUM(PB3UserStatusCmdId) {
  /**
   * Value used if any message's field encounters a value that is not defined
   * by this enum. The message will also have C functions to get/set the rawValue
   * of the field.
   **/
  PB3UserStatusCmdId_GPBUnrecognizedEnumeratorValue = kGPBUnrecognizedEnumeratorValue,
  PB3UserStatusCmdId_UcUserStatusZero = 0,

  /** 广播重登陆 */
  PB3UserStatusCmdId_UcUserStatusRelogin = 501001,

  /** 广播踢下线 */
  PB3UserStatusCmdId_UcUserStatusTakeLeave = 501002,

  /** 本账号设备离线, BroadcastDeviceDisconnected */
  PB3UserStatusCmdId_UcUserStatusDeviceDisconnected = 501003,
};

GPBEnumDescriptor *PB3UserStatusCmdId_EnumDescriptor(void);

/**
 * Checks to see if the given value is defined by the enum or was not known at
 * the time this source was generated.
 **/
BOOL PB3UserStatusCmdId_IsValidValue(int32_t value);

#pragma mark - PB3UserStatusExtRoot

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
@interface PB3UserStatusExtRoot : GPBRootObject
@end

#pragma mark - PB3LoginReq

typedef GPB_ENUM(PB3LoginReq_FieldNumber) {
  PB3LoginReq_FieldNumber_Key = 1,
  PB3LoginReq_FieldNumber_DeviceType = 2,
  PB3LoginReq_FieldNumber_DeviceId = 3,
  PB3LoginReq_FieldNumber_PushToken = 4,
  PB3LoginReq_FieldNumber_ReyunDeviceId = 5,
  PB3LoginReq_FieldNumber_UMengDeviceId = 6,
};

/**
 * 登录
 **/
@interface PB3LoginReq : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *key;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

/** 推送token */
@property(nonatomic, readwrite, copy, null_resettable) NSString *pushToken;

/** 热云deviceId */
@property(nonatomic, readwrite, copy, null_resettable) NSString *reyunDeviceId;

/** 友盟deviceId */
@property(nonatomic, readwrite, copy, null_resettable) NSString *uMengDeviceId;

@end

/**
 * Fetches the raw value of a @c PB3LoginReq's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3LoginReq_DeviceType_RawValue(PB3LoginReq *message);
/**
 * Sets the raw value of an @c PB3LoginReq's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3LoginReq_DeviceType_RawValue(PB3LoginReq *message, int32_t value);

#pragma mark - PB3LoginRes

typedef GPB_ENUM(PB3LoginRes_FieldNumber) {
  PB3LoginRes_FieldNumber_AccountId = 1,
};

@interface PB3LoginRes : GPBMessage

@property(nonatomic, readwrite) int64_t accountId;

@end

#pragma mark - PB3BroadcastRelogin

typedef GPB_ENUM(PB3BroadcastRelogin_FieldNumber) {
  PB3BroadcastRelogin_FieldNumber_DeviceId = 1,
  PB3BroadcastRelogin_FieldNumber_DeviceType = 2,
  PB3BroadcastRelogin_FieldNumber_MultiClient = 3,
};

/**
 * 通知设备上线
 **/
@interface PB3BroadcastRelogin : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite) BOOL multiClient;

@end

/**
 * Fetches the raw value of a @c PB3BroadcastRelogin's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3BroadcastRelogin_DeviceType_RawValue(PB3BroadcastRelogin *message);
/**
 * Sets the raw value of an @c PB3BroadcastRelogin's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3BroadcastRelogin_DeviceType_RawValue(PB3BroadcastRelogin *message, int32_t value);

#pragma mark - PB3BroadcastTakeLeave

typedef GPB_ENUM(PB3BroadcastTakeLeave_FieldNumber) {
  PB3BroadcastTakeLeave_FieldNumber_AccountId = 1,
  PB3BroadcastTakeLeave_FieldNumber_Msg = 2,
};

/**
 * 广播踢下线 cmdid = 501002
 **/
@interface PB3BroadcastTakeLeave : GPBMessage

@property(nonatomic, readwrite) int64_t accountId;

/** 踢下线提示 */
@property(nonatomic, readwrite, copy, null_resettable) NSString *msg;

@end

#pragma mark - PB3BroadcastDeviceDisconnected

typedef GPB_ENUM(PB3BroadcastDeviceDisconnected_FieldNumber) {
  PB3BroadcastDeviceDisconnected_FieldNumber_DeviceId = 1,
  PB3BroadcastDeviceDisconnected_FieldNumber_DeviceType = 2,
};

/**
 * 通知设备下线
 **/
@interface PB3BroadcastDeviceDisconnected : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@end

/**
 * Fetches the raw value of a @c PB3BroadcastDeviceDisconnected's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3BroadcastDeviceDisconnected_DeviceType_RawValue(PB3BroadcastDeviceDisconnected *message);
/**
 * Sets the raw value of an @c PB3BroadcastDeviceDisconnected's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3BroadcastDeviceDisconnected_DeviceType_RawValue(PB3BroadcastDeviceDisconnected *message, int32_t value);

#pragma mark - PB3LogoutReq

typedef GPB_ENUM(PB3LogoutReq_FieldNumber) {
  PB3LogoutReq_FieldNumber_Key = 1,
};

@interface PB3LogoutReq : GPBMessage

/** sessionKey */
@property(nonatomic, readwrite, copy, null_resettable) NSString *key;

@end

#pragma mark - PB3LogoutRes

@interface PB3LogoutRes : GPBMessage

@end

#pragma mark - PB3DisconnectReq

typedef GPB_ENUM(PB3DisconnectReq_FieldNumber) {
  PB3DisconnectReq_FieldNumber_ConnId = 1,
  PB3DisconnectReq_FieldNumber_UserId = 2,
  PB3DisconnectReq_FieldNumber_DeviceType = 3,
  PB3DisconnectReq_FieldNumber_DeviceId = 4,
  PB3DisconnectReq_FieldNumber_Timeout = 5,
};

/**
 * 下线
 **/
@interface PB3DisconnectReq : GPBMessage

@property(nonatomic, readwrite) int64_t connId;

@property(nonatomic, readwrite) int64_t userId;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

@property(nonatomic, readwrite) BOOL timeout;

@end

/**
 * Fetches the raw value of a @c PB3DisconnectReq's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3DisconnectReq_DeviceType_RawValue(PB3DisconnectReq *message);
/**
 * Sets the raw value of an @c PB3DisconnectReq's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3DisconnectReq_DeviceType_RawValue(PB3DisconnectReq *message, int32_t value);

#pragma mark - PB3DisconnectRes

@interface PB3DisconnectRes : GPBMessage

@end

#pragma mark - PB3HeartbeatReq

typedef GPB_ENUM(PB3HeartbeatReq_FieldNumber) {
  PB3HeartbeatReq_FieldNumber_ConnId = 1,
  PB3HeartbeatReq_FieldNumber_UserId = 2,
  PB3HeartbeatReq_FieldNumber_RoomId = 3,
  PB3HeartbeatReq_FieldNumber_DeviceType = 4,
  PB3HeartbeatReq_FieldNumber_Ip = 5,
};

/**
 * 心跳
 **/
@interface PB3HeartbeatReq : GPBMessage

@property(nonatomic, readwrite) int64_t connId;

@property(nonatomic, readwrite) int64_t userId;

@property(nonatomic, readwrite) int64_t roomId;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy, null_resettable) NSString *ip;

@end

/**
 * Fetches the raw value of a @c PB3HeartbeatReq's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3HeartbeatReq_DeviceType_RawValue(PB3HeartbeatReq *message);
/**
 * Sets the raw value of an @c PB3HeartbeatReq's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3HeartbeatReq_DeviceType_RawValue(PB3HeartbeatReq *message, int32_t value);

#pragma mark - PB3HeartbeatRes

typedef GPB_ENUM(PB3HeartbeatRes_FieldNumber) {
  PB3HeartbeatRes_FieldNumber_TimeAt = 2,
};

@interface PB3HeartbeatRes : GPBMessage

/** 返回 unix time */
@property(nonatomic, readwrite) uint32_t timeAt;

@end

#pragma mark - PB3UserConInfoListReq

@interface PB3UserConInfoListReq : GPBMessage

@end

#pragma mark - PB3UserConInfoListRes

typedef GPB_ENUM(PB3UserConInfoListRes_FieldNumber) {
  PB3UserConInfoListRes_FieldNumber_ListArray = 1,
};

@interface PB3UserConInfoListRes : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<PB3UserConInfo*> *listArray;
/** The number of items in @c listArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger listArray_Count;

@end

#pragma mark - PB3UserConInfo

typedef GPB_ENUM(PB3UserConInfo_FieldNumber) {
  PB3UserConInfo_FieldNumber_Id_p = 1,
  PB3UserConInfo_FieldNumber_Ip = 2,
  PB3UserConInfo_FieldNumber_DeviceType = 3,
  PB3UserConInfo_FieldNumber_DeviceId = 4,
  PB3UserConInfo_FieldNumber_DieTime = 5,
  PB3UserConInfo_FieldNumber_PlayerId = 6,
  PB3UserConInfo_FieldNumber_CreateTime = 7,
};

@interface PB3UserConInfo : GPBMessage

/** 连接ID */
@property(nonatomic, readwrite) int64_t id_p;

@property(nonatomic, readwrite, copy, null_resettable) NSString *ip;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

@property(nonatomic, readwrite) int64_t dieTime;

@property(nonatomic, readwrite) int64_t playerId;

@property(nonatomic, readwrite) int64_t createTime;

@end

/**
 * Fetches the raw value of a @c PB3UserConInfo's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3UserConInfo_DeviceType_RawValue(PB3UserConInfo *message);
/**
 * Sets the raw value of an @c PB3UserConInfo's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3UserConInfo_DeviceType_RawValue(PB3UserConInfo *message, int32_t value);

#pragma mark - PB3UserDeviceDisconnectedReq

typedef GPB_ENUM(PB3UserDeviceDisconnectedReq_FieldNumber) {
  PB3UserDeviceDisconnectedReq_FieldNumber_DeviceId = 1,
  PB3UserDeviceDisconnectedReq_FieldNumber_DeviceType = 2,
};

@interface PB3UserDeviceDisconnectedReq : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *deviceId;

@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@end

/**
 * Fetches the raw value of a @c PB3UserDeviceDisconnectedReq's @c deviceType property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t PB3UserDeviceDisconnectedReq_DeviceType_RawValue(PB3UserDeviceDisconnectedReq *message);
/**
 * Sets the raw value of an @c PB3UserDeviceDisconnectedReq's @c deviceType property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void SetPB3UserDeviceDisconnectedReq_DeviceType_RawValue(PB3UserDeviceDisconnectedReq *message, int32_t value);

#pragma mark - PB3UserDeviceDisconnectedRes

@interface PB3UserDeviceDisconnectedRes : GPBMessage

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
