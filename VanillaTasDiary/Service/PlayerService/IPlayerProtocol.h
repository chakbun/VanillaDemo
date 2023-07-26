#import <ZygoteNetwork/IZYGNetworkService.h>
//#import "RoomEntry.h"
#import "UserStatusExt.pbobjc.h"
#import "UserExt.pbobjc.h"
#import "UauthExt.pbobjc.h"
#import "UauthCommon.pbobjc.h"
#import "CommonExt.pbobjc.h"
#import <DYBusinessServices/VoiceTypes.h>
#import "NobilityExt.pbobjc.h"
#import "DYNeteaseToken.h"
#import "AssetsExt.pbobjc.h"
#import "IndexExt.pbobjc.h"

#import "ClanCliExt.pbobjc.h"

@class DYIMBubbleModel;

N_Dec(kPlayerPersonalSwitchedChangedNotification);// 用户个人开关变化通知
N_Dec(kNoteClanIDChange);// 公会通知
N_Dec(kNoteCertifyNotice);// 实名认证通知
N_Dec(kBillPlayerAuthNotification);// 点单权限变更
N_Dec(kPlayerNobilityInfoUpdateNotice); // 个人爵位信息更改
N_Dec(kPlayerPrivilegeSettingsUpdateNotice); // 个人爵位特权信息更改
N_Dec(kPlayerPrivilegeStatusUpdateNotice); // 个人爵位特权设置状态更改
N_Dec(kPlayerNobilityVehicleChangeNotice); // 个人爵位座驾更换
N_Dec(kPlayerFishedRealNameNotice); // 完成实名认证
N_Dec(kRoomChatChannelCfgChangedNotification);// 房间公屏频道配置更新
N_Dec(kPlayerNeteaseTokenDidUpdate);// 网易云信的Token刷新
N_Dec(kPlayerNeedChangeGenderUpdateNotice);// 需要设置性别

// 用户属性 PlayerAttributeReq 获取的配置
// 是否是新用户
static NSString *const kDYPlayerNewUserAttributeKey = @"new_sw";
// 是否折叠了陌生私聊
static NSString *const kDYPlayerStrangerMsgFoldingAttributeKey = @"msg_folding_sw";
// 陌生私聊折叠提醒条数
static NSString *const kDYPlayerStrangerMsgFoldingNumAttributeKey = @"msg_folding_num";


typedef NS_ENUM(int32_t, kPasswordState)
{
    kPasswordStateWithout = 0,//默认没有管理过小红点
    kPasswordStateExist,//已经存在密码了
//    kPasswordStateHaveSet//已经有进过设置页面了
};

//切换账号是否提示小红点
typedef NS_ENUM(NSInteger, kChooseAccountRemind)
{
    kChooseAccountNoRemind = 0,//默认没有提醒过小红点
    kChooseAccountNeedRemind,//需要去提醒小红点
    kChooseAccountHaveRemind,//已经提醒过
};


typedef NS_ENUM(int32_t, kRegisterType)
{
    kRegisterTypeNone = 0,  //万能登录
    kRegisterTypeWechat,
    kRegisterTypeTencent,
    kRegisterTypePhone,
};

typedef NS_ENUM(NSInteger, kBindPhoneOperType) {
    kBindPhoneOperTypeSendCode = 0,
    kBindPhoneOperTypeConfirmCode,
    kBindPhoneOperTypeOldSendCode,
    kBindPhoneOperTypeOldConfirmCode,
    kBindPhoneOperTypeNewSendCode,
    kBindPhoneOperTypeNewConfirmCode,
};

typedef NS_ENUM(int32_t, kMediaModelAuditStatus)
{
    kMediaModelAuditStatusDefault = 0,      //通过/正常
    kMediaModelAuditStatusAuditing,         //审核中
    kMediaModelAuditStatusRefused,          //审核拒绝
};
///点单权限
typedef NS_ENUM(int32_t, kBillPlayerAuth)
{
    kBillPlayerAuthDefault = 0,     //
    kBillPlayerAuthNoAuth,          //不是主播
    kBillPlayerAuthAuth,            //是主播，正常权限
    kBillPlayerAuthAuthFrozen,      //是主播，权限已被冻结
};

///点单开关
typedef NS_ENUM(int32_t, kBillPlayerStatus)
{
    kBillPlayerStatusDefault = 0,   //
    kBillPlayerStatusOpen,          //开启
    kBillPlayerStatusClose,         //关闭
    kBillPlayerStatusFrozen,        //冻结
};

