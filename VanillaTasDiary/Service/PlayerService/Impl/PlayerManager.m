//
//  PlayerModel.m
//  huhuAudio
//
//  Created by fish on 2017/5/15.
//  Copyright © 2018年 MiZhua. All rights reserved.
//

#import "PlayerManager.h"
#import "AppDelegate.h"
#import "AssetsExtraManager.h"
#import "CommonExt.pbobjc.h"
#import "BillExt.pbobjc.h"

#import <ZygoteFoundation/GPBMessage+JSON.h>
#import "DBManager.h"
#import "NetConfigModel.h"
#import <ZygoteFoundation/AppUtils.h>
#import "SystemExt.pbobjc.h"
#import "ILoginProtocol.h"
//#import "IRoomProtocol.h"
#import "DYAppKeyManager.h"
//#import "MiHomeProtocol.h"
#import "ChatExt.pbobjc.h"
#import <ZygoteNetwork/ZYGNetworkTime.h>
#import <ZygoteFoundation/SettingsData.h>
#import "ActivityCliExt.pbobjc.h"

static NSString * const kPlayerServicePlayerIdKey = @"keyplayerId";
static NSString * const kPlayerServiceShotIdKey = @"keyplayershotId";
static NSString * const kPlayerServiceNetEaseTokenKey = @"kPlayerServiceNetEaseTokenKey";

@interface PlayerManager()
{
    int64_t _targetId;
}

@property (nonatomic, strong) DYMutilDelegates<id<IPlayerServiceDelegate>>* delegateList;
@property (nonatomic, strong) NSMutableDictionary *playerAttributesDict;
@property (nonatomic, readwrite, strong) NSArray <PB3SettingOnOffStatus*> *playerPersonalSwitches;
@property (nonatomic, assign) BOOL hasClanUnReadMsg;//收否有工会未读消息

@end

@implementation PlayerManager

//@synthesize registerType;

+ (instancetype)sharedInstance {
    static PlayerManager *share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      share = [[PlayerManager alloc] init];
      //        share.switchModel = [[SwitchModel alloc] init];
      share.voiceSdkType = kVoiceSDKTypeTencent;
      share.delegateList = [DYMutilDelegates new];
      [share addObserver];
    });

    return share;
}

- (void)addObserver {
    [ZYGService(IZYGNetworkService) addDelegate:self];
    [ZYGService(IZYGNetworkService) registerCmdid:PB3AssetsCmdId_AssetsEffectPlayer forClass:[PB3BcPlayerEffect class]];
    // 监听公会通知
    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_ClanUpdate forClass:[PB3UpdateClanNotice class]];

    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcSettingOnOffChange forClass:[PB3SettingOnOffStatus class]];

//    [ZYGService(MiHomeService).delegateList addDelegate:(id<MiHomeServiceDelegate>)self];

    NSString *key = ZYGService(ILoginService).loginKey;
    if (key.length) {
        NSString *playerId = [[DBManager getInstance] readString:kPlayerServicePlayerIdKey];
        NSArray *playIdArray = [playerId componentsSeparatedByString:@"-"];
        NSString *shotId = [[DBManager getInstance] readString:kPlayerServiceShotIdKey];
        NSArray *shotIdArray = [playerId componentsSeparatedByString:@"-"];
        if ([playIdArray.firstObject isEqual:key]) {
            self.playId = [playIdArray.lastObject integerValue];
        }
        if ([shotIdArray.firstObject isEqual:key]) {
            self.playId = [shotIdArray.lastObject integerValue];
            self.id2 = [shotIdArray.lastObject integerValue];
        }
    }

    //公屏多频道配置更新
    [ZYGService(IZYGNetworkService) registerCmdid:PB3ChatCmdId_CcAnonymousCd forClass:[PB3ChatAnonymousCdRes class]];

//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(effectConfigChanged)
//                                                 name:kNotificationActivityEffectConfigChanged
//                                               object:nil];

    //登录成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDidLogin) name:kNotificationDidLogin object:nil];

    //好友召回任务
//    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_PromoterRecallUpdateCmdId forClass:[PB3PromoterRecallUpdate class]];

    //网易云信token
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcBroadcastNeteaseToken forClass:[PB3NeteaseTokenRes class]];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];

    //截屏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenshotNotification:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];

    
    //未读公会消息
    [ZYGService(IZYGNetworkService) registerCmdid:PB3ClanCmdId_CcUnReadAnnouncementMsg forClass:[PB3UnReadAnnouncementMsgRes class]];
}

//- (kVoiceSDKType)voiceSdkTypeWithType:(PB3VoiceSdkType)type {
//    kVoiceSDKType newType = kVoiceSDKTypeTencent;
//    switch (type) {
//        case PB3VoiceSdkType_VstTencent:
//            newType = kVoiceSDKTypeTencent;
//            break;
//        case PB3VoiceSdkType_VstAgora:
//            newType = kVoiceSDKTypeAgora;
//            break;
//        case PB3VoiceSdkType_VstNetease:
//            newType = kVoiceSDKTypeNetEase;
//            break;
//        default:
//            NSAssert(NO, @"undefined PB3VoiceSdkType:%d", type);
//            break;
//    }
//    return newType;
//}

//- (void)syncUpdateVoiceSdkTypeWithType:(PB3VoiceSdkType)type
//                         completeBlock:(void (^)(BOOL isUpdated))completeBlock {
//    kVoiceSDKType newType = [self voiceSdkTypeWithType:type];
//    [self syncUpdateVoiceSdkTypeWithVoiceType:newType
//                                completeBlock:completeBlock];
//}

- (void)syncUpdateVoiceSdkTypeWithVoiceType:(kVoiceSDKType)voiceType
                              completeBlock:(void (^)(BOOL isUpdated))completeBlock {
    // check sdk change
    BOOL isChanged = (_voiceSdkType != voiceType);
    _voiceSdkType = voiceType;

    if (completeBlock) {
        completeBlock(isChanged);
    }
}

- (void)eggCrackOpenSwitchChanged {
}

- (void)effectConfigChanged {
    if (self.currentBubble) {
    }
}

- (void)handleDidLogin {
    DYNeteaseToken *model = (DYNeteaseToken *)[SettingsData.sharedObject getCustomValueForKey:kPlayerServiceNetEaseTokenKey];
    if (model && DYCheckInvalidAndKindOfClass(model, DYNeteaseToken))
        model = nil;
    if (model)
        [self setNetEaseWithModel:model];
    //登录更新一下token
    [self refreshNetEaseToken];
    
    //工会未读消息
    [self clanUnReadAnnouncementMsg];
}

- (void)applicationDidEnterBackground:(NSNotification *)notification {
    [self checkNetEaseToken];
}

- (void)applicationDidBecomeActive:(NSNotification *)notification {
    [self checkNetEaseToken];
}

- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj {
    switch (serverPush.cmdId) {
        case PB3AssetsCmdId_AssetsEffectPlayer: {
            PB3BcPlayerEffect *effect = obj;
            if (effect.playerId == ZYGService(IPlayerService).playId) {
                self.effectArray = effect.effectArray;
            }
            break;
        }
        case PB3SystemCmdId_ClanUpdate: {
            PB3UpdateClanNotice *clan = obj;
            self.clanId = clan.clanId;
            [[NSNotificationCenter defaultCenter] postNotificationName:kNoteClanIDChange object:nil];

            break;
        }
        case PB3UserCmdId_UcSettingOnOffChange: {
            PB3SettingOnOffStatus *swt = obj;
            [self.playerPersonalSwitches enumerateObjectsUsingBlock:^(PB3SettingOnOffStatus *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
              if (swt.onOffType == obj.onOffType) {
                  obj.isOpen = swt.isOpen;
              }
            }];
            [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerPersonalSwitchedChangedNotification object:nil];

        } break;
        case PB3ChatCmdId_CcAnonymousCd: {
            [[NSNotificationCenter defaultCenter] postNotificationName:kRoomChatChannelCfgChangedNotification object:obj];
        } break;
        case PB3UserCmdId_UcBroadcastNeteaseToken: {
            if (DYCheckInvalidAndKindOfClass(obj, PB3NeteaseTokenRes))
                return;
            PB3NeteaseTokenRes *res = (PB3NeteaseTokenRes *)obj;
            if (PB3DeviceType_DtWindowsPc == res.deviceType)
                return;
            [SettingsData.sharedObject removeValueForKey:kPlayerServiceNetEaseTokenKey];
            [self setNetEaseWithRes:res];
            break;
        }
            break;
        case PB3ClanCmdId_CcUnReadAnnouncementMsg: {
            if (DYCheckInvalidAndKindOfClass(obj, PB3UnReadAnnouncementMsgRes)) return;
            PB3UnReadAnnouncementMsgRes *res = obj;
            self.hasClanUnReadMsg = res.has;
            [(id<IPlayerServiceDelegate>)self.delegateList clanUnReadMsgChange:obj];
        }
            break;
        default:
            break;
    }
}

//设置登录信息
- (void)updatePlayer:(PB3PlayerRes *)loginMs loginKey:(NSString *)key isLogin:(BOOL)isLogin {
    if (!loginMs) {
        return;
    }
    if (key.length) {
        NSString *playerIdStr = [NSString stringWithFormat:@"%@-%@", @(loginMs.player.id_p), key];
        [[DBManager getInstance] saveString:kPlayerServicePlayerIdKey obj:playerIdStr];
        NSString *shotIdStr = [NSString stringWithFormat:@"%@-%@", @(loginMs.player.id_p), key];
        [[DBManager getInstance] saveString:kPlayerServiceShotIdKey obj:shotIdStr];
    }
    self.playId = loginMs.player.id_p;
    self.id2 = loginMs.player.id2;
    //    self.clanId=loginMs.player.clanId;
    self.nickname = loginMs.player.nickname;
    self.icon = loginMs.player.icon;

    if (loginMs.player.needChangeSex) {
        self.sex = PB3SexType_Unknown;
    } else {
        self.sex = loginMs.player.sex;
    }
    self.genderNum = loginMs.userInfo.genderNum;
    self.charmLevel = loginMs.player.charmLevel;
    self.charm = loginMs.player.charm;
    self.wealthLevel = loginMs.player.wealthLevel;
    //    self.wealth=loginMs.player.wealth;
    self.wealth = loginMs.player.newWealth;
    self.createAt = loginMs.player.createAt;
    self.loginKey = key;
    self.flags = loginMs.player.flags;
    self.flags2 = loginMs.player.flags2;
    self.channelListArray = loginMs.player.channelListArray;
    self.needChangeGender = loginMs.player.needChangeSex;
    //    self.accountFlag = loginMs.account.flags;
    //    self.isCharge = loginMs.money.charge  ? YES : NO;
    //    DYLogInfo(@"%lld  %u",loginMs.account.flags,loginMs.money.charge);

    PB3ClanInfo *clanInfo = loginMs.clan;
    self.clanId = clanInfo.id_p;
    self.clanName = clanInfo.name;
    self.clanIconWord = clanInfo.iconWord;
    self.clanLevel = clanInfo.level;
    self.isMinors = loginMs.isMinors;
    self.familyId = clanInfo.familyId;
    self.isPublicSettle = clanInfo.isPublicSettle;
    self.isClanSignMember = clanInfo.isSignMember;

    if (self.playId == self.clanId) {
        self.isClanElder = YES;
    } else {
        self.isClanElder = NO;
    }

    self.voiceURL = loginMs.userInfo.voiceURL;
    self.voiceTime = loginMs.userInfo.voiceTime;
    self.isVoiceTag = loginMs.userInfo.isVoiceTag;

    if (loginMs.hasBindPhoneInfo) {
        PB3BindPhoneInfo *phoneInfo = loginMs.bindPhoneInfo;
        self.isBindedPhone = phoneInfo.phone.length;
        self.isGotBindPhoneReward = phoneInfo.isDraw;

        PB3RegisterType type = phoneInfo.type;
        if (PB3RegisterType_Rtzero == type ||
            PB3RegisterType_RtPhone == type) {
            self.isThirdPartyLogin = NO;
        } else {
            self.isThirdPartyLogin = YES;
        }

        self.bindPhoneRegisterType = [self registerTypeWithType:type];
//        self.registerType = loginMs.accountType;
        self.phone = phoneInfo.phone;
    }

    //点单
    if (loginMs.hasBillPlayer) {
        PB3BillPlayerCard *playerCard = loginMs.billPlayer;
        self.playerCard = playerCard;
    }
    ///点单权限
    [loginMs.player.flagsKv enumerateKeysAndInt32sUsingBlock:^(int32_t key, int32_t value, BOOL *_Nonnull stop) {
      if (key == PB3PlayerFlagKey_PfkBillPlayerAuth) {
          self.billPlayerAuth = value;
      }

      if (PB3PlayerFlagKey_PfkNobility == key) {
          self.hasNobility = value > 0;
      }
    }];

    [self updateFlags:loginMs.player.flags];


    self.isBlackWhaleVIP = loginMs.isBlackWhale;
    self.timbre = loginMs.player.callCondition;

    self.longitude = 0.f;
    self.latitude = 0.f;

    self.signature = loginMs.userInfo.signature;

    if (isLogin) {
//        [ZYGService(MiHomeService) loadZoneEffectWithPlayerId:self.playId extraObj:nil];
        [self updatePlayerSettingSwitchesWithCompletion:nil];
    }
}

- (void)setNeedChangeGender:(BOOL)needChangeGender {
    _needChangeGender = needChangeGender;
    if (_needChangeGender == NO) {
    }
    if (needChangeGender) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerNeedChangeGenderUpdateNotice object:@(needChangeGender)];
    }
}

//更新未成年人状态
- (void)updateMinorState:(BOOL)state {
    self.isMinors = state;
}

//更新用户语音
- (void)updateVoice:(NSString *)voiceURL voiceTime:(NSInteger)time {
    self.voiceURL = voiceURL;
    self.voiceTime = time;
}

//更新用户语音审核信息
- (void)updateUserReviewInfoVoice:(NSString *)voiceURL voiceTime:(NSInteger)time state:(PB3AuditStatus)voiceState {
    self.userReviewInfo.voice = voiceURL;
    self.userReviewInfo.voiceTime = time;
    self.userReviewInfo.voiceStatus = voiceState;
}

