//
//  DYAccount.m
//  huhuAudio
//
//  Created by EasyinWan on 2019/2/26.
//  Copyright © 2019 XYWL. All rights reserved.
//

#import "DYAccount.h"
#import <ZygoteFoundation/YYModel.h>

@interface DYAccount ()

@property (nonatomic, copy) NSString *accountId;        //账号ID
@property (nonatomic, copy) NSString *showOffId;        //靓号ID
@property (nonatomic, copy) NSString *avatarUrlString;  //头像
@property (nonatomic, assign) LoginType loginType;       //登录模式

@end

@implementation DYAccount

- (instancetype)initWithAccountId:(NSString *)accountId
                        showOffId:(NSString *)showOffId
                  avatarUrlString:(NSString *)avatarUrlString
                        loginType:(LoginType)loginType
{
    if (self = [super init]) {
        _accountId = accountId;
        _showOffId = showOffId;
        _avatarUrlString = avatarUrlString;
        _loginType = loginType;
    }
    return self;
}

- (void)updateWithShowOffId:(NSString *)showOffId
{
    kDYLogModuleLogin.info(@"showOffId:%@", showOffId);
    _showOffId = showOffId;
}

- (NSString *)phone
{
    if (LoginTypePhonePass != _loginType) return nil;
    NSArray<NSString *> *list = [_accountId componentsSeparatedByString:@"_"];
    return list.count >= 2 ? list[1] : nil;
}

- (NSString *)countryPhoneCode
{
    if (LoginTypePhonePass != _loginType) return nil;
    NSArray<NSString *> *list = [_accountId componentsSeparatedByString:@"_"];
    return list.count >= 2 ? list.firstObject : nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }

@end