@protocol IPlayerServiceDelegate <NSObject>

@optional

/// 好友召回任务数更新
/// @param newNum 更新任务数
/// @param currentNum 当前进行的任务数
- (void)recallMissionUpdateWithNewTaskNum:(int32_t)newNum currentTaskNum:(int32_t)currentNum;

//公告消息：是否有未读消息(工会)
- (void)clanUnReadMsgChange:(PB3UnReadAnnouncementMsgRes *)msgRes;

@end

@protocol IPlayerService <IZYGService>

@property (nonatomic, strong, readonly) DYMutilDelegates<id<IPlayerServiceDelegate>>* delegateList;

/** 请求设备类型 */
@property(nonatomic, readwrite) enum PB3DeviceType deviceType;

@property(nonatomic, readwrite, copy) NSString *deviceId;
/** Test to see if @c deviceId has been set. */
@property(nonatomic, readwrite) BOOL hasDeviceId;
@property (nonatomic, assign) int64_t playId;
/// 判断是否用长链接: ==0时 底层会改用短链接, >0时底层不会修改连接类型
@property (nonatomic, assign) int64_t accountID;

@property (nonatomic, assign) int64_t id2;

@property (nonatomic, assign) int64_t clanId;        //公会id
@property (nonatomic, readonly, copy) NSString *clanName;     //公会名称
@property (nonatomic, readonly, copy) NSString *clanIconWord; //公会图标文字
@property (nonatomic, readonly, assign) int64_t clanLevel;        //公会等级
@property (nonatomic, readonly, assign) BOOL isClanSignMember; // 是否公会签约成员

/// 家族ID 0:表示没有家族; >0:表示有家族
@property (nonatomic, readonly, assign) int64_t familyId;
@property(nonatomic, assign) BOOL isPublicSettle; //公会是否是对公结算

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
/** 0, 表示非RT_REWARD， 1：RT_REWARD房 */
@property (nonatomic, assign) int64_t isOpenRoomTicket;

@property (nonatomic, copy) NSString *loginKey;//登录key
//@property (nonatomic, strong) NSMutableDictionary * playerMessageList;//登录key
@property (nonatomic, assign) int64_t playIdByMessage;

//@property (nonatomic, strong) SwitchModel *switchModel;
@property (nonatomic, assign) int goldVoiceLevel;//金话筒（1金，2银）
@property (nonatomic, assign) BOOL isCommunityTrendAdmin;        //是否氧吧动态管理员

@property (nonatomic, assign) BOOL isSuperAdmin;//是否为超级管理 0否 1是
@property (nonatomic, assign) BOOL isMakeFriend;//好友广播是否发送
@property (nonatomic, assign) BOOL isMakeFriendJump;//好友广播跳跳能否发送
@property (nonatomic, strong) NSArray *certifs;//用户资料

//@property (nonatomic, copy) NSString *voice;// 语音

@property (nonatomic, assign) bool isClanElder;

@property (nonatomic, assign) int32_t slot;//已开通坑位

/** 新手礼包 */
@property(nonatomic, assign) int64_t accountFlag;//用户是否验证了
@property(nonatomic, assign) BOOL isCharge;//用户是否充值了

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
@property(nonatomic, strong, readonly) NSMutableArray<PB3Effect*> *effectArray;

@property (nonatomic, copy) NSString *assistToken;

@property (nonatomic, readonly, assign) kVoiceSDKType voiceSdkType;
///是否有接单权限
@property (nonatomic, readonly, assign) kBillPlayerAuth billPlayerAuth;
///是否开启接单
@property (nonatomic, readonly, assign) kBillPlayerStatus billPlayerStatus;
//用户个人信息审核结果
@property (nonatomic, strong) PB3UserAuditDetailRes *userReviewInfo;

/// 是否有爵位 PB3PlayerNobilityStatus_PnsUsing状态
@property (nonatomic, readonly, assign) BOOL hasNobility;
    
/// 当前的爵位信息
@property (nonatomic, readonly, strong) PB3PlayerNobilityInfo *currentNobility;

/// 当前的马甲信息
@property (nonatomic, readonly, strong) PB3MaskInfo *currentMask;

/// 用户所有的爵位信息
@property (nonatomic, readonly, strong) NSMutableArray<PB3PlayerNobilityInfo *> *nobilityList;