//更新用户声卡审核信息
- (void)updateUserVoiceCardReviewState:(PB3AuditStatus)voiceState {
    self.userReviewInfo.voiceTagStatus = voiceState;
    if (voiceState == PB3AuditStatus_AsAuditPass) {
        [self updateVoiceTagState:YES];
    }
}

//更新用户声卡审核信息(是否有生卡)
- (void)updateVoiceTagState:(BOOL)isVoiceTag {
    self.isVoiceTag = isVoiceTag;
}

- (kRegisterType)registerTypeWithType:(PB3RegisterType)type {
    kRegisterType registerType;
    switch (type) {
        case PB3RegisterType_Rtzero:
            registerType = kRegisterTypeNone;
            break;
        case PB3RegisterType_RtWeixin:
            registerType = kRegisterTypeWechat;
            break;
        case PB3RegisterType_RtQq:
            registerType = kRegisterTypeTencent;
            break;
        case PB3RegisterType_RtPhone:
            registerType = kRegisterTypePhone;
            break;
        default:
            registerType = kRegisterTypeNone;
            break;
    }
    return registerType;
}

//更新标志位信息
- (void)updateFlags:(int64_t)flags {
    //是否是实名认证变更
    BOOL havedRealName = [self certificationVerified:self.flags];
    BOOL isNewRealName = [self certificationVerified:flags];
    if (!havedRealName && isNewRealName) {
        //实名认证完成
        [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerFishedRealNameNotice object:nil];
    }
    ZYGService(IPlayerService).flags = flags;
    self.isSuperAdmin = [self getFlagIndex:PB3PlayerFlags_PfOfficialGuide flag:flags];
    self.goldVoiceLevel = [self voiceLevelByFlag:flags];

    self.isCommunityTrendAdmin = [self isCommunityTrendAdmin:flags];
}

//是否已登录
- (BOOL)isLogined {
    return self.playId > 0;
    //    NSString *key = [[DBManager getInstance] readString:kLoginServiceToken];
    //
    //    if (key.length >0 ) {
    //        return YES;
    //    }else{
    //        return NO;
    //    }
}
//旧isLogined的逻辑
- (BOOL)hasLoginToken {
    NSString *key = [[DBManager getInstance] readString:kLoginServiceToken];

    if (key.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

//是否已连接和登录
- (BOOL)isConnectedAndLogin {
    if (ZYGService(IZYGNetworkService).isLongConnected && [self isLogined]) {
        return YES;
    }
    return NO;
}

- (void)clear {
    self.playId = 0;
    self.accountID = 0;
    self.familyId = 0;
    self.id2 = 0;
    self.nickname = nil;
    self.icon = nil;
    self.sex = PB3SexType_Unknown;
    self.genderNum = 0;
    self.charmLevel = 0;
    self.charm = 0;
    self.wealthLevel = 0;
    self.wealth = 0;
    self.assetsMoney = nil;
    self.loginKey = nil;
    //    self.roomSelfOnMike=NO;
    self.effectArray = nil;
    self.passwordSate = kPasswordStateWithout;
    self.isRegisterByPhone = NO;
    self.isBindedPhone = NO;
    self.isGotBindPhoneReward = NO;
    self.isThirdPartyLogin = NO;
    self.haveDisplayNewGift = NO;
    self.isOpenRoomTicket = 0;

    self.hasNobility = NO;
    self.nobilityList = nil;
    self.currentNobility = nil;
    self.fansCardList = nil;
    self.currentFansCardId = 0;

    self.longitude = 0.f;
    self.latitude = 0.f;
    self.channelListArray = nil;
    self.isMinors = NO;
    self.billPlayerAuth = kBillPlayerStatusDefault;

//    // 重置粉丝信息
//    [ZYGService(IRoomService) cleanFansInfo];


    self.currentBubble = nil;

    self.netEaseModel = nil;

    [self.playerAttributesDict removeAllObjects];

    self.signature = nil;

    self.newRecallTaskNum = 0;
    self.currentRecallTaskNum = 0;

    self.voiceSdkType = kVoiceSDKTypeTencent;
    self.hasClanUnReadMsg = NO;
}

// v 标志位 ，flags 表示原来的值
- (BOOL)getFlagIndex:(NSInteger)v flag:(int64_t)flags {
    return (flags & (1L << (v - 1))) != 0;
}

///更新有接单
- (void)updatePlayerAuth:(kBillPlayerAuth)playerAuth {
    self.billPlayerAuth = playerAuth;
}

///更新个人接单开关
- (void)updateBillPlayerStatus:(int32_t)status {
    kBillPlayerStatus playerStatus = kBillPlayerStatusDefault;
    switch (status) {
        case PB3BillPlayerStatus_BpOpen:
            playerStatus = kBillPlayerStatusOpen;
            break;
        case PB3BillPlayerStatus_BpClose:
            playerStatus = kBillPlayerStatusClose;
            break;
        case PB3BillPlayerStatus_BpFreeze:
            playerStatus = kBillPlayerStatusFrozen;
            break;
        default:
            break;
    }
    self.billPlayerStatus = playerStatus;
}

//是否显示派单消息
- (BOOL)isMineShowSendOrderList {
    return self.billPlayerAuth == kBillPlayerAuthAuth;
}

//是否显示浏览通知
- (BOOL)isMineShowVisitorList {
    return NO;
}

//是主播，正常权限
- (BOOL)hasBillPlayerAuth {
    return self.billPlayerAuth == kBillPlayerAuthAuth;
}

// YES显示排行榜
- (BOOL)showRank {
    return YES;
}

// YES显示排行榜数值
- (BOOL)showRankListData {
    //    财富经验值或魅力经验值＞0的，即可看见排行榜
    //    如果客户端无法判断经验值，则改为财富等级或魅力等级＞1的可以看见排行榜
    if (self.wealth > 0 || self.charm > 0) {
        return YES;
    }

    return NO;
}

- (NSString *)newCurrencyGoldText {
    return [self isOffNewWorthToken] ? @"金币" : @"金币券";
}

- (BOOL)isOffNewWorthToken {
    return NO;
}

//周星榜图标
- (int)weekStarTopNumber:(int64_t)flags {
    /*周星榜图标*/
    BOOL top1 = [self getFlagIndex:PB3PlayerFlags_PfWeekstar1 flag:flags];
    if (top1) {
        return 1;
    }
    BOOL top2 = [self getFlagIndex:PB3PlayerFlags_PfWeekstar2 flag:flags];
    if (top2) {
        return 2;
    }
    BOOL top3 = [self getFlagIndex:PB3PlayerFlags_PfWeekstar3 flag:flags];
    if (top3) {
        return 3;
    }
    return 0;
}

//周星榜擂主
- (int)weekStarTop:(int64_t)flags {
    BOOL top4 = [self getFlagIndex:PB3PlayerFlags_PfWeekstar0 flag:flags];
    if (top4) {
        return 4;
    }
    return 0;
}

//金话筒等级
- (int)voiceLevelByFlag:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfVoiceGold flag:flags];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfVoiceSilver flag:flags];
    if (lev2) {
        return 2;
    }
    return 0;
}

