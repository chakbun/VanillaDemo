//
//  DYPlayerType.m
//  huhuAudio
//
//  Created by yu on 2020/12/25.
//  Copyright © 2020 XYWL. All rights reserved.
//

#import "DYPlayerType.h"

@implementation DYPlayerType

+ (kPlayerClanIconType)clanIconTypeByPB3Type:(PB3ClanIconType)iconType
{
    kPlayerClanIconType type = kPlayerClanIconTypeNormal;
    if (iconType == PB3ClanIconType_CitRely) {
        type = kPlayerClanIconTypeRely;
    }if (iconType == PB3ClanIconType_CitBill) {
        type = kPlayerClanIconTypeOrder;
    }
    return type;
}

//+ (kPlayerClanIconType)clanIconTypeByCommunityType:(PB4CommunityClanIconType)iconType
//{
//    kPlayerClanIconType type = kPlayerClanIconTypeNormal;
//    if (iconType == PB4CommunityClanIconType_CcitRely) {
//        type = kPlayerClanIconTypeRely;
//    }if (iconType == PB4CommunityClanIconType_CcitBill) {
//        type = kPlayerClanIconTypeOrder;
//    }
//    return type;
//}

@end