/// 用户设置的榜单隐身房间
@property (nonatomic, readonly, strong) NSMutableArray<PB3MaskRoomInfo *> *maskRoomList;

/// 数组里面的类型可以显示在全部频道
@property (nonatomic, strong) GPBEnumArray *channelListArray;

/// 爵位用户专属客服
@property (nonatomic, readonly, strong) PB3CustomerServiceRes *nobilityCustomerService;

///是否未成年，如果未实名验证，这里返回的是false
@property(nonatomic, assign) BOOL isMinors;

@property (nonatomic, copy) NSString *voiceURL; //语音地址
@property (nonatomic, assign) NSInteger voiceTime;//语音时长
@property(nonatomic, assign) BOOL isVoiceTag;//是否有声鉴卡标签

/// 是否是黑鲸VIP
@property (nonatomic, assign) BOOL isBlackWhaleVIP;
///亲密粉丝牌子列表
@property (nonatomic, readonly, strong) NSArray<PB3IntimateFansCardInfo*> *fansCardList;
///当前选中的粉丝牌子
@property (nonatomic, readonly, assign) int64_t currentFansCardId;
/// 当前用户的定位
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
// 用户当前使用的聊天气泡
@property (nonatomic, readonly, strong) DYIMBubbleModel *currentBubble;

@property (nonatomic, readonly, strong) NSArray <PB3SettingOnOffStatus*> *playerPersonalSwitches;

@property (nonatomic, assign) BOOL needChangeGender;//是否需要修改性别

@property (nonatomic, assign) BOOL hideRoomQuickChatView;

@property (nonatomic, assign) BOOL hideImQuickChatView;

@property (nonatomic, copy) NSString *timbre; //音色

@property (nonatomic, readonly, strong) DYNeteaseToken *netEaseModel;       //网易语音SDK的Token，跟具体房间无关，所以放这里

@property (nonatomic, readonly, assign) int32_t currentRecallTaskNum; // 当前进行的召回任务数量
@property (nonatomic, readonly, assign) int32_t newRecallTaskNum; // 更新的召回任务数量

@property (nonatomic, readonly, assign) BOOL hasClanUnReadMsg;//收否有工会未读消息

//- (kVoiceSDKType)voiceSdkTypeWithType:(PB3VoiceSdkType)type;
//
//- (void)syncUpdateVoiceSdkTypeWithType:(PB3VoiceSdkType)type
//                         completeBlock:(void (^)(BOOL isUpdated))completeBlock;

- (void)syncUpdateVoiceSdkTypeWithVoiceType:(kVoiceSDKType)voiceType
                              completeBlock:(void (^)(BOOL isUpdated))completeBlock;