//天使等级
- (int)angleLevelByFlag:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfGuardPlayer1 flag:flags];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfGuardPlayer2 flag:flags];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags_PfGuardPlayer3 flag:flags];
    if (lev3) {
        return 3;
    }
    return 0;
}

//守护等级
- (int)guardLevelByFlag:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfGuardFans1 flag:flags];

    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfGuardFans2 flag:flags];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags_PfGuardFans3 flag:flags];
    if (lev3) {
        return 3;
    }
    return 0;
}

//首页天使庇护等级
- (int)angleHomeLevelByFlag:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3RoomFlags_RfGuard1 flag:flags];
    if (lev1) {
        return 1;
    }
    //    BOOL lev2=[ZYGService(IPlayerService) getFlagIndex:PROTORoomFlags_RfGuard2 flag:flags];
    //    if (lev2) {
    //        return 2;
    //    }
    //    BOOL lev3=[ZYGService(IPlayerService) getFlagIndex:PROTORoomFlags_RfGuard3 flag:flags];
    //    if (lev3) {
    //        return 3;
    //    }
    BOOL lev4 = [self getFlagIndex:PB3RoomFlags_RfEvent520 flag:flags];
    if (lev4) {
        return 4;
    }
    return 0;
}

//周星推荐
- (BOOL)weekStarRecommend:(int64_t)flags {
    BOOL lev5 = [self getFlagIndex:PB3RoomFlags_RfWeekstarroom flag:flags];

    return lev5;
}

// 1金话筒2银话筒
- (int)microphoneType:(int64_t)flags {
    BOOL type1 = [self getFlagIndex:PB3PlayerFlags_PfVoiceGold flag:flags];
    if (type1) {
        return 1;
    }
    BOOL type2 = [self getFlagIndex:PB3PlayerFlags_PfVoiceSilver flag:flags];
    if (type2) {
        return 2;
    }
    return 0;
}

// 520魅力榜
- (int)charm520TopNumber:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfEvent520SceneCharm1 flag:flags];

    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfEvent520SceneCharm2 flag:flags];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags_PfEvent520SceneCharm3 flag:flags];
    if (lev3) {
        return 3;
    }
    return 0;
}

// 520活动坑上特效
- (int)activity520OnChairByFlag:(int64_t)flags {
    /** 520上坑特效，魅力 */
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfEvent520ChairCharm flag:flags];
    if (lev1) {
        return 1;
    }
    /** 520上坑特效，财富 */
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfEvent520ChairWealth flag:flags];
    if (lev2) {
        return 2;
    }
    return 0;
}

// 520财富榜
- (int)wealth520TopNumber:(int64_t)flags {
    BOOL lev4 = [self getFlagIndex:PB3PlayerFlags_PfEvent520SceneWealth flag:flags];
    if (lev4) {
        return 4;
    }
    return 0;
}

// 520魅力榜尾灯 1魅力尾灯，2财富尾灯
- (int)charm520HeartTail:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfEvent520LightCharm flag:flags];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfEvent520LightWealth flag:flags];
    if (lev2) {
        return 2;
    }
    return 0;
}

// 61活动榜单
- (int)event61TopNumber:(int64_t)flags {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfEvent61Small flag:flags];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags_PfEvent61Medium flag:flags];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags_PfEvent61Big flag:flags];
    if (lev3) {
        return 3;
    }
    BOOL lev4 = [self getFlagIndex:PB3PlayerFlags_PfEvent61Super flag:flags];
    if (lev4) {
        return 4;
    }
    return 0;
}

//挚友
- (int)zhiYouByPlayerId:(int64_t)playId {
    int giftId = 0;
    return giftId;
}

//喵球
- (BOOL)catBall:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfCrackeggBall flag:flag2];
    return lev1;
}

//世界杯
- (int)worldCupBall:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcup1 flag:flag2];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcup2 flag:flag2];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcup3 flag:flag2];
    if (lev3) {
        return 3;
    }
    return 0;
}

//国旗尾灯
- (int)worldCupFlag:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupChina flag:flag2];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupBrazil flag:flag2];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupGermany flag:flag2];
    if (lev3) {
        return 3;
    }
    BOOL lev4 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupArgentina flag:flag2];
    if (lev4) {
        return 4;
    }
    BOOL lev5 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupSpain flag:flag2];
    if (lev5) {
        return 5;
    }
    return 0;
}

//加油奖杯
- (int)worldCupMedals:(int64_t)flag2 {
    BOOL lev3 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupGold flag:flag2];
    if (lev3) {
        return 3;
    }
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupSilver flag:flag2];
    if (lev2) {
        return 2;
    }
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfWorldcupBronze flag:flag2];
    if (lev1) {
        return 1;
    }

    return 0;
}

//小鸡凤凰
- (int)birdMedals:(int64_t)flag2 {
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags2_PfPhoenix flag:flag2];
    if (lev2) {
        return 2;
    }

    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfChickenRice flag:flag2];
    if (lev1) {
        return 1;
    }

    return 0;
}

/** 八重礼 */
- (BOOL)eightHeavyGift:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfMizhuaAnnual flag:flag2];

    return lev1;
}

/** 最具影响力上坑特效 */
- (int)activityInfluentialOnChairByFlag:(int64_t)flag2 {
    /** 最具影响力上坑特效 */
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfChairInfluential flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 周年庆最具影响力进场 */
- (BOOL)InfluentialRunwayMark:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfSceneInfluential flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 首充新贵标志 */
- (BOOL)chargeFirstMark:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfChargeFirst flag:flag];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 月饼兔子 */
- (int)moonFestivalTaillight:(int64_t)flag2 {
    BOOL lev2 = [self getFlagIndex:PB3PlayerFlags2_PfMoonFestivalRabbit flag:flag2];
    if (lev2) {
        return 2;
    }

    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfMoonFestivalCake flag:flag2];
    if (lev1) {
        return 1;
    }

    return 0;
}

/** 中秋名片 */
- (int)moonFestivalCard:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfMoonFestivalCard flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 优质认证 */
- (int)HighQuality:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfHighQuality flag:flag];
    if (lev1) {
        return 1;
    }
    return 0;
}
/** 歌手认证 */
- (int)certificationSinger:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfSinger flag:flag];
    if (lev1) {
        return 1;
    }
    return 0;
}

- (BOOL)isVerifiedSingerWithAuthInfos:(NSArray<PB3AuthInfo *> *)authInfos {
    __block BOOL isSinger = NO;
    [authInfos enumerateObjectsUsingBlock:^(PB3AuthInfo *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if (obj.authType == PB3AuthType_AuthTypeSinger) {
          isSinger = YES;
          *stop = YES;
      }
    }];
    return isSinger;
}

