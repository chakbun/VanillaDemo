//
//  AppDelegate.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/25.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <ZygoteNetwork/IZYGConnectorService.h>
#import "NetConfigModel.h"
#import "VTDSharedDefault.h"

@interface AppDelegate ()<ZYGNetWorkServiceDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)relaunchNetwork {
    //默认为正式环境
    [[NetConfigModel shareInstance] setURLByType:kServerTypeOfficial];
    
    //初始化网络
    ZYGNetworkServiceConfig* config = [ZYGNetworkServiceConfig new];
    config.appId  = @"1"; //[DYAppKeyManager sharedInstance].dyrpcSdkConfig.appId;
    config.schema = [NetConfigModel shareInstance].scheme;
    config.longLinkHost = [NetConfigModel shareInstance].socketHost;
    config.longLinkPort = [NetConfigModel shareInstance].port;
    config.shortLinkHost = [NetConfigModel shareInstance].host;
    config.shortLinkPort = [NetConfigModel shareInstance].shortLinkPort;
    
    config.mobileStaticHost = [NSURL URLWithString:[NetConfigModel shareInstance].mobileHost].host;
    
    config.proxy = @"proxymsg";
    config.cdnLink = [NetConfigModel shareInstance].oldCdn;
    config.ossLink = [NetConfigModel shareInstance].mobileHost;
    config.servicePrefix = kNetApiServicePrefix;
    
    NSLog(@"use longlinkHost:%@:%d" , config.longLinkHost, config.longLinkPort);
    NSLog(@"use shortLinkPort:%@:%d", config.shortLinkHost, config.shortLinkPort);
    
    // 添加短链接服务列表，该列表内的服务全部走短连接
    config.shortConnectServiceSet = [NSSet setWithObjects:kNetApiPluginHomeExtService, nil];
    
    [ZYGService(IZYGNetworkService) configWith:config];
    //[ZYGService(IZYGNetworkService) setBackupIp:config.longLinkHost ips:@[@"47.107.14.55"]];
    [ZYGService(IZYGNetworkService) makeSureLongLink];

    ZYGService(IZYGNetworkService).delegate = self;
}

- (void)willSendRequestWithConfig:(ZYGNetworkServiceReqConfig *)config channelType:(ZYGChannelType)channelType {
    NSLog(@"==============> willSendRequestWithConfig %@ %@",config.serviceName,config.functionName);
    config.header[@"lang"] = VTDSharedDefault.shared.languageCode;
    //TODO: 处理下面的参数来源
//    config.header[@"no_auth_id"] = [NSString stringWithFormat:@"%@", @(ZYGService(IPlayerService).accountID ?:ZYGService(IPlayerService).playId)];
//    config.header[@"application"] = @"breathinglove";
//    config.header[@"app"] = @"breathinglove";
//    config.header[@"uid"] = [NSString stringWithFormat:@"%@", @(ZYGService(IPlayerService).accountID ?:ZYGService(IPlayerService).playId)];
//
//    if ([config.serviceName hasPrefix:@"platform"]) {
//        config.header[@"device_type"] = [NSString stringWithFormat:@"%d", 2];
//    } else {
//        config.header[@"device_type"] = [NSString stringWithFormat:@"%d", PB3DeviceType_DtIosPhone];
//    }
//
//    //新注册用户，需要在header带上注册时间，方便服务器更新首页缓存等操作
//    if (ZYGService(ILoginService).currentNewUserId > 0 &&
//        ZYGService(ILoginService).newUserRegisterTimestamp > 0) {
//        config.header[@"create-time"] = [NSString stringWithFormat:@"%lld", ZYGService(ILoginService).newUserRegisterTimestamp];
//    }

    kServerType baseNetType = [NetConfigModel shareInstance].baseNetType;
    if (kServerTypeBeta == baseNetType) {
        config.header[@"env"] = @"beta";
    } else if (kServerTypeAudit == baseNetType) {
        config.header[@"env"] = @"audit";
    } else if (kServerTypePre == baseNetType) {
        config.header[@"env"] = @"pre";
    } else if (kServerTypeTxCloudPre == baseNetType) {
        config.header[@"env"] = @"pre";
    } else if (kServerTypeTxCloudBeta == baseNetType) {
        config.header[@"env"] = @"beta";
    } else if (kServerTypeTxCloudAudit == baseNetType) {
        config.header[@"env"] = @"audit";
    }
    config.header[@"env"] = @"pre";
    config.header[@"appid"] = @"153";

    if ([config.serviceName isEqualToString:kNetApiConfigurationExtService]) {
        config.cgi = @"https://pub-dt-ops.shuntongtong.com/proxycommon";
    }
//    int64_t roomId = ZYGService(IRoomService).roomId;
//    if (roomId > 0) {
//        config.header[@"roomid"] = [NSString stringWithFormat:@"%lld", roomId];
//    }
//    //去掉长链接时请求头的X-Token
//    if (ZYGChannelType_LongConn != channelType) {
//        NSString *loginKey = ZYGService(ILoginService).loginKey.length ? ZYGService(ILoginService).loginKey : ZYGService(ILoginService).token;
//        if (loginKey.length) {
//            config.header[@"X-Token"] = [NSString stringWithFormat:@"%@", loginKey];
//        }
//    }
}
- (bool)makesureAuthed
{
    return ZYGService(IZYGConnectorService).isLongLinkAuthed;
}

@end
