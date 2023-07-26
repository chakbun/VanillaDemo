//
//  GiftExtraManager.h
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAssetsServiceProtocol.h"
#import "AssetsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AssetsManager : NSObject<IAssetsService,ZYGNetWorkServiceBroadCastDelegate>

@property (nonatomic, strong) NSMutableArray<PB3BagItem*> *bagItemsArray;  //背包资源

@property (nonatomic, readwrite, copy) GPBInt32ObjectDictionary<AsstesCollectionModel *> *assetsDictionary;
WF_AS_SINGLETION(AssetsManager);
///for subclass
- (void)addObserver;
- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj;

@end

NS_ASSUME_NONNULL_END
