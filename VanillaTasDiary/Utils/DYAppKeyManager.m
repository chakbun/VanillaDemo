//
//  DYAppKeyConfig.m
//  XHX
//
//  Created by flyhuang on 2018/10/26.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import "DYAppKeyManager.h"
#import <DYBusinessServices/INetworkConfigService.h>
#import <DYBusinessServices/NetworkConfig.h>

//bugly product
#define buglyAppID @"521acad469"
#define buglyAppKey @"c7ed6fd5-e896-4f57-8e80-02283dbfc09d"

//buglyTest
#define buglyTestAppID @"d4fc017c34"
#define buglyTestAppKey @"0b67a465-c1f4-440f-967d-fa4c0edc2c03"

#ifdef INTELNAL_VERSION
#import <ZygoteFoundation/SettingsData.h>

#endif

#import "DYAppKeyList.h"
#import <ZygoteFoundation/YYModel.h>

#import "ILoginProtocol.h"
#import "NetConfigModel.h"

@implementation DYAppkeyConfig

@end

@interface DYAppKeyManager ()

@property (nonatomic, strong) DYAppKeyList *keyList;

@end

@implementation DYAppKeyManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"config_appkey" withExtension:@"json"];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        if (data) {
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.keyList = [DYAppKeyList yy_modelWithJSON:obj];
        }
    }
    return self;
}

WF_DEF_SINGLETION(DYAppKeyManager);

- (DYAppkeyConfig*)umengConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    
    if ([NetConfigModel shareInstance].baseNetType==kServerTypeOfficial) {
        //cfg.appId = @"5b505142a40fa3013f00022d";
        cfg.appId = self.keyList.umengAppid;
        cfg.appKey = self.keyList.umengAppkey;
    }else{
        //cfg.appId = @"5baaf345f1f55687df00027b";
        cfg.appId = self.keyList.umengAppidDebug;
        cfg.appKey = self.keyList.umengAppkeyDebug;
    }
    
    return cfg;
}

- (DYAppkeyConfig*)facebookConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    //cfg.appId = @"fb10378254921";
    cfg.appId = self.keyList.facebookAppid;
    return cfg;
}

- (DYAppkeyConfig*)buglyConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    
    if ([VersionHelper isSnapshotVersion] || [VersionHelper isDebugVersion]) {
        //cfg.appId = buglyTestAppID;
        cfg.appId = self.keyList.buglyAppidDebug;
    } else {
        //cfg.appId = buglyAppID;
        cfg.appId = self.keyList.buglyAppid;
    }
    
    return cfg;
}

- (DYAppkeyConfig*)weixinConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
//    cfg.appId = [LoginConfig config].wxAppid.length
//    ? [LoginConfig config].wxAppid
//    : self.keyList.weixinAppid;
    //: @"wx918845352a606297";
    NSString *appId = nil;
    BOOL enable = YES;
    cfg.enable = enable;
    return cfg;
}

- (DYAppkeyConfig*)qqConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
//    cfg.appId  = [LoginConfig config].qqAppid.length
//    ? [LoginConfig config].qqAppid
//    : self.keyList.qqAppid;
    //: @"101411299";
    NSString *appId = nil;
    BOOL enable = YES;
    cfg.enable = enable;
    return cfg;
}

- (DYAppkeyConfig*)imsdkConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    
    //offical
