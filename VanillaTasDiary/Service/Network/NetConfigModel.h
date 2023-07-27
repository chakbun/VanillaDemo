//
//  NetConfigModel.h
//  huhuAudio
//
//  Created by fish on 2017/5/15.
//  Copyright © 2018年 MiZhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZygoteNetwork/IZYGNetworkService.h>

typedef NS_ENUM(NSInteger, kServerType) {
    kServerTypeOfficial = 0,    //正式服
    kServerTypeDebug,           //debug
    kServerTypeBeta,            //beta
    kServerTypeAudit,           //审核服
    kServerTypePre,             //预发布
    kServerTypeOfficialOversea, //海外加速测试
    kServerTypePressureTest,    //压测服
    kServerTypeTxCloud,         //腾讯服
    kServerTypeTxCloudPre,      //腾讯服(预发布)
    kServerTypeTxCloudBeta,     //腾讯服(beta)
    kServerTypeTxCloudAudit,    //腾讯服(audit)
};

//OSS上传回掉的服务器
typedef NS_ENUM(NSInteger, kOSSCallbackServerType) {
    kOSSCallbackServerTypeDefault = 0,
    kOSSCallbackServerTypeUser,
    kOSSCallbackServerTypePhome,
    kOSSCallbackServerTypeIndex,
};

extern NSString *const kNetApiServicePrefix;
//extern NSString *const kNetApiActivityServicePrefix;    //活动房间专用

extern NSString *kNetApiActivityExtService;
extern NSString *kNetApiAssetExtService;
extern NSString *kNetApiGiftExtService;
//extern NSString *kNetApiRoomExtService;
extern NSString *kNetApiFriendExtService;
extern NSString *kNetApiStoreExtService;
extern NSString *kNetApiUserExtService;
extern NSString *kNetApiIndexExtService;
// extern NSString *kNetApiEggExtService;
extern NSString *kNetApiPluginHomeExtService;
//活动房间专用
//extern NSString *kNetApiActivityRoomExtService;
//动态配置专用
extern NSString *kNetApiConfigurationExtService;
//
extern NSString *kNetApiBillExtService;
extern NSString *kNetApiUpgradeExtService;
extern NSString *kNetApiUpgradeExtServiceReport;
extern NSString *kNetApiAuthExtService;

extern NSString *kNetApiNobilityExtService;
extern NSString *kNetUserStatusExtService;
extern NSString *kNetApiChatExtService;
extern NSString *kNetApiEffectExtService;
extern NSString *kNetApiCouponExtService;

extern NSString *kNetApiClanExtService;
extern NSString *kNetApiRoomPatternExtService;
extern NSString *kNetApiKtvExtService;
extern NSString *kNetApiConfigUresExtObjService;

N_Dec(kNotificationNetworkReachableChanged);

#if ENABLE_ALIAS_CARAMEL
//连麦匹配专用
extern NSString *kNetApiLiveExtService;
#endif

@interface NetConfigModel : NSObject

@property (nonatomic, copy) NSString *scheme;

@property (nonatomic, copy) NSString *httpUrl;  //带一些公共部分的信息
@property (nonatomic, copy) NSString *url;      //
@property (nonatomic, copy) NSString *uploadUrl;
@property (nonatomic, copy) NSString *host;
@property (nonatomic, copy) NSString *socketHost;  //只负责socket连接
@property (nonatomic, copy) NSString *oldCdn;         //用来下载各种资源的

@property (nonatomic, readonly, copy) NSString *staticHtml;  //静态网页前缀

@property (nonatomic, copy) NSString *param;
@property (nonatomic, readonly, copy) NSString *appName;

@property (nonatomic, assign) int port;
@property (nonatomic, assign) int shortLinkPort;

@property (nonatomic, assign) NSInteger currentSocketIndex;  // 当前下标

@property (nonatomic, strong) NSMutableArray *preHTTPDNSArray;  //域名预解析列表

@property (nonatomic, assign) kServerType baseNetType;

@property (nonatomic, copy) NSString *ossCallbackServiecName;  //oss 上传回掉时的serviecName

@property (nonatomic, strong) NSMutableArray *longlinkHostList;  // 备用长连接域名列表
@property (nonatomic, strong) NSMutableArray *shortLinkHostList; // 备用短连接域名列表
@property (nonatomic, strong) NSMutableSet *hostBlockSet;        // 单次启动过程中不可用的域名集合，监测到不可用后不再启用

//cdn切换回调
@property (nonatomic, copy) void (^didUpdateCDNBlock)(NSString *cdnHost);
//长连接域名切换回调
@property (nonatomic, copy) void (^didUpdateLongLinkHostBlock)(NSString *host);
//短连接域名切换回调
@property (nonatomic, copy) void (^didUpdateShortLinkHostBlock)(NSString *host);

+ (instancetype)shareInstance;
- (void)clearCache;

//是否是正式环境
- (BOOL)isRealSetting;

- (void)setURLByType:(kServerType) type;

//静态页面host
- (NSString *)mobileHost;

//资源下载路径
- (NSString *)ossHostPath;

//视频路径
- (NSString *)voideHostPath;

- (NSString *)htmlUrlConfigWithBasePath:(NSString *)path isGlobal:(BOOL)isGlobal;

//静态前端页面路径,module为模块名字
- (NSString *)htmlUrlWithModule:(NSString *)module path:(NSString *)path;
- (NSString *)htmlUrlWithModule:(NSString *)module detailPath:(NSString *)detailPath;

//判断域名是否在历史域名列表里
- (BOOL)isHistoryHost:(NSString *)host;

+ (NSURL *)redirectHostInUrl:(NSURL*)originUrl;

+ (NSString *)ossCallbackServiecNameWithType:(kOSSCallbackServerType)serviceType;

//cdn切换
- (void)triggerCDNSwith;
//cdn缓存清除
- (void)clearCachedCDN;

/*
 *  房间协议
 *  请求时不要直接使用，请用
 *  ZYGService(IRoomService).currentRoomExtServiceName
 *
 */
- (NSString *)roomExtService;

//添加备用长连接列表
- (void)addLongLinkHostList:(NSArray *)hostList;
//添加备用短连接列表
- (void)addShortLinkHostList:(NSArray *)hostList;
//选中长短连接域名
- (void)selectLinkHost:(NSString *)host forChannelType:(ZYGChannelType)channelType;
//清除长短连接缓存
- (void)clearLinkHostCache;

#if ENABLE_ALIAS_CARAMEL
+ (NSString *)handleStaticURL:(NSString *)url;

+ (NSString *)appendingParamToUrl:(NSString *)url param:(NSString *)param;
#endif

@end
