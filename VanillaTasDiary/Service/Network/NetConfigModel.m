//
//  NetConfigModel.m
//  huhuAudio
//
//  Created by fish on 2017/5/15.
//  Copyright © 2018年 MiZhua. All rights reserved.
//

#import "NetConfigModel.h"
//#import "DYPlayerHelper.h"
#import <AlicloudHttpDNS/AlicloudHttpDNS.h>
#import <DYBusinessServices/INetworkConfigService.h>
#import <ZygoteFoundation/SettingsData.h>
#import <ZygoteNetwork/ZYGNetworkTime.h>
#import <ZygoteCategories/NSObject+DY.h>
#import <ZygoteFoundation/KiwiSDKMacro.h>
#import <ZygoteFoundation/DYTestModeDef.h>

NSString *const kNetApiServicePrefix = @"hydrogen";
NSString *const kNetApiConfigurationServicePrefix = @"appcommon";  //动态配置专用

NSString *kNetApiActivityExtService;
NSString *kNetApiAssetExtService;
NSString *kNetApiGiftExtService;
static NSString *kNetApiRoomExtService;
NSString *kNetApiFriendExtService;
NSString *kNetApiStoreExtService;
NSString *kNetApiUserExtService;
NSString *kNetApiIndexExtService;
NSString *kNetApiBillExtService;
NSString *kNetApiChatExtService;
// NSString *kNetApiEggExtService;
NSString *kNetApiPluginHomeExtService;
NSString *kNetApiUpgradeExtService;
NSString *kNetApiUpgradeExtServiceReport;
NSString *kNetApiAuthExtService;
NSString *kNetApiNobilityExtService;
NSString *kNetApiClanExtService;
NSString *kNetApiRoomPatternExtService;
NSString *kNetApiCouponExtService;
NSString *kNetApiKtvExtService;

//动态配置专用
NSString *kNetApiConfigurationExtService;

NSString *kNetApiConfigUresExtObjService;

NSString *kNetApiBillExtService;
NSString *kNetUserStatusExtService;

NSString *kNetApiEffectExtService;

#if ENABLE_ALIAS_CARAMEL
//连麦匹配专用
NSString *kNetApiLiveExtService;
#endif

NSString *const kNetConfigLocalCdnList = @"kNetConfigLocalCdnList";     //本地写死的CDN列表
NSString *const kNetConfigCachedCdnHost = @"kNetConfigCachedCdnHost";   //上次缓存可用的cdn
NSString *const kNetConfigCdnCheckTime = @"kNetConfigCdnCheckTime";   //上次检查cdn的时间缀
NSString *const kNetConfigCdnCheckVersion = @"kNetConfigCdnCheckVersion";   //远端cdn配置版本
const float kNetConfigCdnSwitchDuration = 60.f;                            //cdn检查的间隔

NSString *const kNetConfigCachedLongLinkHost = @"kNetConfigCachedLongLinkHost";   //上次缓存可用的长连接域名
NSString *const kNetConfigCachedShortLinkHost = @"kNetConfigCachedShortLinkHost"; //上次缓存可用的短连接域名

N_Def(kNotificationNetworkReachableChanged);

@interface NetCDNModel : NSObject
@property (nonatomic, strong) NSString *host;
@property (nonatomic, assign) BOOL isExpensiveHost;
@end

@implementation NetCDNModel
@end

@interface NetConfigModel()

@property(nonatomic, copy) NSString *theCDN;

@property (nonatomic, copy) NSString *staticHtml;  //静态网页前缀

@property (nonatomic, copy) NSString *ossHost;

@property (nonatomic, copy) NSString *appName;

@property (nonatomic, copy) NSString *selectedCdnHost;
@property (nonatomic, copy) NSString *selectedLongLinkHost;
@property (nonatomic, copy) NSString *selectedShortLinkHost;

@property (nonatomic, strong)NSArray <NSString *>*videoHosts;
@property (nonatomic, copy) NSString *selectedVideoHost;

@property (nonatomic, strong) NSArray *historyHosts;//历史域名列表

@end

@implementation NetConfigModel

