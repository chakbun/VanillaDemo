//
//  AppDelegate.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/25.
//

#import "AppDelegate.h"
#import "VTDLoginViewController.h"
#import <ZygoteNetwork/IZYGConnectorService.h>
#import "NetConfigModel.h"
#import "VTDSharedDefault.h"
#import "ILoginProtocol.h"
#import <ZygoteServiceCenter/ZYGServiceMediator.h>
#import <ZygoteServiceCenter/ZYGServiceCenter.h>

@interface AppDelegate ()<ZYGNetWorkServiceDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    VTDLoginViewController *loginViewController = [[VTDLoginViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ZYGServiceConfig *config  = [[ZYGServiceConfig alloc] init];
    config.servicesPlistPath = [[NSBundle mainBundle] pathForResource:@"ZYGServices" ofType:@"plist"];
    [ZYGServiceMediator setupWithConfig:config];
    
    ZYGService(ILoginService);
    [self relaunchNetwork];
    [NetConfigModel shareInstance].didUpdateCDNBlock = ^(NSString *cdnHost) {
        DYLogInfo(@"CDN host selection trigger reset network, selected cdn host: %@", cdnHost);
        [self relaunchNetwork];
    };
    
    [NetConfigModel shareInstance].didUpdateLongLinkHostBlock = ^(NSString *host) {
        DYLogInfo(@"Long link host update for net config, selected host: %@", host);
        [self relaunchNetwork];
        [ZYGService(IZYGNetworkService) networkChanged];
    };
    
    [NetConfigModel shareInstance].didUpdateShortLinkHostBlock = ^(NSString *host) {
        DYLogInfo(@"Short link host update for net config, selected host: %@", host);
        [ZYGService(IZYGNetworkService) resetShortLinkHost:host];
    };
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *ipAddr = [self getNetworkIPAddress];
        [ZYGService(ILoginService) appLaunchWithIP:ipAddr completion:NULL];
    });
    
    return YES;
}

- (void)relaunchNetwork {
    //默认为正式环境
    [[NetConfigModel shareInstance] setURLByType:kServerTypeOfficial];
    
    //初始化网络
    ZYGNetworkServiceConfig* config = [ZYGNetworkServiceConfig new];
    config.appId  = @"33"; //[DYAppKeyManager sharedInstance].dyrpcSdkConfig.appId;
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
- (bool)makesureAuthed {
    return ZYGService(IZYGConnectorService).isLongLinkAuthed;
}

- (NSString *)getNetworkIPAddress {
    NSURL *ipURL = [NSURL URLWithString:@"https://api64.ipify.org/"];
    NSError *error;
    NSString *ipAddr = [NSString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    return (ipAddr ? ipAddr : @"0.0.0.0");
}

@end
