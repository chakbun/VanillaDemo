//
//  IActivityServiceProtocol.h
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import <ZygoteNetwork/IZYGNetworkService.h>
#import "AssetsExt.pbobjc.h"
#import "AssetsModel.h"
#import "CommonExt.pbobjc.h"

DYLogModule(Assets);

typedef void (^AssetsServiceCompletionBlock)(id responseObj, NSString *errorMessage);

N_Dec(kNotificationAssetsMoneyChange);  //通知资产更新
N_Dec(kNotificationAssetsBagUpdate);    //通知背包更新
N_Dec(kNotificationAssetsGetGiftAmout); //接通知发起背包请求
N_Dec(kNotificationAssetsConfigChange); //通知个人资产发生变化
N_Dec(kNotificationAssetsDebtInfoChanged); //通知个人债务发送变化
N_Dec(kNotificationAssetsPointInfoChanged); //通知个人积分发送变化

@protocol IAssetsService<IZYGService>

#pragma mark - --> API

///获取用户资产
- (void)getMoneyWithCompletionBlock:(AssetsServiceCompletionBlock)completionBlock;
///获取用户背包
- (void)getGiftAmout:(AssetsServiceCompletionBlock)completionBlock;

/// 获取用户负债
/// @param completionBlock 完成回调
- (void)debtInfoWithCompletion:(AssetsServiceCompletionBlock)completionBlock;

/// 获取用户积分
/// @param completionBlock 完成回调
- (void)scoreInfoWithCompletion:(AssetsServiceCompletionBlock)completionBlock;

///获取对应资产的详情
- (AsstesCollectionModel *)assetsCollectionModelByAssetType:(PB3AssetsType)assetType;
///获取对应的资产数量
- (uint32_t)assetsCountByAssetType:(PB3AssetsType)assetType;

///藏宝礼物有效期
- (PB3GiftValidDate *)validDateWithGiftId:(uint32_t)giftId;

@end