+ (instancetype)shareInstance
{
    static NetConfigModel *share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[NetConfigModel alloc] init];
        share.longlinkHostList = [NSMutableArray array];
        share.shortLinkHostList = [NSMutableArray array];
        share.hostBlockSet = [NSMutableSet set];
        /*域名预解析列表*/
        share.preHTTPDNSArray = [NSMutableArray array];
        [share setNetApiExtService];
        
        kDYTest({
            //切换环境
            @weakify(share);
            [share dy_addObserver:kNotificationTestEnvChanged block:^(NSNotification *notification) {
                @strongify(share);
                [share clearCache];
            }];
        });
    });
    return share;
}

- (void)clearCache
{
    [self clearLinkHostCache];
    [self clearCachedCDN];
}

//是否是正式环境
- (BOOL)isRealSetting
{
    if (self.baseNetType == kServerTypeOfficial) {
        return YES;
    }
    return NO;
}

//增加域名解析
- (void)addPreHost:(NSString *)host
{
    if (!host) {
        return;
    }
    BOOL exist = NO;
    for (NSString *hostOld in self.preHTTPDNSArray) {
        if ([hostOld isEqualToString:host]) {
            exist = YES;
            break;
        }
    }
    if (!exist) {
        [self.preHTTPDNSArray addObject:host];
        [[HttpDnsService sharedInstance] setPreResolveHosts:self.preHTTPDNSArray];
    }
}