//    cfg.appId = @"1400066193";
//    cfg.tlsAppId = @"1400066193";
    cfg.appId = self.keyList.imsdkAppid;
    cfg.tlsAppId = self.keyList.imsdkTLSAppid;
    
    
    NetworkConfig* config = [NetworkConfig config];
    
    if ([config remoteImAppId].length &&
        [config remoteImTlsAppId].length){
        cfg.appId = [config remoteImAppId];
        cfg.tlsAppId = [config remoteImTlsAppId];
    }
    
    kDYTest({
        NSUInteger selectedType = [[SettingsData.sharedObject getValueForKey:kSettingKeyTestServerType] longLongValue];
        
        if (selectedType == kServerTypeOfficial) {
            cfg.appId = self.keyList.imsdkAppid;
            cfg.tlsAppId = self.keyList.imsdkTLSAppid;

            DYLogInfo(@"使用Official IMSDK");
        } else if (selectedType == kServerTypeAudit) {
            cfg.appId = self.keyList.imsdkAppidAudit;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidAudit;

            DYLogInfo(@"使用Audit IMSDK");
        } else if (selectedType == kServerTypePre) {
            cfg.appId = self.keyList.imsdkAppidPre;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidPre;

            DYLogInfo(@"使用PRE IMSDK");
        }  else if (selectedType == kServerTypeTxCloud) {
            cfg.appId = self.keyList.imsdkAppidTx;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidTx;

            DYLogInfo(@"使用TX IMSDK");
        } else if (selectedType == kServerTypeTxCloudPre) {
            cfg.appId = self.keyList.imsdkAppidTxPre;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidTxPre;
            
            DYLogInfo(@"使用TX Pre IMSDK");
        } else if (selectedType == kServerTypeTxCloudBeta) {
            cfg.appId = self.keyList.imsdkAppidTxBeta;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidTxBeta;
            
            DYLogInfo(@"使用TX Beta IMSDK");
        } else if (selectedType == kServerTypeTxCloudAudit) {
            cfg.appId = self.keyList.imsdkAppidTxAudit;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidTxAudit;
            
            DYLogInfo(@"使用TX Audit IMSDK");
        } else {
            cfg.appId = self.keyList.imsdkAppidDebug;
            cfg.tlsAppId = self.keyList.imsdkTLSAppidDebug;

            DYLogInfo(@"使用测试版IMSDK");
        }
    });
    
//    if (AliasUtil.isAlias &&
//        ZYGService(ILoginService).isAppOnAir) {
//        cfg.appId = self.keyList.imsdkAppidDebug;
//        cfg.tlsAppId = self.keyList.imsdkTLSAppidDebug;
//        
//        DYLogInfo(@"使用测试版IMSDK");
//    }
    
    return cfg;
}

- (DYAppkeyConfig*)gmeSdkConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    
//    cfg.appId = @"1400148210";
//    cfg.appKey = @"uXY53uBNVTPFcRHL";
    
    cfg.appId = self.keyList.gmeAppid;
    cfg.appKey = self.keyList.gmeAppkey;
    
    NetworkConfig* config = [NetworkConfig config];
    
    if ([config remoteGmeAppId].length &&
        [config remoteGmeAppkey].length){
        cfg.appId = [config remoteGmeAppId];
        cfg.appKey = [config remoteGmeAppkey];
    }
    
    kDYTest({
        if (![[NetConfigModel shareInstance] isRealSetting]) {
            //test mode
//            cfg.appId = @"1400169063";
//            cfg.appKey = @"xZcVdEJwycjQv8O3";
            
            NSUInteger selectedType = [[SettingsData.sharedObject getValueForKey:kSettingKeyTestServerType] longLongValue];
            
            if (selectedType == kServerTypePre) {
                cfg.appId = self.keyList.gmeAppidPre;
                cfg.appKey = self.keyList.gmeAppkeyPre;
            }  else if (selectedType == kServerTypeTxCloud) {
                cfg.appId = self.keyList.gmeAppidTx;
                cfg.appKey = self.keyList.gmeAppkeyTx;
            } else if (selectedType == kServerTypeTxCloudPre) {
                cfg.appId = self.keyList.gmeAppidTxPre;
                cfg.appKey = self.keyList.gmeAppkeyTxPre;
            } else if (selectedType == kServerTypeTxCloudBeta) {
                cfg.appId = self.keyList.gmeAppidTxBeta;
                cfg.appKey = self.keyList.gmeAppkeyTxBeta;
            } else if (selectedType == kServerTypeTxCloudAudit) {
                cfg.appId = self.keyList.gmeAppidTxBeta;
                cfg.appKey = self.keyList.gmeAppkeyTxBeta;
            } else {
                cfg.appId = self.keyList.gmeAppidDebug;
                cfg.appKey = self.keyList.gmeAppkeyDebug;
            }
            
            DYLogInfo(@"使用测试版语音SDK");
        }
    });

    
    return cfg;
}

