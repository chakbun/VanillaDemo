//
//  ILoginProtocol.h
//  huhuAudio
//
//  Created by flyhuang on 2018/12/24.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginTypes.h"
#import "ConfigCenterComponentTypes.h"
#import "DYAccount.h"
#import "UserStatusExt.pbobjc.h"
#import "UauthExt.pbobjc.h"
#import "CommonExt.pbobjc.h"
#import "IndexExt.pbobjc.h"
#import "UserChooseAccountModel.h"
#import <ZygoteNetwork/IZYGNetworkService.h>

N_Dec(kCheckActivityOnNotification);
N_Dec(kCheckActivityOnNotification_switchModel);
N_Dec(kVeryCodeNotification);
N_Dec(kBindPhoneNotification);
N_Dec(kSendSMSCodeNotification);
N_Dec(kRegisterNotification);
N_Dec(kReSetPasswordNotification);
N_Dec(kGetUserSigNotification);
N_Dec(kGetUserSigNotification_UserSigRes);
N_Dec(kLoginResultNotification);
N_Dec(kLongLinkSuccessNotification);
N_Dec(kLongLinkNotification_PROTOLoginRes);
N_Dec(kLoginRegisterServiceDidLoginNotification);
N_Dec(kNotificationDidLogin);
N_Dec(kNotificationQuickChatSwitchStatusChanged);
N_Dec(kNotificationQuickChatSwitchStatusUpdated);
N_Dec(kNotificationDidShortLogin);
N_Dec(kNotificationLogout);
N_Dec(kWillLogoutNotification); 
N_Dec(kUpdateSpecailNotification);
N_Dec(kGetUserIdsNotification);
N_Dec(kGetKeySuccessNotification);
N_Dec(kPlayerChooseAccountNotification);//切换账号成功
N_Dec(kPlayerChooseAccountHaveRemind);//切换账号红点是否已经提示过
N_Dec(kPlayerFlagsNotification);// 用户Flag发送变化
N_Dec(kHomeAlertNotification);// 弹出普通样式弹窗
N_Dec(kNotificationUserPrivacyKeyChanged);

N_Dec(kNewUserDidChooseGender);             //新注册用户选择了性别
N_Dec(kNotificationUserMultiLoginStatusChange); //多端登录状态改变
N_Dec(kNotificationUserDeviceOffline); //设备离线

typedef NS_ENUM(NSInteger, LoginServiceErrorCode) {
    LoginServiceErrorCodeIsResigning = -10001,
};

typedef void (^UserChooseAccountBlock)(UserChooseAccountModel *accountModel);

FOUNDATION_EXPORT NSString * const LoginServiceErrorDomain;

@protocol ILoginService<IZYGService>

@property (nonatomic, assign) BOOL isNew;

@property (nonatomic, assign) LoginState loginState;  //登录状态

@property (nonatomic, strong, readonly) PB3UserConInfo *multiLoginInfo;  //多端登录PC的数据

@property (nonatomic, assign, readonly) int64_t shortConnectLoginTime;

@property (nonatomic, assign, readonly) int64_t shortConnectLoginId;

#ifdef INTELNAL_VERSION
@property (nonatomic, assign, readonly) LoginType loginType;
#endif

- (NSArray *)logPushArray;
//当前用户登录的loginkey
- (NSString *)loginKey;

- (NSString *)token;//获取临时token时用
//最后的登录方式
- (LoginType)latestLoginType;

- (BOOL)isLastLoginByUserId;

- (void)clearLastLoginByUserId;
//当前登录者是新用户
- (int64_t)currentNewUserId;
//新用户的注册时间
- (int64_t)newUserRegisterTimestamp;

//开始监听
- (void)begionObserver;

//拉取设置(有部分设置需要在登录前拉取)
- (void)refreshOnoffListBeforeLogin;
- (void)refreshOnoffList;

//进入登录页面
- (void)enterLogin;
//进入登录页面，并弹出toast提示
- (void)enterLoginWithTipsMsg:(NSString *)tipsMsg;

/**
 * 登录
 */
- (void)login:(NSString *)loginKey;

//当登录的是游客是，检查是否需要重新登录
- (void)relogin;

//登录超时检测
- (BOOL)loginTimerOutCheck;

//微信授权
- (void)weChatAuth;

//微信登录
- (void)WechatLoginByCode:(NSString *)code;

/**
 * FaceBook登录
 */
