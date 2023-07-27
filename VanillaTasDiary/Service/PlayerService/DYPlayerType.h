//
//  DYPlayerType.h
//  huhuAudio
//
//  Created by yu on 2020/12/25.
//  Copyright © 2020 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommunityExt.pbobjc.h"
#import "BillExt.pbobjc.h"

///公会图标类型
typedef NS_ENUM(NSInteger, kPlayerClanIconType)
{
    kPlayerClanIconTypeNormal = 0,     //普通公会
    kPlayerClanIconTypeRely   = 1,     //挂靠公会
    kPlayerClanIconTypeOrder  = 2,     //点单公会
};


NS_ASSUME_NONNULL_BEGIN

@interface DYPlayerType : NSObject

+ (kPlayerClanIconType)clanIconTypeByPB3Type:(PB3ClanIconType)iconType;

//+ (kPlayerClanIconType)clanIconTypeByCommunityType:(PB4CommunityClanIconType)iconType;


@end

NS_ASSUME_NONNULL_END