/** 实名认证 */
- (int)certificationVerified:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfCertification flag:flag];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 小可爱名片 */
- (int)deLovelyCard:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfCallingCard flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 小可爱尾灯 */
- (int)deLovelyTail:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfDeLovely flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 小可爱上坑特效 */
- (int)deLovelyPit:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfThePit flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 蛋蛋菌尾灯 */
- (int)danDanJun:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfDandanjun flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双十一名片 */
- (int)event11Card:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfEvent11CharmCard flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双十一尾灯 */
- (int)event11Tail:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfEvent11LightCharm flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双十一上坑特效 */
- (int)event11Pit:(int64_t)flag2 {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags2_PfEvent11ChairCharm flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双蛋CP尾灯 */
- (int)doubleDenierTail:(int64_t)flag2 {
    BOOL lev1 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierCpLight flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双蛋最佳CP尾灯 */
- (int)doubleDenierBestTail:(int64_t)flag2 {
    BOOL lev1 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierOptimumCpLight flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双蛋CP上坑特效 */
- (int)doubleDenierChair:(int64_t)flag2 {
    BOOL lev1 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierChairCharm flag:flag2];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 双蛋携手进场特效 */
- (int)doubleDenierInfluential:(int64_t)flag2 {
    BOOL lev1 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierInfluential1 flag:flag2];
    if (lev1) {
        return 1;
    }
    BOOL lev2 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierInfluential2 flag:flag2];
    if (lev2) {
        return 2;
    }
    BOOL lev3 = [ZYGService(IPlayerService) getFlagIndex:PB3PlayerFlags2_PfEventDoubledenierInfluential3 flag:flag2];
    if (lev3) {
        return 3;
    }
    return 0;
}

/** 接引人 */
- (int)greet:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfGreet flag:flag];
    if (lev1) {
        return 1;
    }
    return 0;
}

/** 是否氧吧 */
- (BOOL)isCommunityTrendAdmin:(int64_t)flag {
    BOOL lev1 = [self getFlagIndex:PB3PlayerFlags_PfCommunityManager flag:flag];

    return lev1;
}

- (void)setIsBindedPhone:(BOOL)isBindedPhone {
    _isBindedPhone = isBindedPhone;
}

//是否可以显示动态
- (BOOL)isShowCommunity {
    return NO;
}

- (BOOL)checkHasNobilityPrivilegeWithType:(PB3PrivilegeType)type {
    return NO;
}

- (BOOL)checkNobilityPrivilegeStatusWithType:(PB3PrivilegeType)type {
    return NO;
}

- (PB3FollowToRoomRes *)statusOfPrivilegePreventTrack {

    return nil;
}

- (void)screenshotNotification:(NSNotification *)notification {
    UIViewController *topController = [DYNavigatorManager currentNavigator].navigationController.topViewController;
    NSString *topName = NSStringFromClass(topController.class);
   
}

/// 申请实名验证
- (void)applyCertify:(PROTOApplyCertifySignReq *)req
     completionBlock:(void (^)(PROTOApplyCertifyRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock {
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                  rspClass:PROTOApplyCertifyRes.class
               ServiceName:kNetApiAuthExtService
              functionName:@"ApplyCertifySign"
                completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                  NSString *errorMessage;
                  if (error) {
                      errorMessage = error.errorMessage;
                  } else if (!rsp) {
                      errorMessage = L(@"ClientError");
                  }

                  completionBlock(rsp, errorMessage, error.errorCode);
                }];
}

/// 实名认证验证成功回调
- (void)certifyResult:(PROTOCertifyResultReq *)req completionBlock:(void (^)(PROTOCertifyResultRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock {
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                  rspClass:PROTOCertifyResultRes.class
               ServiceName:kNetApiAuthExtService
              functionName:@"CertifyResult"
                completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                  NSString *errorMessage;
                  if (error) {
                      errorMessage = error.errorMessage;
                  } else if (!rsp) {
                      errorMessage = L(@"ClientError");
                  }

                  completionBlock(rsp, errorMessage, error.errorCode);
                }];
}

- (void)tryToFetchRecallMissionInfo {

//    PB3CheckPromoterRecallUpdateReq *req = [PB3CheckPromoterRecallUpdateReq message];
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
//                                                header:nil
//                                           channelType:ZYGChannelType_ShortConn
//                                              rspClass:[PB3CheckPromoterRecallUpdateRes class]
//                                           ServiceName:kNetApiActivityExtService
//                                          functionName:@"CheckPromoterRecallUpdate"
//                                            completion:^(PB3CheckPromoterRecallUpdateRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//                                              if (error)
//                                                  return;
//
//                                              self.newRecallTaskNum = rsp.newTaskNum;
//                                              self.currentRecallTaskNum = rsp.currentTaskNum;
//                                              [(id<IPlayerServiceDelegate>)self.delegateList recallMissionUpdateWithNewTaskNum:self.newRecallTaskNum currentTaskNum:self.currentRecallTaskNum];
//                                            }];
}

- (void)clearRecallMissionRemindInfo {
    self.newRecallTaskNum = 0;
    [(id<IPlayerServiceDelegate>)self.delegateList recallMissionUpdateWithNewTaskNum:self.newRecallTaskNum currentTaskNum:self.currentRecallTaskNum];
}

- (void)loadThirdPartInfoWithCompletion:(void (^)(PROTOThirdAccountBindInfoRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block {
    PROTOThirdAccountBindInfoReq *req = [PROTOThirdAccountBindInfoReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTOThirdAccountBindInfoRes class] ServiceName:kNetApiAuthExtService functionName:@"ThirdAccountBindInfo" completion:^(PROTOThirdAccountBindInfoRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"ChoiceCPError:%@", errorMessage);
        }
        
        if (block)
            block(rsp, errorMessage, nError.errorCode);
   }];
}

- (void)bindThirdPartInfoWithRes:(PROTOBindThirdAccountReq *)req completion:(void (^)(PROTOBindThirdAccountRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block {
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTOBindThirdAccountRes class] ServiceName:kNetApiAuthExtService functionName:@"BindThirdAccount" completion:^(PROTOBindThirdAccountRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"ChoiceCPError:%@", errorMessage);
        }
        
        if (block)
            block(rsp, errorMessage, nError.errorCode);
   }];
}

- (void)unbindThirdPartInfoWithRes:(PROTOUnbindThirdAccountReq *)req completion:(void (^)(PROTOUnbindThirdAccountRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block {
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTOUnbindThirdAccountRes class] ServiceName:kNetApiAuthExtService functionName:@"UnbindThirdAccount" completion:^(PROTOUnbindThirdAccountRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"ChoiceCPError:%@", errorMessage);
        }
        
        if (block)
            block(rsp, errorMessage, nError.errorCode);
   }];
}

- (void)AuthAlertBindPhoneWithReq:(PROTOPhoneSmsCodeReq *)req completion:(void (^)(PROTOPhoneSmsCodeRes * _Nonnull, NSString * _Nonnull, int32_t))block {
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTOPhoneSmsCodeRes class] ServiceName:kNetApiAuthExtService functionName:@"PhoneSmsCode" completion:^(PROTOPhoneSmsCodeRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"PhoneSmsCode Error:%@", errorMessage);
        }
        
        if (block)
            block(rsp, errorMessage, nError.errorCode);
   }];
}

