//
//  LoginManeger.m
//  19LIVE
//
//  Created by weicaiyu on 17/2/10.
//  Copyright © 2017年 XinYu. All rights reserved.
//

#import "LoginManager.h"
#import "AppDelegate.h"
#import <ZygoteFoundation/YuKeychainUUID.h>
//#import "LoginNavigationController.h"

#import <UMCommon/MobClick.h>

#import <ZygoteNetwork/IZYGConnectorService.h>
#import "UserStatusExt.pbobjc.h"
#import "UserExt.pbobjc.h"
#import <ZygoteFoundation/TimeUtils.h>
#import <ZygoteDeviceUtils/ZYGDeviceUtils.h>
#import "IAssetsExtraServiceProtocol.h"

#import "DYAppKeyManager.h"
#import "IPlayerProtocol.h"
#import "CrackEggExt.pbobjc.h"

#import <ZygoteFoundation/SettingsData.h>
#import "UserIdChooseModel.h"


//#import "IVoiceExtraProtocol.h"

#import "UauthExt.pbobjc.h"
#import "UauthCommon.pbobjc.h"
#import <ZygoteNetwork/ZYGNetworkTime.h>

#import <ZygoteCategories/NSString+YYAdd.h>
#import <ZygoteFoundation/JTXXTEA.h>


#import "DBManager.h"
#import "NetConfigModel.h"
#import <ZygoteFoundation/AppUtils.h>
//#import "DYRoomControllerManager.h"
//#import "IRoomProtocol.h"
#import "UserProtocol.h"
#import "DYAccountPromptTool.h"


#import "DYSafetyAuthorizationInterceptTool.h"
#import <ZygoteCategories/NSDate+Common.h>
#import <ZygoteCategories/NSDate+YYAdd.h>
#import <ZygoteFoundation/AppDeviceUtils.h>

#import "DYAlert.h"

static NSString * const kLoginManagerIsLastLoginWithUserId = @"kLoginManagerIsLastLoginWithUserId";
static NSString * const kLoginManagerAccountKey = @"kLoginManagerAccountKey";
static NSUInteger const kLoginManagerAccountMaxCount = 10;
static NSString * const kLoginManagerTokenCreateTime = @"kLoginManagerTokenCreateTime";

static NSString * const kLoginManagerTokenId = @"kLoginManagerTokenId";

static NSString * const kLoginManagerAliasOnAir = @"kLoginManagerAliasOnAir";

NSString * const LoginServiceErrorDomain = @"kLoginServiceErrorDomain";

@interface LoginManager ()
<
ZYGNetWorkServiceBroadCastDelegate
>
{
    NSString *_loginPassword;
    NSString *_countryPhoneCode;
    NSString *_phone;
    LoginType _loginType;
    NSString *_token;
    int64_t _currentNewUserId;         //如果当前用户是注册用户，记录一下id
    int64_t _newUserRegisterTimestamp; //如果当前用户是注册用户，记录一下注册时间
}

@property (nonatomic, strong) NSMutableArray *logArray;  //debug模式显示出来的log

@property (nonatomic, assign) int sdkNotInitRetry;

@property (nonatomic, assign) int sdkNetWaitTimeoutRetry;

//正在请求player信息
//@property (nonatomic, assign) BOOL isQueringPlayer;


@property (nonatomic, copy) NSString *deviceId;
@property (nonatomic, copy) NSString *umengDeviceId;
@property (nonatomic, copy) NSString *idfa;
@property (nonatomic, copy) NSString *idfv;
@property (nonatomic, assign) PB3DeviceType deviceType;

@property (nonatomic, strong, readwrite) PB3UserConInfo *multiLoginInfo;  //多端登录PC的数据

@property (nonatomic, assign) int64_t shortConnectLoginTime;

@property (nonatomic, assign) int64_t shortConnectLoginId;

@property (nonatomic, assign) BOOL isHadOpenAppFlag;

//@property (nonatomic, strong) PB3NoConfirm *noConfirmInfo;

@end

@implementation LoginManager

@synthesize isNew;

WF_DEF_SINGLETION(LoginManager)

- (id)init
{
    if (self = [super init]) {
        self.deviceId = [YuKeychainUUID getDeviceIDInKeychain];
        self.deviceType = PB3DeviceType_DtIosPhone;
        self.idfa = [[ZYGDeviceUtils sharedInstance] getIdfa];
        self.idfv = [[ZYGDeviceUtils sharedInstance] getIdfv];
        [self addNetworkObservers];
        [self setup];
    }
    return self;
}

//进入登录页面
- (void)enterLogin
{
    [self enterLoginWithTipsMsg:nil];
}

- (void)enterLoginWithTipsMsg:(NSString *)tipsMsg
{
    
}

//开始监听
- (void)begionObserver
{
    //网络权限检测
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
}

//网络监听
- (void)networkReachableHandle:(NSNotification *)notification
{
    BOOL isReachable = [notification.object boolValue];
    if (isReachable) {
    }
}

//长连接成功连上
- (void)longLinkConnected
{
    [[NetConfigModel shareInstance] triggerCDNSwith];
    
    NSString *key = [self loginKey];
    if (key) {
        [self longlinkLogin:key];
    }
    else {
        [self enterLogin];
    }
}
- (void)setupToken:(NSString *)token
{
    _token = token;
}
- (NSString *)token
{
    return _token;
}

- (NSString *)loginKey
{
    return [[DBManager getInstance] readString:kLoginServiceToken];
}

- (void)saveLoginKey:(NSString *)loginKey
{
    [[DBManager getInstance] saveString:kLoginServiceToken obj:loginKey];
    DYLogInfo(@"Login key cache refreshed: %@", loginKey);
}

- (void)handleLonglinkReconnect:(NSNotification *)notification
{
    [self longLinkConnected];
}

- (BOOL)isLastLoginByUserId
{
    NSNumber *lastLoginByUserId = (NSNumber *)[[DBManager getInstance] readString:kLoginManagerIsLastLoginWithUserId];
    if (lastLoginByUserId &&
        ([lastLoginByUserId isKindOfClass:NSNumber.class] || [lastLoginByUserId isKindOfClass:NSString.class])) {
        return [lastLoginByUserId boolValue];
    }
    return NO;
}

- (void)clearLastLoginByUserId
{
    [[DBManager getInstance] saveString:kLoginManagerIsLastLoginWithUserId obj:@"0"];
}

//当前登录者是新用户
- (int64_t)currentNewUserId
{
    return _currentNewUserId;
}

//新用户的注册时间
- (int64_t)newUserRegisterTimestamp
{
    return _newUserRegisterTimestamp;
}

#pragma mark-- 长连接登录
//长连接登录
- (void)longlinkLogin:(NSString *)loginkey
{
    
    if (loginkey == nil || [loginkey isEqualToString:@""]) {
        [self enterLogin];
        return;
    }
    
    
    PROTOCommonSignInRes *pendingSignInRes = [DYAccountPromptTool pendingSignInRes];
    
    //    if (self.isQueringPlayer ||
    //        self.loginState == Logging) {
    //        DYLogInfo(@"isQueringPlayer not need to longlink again");
    //        return;
    //    }
    
    DYLogInfo(@"longlinkLogin登录凭证   %@", loginkey);
    
    self.loginState = Logging;
    PB3LoginReq *req = [PB3LoginReq message];
    req.key = loginkey;
    req.deviceType = PB3DeviceType_DtIosPhone;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    
    ZYGService(IPlayerService).deviceId = req.deviceId;
    ZYGService(IPlayerService).loginKey = loginkey;
    
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"version"] = [AppUtils bundleAppVersion];
    opt[@"X-Token"] = loginkey;
    opt[@"appid"] = @"1";
    
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                 cmdid:ZYGPROTOOperationType_OpAuth
                                                header:opt
                                              rspClass:[PB3LoginRes class]
                                           channelType:ZYGChannelType_LongConn
                                            needAuthed:NO
                                           ServiceName:@"breathinglove.userstatus.UserStatusExtObj"
                                          functionName:@"Login"
                                            completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        
        PB3LoginRes *res = (PB3LoginRes *) rsp;
        DYLogInfo(@"Login-rsp = %lld,error = %@", res.accountId, error);
        if (error) {
            if (error.errorCode == PB3CommonErr_ErrCodeMaintain) {
            }
            //业务错误做退出处理
            if (ZYGNetRequestErrorTypeBusi == error.errorType) {
                [self logout];
            }
            //后台返回该区间错误码则直接退出
            if (error.errorCode >= 37001 && error.errorCode <= 37599) {
                [self logout];
            }
            [self longLinkStatisticError:error];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error.errorMessage.length) {
                    //                                                      [DYProgressHUD showInfoWithStatus:error.errorMessage];
                    [DYProgressHUD showInfoWithStatus:@"There is a problem with the service. Please try again later"];
                } else {
                    //客户端错误
                    DYLogInfo(@"longlinkLogin failed :%@ busiError:%@", [error description], error);
                }
            });
            
        }
        else {
            self.loginState = Logged;
            ZYGService(IPlayerService).accountID = res.accountId;
            [self refreshOnoffList];
            [self getPlayerInfo];
            
            //长连接验证成功后需要主动标记成功通知mars鉴权完成
            [ZYGService(IZYGConnectorService) markLonglinkAuthed];
            
            [self longLinkStatisticError:nil];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kLongLinkSuccessNotification object:res];
            
        }
    }];
}

//长连接统计
- (void)longLinkStatisticError:(ZYGNetRequestError *) error
{
    
}

#ifdef INTELNAL_VERSION
- (LoginType)loginType {
    return _loginType;
}
#endif

#pragma mark 登录IM模块
- (void)loginIM
{
}

//获取当前登录玩家信息
- (void)getPlayerInfo {
    PB3PlayerReq *req = [PB3PlayerReq message];
    DYLogInfo(@"getPlayerInfo after longKink");
    
    __weak typeof(self) weakSelf = self;
    
    [ZYGService(IZYGNetworkService)
     sendRequestWithReq:req
     cmdid:ZYGPROTOOperationType_OpSendSms
     header:nil
     rspClass:[PB3PlayerRes class]
     ServiceName:kNetApiUserExtService
     functionName:@"GetPlayer"
     completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        
        PB3PlayerRes *res = (PB3PlayerRes *) rsp;
        
        DYLogInfo(@"GetPlayer-rsp = %@,error = %@", res.player, error);
        if (error) {
            weakSelf.loginState = LoggedFail;
            DYLogError(@"GetPlayer-rsp = %@,error = %@", res.player, error);
        }
        else {
            weakSelf.loginState = Logged;
            
            if (res.player.id_p > 0) {
                DYLogInfo(@"==============最近登录为——注册用户id:%@", @(res.player.id_p));
            }else {
                DYLogInfo(@"==============最近登录为——游客%@", @(res.player.id_p));
            }
            NSString *key = [weakSelf loginKey];
            ZYGService(IPlayerService).accountFlag = res.accountFlags;
            [ZYGService(IPlayerService) updatePlayer:res loginKey:key isLogin:YES];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationDidLogin object:@(res.player.id_p)];
            if (res.player.id_p > 0) {  //非游客登录
                
                ZYGService(IPlayerService).passwordSate = res.player.hasPasswd;
                ZYGService(IPlayerService).isRegisterByPhone = res.player.isPhone;
                [ZYGService(IAssetsExtraService) getMoneyWithCompletionBlock:nil];
                [ZYGService(IAssetsExtraService) scoreInfoWithCompletion:nil];
                [weakSelf reportRechargePlayer];
                [weakSelf sendStateById:res.player.id_p];
                [weakSelf fetchIntimateList];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:kLoginRegisterServiceDidLoginNotification object:nil];
                
                [ZYGService(IPlayerService) loadPlayerAttributes];
                
                // 尝试拉取正在拨打中的电话，只有冷启动的时候才拨打。（强哥说用dispatch_once，会阻止编译优化）
                static BOOL hasFetchedIncomeCallingOnce = NO;
                
                if (LoginTypeUserId == _loginType) {
                    [YuKeychainUUID saveWithAccountId:[NSString stringWithFormat:@"%lld", res.player.id_p] password:_loginPassword ?: @""];
                    DYAccount *account = [[DYAccount alloc] initWithAccountId:[NSString stringWithFormat:@"%lld", res.player.id_p]
                                                                    showOffId:res.player.id2 ? [NSString stringWithFormat:@"%lld", res.player.id2] : nil
                                                              avatarUrlString:res.player.icon
                                                                    loginType:_loginType];
                    [weakSelf setupLocalLoginAccount:account];
                    
                }else if (LoginTypePhonePass == _loginType) {
                    NSString *accountId = [YuKeychainUUID accountIdWithCountryPhoneCode:_countryPhoneCode phone:_phone];
                    [YuKeychainUUID saveWithAccountId:accountId password:_loginPassword ?: @""];
                    DYAccount *account = [[DYAccount alloc] initWithAccountId:accountId
                                                                    showOffId:nil
                                                              avatarUrlString:res.player.icon
                                                                    loginType:_loginType];
                    [weakSelf setupLocalLoginAccount:account];
                }
            }else if (res.player.id_p <= 0) {  //游客登录
                //检查是否需要重新登录(自动，不需要跳到登录页面)
                [ZYGService(ILoginService) relogin];  //作退出处理
            }
        }
    }];
}

