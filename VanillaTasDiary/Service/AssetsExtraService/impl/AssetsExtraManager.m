//
//  GiftExtraManager.m
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import "AssetsExtraManager.h"
#import "GiftExt.pbobjc.h"
#import "IPlayerProtocol.h"
#import "NetConfigModel.h"

@implementation AssetsExtraManager

WF_DEF_SINGLETION(AssetsExtraManager);

- (void)addObserver
{
    [super addObserver];
    
}

- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj
{
    [super handleCmdid:cmdid serverPush:serverPush withObj:obj];
    switch (serverPush.cmdId) {
        default:
            break;
    }
}

#pragma mark - --> Public API

- (void)transferToUseId:(int64_t)useId giftId:(uint32_t)giftId giftNum:(uint32_t)giftNum completionBlock:(AssetsServiceCompletionBlock)completionBlock
{
    if (!useId || !giftId)
        return;
    PB3TransferGiftReq *req = [PB3TransferGiftReq new];
    req.toId                = useId;
    req.giftEntry           = giftId;
    req.giftNum             = giftNum;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3TransferGiftRes class]
                                       ServiceName:kNetApiGiftExtService
                                      functionName:@"TransferGift"
                                        completion:^(PB3TransferGiftRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                                            NSString *errorMessage = nil;
                                            if (nError) {
                                                errorMessage = nError.errorMessage;
                                            }
                                            else if (!rsp) {
                                                errorMessage = L(@"ClientError");
                                            }
                                            if (completionBlock)
                                                completionBlock(rsp, errorMessage);
                                        }];
}

@end
