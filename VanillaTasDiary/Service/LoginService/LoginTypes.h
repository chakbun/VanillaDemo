//
//  LoginTypes.h
//  huhuAudio
//
//  Created by EasyinWan on 2019/3/2.
//  Copyright © 2019 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kLoginServiceToken = @"UserKey";

static NSString * const kLoginServiceUserRuleTitleKey = @"title";
static NSString * const kLoginServiceUserRuleUrlKey = @"urlString";

typedef NS_ENUM(NSInteger, LoginState) {
    LoginNo = 0,    //未登录
    Logging,        //登录中
    Logged,         //已登录
    LoginTimerOut,  //登录超时
    LoggedFail,//登录失败
};

//typedef NS_ENUM(int32_t, kLoginType)
//{
//    kLoginTypeDefault = 0,
//    kLoginTypeUserId,           //用户ID+密码
//    kLoginTypeMobilePhone,      //用户手机+密码
//    kLoginTypePhoneNumOnly,     //手机直登
//    kLoginTypeWechat,           //微信
//    kLoginTypeQQ,               //QQ
//};

typedef NS_ENUM(NSInteger, kLoginSmsType) {
    kLoginSmsTypeDefault = 0,   //空值
    kLoginSmsTypeLogin,         //登录、注册
    kLoginSmsTypeResetPwd,      //重置密码    
};

typedef NS_ENUM(NSInteger, LoginType) {
    LoginTypeAccount = 0,  //无密码帐号登录（万能登录）
    LoginTypeWebChat,      //微信登录
    LoginTypeFacebook,     // Facebook登录
    LoginTypePhoneSMS,     //手机号+短信登录
    LoginTypeQQ,           // QQ登录
    LoginTypeWeiBo,        //微博登录
    LoginTypePhoneOnly,    //手机号一键登录
    LoginTypeUserId,       //用户ID+密码
    LoginTypePhonePass,    //手机号+密码
    LoginTypeApple,        //苹果登录
};

@interface DYLoginModel : NSObject

@property (nonatomic, assign) LoginType loginType;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, assign) BOOL needPassword;

@end

DYLogModule(Login);
