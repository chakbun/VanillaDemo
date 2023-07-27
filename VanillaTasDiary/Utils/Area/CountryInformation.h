//
//  CountryInformation.h
//  GDLiveStreaming
//
//  Created by 
//  Copyright © 2016年 Larry Tin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kCountryInformationHotPrefix;

@interface CountryInformation : NSObject

@property (nonatomic, strong) NSDictionary *phoneCodeDictonary;//国家电话区号信息

@property (nonatomic, strong) NSDictionary  *countryNameDictonary;//国家信息

+ (instancetype) shareCountryInformation;


//获得电话区号
- (NSString *) phoneCodeByCountryCode:(NSString *) countryCode;


//根据国家编号，获取国家名称
- (NSString *) countryNameCodeByCountryCode:(NSString *) countryCode;


//获得当前手机设置的国家名称
- (NSString *) currentcountryName;
//获得当前手机设置的国家编号
- (NSString *)currentcountryCode;



@end