- (void)getFaceBookToken:(NSString *)token;

/**
 * 账号登录
 */
- (void)getAccountToken:(NSString *)name;

/**
 * ID登录
 */
- (void)loginById:(int64_t)playId withPassword:(NSString *)password;

//旧代码
- (void)loginWithUserId:(int64_t)userId
               password:(NSString *)password
           successBlock:(void (^)(void))successBlock
              failBlock:(void (^)(NSString *errorMsg))failBlock;

// QQ登录
- (void)qqLogin;

- (void)loginWithApple;

//一键登录
- (void)loginWithPhoneOnlyToken:(NSString *)token;

//短信验证码
- (void)smsCodeWithPhone:(NSString *)phone
        countryPhoneCode:(NSString *)countryPhoneCode
                 smsType:(kLoginSmsType)smsType
            successBlock:(void (^)(void))successBlock
               failBlock:(void (^)(NSString *errorMsg, NSInteger errorCode))failBlock;

//手机+短信验证码登录
- (void)loginWithPhone:(NSString *)phone
      countryPhoneCode:(NSString *)countryPhoneCode
               smsCode:(NSString *)smsCode
          successBlock:(void (^)(void))successBlock
             failBlock:(void (^)(NSString *errorMsg))failBlock;

//重置密码校验验证码
- (void)resetPasswordWithPhone:(NSString *)phone
              countryPhoneCode:(NSString *)countryPhoneCode
                       smsCode:(NSString *)smsCode
                  successBlock:(void (^)(NSString *smsToken))successBlock
                     failBlock:(void (^)(NSString *errorMsg))failBlock;
//重置密码
- (void)resetPasswordWithPhone:(NSString *)phone
              countryPhoneCode:(NSString *)countryPhoneCode
                      smsToken:(NSString *)smsToken
                      password:(NSString *)password
                  successBlock:(void (^)(void))successBlock
                     failBlock:(void (^)(NSString *errorMsg))failBlock DY_DEPRECATED_MSG_ATTRIBUTE("Use '- (void)resetPasswordForAccount:(NSInteger)account withPhone:(NSString *)phone countryPhoneCode:(NSString *)countryPhoneCode smsToken:(NSString *)smsToken password:(NSString *)password successBlock:(void (^)(void))successBlock failBlock:(void (^)(NSString *errorMsg))failBlock;' instead. ");

//重置密码
- (void)resetPasswordForAccount:(NSInteger)account withPhone:(NSString *)phone countryPhoneCode:(NSString *)countryPhoneCode smsToken:(NSString *)smsToken password:(NSString *)password successBlock:(void (^)(void))successBlock failBlock:(void (^)(NSString *errorMsg))failBlock;

//手机号+密码登录
- (void)loginWithPhone:(NSString *)phone
      countryPhoneCode:(NSString *)countryPhoneCode
              password:(NSString *)password
          successBlock:(void (^)(void))successBlock
             failBlock:(void (^)(NSString *errorMsg))failBlock;

//设置密码,注册页面设置密码isNew = YES
- (void)changePasswordWithOldPasswd:(NSString *)oldPasswd
                         newPasswd1:(NSString *)newPasswd1
                         newPasswd2:(NSString *)newPasswd2
                       isNewSetting:(BOOL)isNew
                       successBlock:(void (^)(void))successBlock
                          failBlock:(void (^)(NSString *errorMsg))failBlock;


///// 安全验证，向指定手机号发送验证码
///// @param successBlock 成功
///// @param failedBlock 失败
//- (void)safetyVerificationSendCodeWithUserId:(NSInteger)userId successBlock:(void (^)(PB3AnomalyLoginSendCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock;
//
///// 安全验证
///// @param verifiyCode 验证码
///// @param successBlock 成功
///// @param failedBlock 失败
//- (void)safetyVerificationWithUserId:(NSInteger)userId verifyCode:(NSString *)verifiyCode successBlock:(void (^)(PB3AnomalyLoginConfirmCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock;