- (void)setURLByType:(kServerType)type {
    self.baseNetType = type;
    //获得网络配置的plist文件
    NSString *path     = [[NSBundle mainBundle] pathForResource:@"base_url" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];  //得到一个字典

    NSDictionary *urlDict = nil;
    if (type == kServerTypeOfficial) {  // 正式
        urlDict = [dict valueForKey:@"official"];
    }
    else if (type == kServerTypeDebug) {  //debug
        urlDict = [dict valueForKey:@"debug"];
    }
    else if (type == kServerTypeBeta ||
             type == kServerTypeAudit ||
             type == kServerTypePre) {  //测试服(包含beta/audit/pre)
        urlDict = [dict valueForKey:@"test"];
    }
    else if (type == kServerTypeOfficialOversea) {
        urlDict = [dict valueForKey:@"officialoversea"];
    }
    else if (type == kServerTypePressureTest) {
        urlDict = [dict valueForKey:@"pressuretest"];
    }
    else if (type == kServerTypeTxCloud) {
        urlDict = [dict valueForKey:@"txcloud"];
    }
    else if (type == kServerTypeTxCloudPre) {
        urlDict = [dict valueForKey:@"txcloudPre"];
    }
    else if (type == kServerTypeTxCloudBeta) {
        urlDict = [dict valueForKey:@"txcloudBeta"];
    }
    else if (type == kServerTypeTxCloudAudit) {
        urlDict = [dict valueForKey:@"txcloudAudit"];
    }

    NSString *scheme = [urlDict valueForKey:@"scheme"];
    NSString *host = [urlDict valueForKey:@"host"];
    NSString *socket = [urlDict valueForKey:@"socketHost"];

    NSString *port = [urlDict valueForKey:@"port"];
    NSString *oldCdn = [urlDict valueForKey:@"oldcdn"];
    NSString *theCDN = [urlDict valueForKey:@"cdn"];
    NSString *ossHost = [urlDict valueForKey:@"ossHost"];
    NSString *staticHtml = [urlDict valueForKey:@"staticHtml"];
    NSString *param = [urlDict valueForKey:@"param"];
    if (type == kServerTypeAudit) {
        param = @"/audit";
    }
    if (type == kServerTypePre) {
        param = @"/pre";
    }
    
    // 替换CND域名
    if (!self.selectedCdnHost) {
        NSString *cachedHost = [[SettingsData sharedObject] getValueForKey:kNetConfigCachedCdnHost];
        if (cachedHost && [cachedHost isKindOfClass:NSString.class]) {
            self.selectedCdnHost = cachedHost;
        }
    }
    
    if (self.selectedCdnHost) {
        oldCdn = self.selectedCdnHost;
        theCDN = self.selectedCdnHost;
        staticHtml = self.selectedCdnHost;
    }
    
    // 替换长连接域名
    if (!self.selectedLongLinkHost) {
        NSString *cachedHost = [[SettingsData sharedObject] getValueForKey:kNetConfigCachedLongLinkHost];
        if (cachedHost && [cachedHost isKindOfClass:NSString.class]) {
            self.selectedLongLinkHost = cachedHost;
        }
    }
    
    if (self.selectedLongLinkHost) {
        socket = self.selectedLongLinkHost;
    }
    
    // 替换短连接域名
    if (!self.selectedShortLinkHost) {
        NSString *cachedHost = [[SettingsData sharedObject] getValueForKey:kNetConfigCachedShortLinkHost];
        if (cachedHost && [cachedHost isKindOfClass:NSString.class]) {
            self.selectedShortLinkHost = cachedHost;
        }
    }
    
    if (self.selectedShortLinkHost) {
        host = self.selectedShortLinkHost;
    }
    
    self.theCDN    = theCDN;
    self.staticHtml = staticHtml;
    self.scheme        = scheme;
    self.host          = host;
    self.socketHost    = socket;
    self.shortLinkPort = [[urlDict valueForKey:@"shortlinkPort"] intValue];
    self.ossHost       = ossHost;
    
    self.param         = param;

    self.port      = [port intValue];
    self.url       = [NSString stringWithFormat:@"%@://%@", scheme, host];
    self.httpUrl   = [NSString stringWithFormat:@"%@/cache/servlet", self.url];
    self.uploadUrl = [NSString stringWithFormat:@"%@/res/uploading", self.url];
    self.oldCdn       = [NSString stringWithFormat:@"%@://%@", scheme, oldCdn];
    
    if ([NetworkConfig config].enable) {
        self.scheme = [NetworkConfig config].scheme;
        self.port = [NetworkConfig config].longlinkport;
        self.socketHost = [NetworkConfig config].longlinkip;
        self.host = [NetworkConfig config].shortlinkip;
        self.shortLinkPort = [NetworkConfig config].shortlinkport;
        self.oldCdn = [NetworkConfig config].cdnHost;
        self.theCDN = [NetworkConfig config].mobileHost;
        self.ossHost = [NetworkConfig config].ossHost;

        self.url       = [NSString stringWithFormat:@"%@://%@", self.scheme, self.host];
        self.httpUrl   = [NSString stringWithFormat:@"%@/cache/servlet", self.url];
        self.uploadUrl = [NSString stringWithFormat:@"%@/res/uploading", self.url];
        self.oldCdn       = [NSString stringWithFormat:@"%@://%@", self.scheme, self.oldCdn];
        self.staticHtml = [NetworkConfig config].staticHtml;
    }

    if (host) {
        [self.preHTTPDNSArray addObject:host];
    }
    if (oldCdn) {
        [self.preHTTPDNSArray addObject:oldCdn];
    }
    if (theCDN) {
        [self.preHTTPDNSArray addObject:theCDN];
    }
    if (staticHtml) {
        [self.preHTTPDNSArray addObject:staticHtml];
    }
    if (self.socketHost) {
        [self.preHTTPDNSArray addObject:self.socketHost];
    }
    if (ossHost) {
        [self.preHTTPDNSArray addObject:ossHost];
    }
    
    self.appName = @"oxygen";
}

- (void)setStaticHtml:(NSString *)staticHtml {
    // 这个东西本质上就是个域名，域名就得有域名的规范
    NSString *host = staticHtml;
    while ([host hasPrefix:@"/"]) {
        host = [host substringFromIndex:1];
    }
    
    while ([host hasSuffix:@"/"]) {
        host = [host substringToIndex:host.length - 1];
    }
    _staticHtml = host;
}

