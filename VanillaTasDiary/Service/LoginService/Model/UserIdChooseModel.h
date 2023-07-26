//
//  UserIdChooseModel.h
//  huhuAudio
//
//  Created by 刘勇航 on 2019/7/17.
//  Copyright © 2019年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UserAccounChannelType) {
    UserAccounChannelType_Zero = 0,
    UserAccounChannelType_Phone = 1,
    UserAccounChannelType_Qq = 2,
    UserAccounChannelType_Wechat = 3,
    UserAccounChannelType_AppleId = 4,
    UserAccounChannelType_Subsidiary = 5,
};

typedef NS_ENUM(NSUInteger, kDYLoginGender) {
    kDYLoginGenderUnkown = 0, // 未知
    kDYLoginGenderMale = 1, // 男
    kDYLoginGenderFemale = 2, // 女
};



@interface UserIdChooseModel : NSObject
@property (nonatomic, copy) NSString *name;  //用户名称
@property (nonatomic, copy) NSString *icon;  //用户头像
@property (nonatomic, assign) int64_t userId;  //用户Id
@property (nonatomic, assign) int64_t shotId;  //用户短号
@property (nonatomic, copy) NSString *typeImageName; // 用户账号类型图片名称
@property (nonatomic, assign) UserAccounChannelType type; // 用户账号类型
@property (nonatomic, assign) BOOL isShowIcon; // 是否展示用户账号类型图标
@property (nonatomic, assign) kDYLoginGender gender; // 性别

@end

NS_ASSUME_NONNULL_END