- (void)loadThirdPartInfoWithCompletion:(void (^)(PROTOThirdAccountBindInfoRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block;

- (void)bindThirdPartInfoWithRes:(PROTOBindThirdAccountReq *)req completion:(void (^)(PROTOBindThirdAccountRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block;

- (void)unbindThirdPartInfoWithRes:(PROTOUnbindThirdAccountReq *)req completion:(void (^)(PROTOUnbindThirdAccountRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block;

- (void)AuthAlertBindPhoneWithReq:(PROTOPhoneSmsCodeReq *)req completion:(void (^)(PROTOPhoneSmsCodeRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block;

- (void)AuthAlertVerifyPhoneNumberWithReq:(PROTOCheckPhoneSmsCodeReq *)req completion:(void (^)(PROTOCheckPhoneSmsCodeRes * _Nonnull res, NSString * _Nonnull errorMsg, int32_t errorCode))block;

- (BOOL)isAssistSeed;
///更新有接单
- (void)updatePlayerAuth:(kBillPlayerAuth)playerAuth;
///更新个人接单开关
- (void)updateBillPlayerStatus:(int32_t)status;
//设置登录信息
- (void) updatePlayer:(PB3PlayerRes *) loginMs loginKey:(NSString *) key isLogin:(BOOL)isLogin;

//更新未成年人状态
- (void)updateMinorState:(BOOL)state;

//更新用户语音
- (void)updateVoice:(NSString *)voiceURL voiceTime:(NSInteger)time;

//更新用户审核信息语音
- (void)updateUserReviewInfoVoice:(NSString *)voiceURL voiceTime:(NSInteger)time state:(PB3AuditStatus)voiceState;

//更新用户声卡审核信息
- (void)updateUserVoiceCardReviewState:(PB3AuditStatus)voiceState;

//更新用户声卡审核信息(是否有生卡)
- (void)updateVoiceTagState:(BOOL)isVoiceTag;

//是否已登录
- (BOOL) isLogined;

- (BOOL)hasLoginToken;

- (BOOL)isConnectedAndLogin;

//v 标志位 ，flags 表示原来的值
- (BOOL) getFlagIndex:(NSInteger) v  flag:(int64_t)  flags;

//是否显示派单消息
- (BOOL)isMineShowSendOrderList;

//是否显示浏览通知
- (BOOL)isMineShowVisitorList;

//是主播，正常权限
- (BOOL)hasBillPlayerAuth;

- (NSString *)newCurrencyGoldText;
- (BOOL)isOffNewWorthToken;

- (void) clear;

//YES显示排行榜
- (BOOL) showRank;

//YES显示排行榜数值(2019.12.10产品要求不再使用限制)
- (BOOL) showRankListData;

//周星榜图标
- (int) weekStarTopNumber:(int64_t) flags;

//周星榜擂主
- (int) weekStarTop:(int64_t) flags;

//金话筒等级
- (int) voiceLevelByFlag:(int64_t) flags;

//更新标志位信息
- (void) updateFlags:(int64_t) flags;

//天使等级
- (int) angleLevelByFlag:(int64_t) flags;

//守护等级
- (int) guardLevelByFlag:(int64_t) flags;

//首页天使庇护等级
- (int) angleHomeLevelByFlag:(int64_t) flags;


//520魅力榜
- (int)charm520TopNumber:(int64_t) flags;

//520财富榜
- (int)wealth520TopNumber:(int64_t) flags;

//520魅力榜尾灯 1魅力尾灯，2财富尾灯
- (int)charm520HeartTail:(int64_t) flags;

//61活动榜单
- (int)event61TopNumber:(int64_t) flags;

//1金话筒2银话筒
- (int)microphoneType:(int64_t) flags;


//520活动坑上特效
- (int) activity520OnChairByFlag:(int64_t) flags;

//通过ID获得挚友
- (int) zhiYouByPlayerId:(int64_t) playId;

//喵球
- (BOOL) catBall:(int64_t) flag2;

/** 世界杯球尾灯 */
- (int)worldCupBall:(int64_t) flag2;

/** 世界杯国旗尾灯 */
- (int)worldCupFlag:(int64_t) flag2;

/** 世界杯金银尾灯 */
- (int)worldCupMedals:(int64_t) flag2;

/** 小鸡凤凰 */
- (int)birdMedals:(int64_t) flag2;

/** 八重礼 */
- (BOOL)eightHeavyGift:(int64_t) flag2;


/** 最具影响力上坑特效 */
- (int) activityInfluentialOnChairByFlag:(int64_t) flag2;

/** 周年庆最具影响力进场 */
- (BOOL)InfluentialRunwayMark:(int64_t) flag2;

/** 首充新贵标志 */
- (BOOL)chargeFirstMark:(int64_t) flag;

/** 月饼兔子 */
- (int)moonFestivalTaillight:(int64_t) flag2;

/** 中秋名片 */
- (int)moonFestivalCard:(int64_t) flag2;

/** 优质认证 */
- (int)HighQuality:(int64_t) flag;

/** 歌手认证 */
- (int)certificationSinger:(int64_t) flag DEPRECATED_MSG_ATTRIBUTE("Use PB3Player.authInfoArray");

- (BOOL)isVerifiedSingerWithAuthInfos:(NSArray <PB3AuthInfo *>*)authInfos;

/** 实名认证 */
- (int)certificationVerified:(int64_t) flag;

/** 小可爱名片 */
- (int)deLovelyCard:(int64_t) flag2;

/** 小可爱尾灯 */
- (int)deLovelyTail:(int64_t) flag2;

/** 小可爱上坑特效 */
- (int)deLovelyPit:(int64_t) flag2;

/** 蛋蛋菌尾灯 */
- (int)danDanJun:(int64_t) flag2;

/** 双十一片 */
- (int)event11Card:(int64_t) flag2;

/** 双十一尾灯 */
- (int)event11Tail:(int64_t) flag2;

/** 双十一上坑特效 */
- (int)event11Pit:(int64_t) flag2;

//周星推荐
- (BOOL) weekStarRecommend:(int64_t) flags;

/** 双蛋CP尾灯 */
- (int)doubleDenierTail:(int64_t) flag2;

/** 双蛋最佳CP尾灯 */
- (int)doubleDenierBestTail:(int64_t) flag2;

/** 双蛋CP上坑特效 */
- (int)doubleDenierChair:(int64_t) flag2;

/** 双蛋氧气携手进场特效 */
- (int)doubleDenierInfluential:(int64_t) flag2;

/** 接引人 */
- (int)greet:(int64_t) flag;

//是否可以显示动态
- (BOOL)isShowCommunity;

- (kMediaModelAuditStatus)statusWithAuditStatus:(int32_t)auditStatus;

- (BOOL)checkHasNobilityPrivilegeWithType:(PB3PrivilegeType)type;

- (BOOL)checkNobilityPrivilegeStatusWithType:(PB3PrivilegeType)type;

/// 防跟踪进房设置获取
- (PB3FollowToRoomRes *)statusOfPrivilegePreventTrack;

/// 申请实名验证
- (void)applyCertify:(PROTOApplyCertifySignReq *)req
     completionBlock:(void (^)(PROTOApplyCertifyRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock;

/// 实名认证验证成功回调
- (void)certifyResult:(PROTOCertifyResultReq *)req completionBlock:(void (^)(PROTOCertifyResultRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock;

- (void)checkNetEaseToken;

#pragma mark -
/**
 绑定手机
 
 @param phone 手机
 @param countryPhoneCode 区号
 @param smsCode 验证码
 @param operType 发送的验证码类型
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)bindPhoneWithPhone:(NSString *)phone
          countryPhoneCode:(NSString *)countryPhoneCode
                   smsCode:(NSString *)smsCode
                  operType:(kBindPhoneOperType)operType
              successBlock:(void (^)(NSString *phone, BOOL isSuccess))successBlock
                 failBlock:(void (^)(NSString *errorMsg ,NSInteger errorCode))failBlock;

//一键绑定手机号
- (void)bindPhoneWithUmengToken:(NSString *)token
                   successBlock:(void (^)(id rsp))successBlock
                      failBlock:(void (^)(NSString *errorMsg, int32_t errorCode))failBlock;

#pragma mark -
///更新粉丝牌子
- (void)updateFansCardInfoList:(PB3IntimateFansCardInfoRes *)rsp;
- (void)updateFansCardInfoItem:(PB3PushIntimateFansCardInfo *)cardInfo;
- (void)updateCurrentFansCardInfoItem:(int64_t)currentCardId;
- (PB3IntimateFansCardInfo *)currentFansCard;

#pragma mark - PlayerAttributes
- (void)loadPlayerAttributes;

- (void)setPlayerAttributeValue:(id)attributeValue forAttributeKey:(NSString *)attributeKey withCompleteBlock:(void (^)(BOOL success))block;

- (id)playerAttributeValueForKey:(NSString *)key;

#pragma mark - location
- (void)setupLocationWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude;

#pragma mark - Switch

/// 获取用户个人开关列表，并且缓存在PlayerManager中
/// @param completion 回调
- (void)updatePlayerSettingSwitchesWithCompletion:(void(^)(NSArray <PB3SettingOnOffStatus*> *listArray))completion;


/// 改变用户个人开关
/// @param swt 需要改变的开关
/// @param completion 回调
- (void)updatePlayerSettingSwitch:(PB3SettingOnOffStatus *)swt withCompletion:(void(^)(PB3SettingOnOffRes *rsp, NSString *errorMsg, NSInteger errorCode))completion;


/// 根据开关类型获取指定的个人开关。
/// @param type 类型
- (PB3SettingOnOffStatus *)getPlayerPersonalSwitchWithType:(PB3SettingType)type;

#pragma mark -
//提供给h5使用，方便从名片卡，空间跳转到h5中，获取到目标的用户id
- (int64_t)targetId;

- (void)setTargetId:(int64_t)targetId;

- (void)clearTargetIdWithViewController:(UIViewController *)viewController;

#pragma mark - RecallMission

- (void)tryToFetchRecallMissionInfo;
- (void)clearRecallMissionRemindInfo;

#pragma mark - clan
//公告消息：是否有未读消息(工会)
- (void)clanUnReadAnnouncementMsg;

//是否在【我的】显示红点
- (BOOL)showRedPointOnPlayer;

@end

