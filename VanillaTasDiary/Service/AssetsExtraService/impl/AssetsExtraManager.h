//
//  GiftExtraManager.h
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import "AssetsManager.h"
#import "IAssetsExtraServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssetsExtraManager : AssetsManager<IAssetsExtraService>

WF_AS_SINGLETION(AssetsExtraManager);

@end

NS_ASSUME_NONNULL_END
