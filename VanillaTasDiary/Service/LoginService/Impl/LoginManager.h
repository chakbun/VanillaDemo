//
//  LoginManeger.h
//  19LIVE
//
//  Created by weicaiyu on 17/2/10.
//  Copyright © 2017年 XinYu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ILoginProtocol.h"

@interface LoginManager : NSObject<ILoginService>

WF_AS_SINGLETION(LoginManager)

@property (nonatomic, assign) LoginState loginState;  //登录状态

@end
