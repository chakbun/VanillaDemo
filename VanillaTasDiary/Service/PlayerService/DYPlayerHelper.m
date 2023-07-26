//
//  DYPlayerHelper.m
//  XHX
//
//  Created by flyhuang on 2018/11/20.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import "DYPlayerHelper.h"
#import "NetConfigModel.h"

@implementation DYPlayerHelper

//是否事王者荣耀游戏
+(BOOL)isKingglorg:(NSString*)content
{
    if (![content isKindOfClass:[NSString class]] || content.length <= 0) {
        return NO;
    }
    if ([content rangeOfString:@"://gamecenter.qq.com/gcjump?appid="].location != NSNotFound) {
        return YES;
    }
    return NO;
}

//图片地址显示规则type==0表示小图,1表示大图
+ (NSURL *) photoStrUrl:(NSString *) key type:(int) type{
    if (key==nil || [key isEqualToString:@""] ) {
        return nil;
    }
    if (![key hasSuffix:@".jpg"]) {
        return nil;
    }
    NSString *url=nil;
    NSMutableString *mutStr=[NSMutableString stringWithString:key];
    
    NSRange rang=[key rangeOfString:@".jpg"];
    [mutStr  deleteCharactersInRange:rang];
    if (type==0) {
        [mutStr insertString:@"_0" atIndex:rang.location];
        url=[NSString stringWithFormat:@"%@/upload/pm/%@/%@/%@.xyp",[NetConfigModel shareInstance].oldCdn,[key substringToIndex:4],[key substringToIndex:8],mutStr];
    }else{
        url=[NSString stringWithFormat:@"%@/upload/pm/%@/%@/%@.xyp",[NetConfigModel shareInstance].oldCdn,[key substringToIndex:4],[key substringToIndex:8],mutStr];
    }
    
    return [NSURL URLWithString:url];
}

+ (NSURL *)photoUrlWithKey:(NSString *)key type:(int)type
{
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    BOOL hasXYPSuffix = NO;
    if ([key hasSuffix:@".xyp"]) {
        hasXYPSuffix = YES;
    }
    if (![key hasSuffix:@".jpg"] &&
        !hasXYPSuffix) {
        return nil;
    }
    
    NSString *url = nil;
    NSMutableString *mutStr = [NSMutableString stringWithString:key];
    NSRange rang;
    if (hasXYPSuffix) {
        rang = [key rangeOfString:@".xyp"];
        [mutStr  deleteCharactersInRange:rang];
    }
    else {
        rang = [key rangeOfString:@".jpg"];
        [mutStr  deleteCharactersInRange:rang];
    }
    if (type == 0) {
        [mutStr insertString:@"_0" atIndex:rang.location];
    }
    url = [NSString stringWithFormat:@"%@/upload/pm/%@/%@/%@.xyp", [NetConfigModel shareInstance].oldCdn, [key substringToIndex:4], [key substringToIndex:8], mutStr];
    
    return [NSURL URLWithString:url];
}


#pragma mark----内部方法
//获取随机数（from 到 to）
+(NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to

{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

#if ENABLE_ALIAS_CARAMEL || ENABLE_ALIAS_CALLME
//获取头像,0=120*120;1=800*600;2=300*300
+ (NSURL *)headImageByIcon:(NSString *)targetIcon byType:(int32_t)type
{
    if (targetIcon.length < 4) {
        return nil;
    }

    NSString *headImg = [self headImageFullUrlByIcon:targetIcon byType:type];
    NSURL *url        = [NSURL URLWithString:headImg];
    return url;
}

+ (NSString *)headImageFullUrlByIcon:(NSString *)targetIcon byType:(int32_t)type
{
    if (targetIcon.length < 4) {
        return nil;
    }

    //    alpha/
    //    beta/
    //    prod/
    //    upload/alpha/
    //    upload/beta/
    //    upload/prod/
    NSString *param = NetConfigModel.shareInstance.param;
    if ([targetIcon hasPrefix:param] || [targetIcon hasPrefix:[NSString stringWithFormat:@"upload/%@", param]]) {
        NSString *sizeStr = @"x-oss-process=image/format,webp";
        switch (type) {
            case 0: {
                sizeStr = @"x-oss-process=image/resize,w_120/format,webp";
            } break;
            case 1: {
                sizeStr = @"x-oss-process=image/resize,w_300/format,webp";
            } break;
            case 2: {
                sizeStr = @"x-oss-process=image/resize,w_600/format,webp";
            } break;
            case 3: {
                sizeStr = @"x-oss-process=image/resize,w_800/format,webp";
            } break;
            case 4: {
                sizeStr = @"x-oss-process=image/format,webp";
            } break;
            default:
                break;
        }
        NSString *headImg =
            [NSString stringWithFormat:@"%@/%@?%@", [NetConfigModel shareInstance].mobileHost, targetIcon, sizeStr];

        return headImg;
    }
    else {
        NSString *headImg =
            [NSString stringWithFormat:@"%@/upload/icon/%@/%@/%@_%@.webp", [NetConfigModel shareInstance].oldCdn,
                                       [targetIcon substringToIndex:2], [targetIcon substringToIndex:4], targetIcon, @(type)];
        return headImg;
    }
}
#endif

@end