//获取挚友列表
- (void)fetchIntimateList
{
    //    [ZYGService(IGiftExtraService) fetchIntimateListWithPlayerId:0 completionBlock:nil];  //请求挚友列表
}
//杀进程才会重新验证
- (void)checkOnceBindPhone:(BOOL)isBindPhone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self logout];
    });
}

//获取多端登录信息
- (void)fetchMultiLoginData
{
    @weakify(self);
    [self fetchMultiLoginList:^(PB3UserConInfoListRes *rsp, NSString *errorMessage, NSInteger errorCode) {
        @strongify(self);
        if (rsp) {
            __block BOOL isMultiLogin = NO;
            [rsp.listArray enumerateObjectsUsingBlock:^(PB3UserConInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.deviceType == PB3DeviceType_DtWindowsPc) {
                    self.multiLoginInfo = obj;
                    isMultiLogin = YES;
                    *stop = YES;
                }
            }];
            if (!isMultiLogin) {
                self.multiLoginInfo = nil;
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUserMultiLoginStatusChange object:nil];
        }
    }];
}

//长期未验证用户登录begin
//- (void)showUserAuthSMSAlertView:(PB3NoConfirm *)obj
//{
//   self.noConfirmInfo = obj;
//   CGFloat height = 279.f;
//   CGFloat originY = (kScreenHeight - height)/2.f;
//   CGFloat width = kScreenWidth;
//}

- (void)contactService
{
    //    NSString *nobilityCustomerServiceRoute = ZYGService(IPlayerService).nobilityCustomerService.route;
    //    NSString *strUrl = nobilityCustomerServiceRoute.length ? nobilityCustomerServiceRoute : [DYWebEntranceManager.sharedInstance urlWithType:kDYWebEntranceTypeCustomerService];
    //    NSString *title = @"客服";
    //
    //    BannerWebViewController *vc = (BannerWebViewController *)[DYNavigator viewControllerWithName:kBannerWebViewController];
    //    @weakify(self);
    //    vc.dismissBlock = ^(BOOL isDismiss) {
    //       @strongify(self);
    //       if (isDismiss) return;
    //       [self showUserAuthSMSAlertView:self.noConfirmInfo];
    //    };
    //    if (DYCheckInvalidAndKindOfClass(vc, BannerWebViewController)) return;
    //
    //    vc.webUrl = strUrl;
    //    vc.title = title;
    //    //链接已经做了屏幕适配
    //    vc.isSubViewControllerMode = YES;
    //    [[DYNavigatorManager currentNavigator] pushViewController:vc animated:YES];
}

//长期未验证用户登录end

- (void)handleDeviceOffline:(PB3BroadcastDeviceDisconnected *)ms
{
    if (DYCheckInvalidAndKindOfClass(ms, PB3BroadcastDeviceDisconnected) || ms.deviceType != PB3DeviceType_DtWindowsPc) return;
    
    if (self.multiLoginInfo) {
        self.multiLoginInfo = nil;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUserDeviceOffline object:nil];
}

- (void)kickDeviceOffComplete:(void(^)(PB3UserDeviceDisconnectedRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    if (DYCheckInvalidAndKindOfClass(self.multiLoginInfo, PB3UserConInfo)) return;
    
    [self kickOtherDeviceOffWithDeviceId:self.multiLoginInfo.deviceId type:self.multiLoginInfo.deviceType complete:^(PB3UserDeviceDisconnectedRes *rsp, NSString *errorMessage, NSInteger errorCode) {
        if (completionBlock) {
            completionBlock(rsp, errorMessage, errorCode);
        }
    }];
}

// 获取账号绑定的手机验证码
- (void)getAccountPhoneSMSCodeComplete:(void(^)(NSString *errorMessage, NSInteger errorCode))completionBlock {
    
    PROTOAccountPhoneSmsCodeReq *req = [PROTOAccountPhoneSmsCodeReq message];
    
    NSString *token = self.token;
    if (self.loginKey.length) {
        token = self.loginKey;
    }
    // 这里添加这个是因为在登录页调用发送验证码接口的时候，要做鉴权
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"X-Token"] = token;
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:opt
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:PROTOAccountPhoneSmsCodeRes.class
                                           ServiceName:kNetApiAuthExtService
                                          functionName:@"AccountPhoneSmsCode"
                                            completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        
        NSString *errorMessage;
        if (error) {
            errorMessage = error.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        
        completionBlock(errorMessage, error.errorCode);
        
    }];
}

// 小号注册
- (void)requestAccountSubsidiaryLoginWithSMSCode:(NSString *)smsCode
                                         success:(void(^)(void))successBlock
                                            fail:(void(^)(NSString *errorMessage, NSInteger errorCode))failBlock {
    
    if (DYCheckInvalidAndKindOfClass(smsCode, NSString)) return;
    
    PROTOAccountSubsidiaryLoginReq *req = [PROTOAccountSubsidiaryLoginReq message];
    req.deviceType = PB3DeviceType_DtIosPhone;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.smsCode = smsCode;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    
    DYLogInfo(@"登录请求===小号");
    [DYProgressHUD showLoadingWithStatus:@""];
    @weakify(self)
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        @strongify(self);
        DYLogInfo(@"小号登录===成功");
        
        // 请求退出登录，因为调用这个接口成功的话，服务端已经帮我们自动登录了（服务端说不能在这个接口里面主动帮我们调退出登录的逻辑），需要我们自己把之前的loginkey手动调一下退出登录
        //      [self logoutWithIsPopOut:YES loginType:(PB3LogoutType_LtNone) needNoticeServer:YES];
        // 小号注册需要传 create-time，服务端需要这个字段来判断首页8分钟恋爱模块的照片性别
        [self loginSuccessWithType:LoginTypePhoneSMS rsp:res];
        if (successBlock) successBlock();
    } failBlock:^(ZYGNetRequestError *error) {
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        
        @strongify(self);
        DYLogInfo(@"小号登录===失败");
        
        NSInteger code = error.errorCode;
        if (ZYGNetRequestErrorTypeNet == error.errorType) {
            code = -1 ;
            //         [DYProgressHUD showInfoWithStatus:error.errorMessage ?: @"登录超时，请重试"];
            [DYProgressHUD showInfoWithStatus:@"There is a problem with the service. Please try again later"];
        }
        
        if (failBlock) failBlock(error.errorMessage, code);
    }];
    
}

#pragma mark-- 监听处理

- (void)addNetworkObservers
{
    ZYGService(IZYGConnectorService);
    //微信登录返回code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleCode:) name:@"WeChatLoginNotification" object:nil];
    
    //网络是否可用通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkReachableHandle:)
                                                 name:kNotificationNetworkReachableChanged
                                               object:nil];
    
    //长连接成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLonglinkReconnect:) name:kNotificationLongConnConnected object:nil];
    
    [ZYGService(IZYGNetworkService) addDelegate:self];
    //广播重登录
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserStatusCmdId_UcUserStatusRelogin forClass:[PB3BroadcastRelogin class]];
    //更新PlayerFlags
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcPlayerFlags forClass:[PB3BraodUpdatePlayerFlags class]];
    //魅力升级
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcCharmLevel forClass:[PB3BroadcastCharmLevel class]];
    //财富升级
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcWealthLevel forClass:[PB3BroadcastWealthLevel class]];
    //状态变更
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcUpdateOnOff forClass:[PB3BroadcastUpdateOnOff class]];
    //系统消息, （后台短消息）
    //    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_SystemMsgCmdId forClass:[PB3SystemMsgNotice class]];
    //砸蛋活动
    [ZYGService(IZYGNetworkService) registerCmdid:PB3CrackEggCmdId_OpenCmdId forClass:[PB3CrackEggNotice class]];
    
    //广播封号信息（用户处罚）
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcUserBan forClass:[PB3BroadcastBan class]];
    
    //长期未验证用户推送
    //   [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_LongTimeNoConfirm forClass:[PB3NoConfirm class]];
    
    
    //   [DYWebEntranceManager sharedInstance];
    
    
//    //普通样式弹窗
//    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_CommonNoticeCmdId forClass:[PB3CommonNotice class]];
//
    //本账号设备离线
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserStatusCmdId_UcUserStatusDeviceDisconnected forClass:[PB3BroadcastDeviceDisconnected class]];
    
    
    // 异地登录提示
    //   [ZYGService(IZYGNetworkService) registerCmdid:PB3UserStatusCmdId_UcUserStatusRemote forClass:[PB3RemoteLogin class]];
}

- (void)setup
{
    NSString *latestLogin = [self loginKey];
    if (!latestLogin.length) return;
    
    NSNumber *shortConnectLoginTimeNumber = [SettingsData.sharedObject getValueForKey:kLoginManagerTokenCreateTime];
    self.shortConnectLoginTime = [shortConnectLoginTimeNumber longLongValue];
    
    NSNumber *shortConnectLoginId = [SettingsData.sharedObject getValueForKey:kLoginManagerTokenId];
    self.shortConnectLoginId = [shortConnectLoginId longLongValue];
}

#pragma mark - ZYGNetWorkServiceBroadCastDelegate
- (void)showPromptIfNeededWithObj:(PB3BroadcastRelogin *)obj {
    //   if (![obj isKindOfClass:[PB3BroadcastRelogin class]]) {
    //      return;
    //   }
    //
    //   if ([obj.deviceId isEqualToString:[AppDeviceUtils getDeviceID]]) {
    //      return;
    //   }
    //
    //   NSString *timeDes = @"";
    //   NSDate *date = [NSDate dateWithTimeIntervalSince1970:obj.loginAt];
    //   if ([date isToday]) {
    //      timeDes = [date stringWithFormat:@"HH:mm"];
    //   }
    //   else {
    //      timeDes = [date stringWithFormat:@"MM-dd HH:mm"];
    //   }
    
    //   NSString *deviceDes = obj.deviceName;
    //   NSString *loginTypeDes = @"";
    //
    //   NSString *string = nil;
    //   switch (obj.loginType) {
    //      case PB3ClientLoginType_CltNative:
    //      {
    //         loginTypeDes = @"账号密码";
    //      }
    //         break;
    //      case PB3ClientLoginType_CltQq:
    //      {
    //         loginTypeDes = @"QQ";
    //         string = @"你的QQ账号密码可能已经泄露，请尽快登录修改密码";
    //      }
    //         break;
    //
    //      case PB3ClientLoginType_CltWeixin:
    //      {
    //         loginTypeDes = @"微信";
    //         string = @"你的微信账号密码可能已经泄露，请尽快登录修改密码";
    //      }
    //         break;
    //      case PB3ClientLoginType_CltApple:
    //      {
    //         loginTypeDes = @"苹果";
    //         string = @"你的苹果账号密码可能已经泄露，请尽快登录修改密码";
    //      }
    //         break;
    //      case PB3ClientLoginType_CltSms:
    //      {
    //         loginTypeDes = @"短信验证码";
    //         string = @"请勿泄露短信验证码，以防账号被盗";
    //      }
    //         break;
    //
    //      case PB3ClientLoginType_CltQuick:
    //      {
    //         loginTypeDes = @"一键";
    //         string = @"请检测您的手机卡是否在身边~";
    //      }
    //         break;
    //      case PB3ClientLoginType_CltChange:
    //      {
    //         loginTypeDes = @"切换账号";
    //         string = @"请注意你的账号保护，如不告诉其他人账号密码，短信验证码等~";
    //      }
    //         break;
    //      default: {
    //         string = @"请注意你的账号保护，如不告诉其他人账号密码，短信验证码等~";
    //      }
    //         break;
    //   }
    //
    //   NSString *prefix = nil;
    //   if (loginTypeDes.length) {
    //   }
    //   else {
    //   }
    //
    //
    //   NSString *text = [prefix stringByAppendingString:string];
    //   [DYAlert alertWithContent:text expectAction:@"知道了" expectActionHandle:nil];
}

- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj
{
#ifdef INTELNAL_VERSION
    [self addLogServerPush:serverPush withObj:obj];
#endif
    if (![obj isKindOfClass:[GPBMessage class]]) {
        return;
    }
    switch (serverPush.cmdId) {
        case PB3UserStatusCmdId_UcUserStatusRelogin: {
            [self playerRelogin:obj];
            [self fetchMultiLoginData];
            break;
        }
            //      case PB3SystemCmdId_LongTimeNoConfirm: {
            //         [self showUserAuthSMSAlertView:obj];
            //         break;
            //      }
        case PB3UserCmdId_UcPlayerFlags: {
            [self playFlagUpdate:obj];
            break;
        }
        case PB3UserCmdId_UcCharmLevel: {
            [self playerCharmLevelUpdate:obj];
            break;
        }
        case PB3UserCmdId_UcWealthLevel: {
            [self playerWealthLevelUpdate:obj];
            break;
        }
        case PB3UserCmdId_UcUpdateOnOff: {
            [self switchOnOffStateUpdate:obj];
            break;
        }
        case PB3CrackEggCmdId_OpenCmdId: {
            [self switchOnOffEggUpdate:obj];
            break;
        }
        case PB3UserCmdId_UcUserBan: {
            break;
        }
//        case PB3SystemCmdId_CommonNoticeCmdId: {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kHomeAlertNotification object:obj];  //普通样式弹窗
//            break;
//        }
        case PB3UserStatusCmdId_UcUserStatusDeviceDisconnected: {
            [self handleDeviceOffline:obj];
            break;
        }
            //      case PB3UserStatusCmdId_UcUserStatusRemote: {
            //         if (DYCheckInvalidAndKindOfClass(obj, PB3RemoteLogin)) return;
            //         PB3RemoteLogin *remoteLogin = (PB3RemoteLogin *)obj;
            //         if (![remoteLogin.deviceId isEqualToString:self.deviceId]) return;
            //         [DYAccountPromptTool showRemoteLoginAccoutPromptWithLoginTime:remoteLogin.timeAt];
            //         break;
            //      }
        default:
            break;
    }
}

//被挤下线（设备在另外一台设备登录）
- (void)playerRelogin:(PB3BroadcastRelogin *)ms
{
    kDYLogModuleLogin.info(@"ms.multiClient:%@", (ms.multiClient ? @"Y" : @"N"));
    //   kDYLogModuleLogin.info(@"ms.deviceType:%ld appName:%@", ms.deviceType, ms.application);
    
    //移动端保持互踢，移动端和pc不互踢
    //多端登录:开关打开并且对端支持多端登录
    
    if (![ms.deviceId isEqualToString:ZYGService(IPlayerService).deviceId]) {
        DYLogInfo(@"登录过期或在其他设备登录:%@", ms.deviceId);
        //被挤下线时，不调用logout，防止token失效
        //      [self logoutWithLoginType:(PB3LogoutType_LtNone) noticeServer:NO];  //退出处理
        [self showPromptIfNeededWithObj:ms];
    }
}

//广播更新PlayerFlags
- (void)playFlagUpdate:(PB3BraodUpdatePlayerFlags *)ms
{
    if (ms.playerId == ZYGService(IPlayerService).playId) {
        if (ms.flagType == 1) {
            [ZYGService(IPlayerService) updateFlags:ms.flagVal];
        }
        else if (ms.flagType == 2) {
            ZYGService(IPlayerService).flags2 = ms.flagVal;
        }
        else if (ms.flagType == 3) {
            ZYGService(IPlayerService).flags3 = ms.flagVal;
        }
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerFlagsNotification object:nil];
}

//广播魅力升级
- (void)playerCharmLevelUpdate:(PB3BroadcastCharmLevel *)ms
{
    if (ms.id_p == ZYGService(IPlayerService).playId) {
        ZYGService(IPlayerService).charm = ms.charm;
        ZYGService(IPlayerService).charmLevel = ms.charmLevel;
        DYLogInfo(@"魅力变更====魅力值=%@====等级=%@", @(ms.charm), @(ms.charmLevel));
    }
}

//广播魅力升级
- (void)playerWealthLevelUpdate:(PB3BroadcastWealthLevel *)ms
{
    if (ms.id_p == ZYGService(IPlayerService).playId) {
        ZYGService(IPlayerService).wealth = ms.wealth;
        ZYGService(IPlayerService).wealthLevel = ms.wealthLevel;
        DYLogInfo(@"财富变更====财富值=%@====等级=%@", @(ms.wealth), @(ms.wealthLevel));
    }
}

- (void)switchOnOffStateUpdate:(PB3BroadcastUpdateOnOff *)ms
{
    //    [ZYGService(IPlayerService).switchModel updateSpecailSwitch:ms.onOff.type withStatus:ms.onOff.status];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateSpecailNotification object:@(ms.onOff.type)];
}

- (void)switchOnOffEggUpdate:(PB3CrackEggNotice *)ms
{
}

#pragma mark-- 内部处理
//登录超时检测
- (BOOL)loginTimerOutCheck
{
    if (self.loginState == Logging) {
        //        [[NetworkAlert shareInstance] show:@"正在拼命连接..." position:ShowPositionCenter hideAfter:2];
        //        [DYProgressHUD showInfoWithStatus:@"正在拼命连接..."];
        [DYProgressHUD showInfoWithStatus:@"Wait a minute..."];
    }
    else if (self.loginState == LoginTimerOut) {
        return YES;
    }
    return NO;
}

/**
 * 登录并连接socket
 */
- (void)login:(NSString *)loginKey
{
    self.loginState = LoginNo;
    [[NSNotificationCenter defaultCenter] postNotificationName:kGetKeySuccessNotification object:nil];
    
    [ZYGService(IPlayerService) clear];
    [self saveLoginKey:loginKey];
    [ZYGService(IPlayerService) setLoginKey:loginKey];
    
    [ZYGService(IZYGNetworkService) clearAll];
    [ZYGService(IZYGNetworkService) makeSureLongLink];
    
}

/**
 * 登录并连接socket
 */
- (void)login:(NSString *)loginKey loginModel:(DYLoginModel *)loginModel
{
    if (!loginModel) {
        [self login:loginKey];
        return;
    }
    
    self.loginState = LoginNo;
    [[NSNotificationCenter defaultCenter] postNotificationName:kGetKeySuccessNotification object:loginModel];
    
    [ZYGService(IPlayerService) clear];
    [self saveLoginKey:loginKey];
    [ZYGService(IPlayerService) setLoginKey:loginKey];
    
    [ZYGService(IZYGNetworkService) clearAll];
    [ZYGService(IZYGNetworkService) makeSureLongLink];
    
}

//友盟统计
- (void)sendStateById:(int64_t)playId
{
}

//当登录的是游客是，检查是否需要重新登录
- (void)relogin
{
    NSString *latestLogin = [self loginKey];
    if (!latestLogin.length) {
        return;
    }
    NSString *latestLoginType = [[DBManager getInstance] readString:@"LatestLoginType"];
    if (latestLoginType.length && [latestLoginType isEqualToString:@"LoginTypeQQ"]) {
        NSString *token = [[DBManager getInstance] readString:@"QQAccessToken"];
        if (token.length) {
        }
        else {
            [self enterLogin];
        }
    }else{
        [self enterLogin];
    }
}

#pragma mark-- 获取key成功
- (void)loginSuccessWithType:(LoginType)loginType rsp:(PROTOCommonSignInRes *)rsp
{
    [DYAccountPromptTool setPendingSignInRes:rsp];
    
    NSString *key = rsp.loginToken;
    BOOL isNew = rsp.isNew;
    self.isNew = isNew;
#ifdef INTELNAL_VERSION
    BOOL isUserRegisterEverytimeTurnOn = [SettingsData.sharedObject getValueForKey:kSettingKeyUserRegisterEverytimeTurnOn];
    if (isUserRegisterEverytimeTurnOn) {
        isNew = YES;
    }
#endif
    
    _loginType = loginType;
    ZYGService(IPlayerService).playId = rsp.userId;
    
    self.shortConnectLoginTime = ZYGNetworkTime.currentTime ;
    self.shortConnectLoginId = rsp.userId;
    [SettingsData.sharedObject setValue:@(self.shortConnectLoginTime) forKey:kLoginManagerTokenCreateTime];
    [SettingsData.sharedObject setValue:@(rsp.userId) forKey:kLoginManagerTokenId];
    
    BOOL isLastLoginWithUserId = NO;
#warning TODO Easyin 需要优化
    if (loginType == LoginTypeAccount) {
        isLastLoginWithUserId = YES;
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"AccountLogin"];
    }
    else if (loginType == LoginTypeWebChat) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"WebChatLogin"];
    }
    else if (loginType == LoginTypeFacebook) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"FacebookLogin"];
    }
    else if (loginType == LoginTypePhoneSMS) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"PhoneLogin"];
    }
    else if (loginType == LoginTypePhonePass) {
        isLastLoginWithUserId = YES;
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"PhonePassLogin"];
    }
    else if (loginType == LoginTypeQQ) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"LoginTypeQQ"];
    }
    else if (loginType == LoginTypePhoneOnly) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"LoginTypePhoneOnly"];
    }
    else if (loginType == LoginTypeUserId) {
        isLastLoginWithUserId = YES;
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"LoginTypeUserId"];
    }
    else if (loginType == LoginTypeApple) {
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"LoginTypeApple"];
    }
    
    [[DBManager getInstance] saveString:kLoginManagerIsLastLoginWithUserId obj:[NSString stringWithFormat:@"%@", @(isLastLoginWithUserId)]];
    //新注册
    if (isNew) {
        [self setupToken:key];
        //新注册用户需要在header增加字段
        if (rsp.extends_Count) {
            NSString *createTime = [rsp.extends objectForKey:@"create-time"];
            if (createTime &&
                ([createTime isKindOfClass:NSString.class] || [createTime isKindOfClass:NSNumber.class])) {
                _currentNewUserId = rsp.userId;
                _newUserRegisterTimestamp = [createTime longLongValue];
            }
        }
        
        
    }
    else {
        _currentNewUserId = 0;
        _newUserRegisterTimestamp = 0;
        
        
    }
    
    //微信登录，不需要跳转到设置性别和密码页
    if (LoginTypeWebChat == loginType ||
        LoginTypeQQ == loginType) {
        isNew = NO;
    }
    
    //统计登录打点
    [self statisticLoginEndSuccessWithType:loginType];
    
    //手机注册新用户不需要拉去列表
    if (isNew &&
        (LoginTypePhoneSMS == loginType || LoginTypePhoneOnly == loginType)) {
        [self handleLoginWithKey:key loginType:loginType isNew:isNew];
    } else {
        [self checkBindPhoneWithType:loginType key:key isNew:isNew];
    }
    //TODO: get user info
    [self getPlayerInfo];
}
//检测是否绑定手机号
- (void)checkBindPhoneWithType:(LoginType)loginType key:(NSString *)key isNew:(BOOL)isNew
{
    //NSString *str = [AppUtils bundleDisplayName];
    [self setupToken:key];
    @weakify(self)
    [self getBindPhoneIdsSuccessBlock:^(UserChooseAccountModel *accountModel) {
        @strongify(self)
        //已经绑定手机
        if (accountModel.isBindPhone) {
            //获取的列表为空
            if (accountModel.isShowAccountList && accountModel.accountList.count > 1) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kGetUserIdsNotification object:accountModel];
                return ;
            }
            [self handleLoginWithKey:key loginType:loginType isNew:isNew];
        } else {
            [self handleLoginWithKey:key loginType:loginType isNew:isNew];
        }
    } failBlock:^(NSString *errorMsg) {
        //是否开启绑定手机总设置
        [self handleLoginWithKey:key loginType:loginType isNew:isNew];
    }];
}


