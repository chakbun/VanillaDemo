//
//  UserIdChooseModel.m
//  huhuAudio
//
//  Created by 刘勇航 on 2019/7/17.
//  Copyright © 2019年 XYWL. All rights reserved.
//

#import "UserIdChooseModel.h"

@implementation UserIdChooseModel

- (void)setType:(UserAccounChannelType)type {
    _type = type;
    
    if (type == UserAccounChannelType_Zero) {
        _typeImageName = @"icon_sub_register_xiaohao";
    } else if (type == UserAccounChannelType_Phone) {
        _typeImageName = @"icon_sub_register_iphone";
    } else if (type == UserAccounChannelType_Qq) {
        _typeImageName = @"icon_sub_register_qq";
    } else if (type == UserAccounChannelType_Wechat) {
        _typeImageName = @"icon_sub_register_weixin";
    } else if (type == UserAccounChannelType_AppleId) {
        _typeImageName = @"icon_sub_register_appleid";
    } else if (type == UserAccounChannelType_Subsidiary) {
        _typeImageName = @"icon_sub_register_xiaohao";
    }  else {
        _typeImageName = @"icon_sub_register_xiaohao";
    }
}

@end