- (void)AuthAlertVerifyPhoneNumberWithReq:(PROTOCheckPhoneSmsCodeReq *)req completion:(void (^)(PROTOCheckPhoneSmsCodeRes * _Nonnull, NSString * _Nonnull, int32_t))block {
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PROTOCheckPhoneSmsCodeRes class] ServiceName:kNetApiAuthExtService functionName:@"CheckPhoneSmsCode" completion:^(PROTOCheckPhoneSmsCodeRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"CheckPhoneSmsCode Error:%@", errorMessage);
        }
        
        if (block)
            block(rsp, errorMessage, nError.errorCode);
   }];
}

#pragma mark - IM bubble
- (void)filterImBubbleEffect {
    __block PB3Effect *inUseBubble;
    [self.effectArray enumerateObjectsUsingBlock:^(PB3Effect *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if (obj.isUse && obj.effectType == PB3EffectType_EffectTypeImbackground) {
          inUseBubble = obj;
          *stop = YES;
      }
    }];
        self.currentBubble = nil;
}

#pragma mark - MIHomeServiceDelegate
- (void)miHomeServiceLoadZoneEffectSuccessWithPlayerId:(int64_t)playerId
                                             effectRes:(PB3GetEffectRes *)effectRes
                                              extraObj:(id)extraObj {
    if (self.playId != playerId) {
        return;
    }

    self.effectArray = effectRes.effectArray;
}

#pragma mark -
- (void)bindPhoneWithPhone:(NSString *)phone
          countryPhoneCode:(NSString *)countryPhoneCode
                   smsCode:(NSString *)smsCode
                  operType:(kBindPhoneOperType)operType
              successBlock:(void (^)(NSString *phone, BOOL isSuccess))successBlock
                 failBlock:(void (^)(NSString *errorMsg, NSInteger errorCode))failBlock;
{
    //后台返回的号码可能不带区号
    if (operType != kBindPhoneOperTypeOldSendCode && operType != kBindPhoneOperTypeOldConfirmCode) {
        if (DYCheckInvalidAndKindOfClass(phone, NSString)) {
            if (failBlock) {
                failBlock(@"参数错误", -1);
            }
            return;
        }
    }
    
    PB3UserBindPhoneOpType opType = [self pb3OpTypeWithOperType:operType];

    PB3BindPhoneReq *req = [PB3BindPhoneReq message];
    req.phoneAreaCode = countryPhoneCode;
    req.opType = opType;
    req.code = smsCode;
    [ZYGService(ILoginService) synEncryptWithString:phone
                                      completeBlock:^(NSString *encodeStr, NSString *sign) {
                                        req.phone = encodeStr;
                                        req.phoneSign = sign;
                                      }];

    NSString *token = ZYGService(ILoginService).loginKey;
    if (!token.length) {
        token = ZYGService(ILoginService).token;
    }
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"version"] = [DYAppKeyManager innerVersion];
    opt[@"X-Token"] = token;
    opt[@"appid"] = [DYAppKeyManager sharedInstance].dyrpcSdkConfig.appId;
    if (!token.length) {
        opt = nil;
    }
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:opt channelType:ZYGChannelType_ShortConn rspClass:[PB3BindPhoneRes class] ServiceName:kNetApiUserExtService functionName:@"BindPhoneBySign" completion:^(PB3BindPhoneRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"PB3BindPhoneRes = %@,error = %@", rsp, error);
        if (error) {
            if (failBlock) {
                failBlock(error.errorMessage, error.errorCode);
            }
            return;
        }
        if (!rsp) {
            if (failBlock) {
                failBlock([NSString stringWithFormat:@"绑定手机%@失败", !smsCode.length ? @"短信发送" : @""], error.errorCode);
            }
            return;
        }
        
        DYLogInfo(@"绑定手机%@成功", !smsCode.length ? @"短信发送" : @"");
        
        // 绑定成功，设置电话。
        if (operType == kBindPhoneOperTypeNewConfirmCode || operType == kBindPhoneOperTypeConfirmCode) {
            [ZYGService(IPlayerService) setPhone:rsp.phone];
            [ZYGService(IPlayerService) setIsBindedPhone:YES];
        }
        
        if (successBlock) {
            successBlock(rsp.phone, rsp.isSucc);
        }
    }];
}

#pragma mark - 一键绑定手机号
- (void)bindPhoneWithUmengToken:(NSString *)token
                   successBlock:(void (^)(id))successBlock
                      failBlock:(void (^)(NSString *, int32_t))failBlock {
    PB3UmengQuickBindPhoneReq *req = [PB3UmengQuickBindPhoneReq message];
    req.appKey = [DYAppKeyManager sharedInstance].umengConfig.appId;
    req.token = token;
    NSString *xToken;
    if (ZYGService(ILoginService).loginKey && ZYGService(ILoginService).loginKey.length > 0) {
        xToken = ZYGService(ILoginService).loginKey;
    } else if (ZYGService(ILoginService).token && ZYGService(ILoginService).token.length > 0) {
        xToken = ZYGService(ILoginService).token;
    } else {
        xToken = @"";
    }
    NSMutableDictionary *opt = [NSMutableDictionary dictionary];
    opt[@"version"] = [DYAppKeyManager innerVersion];
    opt[@"X-Token"] = xToken;
    opt[@"appid"] = [DYAppKeyManager sharedInstance].dyrpcSdkConfig.appId;
    @weakify(self);
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:opt
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3UmengQuickBindPhoneRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"UmengQuickBindPhone"
                                            completion:^(PB3UmengQuickBindPhoneRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              if (error) {
                                                  if (failBlock) {
                                                      NSInteger errorCode = error.errorCode;
                                                      if (PB3UserCode_ErrUserSamePhoneBind10 == errorCode) {
                                                          failBlock(@"Sorry，该手机号码已达上限，请更换其他手机号进行绑定～", errorCode);
                                                      } else {
                                                          failBlock(@"Sorry，手机一键绑定失败了，请输入您要绑定的手机号吧～", errorCode);
                                                      }
                                                  }
                                                 
                                                  return;
                                              }


                                              if (successBlock) {
                                                  ZYGService(IPlayerService).phone = rsp.phone;
                                                  ZYGService(IPlayerService).isBindedPhone = YES;
                                                  successBlock(rsp);
                                              }

                                             
                                            }];
}