- (void)setNetApiExtService
{
    NSString *roomExt = @".room.RoomExtObj";
    kNetApiActivityExtService = [kNetApiServicePrefix stringByAppendingString:@".activity.ActivityExtObj"];
    kNetApiAssetExtService = [kNetApiServicePrefix stringByAppendingString:@".assets.AssetsExtObj"];
    kNetApiGiftExtService = [kNetApiServicePrefix stringByAppendingString:@".gift.GiftExtObj"];
    kNetApiRoomExtService = [kNetApiServicePrefix stringByAppendingString:@".room.RoomExtObj"];
    kNetApiFriendExtService = [kNetApiServicePrefix stringByAppendingString:@".friend.FriendExtObj"];
    kNetApiStoreExtService = [kNetApiServicePrefix stringByAppendingString:@".store.StoreExtObj"];
    kNetApiUserExtService = [kNetApiServicePrefix stringByAppendingString:@".user.UserExtObj"];
    kNetApiIndexExtService = [kNetApiServicePrefix stringByAppendingString:@".index.IndexExtObj"];
    kNetApiChatExtService = [kNetApiServicePrefix stringByAppendingFormat:@".chat.ChatExtObj"];
    // kNetApiEggExtService  = [kNetApiServicePrefix stringByAppendingString:@".crackegg.CrackEggExtObj"];
    kNetApiPluginHomeExtService = [kNetApiServicePrefix stringByAppendingString:@".phome.PHomeExtObj"];
    //动态配置专用
    kNetApiConfigurationExtService = [kNetApiConfigurationServicePrefix stringByAppendingString:@".dynconf.DynconfExtObj"];
    kNetApiBillExtService = [kNetApiServicePrefix stringByAppendingString:@".index.BillExt.pbobjc"];
    kNetApiCouponExtService = [kNetApiServicePrefix stringByAppendingString:@".coupon.CouponExtObj"];
    kNetApiKtvExtService = [kNetApiServicePrefix stringByAppendingString:@".ktv.KtvExtObj"];
    //
    kNetApiUpgradeExtService = [kNetApiServicePrefix stringByAppendingString:@".upgrade.UpgradeExtObj"];
    kNetApiUpgradeExtServiceReport = [kNetApiConfigurationServicePrefix stringByAppendingString:@".upgrade.UpgradeExtObj"];
    kNetApiAuthExtService = [kNetApiConfigurationServicePrefix stringByAppendingString:@".uauth.AuthExtObj"];
    kNetApiNobilityExtService = [kNetApiServicePrefix stringByAppendingString:@".nobility.NobilityExtObj"];
    kNetUserStatusExtService = [kNetApiServicePrefix stringByAppendingString:@".userstatus.UserStatusExtObj"];
    kNetApiEffectExtService = [kNetApiServicePrefix stringByAppendingString:@".effect.EffectExtObj"];
    kNetApiClanExtService = [kNetApiServicePrefix stringByAppendingString:@".clan.ClanExtObj"];
    kNetApiRoomPatternExtService = [kNetApiServicePrefix stringByAppendingString:@".room.RoomPatternExtObj"];
    kNetApiConfigUresExtObjService = [kNetApiConfigurationServicePrefix stringByAppendingString:@".ures.UresExtObj"];
#if ENABLE_ALIAS_CARAMEL
    //连麦匹配专用
    kNetApiLiveExtService = [kNetApiServicePrefix stringByAppendingString:@".live.LiveExtObj"];
#endif
}

- (NSString *)mobileHost
{
    return self.baseNetType == kServerTypeOfficial ?
    [NSString stringWithFormat:@"%@://%@",self.scheme , self.theCDN]:
    [NSString stringWithFormat:@"%@://%@",self.scheme , self.theCDN];
}

- (NSString *)mobileStaticPath
{
    return self.baseNetType == kServerTypeOfficial ?
    [NSString stringWithFormat:@"%@/pages",self.mobileHost]:
    [NSString stringWithFormat:@"%@/alpha/pages",self.mobileHost];
}

- (NSString *)ossHostPath
{
    return [NSString stringWithFormat:@"%@://%@",self.scheme , self.ossHost];
}