- (LoginType)latestLoginType
{
    NSString *latestLoginType = [[DBManager getInstance] readString:@"LatestLoginType"];
    if (!latestLoginType || [latestLoginType isEqualToString:@""]) return LoginTypeAccount;
    
    if ([latestLoginType isEqualToString:@"AccountLogin"]) return LoginTypeAccount;
    if ([latestLoginType isEqualToString:@"WebChatLogin"]) return LoginTypeWebChat;
    if ([latestLoginType isEqualToString:@"FacebookLogin"]) return LoginTypeFacebook;
    if ([latestLoginType isEqualToString:@"PhoneLogin"]) return LoginTypePhoneSMS;
    if ([latestLoginType isEqualToString:@"PhonePassLogin"]) return LoginTypePhonePass;
    if ([latestLoginType isEqualToString:@"LoginTypeQQ"]) return LoginTypeQQ;
    if ([latestLoginType isEqualToString:@"LoginTypePhoneOnly"]) return LoginTypePhoneOnly;
    if ([latestLoginType isEqualToString:@"LoginTypeUserId"]) return LoginTypeUserId;
    if ([latestLoginType isEqualToString:@"LoginTypeApple"]) return LoginTypeApple;
    return LoginTypeAccount;
}

#pragma mark-- 获取key失败
- (void)keyFail:(LoginType)loginType withCode:(id)code message:(NSString *)msg
{
    [self saveLoginKey:@""];
    //统计登录失败时间
    [self statisticLoginEndFailWithType:loginType];
    
    //    NSString *content = [NSString stringWithFormat:@"%@--Error-code=%@", CustomLocalizedString(@"Login_LoginFail"), code];
    //    if (msg) {
    //        content = msg;
    //    }
    //
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:content delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    //
    //    [alert show];
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [alert dismissWithClickedButtonIndex:0 animated:0];
    //    });
}

#pragma mark -- 退出登录
- (void)logoutWithIsPopOut:(BOOL)isPopOut needNoticeServer:(BOOL)needNoticeServer {
    if (needNoticeServer) {
        [self logoutRequest];//请求退出登录
    }
    
    [DYAccountPromptTool setPendingSignInRes:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kWillLogoutNotification object:nil];
    @try {
        NSDictionary *dict = (NSDictionary *) [[DBManager getInstance] readObject:@"weChatLoginParam"];
        if (dict) {
            [[DBManager getInstance] saveObject:@"weChatLoginParam" obj:@{}];
        }
    }
    @catch (NSException *exception) {
        DYLogInfo(@"微信推出异常：%@", [exception callStackSymbols]);
    }
    
    
    _currentNewUserId = 0;
    _newUserRegisterTimestamp = 0;
    
    _shortConnectLoginTime = 0;
    _shortConnectLoginId = 0;
    [SettingsData.sharedObject removeValueForKey:kLoginManagerTokenCreateTime];
    [SettingsData.sharedObject removeValueForKey:kLoginManagerTokenId];
    
    [self saveLoginKey:@""];
    
    [[DBManager getInstance] saveArray:@"displayNewGiftViewArray" obj:[NSArray array]];      //清空打开新手礼包天数的数组
    [[DBManager getInstance] saveDictionary:@"codeInterval" obj:[NSDictionary dictionary]];  //清空记录倒计时时间
    [[DBManager getInstance] saveInteger:@"timeInterval" obj:0];                             //倒计时时间间隔
    [[DBManager getInstance] saveString:@"phoneNum" obj:@""];
    
    [ZYGService(IPlayerService) clear];
    
    //如果没有退出房间，先退出房间
//    [DYRoomControllerManager closeAllRoom];
    if (!isPopOut) {
        [ZYGService(ILoginService) enterLogin];
    }
    
    self.loginState = LoginNo;
    ZYGService(IPlayerService).isSwitchAccount = isPopOut;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLogout object:nil];
    
    [ZYGService(IZYGNetworkService) clearAll];
    
    // P.S. Easyin 你猜对了，是有这个需要
}

/**
 * 退出
 */
- (void)logout {
    [self logoutWithIsPopOut:NO needNoticeServer:YES];
}

//退出登录请求
- (void)logoutRequest {
    PB3LogoutReq *req = [PB3LogoutReq message];
    req.key = self.loginKey;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3LogoutRes class] ServiceName:kNetUserStatusExtService functionName:@"Logout" completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            DYLogInfo(@"Logout request failed");
        }
        else{
            DYLogInfo(@"Logout request success");
        }
    }];
}

- (void)refreshOnoffListBeforeLogin
{
    PB3GetNoAuthBeforeLoginReq *req = [PB3GetNoAuthBeforeLoginReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3GetNoAuthBeforeLoginRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"GetNoAuthBeforeLogin"
                                            completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (!error) {
        }
    }];
}

- (void)refreshOnoffList
{
}

// 检查是否需要选择兴趣
- (void)checkInterestedSetting
{
}

- (void)jumpToInterestSettingPage
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    UINavigationController *nav = (UINavigationController *) window.rootViewController;
    //   BOOL isLoginVisible = (BOOL)[self currentLoginNavigationController];
    //   if (isLoginVisible) return;
    //
    //   InterestChooseViewController *vc = [[InterestChooseViewController alloc] init];
    //   [nav presentViewController:vc animated:YES completion:nil];
}

//检查活动是否还在进行
- (void)checkActivityOn:(void (^)(id data))dataBlock
{
    //    WaitingView *waitV=[[WaitingView alloc] init];
    //    waitV.isWhite=YES;
    //    [waitV show];
    @try {
        
        
        PB3GetOnOffListReq *req = [PB3GetOnOffListReq message];
        
        [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                    header:nil
                                               channelType:ZYGChannelType_ShortConn
                                                  rspClass:[PB3GetOnOffListRes class]
                                               ServiceName:kNetApiUserExtService
                                              functionName:@"GetOnOffList"
                                                completion:^(PB3GetOnOffListRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
            if (!error) {
            }
        }];
        
        
    }
    @catch (NSException *exception) {
        DYLogInfo(@"获取活动是否开启出现异常:%@", [exception callStackSymbols]);
    }
}

- (void)setupLocalLoginAccount:(DYAccount *)account
{
    if (!account) return;
    
    NSMutableArray *accountList = [NSMutableArray arrayWithArray:[self localLoginAccountList]];
    while (accountList.count >= kLoginManagerAccountMaxCount) {
        [accountList removeLastObject];
    }
    for (int i = 0; i < accountList.count; ++i) {
        DYAccount *obj = accountList[i];
        if (obj.accountId && [obj.accountId isEqualToString:account.accountId]) {
            [accountList removeObjectAtIndex:i];
            break;
        }
    }
    [accountList insertObject:account atIndex:0];
    [[SettingsData sharedObject] setCustomValue:accountList forKey:kLoginManagerAccountKey];
}

- (void)updateLocalLoginAccountForCurrentUserShowOffId
{
    kDYLogModuleLogin.info(@"更新当前缓存的登录过的账号列表中的靓号");
    if (!ZYGService(IPlayerService).isLogined) {
        kDYLogModuleLogin.info(@"没有登录");
        return;
    }
    
    NSString *playerIdStr = [NSString stringWithFormat:@"%lld", ZYGService(IPlayerService).playId];
    
    BOOL isNeedUpdate = NO;
    NSMutableArray *accountList = [NSMutableArray arrayWithArray:[self localLoginAccountList]];
    for (int i = 0; i < accountList.count; ++i) {
        DYAccount *obj = accountList[i];
        if (obj.accountId && [obj.accountId isEqualToString:playerIdStr]) {
            if (!ZYGService(IPlayerService).id2) {
                [obj updateWithShowOffId:nil];
            }
            else {
                [obj updateWithShowOffId:[NSString stringWithFormat:@"%lld", ZYGService(IPlayerService).id2]];
            }
            isNeedUpdate = YES;
            break;
        }
    }
    if (!isNeedUpdate) return;
    [[SettingsData sharedObject] setCustomValue:accountList forKey:kLoginManagerAccountKey];
}

- (void)deleteLocalLoginAccount:(DYAccount *)account
{
    if (!account.accountId.length) return;
    
    NSMutableArray<DYAccount *> *accountList = [NSMutableArray arrayWithArray:[self localLoginAccountList]];
    [accountList enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(DYAccount * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.accountId && [obj.accountId isEqualToString:account.accountId]) {
            [accountList removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
    [[SettingsData sharedObject] setCustomValue:accountList forKey:kLoginManagerAccountKey];
}

- (NSArray<DYAccount *> *)localLoginAccountList
{
    NSArray *accountList = (NSArray *)[[SettingsData sharedObject] getCustomValueForKey:kLoginManagerAccountKey];
    if (!accountList ||
        ![accountList isKindOfClass:NSArray.class] ||
        !accountList.count) {
        accountList = [NSMutableArray array];
        [[SettingsData sharedObject] setCustomValue:accountList forKey:kLoginManagerAccountKey];
    }
    return accountList;
}

- (void)reportRechargePlayer
{
}

#pragma mark - 万能登录
- (void)getAccountToken:(NSString *)name
{
    PROTODevLoginReq *req = [PROTODevLoginReq message];
    req.name = name;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.deviceType = self.deviceType;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    
    @weakify(self);
    //   [DYProgressHUD showLoadingWithStatus:@"登录中"];
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        @strongify(self);
        kDYLogModuleLogin.info(@"账号成功");
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"AccountLogin"];
        [self loginSuccessWithType:LoginTypeAccount rsp:res];
    } failBlock:^(ZYGNetRequestError *error) {
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        @strongify(self);
        kDYLogModuleLogin.info(@"账号登录请求loginKey返回code===%ld", error.errorCode);
        [self keyFail:LoginTypeAccount withCode:@(error.errorCode) message:error.errorMessage];
    }];
}

- (void)loginWithNickName:(NSString *)nickname successBlock:(void (^)(BOOL))successBlock failBlock:(void (^)(NSString *))failBlock {
    PROTODevLoginReq *req = [PROTODevLoginReq message];
    req.name = nickname;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.deviceType = self.deviceType;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    
    @weakify(self);
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        @strongify(self);
        kDYLogModuleLogin.info(@"账号成功");
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"AccountLogin"];
        [self loginSuccessWithType:LoginTypeAccount rsp:res];
        if (successBlock) {
            successBlock(YES);
        }
    } failBlock:^(ZYGNetRequestError *error) {
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        @strongify(self);
        kDYLogModuleLogin.info(@"账号登录请求loginKey返回code===%ld", error.errorCode);
        [self keyFail:LoginTypeAccount withCode:@(error.errorCode) message:error.errorMessage];
        if (failBlock) {
            failBlock(error.errorMessage);
        }
    }];
}
#pragma mark - ID登录
/**
 * ID登录
 */
- (void)reportErrorCode:(NSInteger)code
{
}

