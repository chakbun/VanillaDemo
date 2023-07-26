//
//  DYSafetyAuthorizationInterceptTool.m
//  huhuAudio
//
//  Created by Kevin Chen on 2022/2/16.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import "DYSafetyAuthorizationInterceptTool.h"
#import "DYAlert.h"

@implementation DYSafetyAuthorizationInterceptTool

+ (void)interruptWithVerifyType:(PROTOVerifyType)verifyType
           navigationController:(UINavigationController *)naviController
                         userId:(NSInteger)userId
                      phoneText:(NSString *)phoneText
                       loginRes:(PROTOCommonSignInRes *)loginRes
              successCompletion:(void(^)(PROTOCommonSignInRes *loginRes))successCompletion
               failedCompletion:(void(^)(void))failedCompletion
{
}


@end