//视频路径
- (NSString *)voideHostPath
{
#warning TODO liuyonghang 暂时如果服务器下发则使用服务器给的域名
    if (self.videoHosts.count) {
        return self.videoHosts.firstObject;
    }
    
    NSString *videoHosts = @"https://vodtx.2tianxin.com";
    switch ([NetConfigModel shareInstance].baseNetType) {
        case kServerTypeOfficial: {
            videoHosts = @"https://vodtx.2tianxin.com";
        }
            break;
        case kServerTypeDebug:
        case kServerTypeBeta: {
            videoHosts = @"https://vodtx-beta.2tianxin.com";
        }
            break;
        case kServerTypeAudit: {
            videoHosts = @"https://vodtx-beta.2tianxin.com";
        }
            break;
        case kServerTypePre: {
            videoHosts = @"https://vodtx-pre.2tianxin.com";
        }
            break;
        case kServerTypePressureTest: {
            videoHosts = @"https://vodtx-beta.2tianxin.com";
        }
            break;
        default: {
            NSAssert(NO, @"voideHostPath type error");
        }
            break;
    }
    return videoHosts;
}

- (NSString *)htmlUrlWithModule:(NSString *)module path:(NSString *)path
{
    return self.baseNetType == kServerTypeOfficial ?
    [NSString stringWithFormat:@"https://%@/%@/%@",self.staticHtml,module,path]:
    [NSString stringWithFormat:@"https://%@%@/%@/%@",self.staticHtml,self.param,module,path];
}

- (NSString *)htmlUrlWithModule:(NSString *)module detailPath:(NSString *)detailPath
{
    return self.baseNetType == kServerTypeOfficial ?
    [NSString stringWithFormat:@"%@://%@/%@/index.html?%@",self.scheme,self.theCDN, module,detailPath.length?detailPath:@""] :
    [NSString stringWithFormat:@"%@://%@%@/%@/index.html?%@",self.scheme,self.theCDN,self.param,module,detailPath.length?detailPath:@""];
}

- (NSString *)htmlUrlConfigWithBasePath:(NSString *)path isGlobal:(BOOL)isGlobal {
    NSString *param = self.param;
    NSString *appName = self.appName;
        
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:path];
    [urlComponents setScheme:@"https"];
    [urlComponents setHost:[self staticHtml]];
    
    NSString *wholePath = @"";
    if (isGlobal) {
        if (![self isRealSetting]) {
            wholePath = [wholePath stringByAppendingPathComponent:param];
        }
    }
    else {
        wholePath = [wholePath stringByAppendingPathComponent:param];
        wholePath = [wholePath stringByAppendingPathComponent:appName];
    }
    
    wholePath = [wholePath stringByAppendingPathComponent:urlComponents.path];
    [urlComponents setPath:wholePath];

    return urlComponents.URL.absoluteString;
}

- (BOOL)isHistoryHost:(NSString *)host {
    if (DYCheckInvalidAndKindOfClass(host, NSString)) return NO;
    if (self.historyHosts.count) {
        return [self.historyHosts containsObject:host];
    }
    return [[self localHistoryHosts] containsObject:host];
}

- (NSArray<NSString *> *)localHistoryHosts {
    return @[@"daxieda.com",
             @"m.daxieda.com",
             @"m.haozeh2o.com",
             @"m.shuntongtong.com",
             @"m.xiaojingyuapp.cn",
             @"m.yangqiyuyin.com",
             @"mt.shuntongtong.com",
             @"mx.shuntongtong.com",
             @"www.daxieda.com",
             @"www.shuntongtong.com"
    ];
}

+ (NSURL *)redirectHostInUrl:(NSURL*)originUrl
{
    NSString *originHostString = [originUrl host];
    if (originHostString.length == 0) {
        return originUrl;
    }
    NSString *originUrlString = [originUrl absoluteString];
    NSRange hostRange = [originUrlString rangeOfString:originHostString];
    if (hostRange.location == NSNotFound) {
        return originUrl;
    }
    NSString *resolveDomain = [ZYGService(IZYGNetworkService) preResolveDomain:originHostString];
    NSURL *url = originUrl;
    if (resolveDomain) {
        NSString *urlString = [originUrlString stringByReplacingCharactersInRange:hostRange withString:resolveDomain];
        url = [NSURL URLWithString:urlString];
    }
    return url;
}