- (void)loginWithUserId:(int64_t)userId
               password:(NSString *)password
           successBlock:(void (^)(void))successBlock
              failBlock:(void (^)(NSString *errorMsg))failBlock
{
    PROTOIdOrPhoneLoginReq *req = [PROTOIdOrPhoneLoginReq message];
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.value = @(userId).stringValue;
    [self synEncryptWithString:password completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.password = encodeStr;
        req.sign = sign;
    }];
    
    LoginType loginType = LoginTypeUserId;
    [self statisticLoginStartWithType:loginType];
    //   [DYProgressHUD showLoadingWithStatus:@"登录中"];
    @weakify(self)
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        @strongify(self);
        kDYLogModuleLogin.info(@"ID登录请求loginKey====成功");
        
        [[DBManager getInstance] saveString:@"LatestLoginType" obj:@"AccountLogin"];
        if (password) {
            _loginPassword = password;
            _loginType = LoginTypeUserId;
            
            [YuKeychainUUID saveAccountPassword:password];
            [[DBManager getInstance] saveObject:@"LastLoginID" obj:@(userId)];
        }
        [self statisticLoginEndSuccessWithType:loginType];
        
        [self loginSuccessWithType:LoginTypeUserId rsp:res];
        
        if (successBlock) {
            successBlock();
        }
    } failBlock:^(ZYGNetRequestError *error) {
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            
            // 注销账号的error，无需提示出错误给用户
            if (failBlock) {
                failBlock(nil);
            }
            
            return;
        }
        
        @strongify(self);
        //       [DYProgressHUD showInfoWithStatus:error.errorMessage];
        [DYProgressHUD showInfoWithStatus:@"There is a problem with the service. Please try again later"];
        kDYLogModuleLogin.info(@"ID登录请求loginKey返回code===%@", @(error.errorCode));
        kDYLogModuleLogin.info(@"ID登录请求loginKey失败信息:%@", error.errorMessage);
        
        [self keyFail:LoginTypeUserId withCode:@(error.errorCode) message:error.errorMessage];
        
        [self statisticLoginEndFailWithType:loginType];
        
        if (failBlock) {
            failBlock(error.errorMessage);
        }
    }];
}

#pragma mark-- 微信登录

//微信授权
- (void)weChatAuth
{
}

/**
 * 微信登录
 */
- (void)WechatLoginByCode:(NSString *)code
{
    if (DYCheckInvalidAndKindOfClass(code, NSString)) {
        DYLogInfo(@"WechatLogin , code = nil  ");
        return;
    }
    PROTOThirdLoginReq *req = [PROTOThirdLoginReq message];
    req.code = code;
    req.appId = DYAppKeyManager.sharedInstance.weixinConfig.appId;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.deviceType = PROTOUauthDeviceType_DtIosPhone;
    req.loginType = PROTOUauthLoginType_LtWeixin;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    
    LoginType loginType = LoginTypeWebChat;
    [self statisticLoginStartWithType:loginType];
    DYLogInfo(@"登录请求===微信");
    [DYProgressHUD showLoadingWithStatus:@"登录中"];
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        DYLogInfo(@"微信登录===成功");
        [self loginSuccessWithType:loginType rsp:res];
        [self statisticLoginEndSuccessWithType:loginType];
    } failBlock:^(ZYGNetRequestError *error) {
        DYLogInfo(@"微信登录===失败");
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        
        [self keyFail:loginType withCode:@(error.errorCode) message:nil];
        [self statisticLoginEndFailWithType:loginType];
        NSInteger code = error.errorCode;
        if (ZYGNetRequestErrorTypeNet == error.errorType) {
            code = -1 ;
            //[DYProgressHUD showInfoWithStatus:@"登录超时，请重试"];
            [DYProgressHUD showInfoWithStatus:error.errorMessage ?: @"登录超时，请重试"];
        }
    }];
}

#pragma mark--WeChatLoginNotification 获取后收到code通知
- (void)handleCode:(NSNotification *)notification
{
    NSString *code = notification.object;
    [self WechatLoginByCode:code];
}

#pragma mark-- Facebook登录
/**
 * FaceBook登录
 */

- (void)getFaceBookToken:(NSString *)token
{
    if (DYCheckInvalidAndKindOfClass(token, NSString)) {
        DYLogInfo(@"FacebookLogin , code = nil  ");
        return;
    }
    PROTOThirdLoginReq *req = [PROTOThirdLoginReq message];
    req.accessToken = token;
    req.appId = DYAppKeyManager.sharedInstance.facebookConfig.appId;
    req.deviceId = [YuKeychainUUID getDeviceIDInKeychain];
    req.deviceType = PROTOUauthDeviceType_DtIosPhone;
    req.loginType = PROTOUauthLoginType_LtFacebook;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    
    LoginType loginType = LoginTypeFacebook;
    [self statisticLoginStartWithType:loginType];
    DYLogInfo(@"登录请求===Facebook");
    [DYProgressHUD showLoadingWithStatus:@"登录中"];
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        DYLogInfo(@"Facebook登录===成功");
        [self loginSuccessWithType:loginType rsp:res];
        [self statisticLoginEndSuccessWithType:loginType];
    } failBlock:^(ZYGNetRequestError *error) {
        DYLogInfo(@"Facebook登录===失败");
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        
        [self keyFail:loginType withCode:@(error.errorCode) message:nil];
        [self statisticLoginEndFailWithType:loginType];
        //NSInteger code = error.errorCode;
        if (ZYGNetRequestErrorTypeNet == error.errorType) {
            //code = -1 ;
            //[DYProgressHUD showInfoWithStatus:@"登录超时，请重试"];
            [DYProgressHUD showInfoWithStatus:error.errorMessage ?: @"登录超时，请重试"];
        }
    }];
}

#pragma mark--- QQ登录
// QQ登录
- (void)qqLogin
{
}

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    DYLogInfo(@"QQ登录失败");
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    DYLogInfo(@"QQ登录网络有问题");
}


#pragma mark -- 获取短信
//获取短信
- (void)smsCodeWithPhone:(NSString *)phone
        countryPhoneCode:(NSString *)countryPhoneCode
                 smsType:(kLoginSmsType)smsType
            successBlock:(void (^)(void))successBlock
               failBlock:(void (^)(NSString *errorMsg, NSInteger errorCode))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString)) {
        if (failBlock) {
            failBlock(@"国家/地区号，电话号码不能为空", -1);
        }
        return;
    }
    
    PROTOGetSmsCodeReq *req = [PROTOGetSmsCodeReq message];
    req.country = countryPhoneCode.intValue;
    [self synEncryptWithString:phone completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phoneNo = encodeStr;
        req.phoneSign = sign;
    }];
    req.smsCodeTpl = [self getSmsCodeTplWithSmsType:smsType];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PROTOGetSmsCodeRes class]
                                           ServiceName:kNetApiAuthExtService
                                          functionName:@"GetSmsCodeBySign"
                                            completion:^(PROTOGetSmsCodeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage, error.errorCode);
            }
            return;
        }
        
        if (!rsp) {
            if (failBlock) {
                failBlock(@"短信发送失败", error.errorCode);
            }
            return;
        }
        
        if (successBlock) {
            successBlock();
        }
    }];
}

//获取短信token
- (void)smsTokenWithPhone:(NSString *)phone
         countryPhoneCode:(NSString *)countryPhoneCode
                  smsCode:(NSString *)smsCode
                  smsType:(kLoginSmsType)smsType
             successBlock:(void (^)(NSString *smsToken))successBlock
                failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString)||
        DYCheckInvalidAndKindOfClass(smsCode, NSString)) {
        if (failBlock) {
            failBlock(@"国家/地区号，电话号码不能为空,短信验证码不能为空");
        }
        return;
    }
    
    PROTOGetSmsTokenReq *req = [PROTOGetSmsTokenReq message];
    req.country = countryPhoneCode.intValue;
    req.smsCode = smsCode;
    [self synEncryptWithString:phone completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phoneNo = encodeStr;
        req.phoneSign = sign;
    }];
    req.smsCodeTpl = [self getSmsCodeTplWithSmsType:smsType];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PROTOGetSmsTokenRes class]
                                           ServiceName:kNetApiAuthExtService
                                          functionName:@"GetSmsTokenBySign"
                                            completion:^(PROTOGetSmsTokenRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage);
            }
            return;
        }
        
        if (!rsp) {
            if (failBlock) {
                failBlock(@"获取短信Token失败");
            }
            return;
        }
        if (successBlock) {
            successBlock(rsp.smsToken);
        }
    }];
}

#pragma mark  手机+短信验证码登录(或注册)
- (void)loginWithPhone:(NSString *)phone
      countryPhoneCode:(NSString *)countryPhoneCode
               smsCode:(NSString *)smsCode
          successBlock:(void (^)(void))successBlock
             failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString) ||
        DYCheckInvalidAndKindOfClass(smsCode, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    NSString *phoneNO = [NSString stringWithFormat:@"%@%@", countryPhoneCode, phone];
    [self p_loginWithPhoneNO:phoneNO smsCode:smsCode successBlock:successBlock failBlock:failBlock];
}

//手机+短信验证码登录
- (void)p_loginWithPhoneNO:(NSString *)phoneNO
                   smsCode:(NSString *)smsCode
              successBlock:(void (^)(void))successBlock
                 failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(smsCode, NSString)) {
        DYLogInfo(@"手机短信验证码为空，取消登录请求");
        return;
    }
    PROTOLoginWithPhoneSMSReq *req = [PROTOLoginWithPhoneSMSReq message];
    req.smsCode = smsCode;
    req.deviceType = PB3DeviceType_DtIosPhone;
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    PROTODeviceMessage *deviceMessage = [PROTODeviceMessage message];
    deviceMessage.idfa = self.idfa;
    deviceMessage.idfv = self.idfv;
    req.deviceMessage = deviceMessage;
    req.smsCodeTpl = PROTOSMSCodeTpl_SmscodeTplLogin;
    [self synEncryptWithString:phoneNO completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phone = encodeStr;
        req.phoneSign = sign;
    }];
    
    LoginType loginType = LoginTypePhoneSMS;
    [self statisticLoginStartWithType:loginType];
    DYLogInfo(@"登录请求===手机+短信验证码");
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        [self loginSuccessWithType:loginType rsp:res];
        DYLogInfo(@"手机+短信验证码登录===成功");
        [self statisticLoginEndSuccessWithType:loginType];
        
        if (successBlock) successBlock();
        
    } failBlock:^(ZYGNetRequestError *error) {
        DYLogInfo(@"手机+短信验证码登录===失败");
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            return;
        }
        
        [self keyFail:loginType withCode:@(error.errorCode) message:nil];
        [self statisticLoginEndFailWithType:loginType];
        NSInteger code = error.errorCode;
        if (ZYGNetRequestErrorTypeNet == error.errorType) {
            code = -1 ;
            //[DYProgressHUD showInfoWithStatus:@"登录超时，请重试"];
        }
        
        if (failBlock) failBlock(error.errorMessage);
    }];
    
}

//重置密码校验验证码
- (void)resetPasswordWithPhone:(NSString *)phone
              countryPhoneCode:(NSString *)countryPhoneCode
                       smsCode:(NSString *)smsCode
                  successBlock:(void (^)(NSString *smsToken))successBlock
                     failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString) ||
        DYCheckInvalidAndKindOfClass(smsCode, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    [self smsTokenWithPhone:phone
           countryPhoneCode:countryPhoneCode
                    smsCode:smsCode
                    smsType:kLoginSmsTypeResetPwd
               successBlock:successBlock
                  failBlock:failBlock];
}

