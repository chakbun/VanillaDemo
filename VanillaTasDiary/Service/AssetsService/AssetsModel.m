//
//  AssetsModel.m
//  huhuAudio
//
//  Created by 刘勇航 on 2019/6/4.
//  Copyright © 2019年 XYWL. All rights reserved.
//

#import "AssetsModel.h"
//#import "AssetsManager.h"
#import "AssetsExtraManager.h"
#import "CommonExt.pbobjc.h"

@implementation AsstesDetailModel

- (void)setAssetId:(int32_t)assetId
{
    _assetId = assetId;
    AssetsExtraManager *manager = [AssetsExtraManager sharedInstance];
    [manager.bagItemsArray enumerateObjectsUsingBlock:^(PB3BagItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.giftId == assetId) {
            _number = obj.amount;
            *stop = YES;
        }
    }];
}

@end

@implementation AsstesCollectionModel

+ (instancetype)assetModelWithAsstesCollection:(PB3AsstesCollection *)asstesCollection;
{
    __block AsstesCollectionModel *asstesModel = [[AsstesCollectionModel alloc] init];
    asstesModel.icon = asstesCollection.icon;
    [asstesCollection.listArray enumerateObjectsUsingBlock:^(PB3AsstesDetail * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AsstesDetailModel *detail = [[AsstesDetailModel alloc] init];
        detail.assetId = obj.id_p;
        [asstesModel.asstesDetailList addObject:detail];
    }];
    return asstesModel;
}

- (NSMutableArray<AsstesDetailModel *> *)asstesDetailList
{
    if (_asstesDetailList == nil) {
        _asstesDetailList = [NSMutableArray array];
    }
    return _asstesDetailList;
}
@end
