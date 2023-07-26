//
//  DYSafetyAuthorizationInterceptTool.h
//  huhuAudio
//
//  Created by Kevin Chen on 2022/2/16.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYSafetyAuthorizationInterceptTool : NSObject

+ (void)interruptWithVerifyType:(PROTOVerifyType)verifyType
           navigationController:(UINavigationController *)controller
                         userId:(NSInteger)userId
                      phoneText:(NSString *)phoneText
                       loginRes:(PROTOCommonSignInRes *)loginRes
              successCompletion:(void(^)(PROTOCommonSignInRes *loginRes))successCompletion
               failedCompletion:(void(^)(void))failedCompletion;

@end

NS_ASSUME_NONNULL_END
