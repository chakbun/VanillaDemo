//
//  AssetsModel.h
//  huhuAudio
//
//  Created by 刘勇航 on 2019/6/4.
//  Copyright © 2019年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AssetsExt.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface AsstesDetailModel : NSObject

@property (nonatomic, assign) int32_t assetId;  //资产Id

@property (nonatomic, assign) int32_t number;  //资产的数量(从背包中获取)

@end

@interface AsstesCollectionModel : NSObject

@property (nonatomic, copy) NSString *icon;  //头像

@property (nonatomic, strong) NSMutableArray <AsstesDetailModel *>* asstesDetailList;  //详情

+ (instancetype)assetModelWithAsstesCollection:(PB3AsstesCollection *)asstesCollection;

@end

NS_ASSUME_NONNULL_END