//- (void)getCustomerServiceState:(PB3CustomerTypeReq *)req withCompletion:(void(^)(PB3CustomerTypeRes *rsp, NSString *errorMsg, NSInteger errorCode))completion {
//    @weakify(self);
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3CustomerTypeRes class] ServiceName:kNetApiIndexExtService functionName:@"BlackWhaleCustomerBusinessState" completion:^(PB3CustomerTypeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        @strongify(self);
//
//        NSString *errorMessage = nil;
//        if (error) {
//            errorMessage = error.errorMessage;
//        }
//        else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//
//        if (completion) {
//            completion(rsp, errorMessage, error.errorCode);
//        }
//    }];
//}

- (kBindPhoneOperType)operTypeWithType:(int32_t)type
{
    kBindPhoneOperType operType;
    switch ((PB3UserBindPhoneOpType)type) {
        case PB3UserBindPhoneOpType_UcphoneOpTypeSendCode:
            operType = kBindPhoneOperTypeSendCode;
            break;
        case PB3UserBindPhoneOpType_UcphoneOpTypeConfirmCode:
            operType = kBindPhoneOperTypeConfirmCode;
            break;
        case PB3UserBindPhoneOpType_UcphoneOpTypeOldSendCode:
            operType = kBindPhoneOperTypeOldSendCode;
            break;
        case PB3UserBindPhoneOpType_UcphoneOpTypeOldConfirmCode:
            operType = kBindPhoneOperTypeOldConfirmCode;
            break;
        case PB3UserBindPhoneOpType_UcphoneOpTypeNewSendCode:
            operType = kBindPhoneOperTypeNewSendCode;
            break;
        case PB3UserBindPhoneOpType_UcphoneOpTypeNewConfirmCode:
            operType = kBindPhoneOperTypeNewConfirmCode;
            break;
        default:
            operType = kBindPhoneOperTypeSendCode;
            break;
    }
    return operType;
}

- (PB3UserBindPhoneOpType)pb3OpTypeWithOperType:(kBindPhoneOperType)type {
    PB3UserBindPhoneOpType operType;
    switch ((PB3UserBindPhoneOpType)type) {
        case kBindPhoneOperTypeSendCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeSendCode;
            break;
        case kBindPhoneOperTypeConfirmCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeConfirmCode;
            break;
        case kBindPhoneOperTypeOldSendCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeOldSendCode;
            break;
        case kBindPhoneOperTypeOldConfirmCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeOldConfirmCode;
            break;
        case kBindPhoneOperTypeNewSendCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeNewSendCode;
            break;
        case kBindPhoneOperTypeNewConfirmCode:
            operType = PB3UserBindPhoneOpType_UcphoneOpTypeNewConfirmCode;
            break;
        default:
            break;
    }
    return operType;
}

#pragma mark - Nobility delegate
- (void)didLoadNobilityInfo:(PB3PlayerNobilityInfo *)nobility ofPlayer:(int64_t)playerId {
    if (playerId != self.playId)
        return;

    self.currentNobility = nobility;
    self.hasNobility = self.currentNobility.status == PB3PlayerNobilityStatus_PnsUsing;
    [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerNobilityInfoUpdateNotice object:nil];
}

- (void)didLoadNobilityList:(NSMutableArray<PB3PlayerNobilityInfo *> *)nobilityList ofPlayer:(int64_t)playerId {
    if (playerId == self.playId) {
        self.nobilityList = nobilityList;
    }
}

- (void)didLoadRoomRankMaskList:(NSMutableArray<PB3MaskRoomInfo *> *)roomList {
    self.maskRoomList = roomList;
}

- (void)didUpdateMaskInfo:(PB3MaskInfo *)maskInfo ofPlayer:(int64_t)playerId {
    if (playerId == self.playId) {
        self.currentMask = maskInfo;
    }
}

- (void)nobilityServiceDidLoadCustomerServiceWithRsp:(PB3CustomerServiceRes *)rsp {
    self.nobilityCustomerService = rsp;
}

#pragma mark - FansCard
- (void)updateFansCardInfoList:(PB3IntimateFansCardInfoRes *)rsp {
    if (DYCheckInvalidAndKindOfClass(rsp, PB3IntimateFansCardInfoRes)) {
        return;
    }
    self.currentFansCardId = rsp.usedPlayerId;
    self.fansCardList = rsp.cardListArray;
}

- (void)updateFansCardInfoItem:(PB3PushIntimateFansCardInfo *)cardInfo {
    if (DYCheckInvalidAndKindOfClass(cardInfo, PB3PushIntimateFansCardInfo)) {
        return;
    }
    if (cardInfo.pushType == PB3PushIntimateFansCardInfoType_PifcitLev) {
        [self.fansCardList enumerateObjectsUsingBlock:^(PB3IntimateFansCardInfo *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
          if (obj.playerId == cardInfo.playerId) {
              obj.lev = cardInfo.lev;
              *stop = YES;
          }
        }];
    } else if (cardInfo.pushType == PB3PushIntimateFansCardInfoType_PifcitCard) {
        [self.fansCardList enumerateObjectsUsingBlock:^(PB3IntimateFansCardInfo *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
          if (obj.playerId == cardInfo.playerId) {
              obj.cardName = cardInfo.cardName;
              *stop = YES;
          }
        }];
    }
}

- (void)updateCurrentFansCardInfoItem:(int64_t)currentCardId {
    self.currentFansCardId = currentCardId;
}
- (PB3IntimateFansCardInfo *)currentFansCard {
    __block PB3IntimateFansCardInfo *item = nil;
    if (self.currentFansCardId == 0) {
        return item;
    }
    [self.fansCardList enumerateObjectsUsingBlock:^(PB3IntimateFansCardInfo *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if (obj.playerId == self.currentFansCardId) {
          item = obj;
          *stop = YES;
      }
    }];
    return item;
}
#pragma mark - PlayerAttribute
- (void)loadPlayerAttributes {
    PB3PlayerAttributeReq *req = PB3PlayerAttributeReq.message;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3PlayerAttributeRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"PlayerAttribute"
                                            completion:^(PB3PlayerAttributeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              NSString *errorMessage = nil;
                                              if (error) {
                                                  errorMessage = error.errorMessage;
                                              } else if (!rsp) {
                                                  errorMessage = L(@"ClientError");
                                              }

                                              if (errorMessage) {
                                                  DYLogError(@"GetPlayerAttribute request error:%@", errorMessage);
                                                  return;
                                              }

                                              if (rsp) {
                                                  [self.playerAttributesDict removeAllObjects];
                                                  [rsp.attributes enumerateKeysAndInt32sUsingBlock:^(NSString *_Nonnull key, int32_t value, BOOL *_Nonnull stop) {
                                                    self.playerAttributesDict[key] = @(value);
                                                  }];
                                                  // 只根据是否折叠开关设置是否折叠，方便后续开关放出兼容
                                                  BOOL foldUpMsg = [self.playerAttributesDict[kDYPlayerStrangerMsgFoldingAttributeKey] boolValue];
                                              }
                                            }];
}

- (void)setPlayerAttributeValue:(id)attributeValue forAttributeKey:(NSString *)attributeKey withCompleteBlock:(void (^)(BOOL success))block;
{
    PB3PlayerAttributeReq *req = PB3PlayerAttributeReq.message;
    GPBStringInt32Dictionary *attributes = [[GPBStringInt32Dictionary alloc] init];
    [attributes setInt32:[[NSString stringWithFormat:@"%@", attributeValue] integerValue] forKey:attributeKey];
    req.attributes = attributes;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3PlayerAttributeRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"PlayerAttribute"
                                            completion:^(PB3PlayerAttributeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              NSString *errorMessage = nil;
                                              if (error) {
                                                  errorMessage = error.errorMessage;
                                              } else if (!rsp) {
                                                  errorMessage = L(@"ClientError");
                                              }

                                              if (errorMessage) {
                                                  DYLogError(@"SetPlayerAttribute request error:%@", errorMessage);
                                                  if (block)
                                                      block(NO);
                                                  return;
                                              }

                                              [rsp.attributes enumerateKeysAndInt32sUsingBlock:^(NSString *_Nonnull key, int32_t value, BOOL *_Nonnull stop) {
                                                self.playerAttributesDict[key] = @(value);
                                              }];

                                              if (block) {
                                                  block(YES);
                                              }
                                            }];
}