//重置密码
- (void)resetPasswordWithPhone:(NSString *)phone
              countryPhoneCode:(NSString *)countryPhoneCode
                      smsToken:(NSString *)smsToken
                      password:(NSString *)password
                  successBlock:(void (^)(void))successBlock
                     failBlock:(void (^)(NSString *errorMsg))failBlock DY_DEPRECATED_MSG_ATTRIBUTE("Use '- (void)resetPasswordForAccount:(NSInteger)account withPhone:(NSString *)phone countryPhoneCode:(NSString *)countryPhoneCode smsToken:(NSString *)smsToken password:(NSString *)password successBlock:(void (^)(void))successBlock failBlock:(void (^)(NSString *errorMsg))failBlock;' instead. ")
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString) ||
        DYCheckInvalidAndKindOfClass(smsToken, NSString) ||
        DYCheckInvalidAndKindOfClass(password, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    
    PROTOResetPasswordReq *req = [PROTOResetPasswordReq message];
    req.country = [countryPhoneCode intValue];
    req.smsToken = smsToken;
    [self synEncryptWithString:password completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.password = encodeStr;
        req.sign = sign;
    }];
    [self synEncryptWithString:phone completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phoneNo = encodeStr;
        req.phoneSign = sign;
    }];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PROTOResetPasswordRes class]
                                           ServiceName:kNetApiAuthExtService
                                          functionName:@"GetResetPasswordBySign"
                                            completion:^(PROTOResetPasswordRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            NSString *msg = error.errorMessage;
            if (!msg.length) {
                msg = @"重置失败";
            }
            if (failBlock) {
                failBlock(msg);
            }
        }else{
            if (successBlock) {
                successBlock();
            }
        }
    }];
}

- (void)resetPasswordForAccount:(NSInteger)account withPhone:(NSString *)phone countryPhoneCode:(NSString *)countryPhoneCode smsToken:(NSString *)smsToken password:(NSString *)password successBlock:(void (^)(void))successBlock failBlock:(void (^)(NSString *))failBlock {
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString) ||
        DYCheckInvalidAndKindOfClass(smsToken, NSString) ||
        DYCheckInvalidAndKindOfClass(password, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    PROTOResetPasswordReq *req = [PROTOResetPasswordReq message];
    req.country = [countryPhoneCode intValue];
    req.smsToken = smsToken;
    req.playerId = account;
    [self synEncryptWithString:password completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.password = encodeStr;
        req.sign = sign;
    }];
    [self synEncryptWithString:phone completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phoneNo = encodeStr;
        req.phoneSign = sign;
    }];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:[PROTOResetPasswordRes class] ServiceName:kNetApiAuthExtService functionName:@"GetResetPasswordBySign" completion:^(PROTOResetPasswordRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            NSString *msg = error.errorMessage;
            if (!msg.length) {
                msg = @"重置失败";
            }
            if (failBlock) {
                failBlock(msg);
            }
        }
        else {
            if (successBlock) {
                successBlock();
            }
        }
    }];
}

//手机号+密码登录
- (void)loginWithPhone:(NSString *)phone
      countryPhoneCode:(NSString *)countryPhoneCode
              password:(NSString *)password
          successBlock:(void (^)(void))successBlock
             failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(password, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    
    PROTOIdOrPhoneLoginReq *req = [PROTOIdOrPhoneLoginReq message];
    req.deviceId = self.deviceId;
    req.uMengDeviceId = self.umengDeviceId;
    req.country = [countryPhoneCode intValue];
    req.value = phone;
    [self synEncryptWithString:password completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.password = encodeStr;
        req.sign = sign;
    }];
    
    LoginType loginType = LoginTypePhonePass;
    [self statisticLoginStartWithType:loginType];
    DYLogInfo(@"登录请求===手机号+密码登录");
    [self loginWithReq:req successBlock:^(PROTOCommonSignInRes *res) {
        DYLogInfo(@"手机号+密码登录===成功");
        [self loginSuccessWithType:loginType rsp:res];
        _loginPassword = password;
        _countryPhoneCode = countryPhoneCode;
        _phone = phone;
        
        [self statisticLoginEndSuccessWithType:loginType];
        
        if (successBlock) successBlock();
        
    } failBlock:^(ZYGNetRequestError *error) {
        DYLogInfo(@"手机号+密码登录===失败");
        if ([error.domain isEqualToString:LoginServiceErrorDomain] && error.errorCode == LoginServiceErrorCodeIsResigning) {
            
            // 注销账号的error，无需提示出错误给用户
            if (failBlock) failBlock(nil);
            return;
        }
        
        [self keyFail:loginType withCode:@(error.errorCode) message:nil];
        [self statisticLoginEndFailWithType:loginType];
        NSInteger code = error.errorCode;
        if (ZYGNetRequestErrorTypeNet == error.errorType) {
            code = -1 ;
            //         [DYProgressHUD showInfoWithStatus:@"登录超时，请重试"];
        }
        
        if (failBlock) failBlock(error.errorMessage);
    }];
    
}

//设置密码
- (void)changePasswordWithOldPasswd:(NSString *)oldPasswd
                         newPasswd1:(NSString *)newPasswd1
                         newPasswd2:(NSString *)newPasswd2
                       isNewSetting:(BOOL)isNew
                       successBlock:(void (^)(void))successBlock
                          failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (!oldPasswd.length) {
        oldPasswd = @"";
    }
    if (!newPasswd1.length) {
        newPasswd1 = @"";
    }
    if (!newPasswd2.length) {
        newPasswd2 = @"";
    }
    
    PROTOUpdatePasswdReq *req = [PROTOUpdatePasswdReq message];
    [self synEncryptWithString:oldPasswd completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.oldPasswd = encodeStr;
    }];
    [self synEncryptWithString:newPasswd1 completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.newPasswd = encodeStr;
        req.sign = sign;
    }];
    req.isNew = isNew;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                 cmdid:ZYGPROTOOperationType_OpSendSms
                                                header:nil
                                              rspClass:[PROTOUpdatePasswdRes class]
                                           ServiceName:kNetApiAuthExtService
                                          functionName:@"UpdatePasswd"
                                            completion:^(PROTOUpdatePasswdRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        
        DYLogInfo(@"PROTOUpdatePasswdRes = %@,error = %@", rsp, error);
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage);
            }
            return;
        }
        
        if (!rsp) {
            if (failBlock) {
                failBlock(@"设置密码失败");
            }
            return;
        }
        DYLogInfo(@"设置密码成功");
        if (successBlock) {
            successBlock();
        }
        //设置、修改密码后均会把用户踢下线 要求重新登录
        if (!isNew) {
            [self logout];
        }
        
    }];
}

//- (void)safetyVerificationSendCodeWithUserId:(NSInteger)userId successBlock:(void (^)(PB3AnomalyLoginSendCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *))failedBlock {
//   PB3AnomalyLoginSendCodeReq *req = [PB3AnomalyLoginSendCodeReq message];
//   req.userId = userId;
//   [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3AnomalyLoginSendCodeRes class] ServiceName:kNetApiIndexExtService functionName:@"GetAnomalyLoginSendCode" completion:^(PB3AnomalyLoginSendCodeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//      if (error) {
//          if (failedBlock) {
//             failedBlock(error);
//          }
//          return;
//      }
//
//      if (!rsp) {
//          if (failedBlock) {
//             failedBlock(nil);
//          }
//          return;
//      }
//      if (successBlock) {
//          successBlock(rsp);
//      }
//   }];
//}
//
//- (void)safetyVerificationWithUserId:(NSInteger)userId verifyCode:(NSString *)verifiyCode successBlock:(void (^)(PB3AnomalyLoginConfirmCodeRes *))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock {
//   PB3AnomalyLoginConfirmCodeReq *req = [PB3AnomalyLoginConfirmCodeReq message];
//   req.userId = userId;
//   req.code = verifiyCode;
//   [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3AnomalyLoginConfirmCodeRes class] ServiceName:kNetApiIndexExtService functionName:@"GetAnomalyLoginConfirmCode" completion:^(PB3AnomalyLoginConfirmCodeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//      if (error) {
//          if (failedBlock) {
//             failedBlock(error);
//          }
//          return;
//      }
//
//      if (!rsp) {
//          if (failedBlock) {
//             failedBlock(nil);
//          }
//          return;
//      }
//      if (successBlock) {
//          successBlock(rsp);
//      }
//   }];
//}

- (void)tmpProtectVerificationSendCodeWithUserId:(NSInteger)userId successBlock:(void (^)(PROTORemoteLoginSendCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock
{
    PROTORemoteLoginSendCodeReq *req = [PROTORemoteLoginSendCodeReq message];
    req.userId = userId;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTORemoteLoginSendCodeRes class] ServiceName:kNetApiAuthExtService functionName:@"GetRemoteLoginSendCode" completion:^(PROTORemoteLoginSendCodeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error || !rsp) {
            if (failedBlock) {
                failedBlock(error);
            }
        } else {
            if (successBlock) {
                successBlock(rsp);
            }
        }
    }];
}

- (void)tmpProtectVerificationConfirmWithUserId:(NSInteger)userId verifyCode:(NSString *)verifiyCode successBlock:(void (^)(PROTORemoteLoginConfirmCodeRes *res))successBlock failedBlock:(void (^)(ZYGNetRequestError *error))failedBlock;
{
    PROTORemoteLoginConfirmCodeReq *req = [PROTORemoteLoginConfirmCodeReq message];
    req.userId = userId;
    req.code = verifiyCode;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTORemoteLoginConfirmCodeRes class] ServiceName:kNetApiAuthExtService functionName:@"GetRemoteLoginConfirmCode" completion:^(PROTORemoteLoginConfirmCodeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error || !rsp) {
            if (failedBlock) {
                failedBlock(error);
            }
        } else {
            if (successBlock) {
                successBlock(rsp);
            }
        }
    }];
}

//检查手机号是否已经注册
- (void)checkExistUserWithPhone:(NSString *)phone
               countryPhoneCode:(NSString *)countryPhoneCode
                   successBlock:(void (^)(BOOL isExist))successBlock
                      failBlock:(void (^)(NSString *errorMsg))failBlock
{
    if (DYCheckInvalidAndKindOfClass(phone, NSString) ||
        DYCheckInvalidAndKindOfClass(countryPhoneCode, NSString)) {
        if (failBlock) {
            failBlock(@"参数错误");
        }
        return;
    }
    
    PB3GetPhoneUsedReq *req = [PB3GetPhoneUsedReq message];
    req.countryCode = countryPhoneCode;
    [self synEncryptWithString:phone completeBlock:^(NSString *encodeStr, NSString *sign) {
        req.phoneNo = encodeStr;
        req.phoneSign = sign;
    }];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3GetPhoneUsedRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"GetPhoneUsedBySign"
                                            completion:^(PB3GetPhoneUsedRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"PB3GetPhoneUsedRes = %@,error = %@", rsp, error);
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage);
            }
            return;
        }
        if (!rsp) {
            if (failBlock) {
                failBlock(@"检查失败");
            }
            return;
        }
        
        DYLogInfo(@"检查成功");
        if (successBlock) {
            successBlock(rsp.isUsed);
        }
    }];
}
//获取绑定同一个手机的列表
- (void)getBindPhoneIdsSuccessBlock:(UserChooseAccountBlock)successBlock failBlock:(void (^)(NSString *errorMsg))failBlock
{
    PB3ShowBindPhoneIdsReq *req = [PB3ShowBindPhoneIdsReq message];
    NSString *token = self.token;
    if (self.loginKey.length) {
        token = self.loginKey;
    }
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"version"] = [AppUtils bundleAppVersion];
    opt[@"X-Token"] = token;
    opt[@"appid"] = @"1";
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:opt channelType:ZYGChannelType_ShortConn rspClass:[PB3ShowBindPhoneIdsRes class] ServiceName:kNetApiUserExtService functionName:@"ShowBindPhoneIds" completion:^(PB3ShowBindPhoneIdsRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"PB3ShowBindPhoneIdsRes = %@,error = %@", rsp, error);
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage);
            }
            return;
        }
        if (!rsp) {
            if (failBlock) {
                failBlock(@"登录超时");
            }
            return;
        }
        
        DYLogInfo(@"获取绑定Id列表成功");
        if (successBlock) {
            __block NSMutableArray <UserIdChooseModel *>*list = [NSMutableArray array];
            
            [rsp.listArray enumerateObjectsUsingBlock:^(PB3BindPhonePlayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UserIdChooseModel *model = [[UserIdChooseModel alloc] init];
                
                model.shotId = obj.id2;
                model.userId = obj.id_p;
                model.icon = obj.icon;
                model.name = obj.name;
                model.type = (UserAccounChannelType)obj.type;
                model.isShowIcon = rsp.isShowIcon;
                //              model.gender = (kDYLoginGender)obj.sex;
                [list addObject:model];
            }];
            
            UserChooseAccountModel *accountModel = [[UserChooseAccountModel alloc] init];
            accountModel.isBindPhone = rsp.isBindPhone;
            accountModel.isShowAccountList = rsp.changePower;
            accountModel.accountList = list.copy;
            accountModel.isShowAdd = rsp.isShowAdd;
            accountModel.contentList = rsp.contentArray.copy;
            accountModel.phone = rsp.phone;
            accountModel.accountNum = rsp.accountNum;
            accountModel.isShowOther = rsp.isWechatOrQq;
            accountModel.isShowIcon = rsp.isShowIcon;
            
            successBlock(accountModel);
        }
    }];
}

