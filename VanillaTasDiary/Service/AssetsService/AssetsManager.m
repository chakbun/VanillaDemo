//
//  GiftExtraManager.m
//  huhuAudio
//
//  Created by 郑思越 on 2018/11/22.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import "AssetsManager.h"
#import "IPlayerProtocol.h"
#import "SystemExt.pbobjc.h"
#import <ZygoteCategories/NSObject+DY.h>
#import "NetConfigModel.h"

@interface AssetsManager ()

@end

@implementation AssetsManager

WF_DEF_SINGLETION(AssetsManager);
- (instancetype)init
{
    if (self = [super init]) {
        [self addObserver];
    }
    return self;
}

- (void)addObserver
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginEndHandle:) name:@"kNotificationDidLogin" object:nil];
    //进入房间更新礼物配置（下个版本直接推送）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterRoomHandle:) name:@"kNotificationEnterRoomRes" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logOutHandle) name:@"kNotificationLogout" object:nil];
    [ZYGService(IZYGNetworkService) addDelegate:self];
    //金钱资产变更
    [ZYGService(IZYGNetworkService) registerCmdid:PB3AssetsCmdId_AssetsMoneyCmdId forClass:[PB3AssetsMoney class]];
    [ZYGService(IZYGNetworkService) registerCmdid:PB3AssetsCmdId_AssetsBagCmdId forClass:[PB3AssetsBag class]];
    //资产配置变更
    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_SystemConfUpdate forClass:[PB3SysConfUpdate class]];
    [ZYGService(IZYGNetworkService) registerCmdid:PB3AssetsCmdId_AssetsPointCmdId forClass:[PB3AssetsPoint class]];

    [self dy_addObserver:kNotificationAssetsGetGiftAmout block:^(NSNotification *notification) {
        [self getGiftAmout:nil];
    }];
    //负债变更
    [ZYGService(IZYGNetworkService) registerCmdid:PB3AssetsCmdId_AssetsInDebtCmdId forClass:[PB3AssetsInDebt class]];
}

#pragma mark - --> Notification Action

- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj
{
    switch (serverPush.cmdId) {
        case PB3AssetsCmdId_AssetsMoneyCmdId: {
            [self playerAssetsMoneyChange:obj];
            break;
        }
        case PB3AssetsCmdId_AssetsBagCmdId: {
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsBagUpdate object:((PB3AssetsBag *) obj).itemsArray];
            PB3AssetsBag *model = obj;
            [model.itemsArray enumerateObjectsUsingBlock:^(PB3BagItem * _Nonnull object, NSUInteger idx, BOOL * _Nonnull stop) {
                [self updataAsstesCollectionModelByAssetItem:object];
            }];
            break;
        }
        case PB3SystemCmdId_SystemConfUpdate: {
            PB3SysConfUpdate *sysConfUpdate = obj;
            if (sysConfUpdate.type == PB3SysConfType_TypeAssetsConf) {
                [self getGiftAmout:^(id responseObj, NSString *errorMessage) {
                    [self getAssetsConf:nil];
                }];
            }
            break;
        }
        case PB3AssetsCmdId_AssetsInDebtCmdId: {
            PB3AssetsInDebt *debtInfo = (PB3AssetsInDebt *)obj;
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsDebtInfoChanged object:debtInfo];
            break;
        }
        case PB3AssetsCmdId_AssetsPointCmdId: {
            PB3AssetsPoint *score = (PB3AssetsPoint *)obj;
            [self playerScoreChange:score];
            break;
        }
            break;
        default:
            break;
    }
}

//金钱资产变更
- (void)playerAssetsMoneyChange:(PB3AssetsMoney *)ms
{
    if (DYCheckInvalidAndKindOfClass(ms, PB3AssetsMoney)) return;
    ZYGService(IPlayerService).assetsMoney = ms;
    ZYGService(IPlayerService).isCharge = (ms.charge > 0);
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsMoneyChange object:ms];
}

//积分变更
- (void)playerScoreChange:(PB3AssetsPoint *)score
{
    ZYGService(IPlayerService).score = score.num;
    DYLogInfo(@"积分变更======%@", @(score.num));
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsPointInfoChanged object:score];
    DYLogInfo(@"======%@", @(score.num));
}