/// 账号临时保护，向指定手机号发送验证码
/// @param successBlock 成功
/// @param failedBlock 失败
- (void)tmpProtectVerificationSendCodeWithUserId:(NSInteger)userId successBlock:(void (^)(PROTORemoteLoginSendCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock;

/// 账号临时保护，验证验证码
/// @param verifiyCode 验证码
/// @param successBlock 成功
/// @param failedBlock 失败
- (void)tmpProtectVerificationConfirmWithUserId:(NSInteger)userId verifyCode:(NSString *)verifiyCode successBlock:(void (^)(PROTORemoteLoginConfirmCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock;

//检查手机号是否已经注册
- (void)checkExistUserWithPhone:(NSString *)phone
               countryPhoneCode:(NSString *)countryPhoneCode
                   successBlock:(void (^)(BOOL isExist))successBlock
                      failBlock:(void (^)(NSString *errorMsg))failBlock;
//获取账号列表
- (void)getBindPhoneIdsSuccessBlock:(UserChooseAccountBlock)successBlock
                          failBlock:(void (^)(NSString *errorMsg))failBlock;

//获取账号列表(无需登录)
- (void)noneAuthGetBindPhoneIdsWithSMSToken:(NSString *)smsToken successBlock:(UserChooseAccountBlock)successBlock failBlock:(void (^)(NSString *errorMsg))failBlock;

/// 获取新的token进行登录
/// @param userId 用户ID
/// @param isFromLogin 是否从登录页
/// @param successBlock 成功回调
/// @param failBlock 失败回调
- (void)loginNewTokenWithUserId:(int64_t)userId
                    isFromLogin:(BOOL)isFromLogin
                   successBlock:(void (^)(void))successBlock
                      failBlock:(void (^)(NSString *errorMsg))failBlock;
/**
 * 退出
 */
- (void)logout;

/**
 * 指定退出类型退出
 */
//- (void)logoutWithType:(PB3LogoutType)type;

- (void)checkExistUserWithName:(NSString *)name successBlock:(void (^)(BOOL))successBlock failBlock:(void (^)(NSString *))failBlock;

- (void)loginWithNickName:(NSString *)nickname successBlock:(void (^)(BOOL))successBlock failBlock:(void (^)(NSString *))failBlock;

//检查活动是否还在进行
- (void)checkActivityOn:(void(^)(id data))dataBlock;

- (void)setupLocalLoginAccount:(DYAccount *)account;

- (void)deleteLocalLoginAccount:(DYAccount *)account;

- (NSArray<DYAccount *> *)localLoginAccountList;

- (void)updateLocalLoginAccountForCurrentUserShowOffId;

//获取多端登录列表
- (void)fetchMultiLoginList:(void(^)(PB3UserConInfoListRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock;

//踢其它设备下线
- (void)kickDeviceOffComplete:(void(^)(PB3UserDeviceDisconnectedRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock;

// 获取账号绑定的手机验证码
- (void)getAccountPhoneSMSCodeComplete:(void(^)(NSString *errorMessage, NSInteger errorCode))completionBlock;

// 小号注册
- (void)requestAccountSubsidiaryLoginWithSMSCode:(NSString *)smsCode
                                         success:(void(^)(void))successBlock
                                            fail:(void(^)(NSString *errorMessage, NSInteger errorCode))failBlock;

#pragma mark -
- (NSAttributedString *)userRulesAttributedStringWithPrefix:(NSString *)prefix;

- (NSAttributedString *)carrierBindRulesAttributedStringWithTitle:(NSString *)title
                                                          linkUrl:(NSString *)url;

- (NSDictionary *)appUserRule;

- (NSDictionary *)carrierUserRule;

- (NSDictionary *)appPrivacyRule;

- (NSDictionary *)appChildrenRule;

- (NSDictionary *)thirdPartyInfo;

#pragma mark - alias
//no comment, u know it
- (BOOL)isAppOnAir;

#pragma mark - 加密
- (void)synEncryptWithString:(NSString *)string
               completeBlock:(void (^)(NSString *encodeStr, NSString *sign))completeBlock;

#pragma mark - Lanuch
- (void)loadLanuchConfigCompletion:(void(^)(PB3GetAppAdConfigRes *rsp, NSString *errorMessage, NSInteger errorCode))block;

- (void)loadPurchaseItemWithCompletion:(void(^)(NSString *errMsg))completion;

- (void)verifyIAPWithReceipe:(NSString *)receipt transationID:(NSString *)transationID productID:(NSString *)pID completion:(void(^)(NSString *errMsg))completion;

- (void)orderIAPWithProductID:(NSString *)productId completion:(void(^)(NSString *errMsg))completion;

- (void)appLaunchWithIP:(NSString *)ipaddr completion:(void(^)(NSString *errMsg))completion;

@end
