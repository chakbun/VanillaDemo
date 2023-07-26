//
//  ConfigCenterComponentTypes.h
//  huhuAudio
//
//  Created by Easyin Wan on 2020/7/22.
//  Copyright © 2020 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (int32_t, kZYGCarrierType)
{
    kZYGCarrierTypeNotKnown = 0,
    kZYGCarrierTypeChinaMobile,        //中国移动
    kZYGCarrierTypeChinaUnicom,        //中国联通
    kZYGCarrierTypeChinaTelecom,       //中国电信
};

typedef NS_ENUM (int32_t, kZYGAuthCallbackType)
{
    kZYGAuthCallbackTypeNotKnown = 0,
    kZYGAuthCallbackTypeFetchInfo,
    kZYGAuthCallbackTypeGetToken,        
};

typedef NS_ENUM (int64_t, kZYGErrorCode)
{
    kZYGErrorCodeSuccess = 0,
    kZYGErrorCodeCellularUnaccessible = 600008,      //请检查手机蜂窝网络及APP网络使用权限是否开启
};