- (DYAppkeyConfig *)agoraSdkConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
#ifdef DEBUG
    //cfg.appId = @"7a1d7524812b4f689c29f72aeed05f13";
    cfg.appId = self.keyList.agoraAppidDebug;
#else
    //cfg.appId = @"b01ad31e4a6f469c90dab4bd4f6c616c";
    cfg.appId = self.keyList.agoraAppid;
#endif    
    return cfg;    
}

- (DYAppkeyConfig *)neteaseSdkConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    cfg.appId = self.keyList.neteaseAppid;
    kDYTest({
        if (![[NetConfigModel shareInstance] isRealSetting]) {
            cfg.appId = self.keyList.neteaseAppidDebug;
            DYLogInfo(@"使用测试版语音SDK");
        }
    });
    return cfg;
}

- (DYAppkeyConfig *)dyrpcSdkConfig
{
    DYAppkeyConfig* cfg = [DYAppkeyConfig new];
    cfg.appId = @"33";
    return cfg;
}

- (DYAppkeyConfig *)chinaMobileSdkConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    //cfg.appId = @"300011883009";
    //cfg.appKey = @"001430D1A352ACEDE0A76646C41C170E";
    
    cfg.appId = self.keyList.chinaMobileAppid;
    cfg.appKey = self.keyList.chinaMobileAppkey;
    return cfg;
}

- (DYAppkeyConfig *)chinaTelecomSdkConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    //cfg.appId = @"8023525007";
    //cfg.appKey = @"MuX0oWEsKUmJurMa9IrN2blML4adwb9G";
    
    cfg.appId = self.keyList.chinaTelecomAppid;
    cfg.appKey = self.keyList.chinaTeltecomAppkey;
    return cfg;
}

- (DYAppkeyConfig *)appFlyerConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    //cfg.appId = @"1455450133";
    //cfg.appKey = @"D5MdoE75CTziWAZD4YEWCE";//这个key没换
    
    cfg.appId = self.keyList.chinaFlyerAppid;
    cfg.appKey = self.keyList.chinaFlyerAppkey;
    return cfg;
}

- (DYAppkeyConfig *)mizhuaShareConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    cfg.enable = YES;
    return cfg;
}

- (DYAppkeyConfig *)trackingIOConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    cfg.appId = self.keyList.trackingIOAppId;
    cfg.appKey = self.keyList.trackingIOAppKey;
    return cfg;
}

- (DYAppkeyConfig *)tencentUGCConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    cfg.appId = self.keyList.tencentUGCAppId;
    cfg.appKey = self.keyList.tencentUGCAppKey;
    return cfg;
}

- (DYAppkeyConfig *)tencentFaceVertifyCConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    
    cfg.appId = self.keyList.tencentFaceVertifyAppId;
    cfg.appKey = self.keyList.tencentFaceVertifyAppKey;
    
    kDYTest({
        if (![[NetConfigModel shareInstance] isRealSetting]) {
            cfg.appId = self.keyList.tencentFaceVertifyDebugAppId;
            cfg.appKey = self.keyList.tencentFaceVertifyDebugAppKey;
        }
    });
    
    return cfg;
}

- (DYAppkeyConfig *)ameSdkConfig
{
    DYAppkeyConfig *cfg = [DYAppkeyConfig new];
    
    return cfg;
}

+ (NSString *)innerVersion {
    return @"6.0.0";
}

@end
