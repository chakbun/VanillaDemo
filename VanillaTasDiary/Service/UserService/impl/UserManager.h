//
//  UserManager.h
//  huhuAudio
//
//  Created by 刘勇航 on 2018/12/4.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProtocol.h"

@interface UserManager : NSObject<ZYGNetWorkServiceBroadCastDelegate,UserService>

WF_AS_SINGLETION(UserManager)

@end
