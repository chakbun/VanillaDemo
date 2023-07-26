//
//  DYAccount.h
//  huhuAudio
//
//  Created by EasyinWan on 2019/2/26.
//  Copyright © 2019 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginTypes.h"

@interface DYAccount : NSObject<NSCoding>

@property (nonatomic, readonly, copy) NSString *accountId;        //账号ID
@property (nonatomic, readonly, copy) NSString *showOffId;        //靓号ID
@property (nonatomic, readonly, copy) NSString *avatarUrlString;  //头像
@property (nonatomic, readonly, assign) LoginType loginType;       //登录模式

- (instancetype)initWithAccountId:(NSString *)accountId
                        showOffId:(NSString *)showOffId
                  avatarUrlString:(NSString *)avatarUrlString
                        loginType:(LoginType)loginType;

- (void)updateWithShowOffId:(NSString *)showOffId;

- (NSString *)phone;

- (NSString *)countryPhoneCode;

@end
