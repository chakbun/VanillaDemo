//
//  DYAppKeyList.m
//  huhuAudio
//
//  Created by qiupeng on 2019/8/26.
//  Copyright © 2019 XYWL. All rights reserved.
//

#import "DYAppKeyList.h"
#import <ZygoteFoundation/YYModel.h>

@interface DYAppKeyList () <YYModel>

@end

@implementation DYAppKeyList

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"umengAppid": @"umeng_appid",
             @"umengAppidDebug": @"umeng_appid_debug",
             @"umengAppkey": @"umeng_appkey",
             @"umengAppkeyDebug": @"umeng_appkey_debug",
             
             @"facebookAppid": @"facebook_appid",
             @"buglyAppidDebug": @"bugly_appid_debug",
             @"buglyAppkeyDebug": @"bugly_appkey_debug",
             @"buglyAppkey": @"bugly_appkey",
             @"buglyAppid": @"bugly_appid",
             @"weixinAppid": @"weixin_appid",
             @"qqAppid":  @"qq_appid",
             @"qqSchema": @"qq_schema",             
             @"imsdkAppid": @"imsdk_appid",
             @"imsdkTLSAppid": @"imsdk_tls_appid",
             @"imsdkAppidDebug": @"imsdk_appid_debug",
             @"imsdkTLSAppidDebug": @"imsdk_tls_appid_debug",
             @"imsdkAppidPre": @"imsdk_appid_pre",
             @"imsdkTLSAppidPre": @"imsdk_tls_appid_pre",
             @"imsdkAppidAudit": @"imsdk_appid_audit",
             @"imsdkTLSAppidAudit": @"imsdk_tls_appid_audit",
             @"imsdkAppidTx": @"imsdk_appid_tx",
             @"imsdkTLSAppidTx": @"imsdk_tls_appid_tx",
             @"imsdkAppidTxPre": @"imsdk_appid_tx_pre",
             @"imsdkTLSAppidTxPre": @"imsdk_tls_appid_tx_pre",
             @"imsdkAppidTxBeta": @"imsdk_appid_tx_beta",
             @"imsdkTLSAppidTxBeta": @"imsdk_tls_appid_tx_beta",
             @"imsdkAppidTxAudit": @"imsdk_appid_tx_audit",
             @"imsdkTLSAppidTxAudit": @"imsdk_tls_appid_tx_audit",
             @"gmeAppid": @"gme_appid",
             @"gmeAppkey": @"gme_appkey",
             @"gmeAppidDebug": @"gme_appid_debug",
             @"gmeAppkeyDebug": @"gme_appkey_debug",
             @"gmeAppidPre": @"gme_appid_pre",
             @"gmeAppkeyPre": @"gme_appkey_pre",
             @"gmeAppidTx": @"gme_appid_tx",
             @"gmeAppkeyTx": @"gme_appkey_tx",
             @"gmeAppidTxBeta": @"gme_appid_tx_beta",
             @"gmeAppkeyTxBeta": @"gme_appkey_tx_beta",
             @"gmeAppidTxPre": @"gme_appid_tx_pre",
             @"gmeAppkeyTxPre": @"gme_appkey_tx_pre",
             @"agoraAppid": @"agora_appid",
             @"agoraAppidDebug": @"agora_appid_debug",
             @"neteaseAppid": @"netease_appid",
             @"neteaseAppidDebug": @"netease_appid_debug",
             @"dyrpcID": @"dyrpc_id",
             @"chinaMobileAppid": @"china_mobile_appid",
             @"chinaMobileAppkey": @"china_mobile_appkey",
             @"chinaTelecomAppid": @"china_telecom_appid",
             @"chinaTeltecomAppkey": @"china_teltecom_appkey",
             @"chinaFlyerAppid": @"china_flyer_appid",
             @"trackingIOAppKey": @"tracking_io_appkey",
             @"tencentUGCAppId": @"tencent_ugc_appid",
             @"tencentUGCAppKey": @"tencent_ugc_appkey",
             @"tencentFaceVertifyAppId": @"tencent_faceVertify_appid",
             @"tencentFaceVertifyDebugAppId": @"tencent_faceVertify_appid_debug",
             @"tencentFaceVertifyAppKey": @"tencent_faceVertify_licence",
             @"tencentFaceVertifyDebugAppKey": @"tencent_faceVertify_licence_debug",
             @"ameAppId": @"ame_appid",
             @"ameAppKey": @"ame_appkey"
             };
}


@end