- (void)enterRoomHandle:(NSNotification *)notification
{
    [self getGiftAmout:^(id responseObj, NSString *errorMessage) {
        [self getAssetsConf:nil];
    }];
}

- (void)loginEndHandle:(NSNotification *)notification
{
    [self getGiftAmout:^(id responseObj, NSString *errorMessage) {
        [self getAssetsConf:nil];
    }];
}
- (void)logOutHandle
{
    self.assetsDictionary = [GPBInt32ObjectDictionary new];
    self.bagItemsArray = [NSMutableArray array];
}

- (void)updataAsstesCollectionModelByAssetItem:(PB3BagItem *)assetItem
{
    AsstesCollectionModel *model = [self assetsCollectionModelByAssetId:assetItem.giftId];
    [model.asstesDetailList enumerateObjectsUsingBlock:^(AsstesDetailModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.assetId == assetItem.giftId) {
            obj.number = assetItem.amount;
        }
    }];
    BOOL isContain = NO;
    for (PB3BagItem *item in self.bagItemsArray) {
        if (item.giftId == assetItem.giftId) {
            item.validGift = assetItem.validGift;
            isContain = YES;
        }
    }
    if (!isContain) {
        [self.bagItemsArray addObject:assetItem];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsConfigChange object:nil];
}
#pragma mark - --> Public API

///获取用户资产
- (void)getMoneyWithCompletionBlock:(AssetsServiceCompletionBlock)completionBlock
{
    PB3AssetsMoneyReq *req = [PB3AssetsMoneyReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3AssetsMoneyRes class]
                                       ServiceName:kNetApiAssetExtService
                                      functionName:@"GetMoney"
                                        completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        PB3AssetsMoneyRes *res = (PB3AssetsMoneyRes *)rsp;
        NSString *errorMessage = nil;
        if (error) {
            errorMessage = error.errorMessage;
        }
        if (rsp) {
            ZYGService(IPlayerService).assetsMoney = res.money;
            ZYGService(IPlayerService).isCharge = (res.money.charge > 0);
        } else {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock) {
            completionBlock(rsp, errorMessage);
        }
    }];
}

- (void)getGiftAmout:(AssetsServiceCompletionBlock)completionBlock
{
    PB3AssetsBagReq *req = [PB3AssetsBagReq new];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3AssetsBagRes class]
                                           ServiceName:kNetApiAssetExtService
                                          functionName:@"GetBag"
                                            completion:^(PB3AssetsBagRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                                            NSString *errorMessage = nil;
                                            if (nError) {
                                                errorMessage = nError.errorMessage;
                                            }
                                            else if (!rsp) {
                                                errorMessage = L(@"ClientError");
                                            }
                                            if (completionBlock)
                                                completionBlock(rsp, errorMessage);
                                            DYLogInfo(@"GetBag:%@", errorMessage ? errorMessage : rsp);
                                            if (errorMessage)
                                                return;
                                            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsBagUpdate object:rsp.itemsArray];
                                            [self.bagItemsArray removeAllObjects];
                                            [self.bagItemsArray addObjectsFromArray:rsp.itemsArray];
                                        }];
}

/// 获取用户负债
- (void)debtInfoWithCompletion:(AssetsServiceCompletionBlock)completionBlock
{
    PB3InDebtInfoReq *req = [PB3InDebtInfoReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3InDebtInfoRes class] ServiceName:kNetApiAssetExtService functionName:@"InDebtInfo" completion:^(PB3InDebtInfoRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock)
            completionBlock(rsp, errorMessage);
        kDYLogModuleAssets.info(@"InDebtInfo:%@", errorMessage ? errorMessage : rsp);
    }];
}

