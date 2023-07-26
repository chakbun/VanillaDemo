//
//  IGiftExtraServiceProtocol.h
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import "IAssetsServiceProtocol.h"

#ifndef IAssetsExtraServiceProtocol_h
#define IAssetsExtraServiceProtocol_h

@protocol IAssetsExtraService<IAssetsService>

#pragma mark - --> API

///转赠道具给他人
- (void)transferToUseId:(int64_t)useId
                 giftId:(uint32_t)giftId
                giftNum:(uint32_t)giftNum
        completionBlock:(AssetsServiceCompletionBlock)completionBlock;
@end
#endif /* IAssetsExtraServiceProtocol_h */
