//
//  DYPlayerHelper.h
//  XHX
//
//  Created by flyhuang on 2018/11/20.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYPlayerHelper : NSObject


//获取(0:小图，1:大图)
//+ (NSURL *) photoStrUrl:(NSString *) targetIcon  byType:(int) type;

//是否事王者荣耀游戏
+(BOOL)isKingglorg:(NSString*)content;

//图片地址显示规则
//图片地址显示规则type==0表示小图,1表示大图
+ (NSURL *) photoStrUrl:(NSString *) key type:(int) type;

+ (NSURL *)photoUrlWithKey:(NSString *)key type:(int)type;

//获取随机数（from 到 to）
+(NSInteger)getRandomNumber:(NSInteger)from to:(NSInteger)to;

#if ENABLE_ALIAS_CARAMEL || ENABLE_ALIAS_CALLME
//获取头像,0=120*120;1=800*600;2=300*300
+ (NSURL *)headImageByIcon:(NSString *)targetIcon byType:(int32_t)type;
#endif

@end