- (void)noneAuthGetBindPhoneIdsWithSMSToken:(NSString *)smsToken successBlock:(UserChooseAccountBlock)successBlock failBlock:(void (^)(NSString *errorMsg))failBlock {
    //   PB3GetShowBindPhoneIdsReq *req = [PB3GetShowBindPhoneIdsReq message];
    //   req.smsToken = smsToken;
    //   NSString *token = self.token;
    //   if (self.loginKey.length) {
    //       token = self.loginKey;
    //   }
    //   NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    //   opt[@"version"] = [AppUtils bundleAppVersion];
    //   opt[@"X-Token"] = token;
    //   opt[@"appid"] = @"1";
    //   [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:opt channelType:ZYGChannelType_ShortConn rspClass:[PB3GetShowBindPhoneIdsRes class] ServiceName:kNetApiUserExtService functionName:@"GetShowBindPhoneIds" completion:^(PB3GetShowBindPhoneIdsRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
    //      if (error) {
    //          if (failBlock) {
    //              failBlock(error.errorMessage);
    //          }
    //          return;
    //      }
    //      if (!rsp) {
    //          if (failBlock) {
    //              failBlock(@"登录超时");
    //          }
    //          return;
    //      }
    //
    //      if (successBlock) {
    //          __block NSMutableArray <UserIdChooseModel *>*list = [NSMutableArray array];
    //
    //          [rsp.listArray enumerateObjectsUsingBlock:^(PB3BindPhonePlayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //              UserIdChooseModel *model = [[UserIdChooseModel alloc] init];
    //
    //              model.shotId = obj.id2;
    //              model.userId = obj.id_p;
    //              model.icon = obj.icon;
    //              model.name = obj.name;
    //              model.type = (UserAccounChannelType)obj.type;
    //              model.isShowIcon = rsp.isShowIcon;
    //             model.gender = (kDYLoginGender)obj.sex;
    //              [list addObject:model];
    //          }];
    //
    //         UserChooseAccountModel *accountModel = [[UserChooseAccountModel alloc] init];
    //         accountModel.accountList = list.copy;
    //         accountModel.isShowIcon = rsp.isShowIcon;
    //
    //         successBlock(accountModel);
    //      }
    //   }];
}


//获取新的token进行登录
- (void)loginNewTokenWithUserId:(int64_t)userId
                    isFromLogin:(BOOL)isFromLogin
                   successBlock:(void (^)(void))successBlock
                      failBlock:(void (^)(NSString *errorMsg))failBlock
{
    PB3CreateNewTokenReq *req = [PB3CreateNewTokenReq message];
    req.id_p = userId;
    
    NSString *token = self.token;
    if (self.loginKey.length) {
        token = self.loginKey;
    }
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"version"] = [AppUtils bundleAppVersion];
    opt[@"X-Token"] = token;
    opt[@"appid"] = @"1";
    @weakify(self);
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:opt channelType:ZYGChannelType_ShortConn rspClass:[PB3CreateNewTokenRes class] ServiceName:kNetApiUserExtService functionName:@"CreateNewToken" completion:^(PB3CreateNewTokenRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        @strongify(self);
        
        DYLogInfo(@"PB3CreateNewTokenRes = %@,error = %@", rsp, error);
        if (error) {
            DYLogInfo(@"获取新token失败");
            if (failBlock) {
                failBlock(error.errorMessage);
            }
            return;
        }
        if (!rsp) {
            DYLogInfo(@"获取新token失败");
            if (failBlock) {
                failBlock(@"登录超时");
            }
            return;
        }
        DYLogInfo(@"获取新token成功");
        
        void(^login)(void) = ^{
            //如果是从登录页过来，不需要调用退出登录的请求；避免后端判断pushToken失效，导致用户收不到推送
            //          [self logoutWithIsPopOut:YES loginType:(PB3LogoutType_LtNone) needNoticeServer:!isFromLogin];
            [self login:rsp.key];
            if (successBlock) {
                successBlock();
            }};
        
        //       if (rsp.isApplyLogoff) {
        //
        //          NSInteger playerId = userId;
        //          if (rsp.shortId) {
        //             playerId = rsp.shortId;
        //          }
        //
        //          [DYAccountPromptTool showPromptInMainThreadWithPlayerId:playerId endTime:rsp.logoffExpired cancelResignAction:^{
        //             login();
        //          } andResignAction:^{
        //             if (failBlock) {
        //                 failBlock(nil);
        //             }
        //          }];
        //
        //          return;
        //       }
        
        login();
        
    }];
}

//多端登录
- (void)fetchMultiLoginList:(void(^)(PB3UserConInfoListRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    PB3UserConInfoListReq *req = [PB3UserConInfoListReq message];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_LongConn
                                              rspClass:PB3UserConInfoListRes.class
                                           ServiceName:kNetUserStatusExtService
                                          functionName:@"UserConInfoList"
                                            completion:^(PB3UserConInfoListRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock) {
            completionBlock(rsp, errorMessage, nError.errorCode);
        }
    }];
}

//踢其它设备下线
- (void)kickOtherDeviceOffWithDeviceId:(NSString *)deviceId type:(PB3DeviceType)type complete:(void(^)(PB3UserDeviceDisconnectedRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    PB3UserDeviceDisconnectedReq *req = [PB3UserDeviceDisconnectedReq message];
    req.deviceId = deviceId;
    req.deviceType = type;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3UserDeviceDisconnectedRes class] ServiceName:kNetUserStatusExtService functionName:@"UserDeviceDisconnected" completion:^(PB3UserDeviceDisconnectedRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info)
     {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock) {
            completionBlock(rsp, errorMessage, nError.errorCode);
        }
    }];
}

#pragma mark -
- (NSAttributedString *)userRulesAttributedStringWithPrefix:(NSString *)prefix
{
    NSString *appUserRules = [[self appUserRule] objectForKey:@"title"];
    NSString *appPrivacyRules = [[self appPrivacyRule] objectForKey:@"title"];
    
    
    return [NSAttributedString new];
}

- (NSAttributedString *)carrierBindRulesAttributedStringWithTitle:(NSString *)title linkUrl:(NSString *)url
{
    
    NSString *fullText = [NSString stringWithFormat:@"绑定即同意并接受 %@ ", title];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:fullText];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:11.f]
                             range:NSMakeRange(0, fullText.length)];
    NSMutableParagraphStyle *paragraphStyle= [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:2];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, fullText.length)];
    
    UIColor *rulesColor = [UIColor hx_colorWithHexString:@"#5874FC"];
    NSRange titleRange = [fullText rangeOfString:title];
    if (titleRange.location != NSNotFound) {
        [attributedString addAttribute:NSForegroundColorAttributeName
                                 value:rulesColor
                                 range:NSMakeRange(titleRange.location, titleRange.length)];
    }
    
    return attributedString;
}

- (NSDictionary *)appUserRule
{
    NSString *appUserRules = @"《用户协议》";
    NSString *urlString = @"tmp";//[DYWebEntranceManager.sharedInstance urlWithType:kDYWebEntranceTypeUserService];
    NSDictionary *dict = @{kLoginServiceUserRuleTitleKey:appUserRules, kLoginServiceUserRuleUrlKey:urlString};
    return dict;
}

- (NSDictionary *)carrierUserRule
{
    NSString *appUserRules = @"《中国移动认证服务条款》";
    NSString *urlString = @"tmp";//[DYWebEntranceManager.sharedInstance urlWithType:kDYWebEntranceTypeUserService];
    NSDictionary *dict = @{kLoginServiceUserRuleTitleKey:appUserRules, kLoginServiceUserRuleUrlKey:urlString};
    return dict;
}

- (NSDictionary *)appPrivacyRule
{
    NSString *appUserRules = @"《隐私政策》";
    NSString *urlString = @"tmp";//[DYWebEntranceManager.sharedInstance urlWithType:kDYWebEntranceTypePrivacy];
    NSDictionary *dict = @{kLoginServiceUserRuleTitleKey:appUserRules, kLoginServiceUserRuleUrlKey:urlString};
    return dict;
}

- (NSDictionary *)appChildrenRule
{
#if ENABLE_ALIAS_CALLME
    NSString *appChildRules = [NSString stringWithFormat:@"《%@儿童隐私保护声明》", @"popo"];
#else
    NSString *appChildRules = [NSString stringWithFormat:@"《%@语音儿童隐私保护声明》", @"popo"];
#endif
    NSString *urlString = @"tmp";//[DYWebEntranceManager.sharedInstance urlWithType:kDYWebEntranceTypeChildrenPrivacy];
    NSDictionary *dict = @{kLoginServiceUserRuleTitleKey:appChildRules, kLoginServiceUserRuleUrlKey:urlString};
    return dict;
}

- (NSDictionary *)thirdPartyInfo
{
    NSString *thirdPartyTitle = @"《第三方SDK与第三方共享信息》";
    NSString *urlString = @"";
    NSDictionary *dict = @{kLoginServiceUserRuleTitleKey:thirdPartyTitle, kLoginServiceUserRuleUrlKey:urlString};
    return dict;
}

- (NSString *)smsErrorMsgWithCode:(int)code
{
    if (0 == code) return nil;
    NSString *errorMsg = nil;
    switch (code) {
        case 10:
            errorMsg = CustomLocalizedString(@"IM_CanNotoperateFrequent");
            break;
        case 11:
            errorMsg = @"Error-11";
            break;
        case 12:
            errorMsg = CustomLocalizedString(@"Login_PhoneVeryCodeFail");
            break;
        default:
            break;
    }
    return errorMsg;
}

- (void)handleLoginWithKey:(NSString *)key loginType:(LoginType)loginType isNew:(BOOL)isNew
{
    if (isNew) {
        DYLoginModel *model = [[DYLoginModel alloc] init];
        model.loginType = loginType;
        model.isNew = isNew;
        model.needPassword = NO;
        [self login:key loginModel:model];
    }
    else {
        [self login:key];
    }
}

- (PROTOSMSCodeTpl)getSmsCodeTplWithSmsType:(kLoginSmsType)smsType
{
    PROTOSMSCodeTpl smsCodeTpl = PROTOSMSCodeTpl_SmscodeTplZero;
    switch (smsType) {
        case kLoginSmsTypeLogin:
        {
            smsCodeTpl = PROTOSMSCodeTpl_SmscodeTplLogin;
            break;
        }
        case kLoginSmsTypeResetPwd:
        {
            smsCodeTpl = PROTOSMSCodeTpl_SmscodeTplResetPwd;
            break;
        }
        default:
        {
            NSAssert(NO, @"invalid smsCodeTpl:%d", smsCodeTpl);
            DYLogInfo(@"invalid smsCodeTpl:%d", smsCodeTpl);
            break;
        }
    }
    return smsCodeTpl;
}