- (void)scoreInfoWithCompletion:(AssetsServiceCompletionBlock)completionBlock {
    PB3AssetsPointReq *req = [PB3AssetsPointReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3AssetsPointRes class] ServiceName:kNetApiAssetExtService functionName:@"AssetsPoint" completion:^(PB3AssetsPointRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        else {
            [[rsp point] enumerateKeysAndObjectsUsingBlock:^(int32_t key, PB3AssetsPoint * _Nonnull object, BOOL * _Nonnull stop) {
                if (key == PB3PointType_PointStore) {
                    ZYGService(IPlayerService).score       = object.num;
                }
            }];
        }
        
        if (completionBlock)
            completionBlock(rsp, errorMessage);
        kDYLogModuleAssets.info(@"ScoreInfo:%@", errorMessage ? errorMessage : rsp);
    }];
}

- (void)getAssetsConf:(AssetsServiceCompletionBlock)completionBlock
{
    PB3GetAssetsConfReq *req = [PB3GetAssetsConfReq new];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3GetAssetsConfRes class]
                                       ServiceName:kNetApiAssetExtService
                                      functionName:@"GetAssetsConf"
                                        completion:^(PB3GetAssetsConfRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                                            NSString *errorMessage = nil;
                                            if (nError) {
                                                errorMessage = nError.errorMessage;
                                            }
                                            else if (!rsp) {
                                                errorMessage = L(@"ClientError");
                                            }
                                            if (completionBlock)
                                                completionBlock(rsp, errorMessage);
                                            DYLogInfo(@"GetAssetsConf:%@", errorMessage ? errorMessage : rsp);
                                            if (errorMessage)
                                                return;
                                            [self.assetsDictionary removeAll];
                                            
                                            [rsp.assetsConf enumerateKeysAndObjectsUsingBlock:^(int32_t key, PB3AsstesCollection * _Nonnull object, BOOL * _Nonnull stop) {
                                                AsstesCollectionModel *model = [AsstesCollectionModel assetModelWithAsstesCollection:object];
                                                [self.assetsDictionary setObject:model forKey:key];
                                            }];
                                            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationAssetsConfigChange object:nil];
                                        }];
}

- (AsstesCollectionModel *)assetsCollectionModelByAssetType:(PB3AssetsType)assetType
{
    __block AsstesCollectionModel *model = nil;
    [self.assetsDictionary enumerateKeysAndObjectsUsingBlock:^(int32_t key, AsstesCollectionModel * _Nonnull object, BOOL * _Nonnull stop) {
        if (assetType == key) {
            model = object;
            *stop = YES;
        }
    }];
    return model;
}

- (AsstesCollectionModel *)assetsCollectionModelByAssetId:(int32_t)assetId
{
    __block AsstesCollectionModel *model = nil;
    [self.assetsDictionary enumerateKeysAndObjectsUsingBlock:^(int32_t key, AsstesCollectionModel * _Nonnull object, BOOL * _Nonnull nStop) {
        [object.asstesDetailList enumerateObjectsUsingBlock:^(AsstesDetailModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.assetId == assetId) {
                model = object;
                *stop = YES;
                *nStop = YES;
            }
        }];
    }];
    return model;
}

- (uint32_t)assetsCountByAssetType:(PB3AssetsType)assetType
{
    uint32_t count = 0;
    AsstesCollectionModel *model = [self assetsCollectionModelByAssetType:assetType];
    for (AsstesDetailModel *detail in model.asstesDetailList) {
        count = count + detail.number;
    }
    return count;
}

///藏宝礼物有效期
- (PB3GiftValidDate *)validDateWithGiftId:(uint32_t)giftId
{
    PB3GiftValidDate *model = nil;
    for (PB3BagItem *item in self.bagItemsArray) {
        if (item.giftId == giftId) {
            model = item.validGift;
            break;
        }
    }
    return model;
}

#pragma mark - --> Getter & Setter
- (NSMutableArray<PB3BagItem *> *)bagItemsArray
{
    if (_bagItemsArray == nil) {
        _bagItemsArray = [NSMutableArray array];
    }
    return _bagItemsArray;
}
- (GPBInt32ObjectDictionary<AsstesCollectionModel *> *)assetsDictionary
{
    if (_assetsDictionary == nil) {
        _assetsDictionary = [GPBInt32ObjectDictionary new];
    }
    return _assetsDictionary;
}
@end
