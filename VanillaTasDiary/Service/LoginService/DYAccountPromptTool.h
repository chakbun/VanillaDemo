//
//  DYAccountPromptTool.h
//  huhuAudio
//
//  Created by Kevin Chen on 2022/1/14.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PROTOCommonSignInRes;
@interface DYAccountPromptTool : NSObject

@property (class, nonatomic, strong) PROTOCommonSignInRes * __nullable pendingSignInRes;

+ (void)showPromptInMainThreadWithPlayerId:(NSInteger)playerId endTime:(NSString *)endTime cancelResignAction:(void(^)(void))cancelResignAction andResignAction:(void(^)(void))resignAction;

+ (void)showBlockInMainThreadWithAction:(void(^ __nullable)(void))action;

+ (void)showRemoteLoginAccoutPromptWithLoginTime:(NSString *)loginTime;


@end

NS_ASSUME_NONNULL_END