+ (NSString *)ossCallbackServiecNameWithType:(kOSSCallbackServerType)serviceType
{
    NSString *serviceName = @"";
    NSString *server = @"mizhua";
    if ([NetConfigModel shareInstance].baseNetType == kServerTypeAudit) {
        server = @"mizhuaAut";
    }
    
    if ([NetConfigModel shareInstance].baseNetType == kServerTypePre) {
        server = @"mizhuaTmp";
    }
    switch (serviceType) {
        case kOSSCallbackServerTypeUser:
            serviceName = @".user.UserIntObj";
            break;
        case kOSSCallbackServerTypePhome:
            serviceName = @".phome.PHomeIntObj";
            break;
        case kOSSCallbackServerTypeIndex:
            serviceName = @".index.IndexIntObj";
            break;
        default:
            NSAssert(NO, @"kOSSCallbackServerTypeundefined status:%@", @(serviceType));
            break;
    }
    serviceName = [NSString stringWithFormat:@"%@%@",server,serviceName];
    return serviceName;
}

#pragma mark -
- (void)triggerCDNSwith
{
    //海外测试服才不触发cdn切换
    kDYTest({
        if (kServerTypeOfficialOversea == [NetConfigModel shareInstance].baseNetType) return;
    });
    
    id netConfigCdnCheckTime = [[SettingsData sharedObject] getValueForKey:kNetConfigCdnCheckTime];
    if ([netConfigCdnCheckTime isKindOfClass:NSString.class] ||
        [netConfigCdnCheckTime isKindOfClass:NSNumber.class]) {
        NSInteger checkTime = [(NSNumber *)netConfigCdnCheckTime integerValue];
        if (ZYGNetworkTime.currentTime - checkTime < kNetConfigCdnSwitchDuration) return;
    }
    
    NSMutableArray<NetCDNModel *> *cdnHostList = nil;
    NSMutableArray<NetCDNModel *> *expensiveCdnHostList = nil;
    
//    NSDictionary *jsonHost = [ZYGService(IDynamicConfigurationService) dictionaryValueWithType:kDynamicConfigurationGroupTypeBase key:@"cdnHosts"];
//
//    if (jsonHost) {
//        NSString *version = jsonHost[@"ver"];
//        if (version && [version isKindOfClass:NSString.class]) {
//            NSString *localVersion = [[SettingsData sharedObject] getValueForKey:kNetConfigCdnCheckVersion];
//            if (!localVersion ||
//                ![localVersion isKindOfClass:NSString.class] ||
//                ![version isEqualToString:localVersion]) {
//                [[SettingsData sharedObject] setValue:version forKey:kNetConfigCdnCheckVersion];
//
//                NSArray *hosts = jsonHost[@"hosts"];
//                if (hosts && [hosts isKindOfClass:NSArray.class] && hosts.count) {
//                    [[SettingsData sharedObject] setValue:hosts forKey:kNetConfigLocalCdnList];
//                    cdnHostList = [self setupCDNHostWithList:hosts isExpensive:NO];
//                }
//                NSArray *historyHosts = jsonHost[@"historyHosts"];
//                if (historyHosts && [historyHosts isKindOfClass:NSArray.class] && historyHosts.count) {
//                    self.historyHosts = historyHosts;
//                }
//            }
//        }
        
//        NSArray *backupHosts = jsonHost[@"backupHost"];
//        if (backupHosts && [backupHosts isKindOfClass:NSArray.class] && backupHosts.count) {
//            expensiveCdnHostList = [self setupCDNHostWithList:backupHosts isExpensive:YES];
//        }
//        NSArray *videoHosts = jsonHost[@"videoHosts"];
//        if (videoHosts && [videoHosts isKindOfClass:NSArray.class] && videoHosts.count) {
//            self.videoHosts = [self setupVideoHostWithList:videoHosts isExpensive:NO];
//        }
//    }
    
//    if (!cdnHostList.count) {
//        //本地会把cdnHosts的列表顺序进行调整
//        NSArray *localCDNList = [[SettingsData sharedObject] getValueForKey:kNetConfigLocalCdnList];
//        if (localCDNList && [localCDNList isKindOfClass:NSArray.class] && localCDNList.count) {
//            cdnHostList = [self setupCDNHostWithList:localCDNList isExpensive:NO];
//        }
//    }
//    if (!cdnHostList.count) {
//        NSArray<NSString *> *list = @[@"mx.shuntongtong.com", @"m.shuntongtong.com"];
//        kDYTest({
//            if (kServerTypeOfficial != [NetConfigModel shareInstance].baseNetType) list = @[@"m.2tianxin.com"];
//        });
//        [[SettingsData sharedObject] setValue:list forKey:kNetConfigLocalCdnList];
//        cdnHostList = [self setupCDNHostWithList:list isExpensive:NO];
//    }
//    if (!expensiveCdnHostList.count) {
//        NSArray<NSString *> *backupCdnHosts = @[@"xinyu-zhuazhua-web.oss-cn-hangzhou.aliyuncs.com"];
//        expensiveCdnHostList = [self setupCDNHostWithList:backupCdnHosts isExpensive:YES];
//    }
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        __block NetCDNModel *selectedModel = nil;
//        NSArray *hostList = [cdnHostList arrayByAddingObjectsFromArray:expensiveCdnHostList];
//        [hostList enumerateObjectsUsingBlock:^(NetCDNModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
//            if (![model isKindOfClass:NetCDNModel.class]) return;
//            NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://%@/show-net.png?t=%ld", model.host, ZYGNetworkTime.currentTime]];
//            //NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://%@/show-net.png", @"www.abcsfdf.com"]];
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            if (data) {
//                selectedModel = model;
//                *stop = YES;
//            }
//        }];
//        //backup的hosts由于成本比较高，默认不选中
//        if (!selectedModel.isExpensiveHost) {
//            [[SettingsData sharedObject] setValue:selectedModel.host forKey:kNetConfigCachedCdnHost];
//        }
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[SettingsData sharedObject] setValue:@(ZYGNetworkTime.currentTime) forKey:kNetConfigCdnCheckTime];
//            if (!selectedModel) {
//                DYLogInfo(@"selectedModel is nil");
//                return;
//            }
//            if (!selectedModel.isExpensiveHost) {
//                [cdnHostList removeObject:selectedModel];
//                [cdnHostList insertObject:selectedModel atIndex:0];
//                NSMutableArray *cachedList = [NSMutableArray array];
//                [cdnHostList enumerateObjectsUsingBlock:^(NetCDNModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    [cachedList addObject:obj.host];
//                }];
//                [[SettingsData sharedObject] setValue:cachedList forKey:kNetConfigLocalCdnList];
//            }
//            if (![self.selectedCdnHost isEqualToString:selectedModel.host] &&
//                self.didUpdateCDNBlock) {
//                self.selectedCdnHost = selectedModel.host;
//                self.didUpdateCDNBlock(selectedModel.host);
//            }
//        });
//    });
}

