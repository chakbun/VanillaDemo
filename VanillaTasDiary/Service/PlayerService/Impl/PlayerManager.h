//
//  IPlayerProtocol.h
//  huhuAudio
//
//  Created by fish on 2017/5/15.
//  Copyright © 2018年 MiZhua. All rights reserved.
//

#import "IPlayerProtocol.h"

@interface PlayerManager : NSObject<IPlayerService,ZYGNetWorkServiceBroadCastDelegate>

/** 请求设备类型 */
@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy) NSString *deviceId;
/** Test to see if @c deviceId has been set. */
@property(nonatomic, readwrite) BOOL hasDeviceId;
@property (nonatomic, assign) int64_t playId;

/// 长链接判断用
@property (nonatomic, assign) int64_t accountID;

@property (nonatomic, assign) int64_t id2;

@property (nonatomic, assign) int64_t clanId;
@property (nonatomic, copy) NSString *clanName;     //公会名称
@property (nonatomic, copy) NSString *clanIconWord; //公会图标文字
@property (nonatomic, assign) int64_t clanLevel;        //公会等级
/// 家族ID 0:表示没有家族; >0:表示有家族
@property (nonatomic, assign) int64_t familyId;
@property(nonatomic, assign) BOOL isPublicSettle; //公会是否是对公结算
@property (nonatomic, assign) BOOL isClanSignMember; // 是否签约成员

@property (nonatomic, copy) NSString *nickname;

@property(nonatomic, assign) uint32_t createAt;

@property (nonatomic, copy) NSString *city;


@property (nonatomic, copy) NSString *icon;//头像资源版本
@property (nonatomic, assign) PB3SexType sex;
@property (nonatomic, assign) int32_t genderNum;//性别剩余修改次数

@property (nonatomic, assign) int32_t charmLevel;//魅力等级
@property (nonatomic, assign) int64_t charm;


@property (nonatomic, assign) int32_t wealthLevel;//财富等级
@property (nonatomic, assign) int64_t wealth;

/** 标志，按位存储。各位表示意思参考PlayerFlags */
@property(nonatomic, readwrite) int64_t flags;

/** 标志，按位存储。各位表示意思参考PlayerFlags_2 */
@property(nonatomic, readwrite) int64_t flags2;

@property(nonatomic, readwrite) int64_t flags3;

@property (nonatomic, strong) PB3AssetsMoney *assetsMoney; //资产
@property (nonatomic, assign) int64_t score;//积分
@property (nonatomic, copy) NSString *signature;//
@property (nonatomic, copy) NSString *birthday;//
@property (nonatomic, assign) int64_t isOpenRoomTicket;

@property (nonatomic, copy) NSString *loginKey;//登录key
//@property (nonatomic, strong) NSMutableDictionary * playerMessageList;//登录key
@property (nonatomic, assign) int64_t playIdByMessage;

//@property (nonatomic, strong) SwitchModel *switchModel;
@property (nonatomic, assign) int goldVoiceLevel;//金话筒（1金，2银）
@property (nonatomic, assign) BOOL isCommunityTrendAdmin;        //是否氧吧动态管理员


@property (nonatomic, assign) BOOL isSuperAdmin;//是否为超级管理 0否 1是
@property (nonatomic, assign) BOOL isMakeFriend;//好友广播能否发送
@property (nonatomic, assign) BOOL isMakeFriendJump;//好友广播跳跳能否发送


@property (nonatomic, assign) bool isClanElder;


@property (nonatomic, assign) int32_t slot;//已开通坑位

@property (nonatomic, strong) NSArray *weekStarIds;//周星礼物

/** 新手礼包 */
@property(nonatomic, assign) int64_t accountFlag;
@property(nonatomic, assign) BOOL isCharge;

@property (nonatomic, assign) kPasswordState passwordSate;  //密码的状态

@property (nonatomic, assign) BOOL isRegisterByPhone;  //是否是手机号注册

@property (nonatomic, copy) NSString *countryPhoneCode;     //绑定的手机的区号
@property (nonatomic, copy) NSString *phone;                //绑定的手机
@property (nonatomic, assign) BOOL isBindedPhone;           //是否已经绑定手机
@property (nonatomic, assign) BOOL isGotBindPhoneReward;    //是否已经领取绑定手机奖励
@property (nonatomic, assign) BOOL isThirdPartyLogin;       //是否第三方登录
@property (nonatomic, assign) BOOL isSwitchAccount;         //切换账号

@property (nonatomic, assign) BOOL haveDisplayNewGift;      //是否自动弹出过新手礼物

@property (nonatomic, assign) kRegisterType bindPhoneRegisterType;

@property (nonatomic, strong) PB3BillPlayerCard *playerCard;

/** 特效 */
@property(nonatomic, strong, readwrite) NSMutableArray<PB3Effect*> *effectArray;

@property (nonatomic, copy) NSString *assistToken;

@property (nonatomic, assign) kVoiceSDKType voiceSdkType;

///是否有接单权限
@property (nonatomic, assign) kBillPlayerAuth billPlayerAuth;
///是否开启接单
@property (nonatomic, assign) kBillPlayerStatus billPlayerStatus;
//用户个人信息审核结果
@property (nonatomic, strong) PB3UserAuditDetailRes *userReviewInfo;

/// 是否有爵位
@property (nonatomic, assign) BOOL hasNobility;

/// 当前的爵位信息
@property (nonatomic, strong) PB3PlayerNobilityInfo *currentNobility;

/// 当前的马甲信息
@property (nonatomic, strong) PB3MaskInfo *currentMask;

/// 用户所有的爵位信息
@property (nonatomic, strong) NSMutableArray<PB3PlayerNobilityInfo *> *nobilityList;


/// 用户设置的榜单隐身房间
@property (nonatomic, strong) NSMutableArray<PB3MaskRoomInfo *> *maskRoomList;

/// 爵位用户专属客服
@property (nonatomic, strong) PB3CustomerServiceRes *nobilityCustomerService;

///是否未成年，如果未实名验证，这里返回的是false
@property(nonatomic, assign) BOOL isMinors;
@property (nonatomic, copy) NSString *voiceURL; //语音地址
@property (nonatomic, assign) NSInteger voiceTime;//语音时长
@property(nonatomic, assign) BOOL isVoiceTag;//是否有声鉴卡标签

/// 是否是黑鲸VIP
@property (nonatomic, assign) BOOL isBlackWhaleVIP;
/// 当前用户的定位
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;

///亲密粉丝牌子列表
@property (nonatomic, strong) NSArray<PB3IntimateFansCardInfo*> *fansCardList;
///当前选中的粉丝牌子
@property (nonatomic, assign) int64_t currentFansCardId;

/// 数组里面的类型可以显示在全部频道
@property (nonatomic, strong) GPBEnumArray *channelListArray;

// 用户当前使用的聊天气泡
@property (nonatomic, strong) DYIMBubbleModel *currentBubble;

@property (nonatomic, assign) BOOL hideRoomQuickChatView;

@property (nonatomic, assign) BOOL hideImQuickChatView;

@property (nonatomic, assign) BOOL needChangeGender;//是否需要修改性别

@property (nonatomic, copy) NSString *timbre; //音色

@property (nonatomic, strong) DYNeteaseToken *netEaseModel;

@property (nonatomic, assign) int32_t currentRecallTaskNum; // 当前进行的召回任务数量
@property (nonatomic, assign) int32_t newRecallTaskNum; // 更新的召回任务数量

+ (instancetype)sharedInstance;

@end
