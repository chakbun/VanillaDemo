//
//  DYAccountPromptTool.m
//  huhuAudio
//
//  Created by Kevin Chen on 2022/1/14.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import "DYAccountPromptTool.h"
#import "DYAlert.h"
#import "UauthExt.pbobjc.h"

@implementation DYAccountPromptTool

static PROTOCommonSignInRes *dyAccountPromptToolSignInRes = nil;

+ (void)setPendingSignInRes:(PROTOCommonSignInRes * __nullable)pendingSignInRes {
    dyAccountPromptToolSignInRes = pendingSignInRes;
}

+ (PROTOCommonSignInRes * __nullable)pendingSignInRes {
    return dyAccountPromptToolSignInRes;
}

+ (void)showPromptInMainThreadWithPlayerId:(NSInteger)playerId endTime:(NSString *)endTime cancelResignAction:(void(^)(void))cancelResignAction andResignAction:(void(^)(void))resignAction {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *title = [NSString stringWithFormat:@"ID:%@已申请注销，将于%@删除",@(playerId), endTime];
        NSString *detail = @"如你想放弃注销流程，请点击“放弃注销”；如确定注销此账号，点击“暂不登录”后可通过其他账号进行登录。";
        
        [DYAlert alertWithTitle:title content:detail normalAction:@"暂不登录" expectAction:@"放弃注销" normalActionHandle:resignAction expectActionHandle:cancelResignAction];
    });
}

+ (void)showBlockInMainThreadWithAction:(void (^ __nullable)(void))action {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *title = @"该账号已注销";
        NSString *detail = @"该账号已注销，暂无法查看";
        
        [DYAlert alertWithTitle:title content:detail normalAction:nil expectAction:@"知道了" normalActionHandle:nil expectActionHandle:action];
    });
}

+ (void)showRemoteLoginAccoutPromptWithLoginTime:(NSString *)loginTime
{
    dispatch_async(dispatch_get_main_queue(), ^{

        if (loginTime.length <= 0) return;
       
    });
}

@end