- (void)setSelectedCdnHost:(NSString *)selectedCdnHost
{
    _selectedCdnHost = selectedCdnHost;
    
    if (selectedCdnHost.length) {
        DYLogInfo(@"selectedCdnHost:%@", selectedCdnHost);
    }
}

- (NSMutableArray<NetCDNModel *> *)setupCDNHostWithList:(NSArray *)list
                                            isExpensive:(BOOL)isExpensive
{
    NSMutableArray *cdnHostList = [NSMutableArray array];
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:NSString.class] || !obj.length) return;
        NetCDNModel *model = [NetCDNModel new];
        model.host = obj;
        model.isExpensiveHost = isExpensive;
        [cdnHostList addObject:model];
    }];
    return cdnHostList;
}

- (NSMutableArray<NSString *> *)setupVideoHostWithList:(NSArray *)list
                                            isExpensive:(BOOL)isExpensive
{
    NSMutableArray *videoHostList = [NSMutableArray array];
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:NSString.class] || !obj.length) return;
        [videoHostList addObject:obj];
    }];
    return videoHostList;
}


- (void)clearCachedCDN
{
    [[SettingsData sharedObject] removeValueForKey:kNetConfigCdnCheckTime];
    [[SettingsData sharedObject] removeValueForKey:kNetConfigLocalCdnList];
    [[SettingsData sharedObject] removeValueForKey:kNetConfigCachedCdnHost];
    [[SettingsData sharedObject] removeValueForKey:kNetConfigCdnCheckVersion];
    
    self.selectedCdnHost = nil;
}