#pragma mark -
- (void)loginWithReq:(GPBMessage *)req
        successBlock:(void (^)(PROTOCommonSignInRes *res))successBlock
           failBlock:(void (^)(ZYGNetRequestError *error))failBlock
{
    NSDictionary *dict = @{
        NSStringFromClass(PROTODevLoginReq.class)              : @"GetDevLogin",
        NSStringFromClass(PROTOIdOrPhoneLoginReq.class)        : @"GetIdOrPhoneLogin",
        NSStringFromClass(PROTOThirdLoginReq.class)            : @"GetThirdLogin",
        NSStringFromClass(PROTOLoginWithPhoneSMSReq.class)     : @"GetLoginWithPhoneSMSBySign",
        //        NSStringFromClass(PROTOChinaMobileQuickLoginReq.class) : @"GetChinaMobileQuickLogin",
        //        NSStringFromClass(PROTOChinaTelecomAuthReq.class)      : @"GetChinaTelecomAuth",
        NSStringFromClass(PROTOUmengQuickLoginReq.class)       : @"GetUmengQuickLogin",
        NSStringFromClass(PROTOSignInWithAppleReq.class)       : @"GetSignInWithApple",
        NSStringFromClass(PROTOAccountSubsidiaryLoginReq.class): @"AccountSubsidiaryLogin",
    };
    NSString *functionName = dict[NSStringFromClass(req.class)];
    
    NSString *token = self.token;
    if (self.loginKey.length) {
        token = self.loginKey;
    }
    
    // 这里添加这个是因为在登录页调用注册小号接口的时候，要做鉴权
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    if ([functionName isEqualToString:@"AccountSubsidiaryLogin"]) {
        opt[@"X-Token"] = token;
    }
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:opt
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PROTOCommonSignInRes class]
                                           ServiceName:kNetApiAuthExtService
                                          functionName:functionName
                                            completion:^(PROTOCommonSignInRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        [DYProgressHUD dismiss];
        if (error) {
            if (failBlock) failBlock(error);
            [self reportErrorCode:error.errorCode];
            if (error.errorMessage.length) {
                [DYProgressHUD showInfoWithStatus:error.errorMessage];
            }
            return;
        }
        
        self.isNew = rsp.isNew;
        
        void(^successAction)(PROTOCommonSignInRes *rsp) = ^(PROTOCommonSignInRes *rsp){
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationDidShortLogin object:@(rsp.userId)];
            if (successBlock) successBlock(rsp);
            // 短连接不可用时第一次获取tablist是失败的，为了确保正常操作，短连接登录完成后需触发一次拉取tabbarlist
        };
        
        void(^failedAction)(void) = ^{
            kDYLogModuleLogin.info(@"%@ attempt to launch anther task while there is exist one which is not completed.", NSStringFromClass([self class]));
            
            ZYGNetRequestError *ntError = [[ZYGNetRequestError alloc] init];
            ntError.domain = LoginServiceErrorDomain;
            ntError.errorCode = LoginServiceErrorCodeIsResigning;
            if (failBlock) failBlock(ntError);
        };
        
        if ([[rsp.extends objectForKey:@"isApplyLogoff"] boolValue]) {
            // 账号正在注销中
            if ([[rsp.extends objectForKey:@"isMultipleAccounts"] boolValue]) {
                [DYAccountPromptTool setPendingSignInRes:rsp];
                successAction(rsp);
            }
            else {
                NSInteger playerId = rsp.userId;
                if ([[rsp.extends objectForKey:@"playerSid"] integerValue]) {
                    playerId = [[rsp.extends objectForKey:@"playerSid"] integerValue];
                }
                
                [DYAccountPromptTool showPromptInMainThreadWithPlayerId:playerId endTime:[rsp.extends objectForKey:@"logoffExpired"] cancelResignAction:^{
                    if (successAction) {
                        successAction(rsp);
                    }
                } andResignAction:^{
                    if (failBlock) {
                        failBlock(nil);
                    }
                }];
            }
            
            return;
        }
        else if ([[rsp.extends objectForKey:@"verify_type"] length]) {
            PROTOVerifyType verifyType = [[rsp.extends objectForKey:@"verify_type"] integerValue];
            NSString *phoneString = [rsp.extends objectForKey:@"mask_phone"];
            NSInteger userId = rsp.userId;
            //         LoginNavigationController *loginNav = [self currentLoginNavigationController];
            //         [DYSafetyAuthorizationInterceptTool interruptWithVerifyType:verifyType navigationController:loginNav userId:userId phoneText:phoneString loginRes:rsp successCompletion:^(PROTOCommonSignInRes *loginRes) {
            //            if (successAction) {
            //               successAction(loginRes);
            //            }
            //         } failedCompletion:^{
            //            if (failBlock) {
            //               failBlock(nil);
            //            }
            //         }];
        }
        else {
            if (successAction) {
                successAction(rsp);
            }
        }
        
    }];
}

//加密
- (void)synEncryptWithString:(NSString *)string completeBlock:(void (^)(NSString *encodeStr, NSString *sign))completeBlock
{
    if (!completeBlock) return;
    
    PROTOUauthLoginPassword *model = [PROTOUauthLoginPassword message];
    model.password = string;
    int32_t time = (int32_t)ZYGNetworkTime.currentTime ;
    model.time = time;
    model.rand = arc4random();
    
    time = time & 0xFFFFFFFF;
    time = time | 0x000000FF;
    int32_t h = time;
    h ^= (h >> 20) ^ (h >> 12);
    int32_t key = h ^ (h >> 7) ^ (h >> 4);
    NSString *ct = [NSString stringWithFormat:@"%0x%s", key, "ajkgosrt$.1^3"];
    NSString *sign = ct.md5String;
    
    NSString *secretKey = @(key).stringValue;
    NSString *signString = sign;
    
    NSString *encodeStr = [XXTEA encryptToBase64String:model.data stringKey:secretKey];
    completeBlock(encodeStr, signString);
}

#pragma mark - Lanuch
- (void)loadLanuchConfigCompletion:(void(^)(PB3GetAppAdConfigRes *rsp, NSString *errorMessage, NSInteger errorCode))block
{
    PB3GetAppAdConfigReq *req = [PB3GetAppAdConfigReq message];
    //   req.version = [AppUtils bundleAppVersion];
    //   req.system = @"ios";
    ZYGNetworkServiceReqExtConfig *extConfig = ZYGNetworkServiceReqExtConfig.new;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3GetAppAdConfigRes class] channelType:ZYGChannelType_All needAuthed:NO ServiceName:kNetApiIndexExtService functionName:@"GetAppAdConfig" extendConfig:extConfig completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSString *errorMessage;
        if (error && error.errorMessage.length) {
            errorMessage = error.errorMessage;
            if (error.errorMessage.length) {
                errorMessage = error.errorMessage;
            }
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (block) {
            block(rsp, errorMessage, error.errorCode);
        }
    }];
}

#pragma mark - 登录打点相关
- (void)statisticLoginStartWithType:(LoginType)loginType
{
}

- (void)statisticLoginEndSuccessWithType:(LoginType)loginType
{
}

- (void)statisticLoginEndFailWithType:(LoginType)loginType
{
}

//获取typeString
- (NSString *)getLoginTypeStringWithType:(LoginType)type
{
    NSString *typeString;
    if (type == LoginTypeAccount) {
        typeString = @"AccountLogin";
    }
    else if (type == LoginTypeWebChat) {
        typeString = @"WebChatLogin";
    }
    else if (type == LoginTypeFacebook) {
        typeString = @"FacebookLogin";
    }
    else if (type == LoginTypePhoneSMS) {
        typeString = @"PhoneLogin";
    }
    else if (type == LoginTypePhonePass) {
        typeString = @"PhonePassLogin";
    }
    else if (type == LoginTypeQQ) {
        typeString = @"LoginTypeQQ";
    }
    else if (type == LoginTypePhoneOnly) {
        typeString = @"LoginTypePhoneOnly";
    }
    else if (type == LoginTypeUserId) {
        typeString = @"LoginTypeUserId";
    }else
    {
        typeString = @"Unknown";
    }
    return typeString;
}

#pragma mark - alias
//no comment, u know it
- (BOOL)isAppOnAir
{
    //   return NO;
    //   if (!AliasUtil.isAlias) return NO;
    
    NSString *onAirVersion = [SettingsData.sharedObject getValueForKey:kLoginManagerAliasOnAir];
    //   if (!onAirVersion) return YES;
    if (onAirVersion && [onAirVersion isKindOfClass:NSString.class]) {
        //打开才保存，只考虑删除重装的情况
        return NO;
    }
    
    //   if ([ZYGService(IPlayerService).switchModel isSwitchOnWithType:PB3OnOffType_Tg]) {
    //      //打开才保存，只考虑删除重装的情况
    //      [SettingsData.sharedObject setValue:@"" forKey:kLoginManagerAliasOnAir];
    //      return NO;
    //   }
    
    return YES;
}
#ifdef INTELNAL_VERSION
- (void)addLogServerPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj
{
    BOOL isEnableServerLog = [SettingsData.sharedObject getValueForKey:kSettingKeyServerLogTurnOn];
    if (!isEnableServerLog) {
        return;
    }
    if (!self.logArray) {
        self.logArray = [NSMutableArray array];
    }
}
#endif
- (NSArray *)logPushArray
{
    return self.logArray;
}

- (void)loadPurchaseItemWithCompletion:(void(^)(NSString *errMsg))completion {
    PROTOGetGoodListReq *req = [PROTOGetGoodListReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:[PROTOGetGoodListRes class] ServiceName:kNetApiAuthExtService functionName:@"GetGoodList" completion:^(PROTOGetGoodListRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"loadPurchaseItem = %@,error = %@", rsp, error);
        NSLog(@"loadPurchaseItem = %@,error = %@", rsp, error);
        if (completion) {
            completion(error.errorMessage);
        }
    }];
}

- (void)orderIAPWithProductID:(NSInteger)productId completion:(void(^)(NSString *errMsg))completion {
    PROTOOrderIAPReq *req = [PROTOOrderIAPReq message];
    req.id_p = productId;
    req.accountId = ZYGService(IPlayerService).accountID;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:[PROTOOrderIAPRes class] ServiceName:kNetApiAuthExtService functionName:@"OrderIAP" completion:^(PROTOOrderIAPRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"OrderIAPWithCompletion = %@,error = %@", rsp, error);
        NSLog(@"OrderIAPWithCompletion = %@,error = %@", rsp, error);
        if (completion) {
            completion(error.errorMessage);
        }
    }];
}

- (void)verifyIAPWithReceipe:(NSString *)receipt transationID:(NSString *)transationID productID:(NSString *)pID completion:(void(^)(NSString *errMsg))completion {
    PROTOVerifyIAPReq *req = [PROTOVerifyIAPReq message];
    req.receipt = receipt;
    req.transactionId = transationID;
    req.accountId = ZYGService(IPlayerService).accountID;
    req.goodsId = pID;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:[PROTOVerifyIAPRes class] ServiceName:kNetApiAuthExtService functionName:@"VerifyIAP" completion:^(PROTOVerifyIAPRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"verifyIAPWithcompletion = %@,error = %@", rsp, error);
        NSLog(@"verifyIAPWithcompletion = %@,error = %@", rsp, error);
        if (completion) {
            completion(error.errorMessage);
        }
    }];
}

- (void)appLaunchWithIP:(NSString *)ipaddr completion:(void(^)(NSString *errMsg))completion {
//    PB3ReportActivateAppInfoReq *req = [PB3ReportActivateAppInfoReq message];
//    req.ip = ipaddr;
//    req.action = @"App Launch";
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:[PB3ReportActivateAppInfoRes class] ServiceName:kNetApiIndexExtService functionName:@"GetActivateAppInfo" completion:^(PB3ReportActivateAppInfoRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        DYLogInfo(@"appLaunchWithIP = %@,error = %@", rsp, error);
//        NSLog(@"appLaunchWithIP = %@,error = %@", rsp, error);
//        if (completion) {
//            completion(error.errorMessage);
//        }
//    }];
}

@end