- (id)playerAttributeValueForKey:(NSString *)key {
    return self.playerAttributesDict[key];
}

- (NSMutableDictionary *)playerAttributesDict {
    if (!_playerAttributesDict) {
        _playerAttributesDict = [NSMutableDictionary dictionary];
    }

    return _playerAttributesDict;
}

#pragma mark - location
- (void)setupLocationWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self.latitude = latitude;
    self.longitude = longitude;
}

#pragma mark - Setter
- (void)setEffectArray:(NSMutableArray<PB3Effect *> *)effectArray {
    _effectArray = effectArray;
    [self filterImBubbleEffect];
}

- (void)setLoginKey:(NSString *)loginKey {
    if (!_loginKey || ![_loginKey isEqualToString:loginKey]) {
        DYLogInfo(@"Login key changed in player manager, old: %@, new: %@", _loginKey, loginKey);
    }
    _loginKey = loginKey;
}

#pragma mark - Switch
- (void)updatePlayerSettingSwitchesWithCompletion:(void (^)(NSArray<PB3SettingOnOffStatus *> *listArray))completion {
    PB3SettingOnOffListReq *req = PB3SettingOnOffListReq.message;

    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3SettingOnOffListRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"SettingOnOffList"
                                            completion:^(PB3SettingOnOffListRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              NSString *errorMessage = nil;
                                              if (error) {
                                                  errorMessage = error.errorMessage;
                                              } else if (!rsp) {
                                                  errorMessage = L(@"ClientError");
                                              }

                                              NSArray<PB3SettingOnOffStatus *> *result = nil;
                                              if (rsp.listArray_Count > 0) {
                                                  result = [rsp.listArray copy];
                                                  self.playerPersonalSwitches = result;
                                              }

                                              if (errorMessage) {
                                                  DYLogError(@"SettingOnOffList request error:%@", errorMessage);
                                              }

                                              if (completion) {
                                                  completion(result);
                                              }
                                            }];
}

- (void)updatePlayerSettingSwitch:(PB3SettingOnOffStatus *)swt withCompletion:(void (^)(PB3SettingOnOffRes *rsp, NSString *errorMsg, NSInteger errorCode))completion {
    PB3SettingOnOffReq *req = PB3SettingOnOffReq.message;
    req.onOff = swt;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                header:nil
                                           channelType:ZYGChannelType_ShortConn
                                              rspClass:[PB3SettingOnOffRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"SettingOnOff"
                                            completion:^(PB3SettingOnOffRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              NSString *errorMessage = nil;
                                              if (error) {
                                                  errorMessage = error.errorMessage;
                                              } else if (!rsp) {
                                                  errorMessage = L(@"ClientError");
                                              }

                                              if (errorMessage) {
                                                  DYLogError(@"SettingOnOff request error:%@", errorMessage);
                                              }

                                              if (completion) {
                                                  completion(rsp, errorMessage, error.errorCode);
                                              }
                                            }];
}

- (PB3SettingOnOffStatus *)getPlayerPersonalSwitchWithType:(PB3SettingType)type {
    __block PB3SettingOnOffStatus *swt = nil;

    [self.playerPersonalSwitches enumerateObjectsUsingBlock:^(PB3SettingOnOffStatus *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      if (obj.onOffType == type) {
          swt = obj;
          *stop = YES;
      }
    }];

    return swt;
}

- (void)updateSwitchHandle {
    [self tryToFetchRecallMissionInfo];
}

#pragma mark - NetEase
- (void)setNetEaseWithRes:(PB3NeteaseTokenRes *)res {
    if (DYCheckInvalidAndKindOfClass(res, PB3NeteaseTokenRes))
        return;
    kDYLogModuleVoice.info(@"netEase playerId:%lld token:%@ expiredTime:%lld", self.playId, res.token, res.expireAt);
    DYNeteaseToken *model = [DYNeteaseToken new];
    model.playerId = self.playId;
    model.token = res.token;
    model.expiredTime = res.expireAt;
    [self setNetEaseWithModel:model];
}

- (void)setNetEaseWithModel:(DYNeteaseToken *)model {
    if (DYCheckInvalidAndKindOfClass(model, DYNeteaseToken))
        return;
    if (model.playerId != self.playId && self.playId > 0) {
        [SettingsData.sharedObject removeValueForKey:kPlayerServiceNetEaseTokenKey];
        return;
    }
    _netEaseModel = model;
    [SettingsData.sharedObject setCustomValue:model forKey:kPlayerServiceNetEaseTokenKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerNeteaseTokenDidUpdate object:nil];
}

- (void)checkNetEaseToken {
    kDYLogModuleVoice.info(@"检查neteaseToken");
    if (_netEaseModel.token.length)
        return;
    [self refreshNetEaseToken];
}

- (void)refreshNetEaseToken {
    PB3NeteaseTokenReq *req = [PB3NeteaseTokenReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                                 cmdid:ZYGPROTOOperationType_OpSendSms
                                                header:nil
                                              rspClass:[PB3NeteaseTokenRes class]
                                           ServiceName:kNetApiUserExtService
                                          functionName:@"NeteaseToken"
                                            completion:^(PB3NeteaseTokenRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                              NSString *errorMessage = nil;
                                              if (error) {
                                                  errorMessage = error.errorMessage;
                                              } else if (!rsp) {
                                                  errorMessage = L(@"ClientError");
                                              }

                                              if (errorMessage) {
                                                  DYLogError(@"SettingOnOff request error:%@", errorMessage);
                                                  return;
                                              }

                                              [self setNetEaseWithRes:rsp];
                                            }];
}

#pragma mark -
- (int64_t)targetId {
    return _targetId;
}

- (void)setTargetId:(int64_t)targetId {
    _targetId = targetId;
}

- (void)clearTargetIdWithViewController:(UIViewController *)viewController {
    BOOL isFound = [viewController.navigationController.viewControllers containsObject:viewController];
    if (!isFound) {
        [self setTargetId:0];
    }
}
@synthesize certifs;

#pragma mark - clan
//公告消息：是否有未读消息(工会)
- (void)clanUnReadAnnouncementMsg
{
    PB3UnReadAnnouncementMsgReq *req = [PB3UnReadAnnouncementMsgReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3UnReadAnnouncementMsgRes class]
                                       ServiceName:kNetApiClanExtService
                                      functionName:@"UnReadAnnouncementMsg"
                                        completion:^(PB3UnReadAnnouncementMsgRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (error) {
            errorMessage = error.errorMessage;
        } else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        
        if (errorMessage) {
            DYLogError(@"PB3UnReadAnnouncementMsgRes request error:%@", errorMessage);
        } else {
            self.hasClanUnReadMsg = rsp.has;
            [(id<IPlayerServiceDelegate>)self.delegateList clanUnReadMsgChange:rsp];
        }
    }];
}

//是否在【我的】显示红点
- (BOOL)showRedPointOnPlayer
{
    return NO;
}

@end