//房间协议
- (NSString *)roomExtService
{
    return kNetApiRoomExtService;
}

#pragma mark - Host for long|short link

// 添加长连接备用列表
- (void)addLongLinkHostList:(NSArray *)hostList
{
    if (!hostList || ![hostList isKindOfClass:[NSArray class]]) {
        return;
    }
    [self.longlinkHostList addObjectsFromArray:hostList];
    for (NSString *host in hostList) {
        if ([self.longlinkHostList containsObject:host]) {
            continue;
        }
        [self addPreHost:self.socketHost];
        [self.longlinkHostList addObject:host];
    }
    DYLogInfo(@"Add long link host list: %@", hostList);
}

// 添加短连接备用列表
- (void)addShortLinkHostList:(NSArray *)hostList
{
    if (!hostList || ![hostList isKindOfClass:[NSArray class]]) {
        return;
    }
    [self.shortLinkHostList addObjectsFromArray:hostList];
    for (NSString *host in hostList) {
        if ([self.shortLinkHostList containsObject:host]) {
            continue;
        }
        [self addPreHost:self.socketHost];
        [self.shortLinkHostList addObject:host];
    }
    DYLogInfo(@"Add short link host list: %@", hostList);
}

// 选中长短连接域名
- (void)selectLinkHost:(NSString *)host forChannelType:(ZYGChannelType)channelType
{
    if (DYCheckInvalidAndKindOfClass(host, NSString)) {
        return;
    }
    if (channelType == ZYGChannelType_LongConn) {
        [[SettingsData sharedObject] setValue:host forKey:kNetConfigCachedLongLinkHost];
        self.selectedLongLinkHost = host;
        self.socketHost = host;
        if (self.didUpdateLongLinkHostBlock) {
            self.didUpdateLongLinkHostBlock(host);
        }
    } else if (channelType == ZYGChannelType_ShortConn) {
        [[SettingsData sharedObject] setValue:host forKey:kNetConfigCachedShortLinkHost];
        self.selectedShortLinkHost = host;
        self.host = host;
        if (self.didUpdateShortLinkHostBlock) {
            self.didUpdateShortLinkHostBlock(host);
        }
    }
}

- (void)clearLinkHostCache
{
    [[SettingsData sharedObject] removeValueForKey:kNetConfigCachedLongLinkHost];
    [[SettingsData sharedObject] removeValueForKey:kNetConfigCachedShortLinkHost];
    self.selectedLongLinkHost = nil;
    self.selectedShortLinkHost = nil;
    [self.hostBlockSet removeAllObjects];
}

#if ENABLE_ALIAS_CARAMEL
+ (NSString *)handleStaticURL:(NSString *)url
{
    return [NSString stringWithFormat:@"%@/%@/%@%@", [NetConfigModel shareInstance].mobileHost,
                                      @"oxygen", url];
}

+ (NSString *)appendingParamToUrl:(NSString *)url param:(NSString *)param
{
    if (!url.length || !param.length || [url containsString:param]) {
        return url;
    }
    NSString *urlString = url;

    NSString * (^appendingParam)(NSString *url, NSString *param) = ^(NSString *url, NSString *param) {
        return [url stringByAppendingFormat:[NSURL URLWithString:url].query ? @"&%@" : @"?%@", param];
    };

    NSArray *urlArray = [urlString componentsSeparatedByString:@"#"];

    if (urlArray.count == 2) {
        return [NSString stringWithFormat:@"%@#%@", appendingParam(urlArray[0], param), urlArray[1]];
    }
    else {
        return appendingParam(url, param);
    }
}
#endif

@end
