//
//  DYAppKeyConfig.h
//  XHX
//
//  Created by flyhuang on 2018/10/26.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

//QQ APPID
#define QQAPPID [DYAppKeyManager sharedInstance].qqConfig.appId
#define QQScheme [DYAppKeyManager sharedInstance].qqConfig.schema

#define weiboAppID [DYAppKeyManager sharedInstance].weiboConfig.appId
#define weiXinAppID [DYAppKeyManager sharedInstance].weixinConfig.appId

#define WEIXIN_APPID [DYAppKeyManager sharedInstance].weixinConfig.appId
#define QQ_APPID [DYAppKeyManager sharedInstance].qqConfig.appId
#define FACEBOOK_APPID [DYAppKeyManager sharedInstance].facebookConfig.appId

#define kQQCustomerServiceID @"3007559131"

@interface DYAppkeyConfig : NSObject

@property (nonatomic, strong) NSString* appId;
@property (nonatomic, strong) NSString* appKey;
@property (nonatomic, strong) NSString* appSecret;
@property (nonatomic, strong) NSString* schema;
@property (nonatomic, strong) NSString* redirectUrl;

@property (nonatomic, strong) NSString* tlsAppId;
@property (nonatomic, strong) NSString* accountType;

@property (nonatomic, assign) BOOL enable;

@end

@interface DYAppKeyManager : NSObject

WF_AS_SINGLETION(DYAppKeyManager);

- (DYAppkeyConfig*)umengConfig;

- (DYAppkeyConfig*)facebookConfig;

- (DYAppkeyConfig*)buglyConfig;

- (DYAppkeyConfig*)weixinConfig;

- (DYAppkeyConfig*)qqConfig;

- (DYAppkeyConfig*)imsdkConfig;

- (DYAppkeyConfig*)gmeSdkConfig;

- (DYAppkeyConfig *)agoraSdkConfig;

- (DYAppkeyConfig *)neteaseSdkConfig;

- (DYAppkeyConfig *)dyrpcSdkConfig;

//中国移动SDK
- (DYAppkeyConfig *)chinaMobileSdkConfig;

//中国电信SDK
- (DYAppkeyConfig *)chinaTelecomSdkConfig;

- (DYAppkeyConfig *)appFlyerConfig;

- (DYAppkeyConfig *)mizhuaShareConfig;

- (DYAppkeyConfig *)trackingIOConfig;
//短视频编辑SDK
- (DYAppkeyConfig *)tencentUGCConfig;

//人脸识别SDK
- (DYAppkeyConfig *)tencentFaceVertifyCConfig;

- (DYAppkeyConfig *)ameSdkConfig;

+ (NSString *)innerVersion;

@end
