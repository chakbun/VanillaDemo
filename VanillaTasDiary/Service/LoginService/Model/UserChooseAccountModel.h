//
//  UserChooseAccountModel.h
//  huhuAudio
//
//  Created by zhanlong on 2021/7/21.
//  Copyright © 2021 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserIdChooseModel.h"

@interface UserChooseAccountModel : NSObject

@property (nonatomic, assign) BOOL isBindPhone;
@property (nonatomic, assign) BOOL isShowAccountList;
@property (nonatomic, assign) BOOL isShowAdd;
@property (nonatomic, assign) BOOL isShowOther;
@property (nonatomic, assign) BOOL isShowIcon;

@property (nonatomic, copy) NSArray <UserIdChooseModel *>*accountList;
@property (nonatomic, copy) NSArray <NSString *>*contentList;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) int32_t accountNum;

@end

