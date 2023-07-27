//
//  UserServiceProtocol.h
//  huhuAudio
//
//  Created by 刘勇航 on 2018/12/4.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserExt.pbobjc.h"
#import "CommonExt.pbobjc.h"
#import <ZygoteFoundation/DYMutilDelegates.h>
#import "IndexExt.pbobjc.h"
#import "GiftExt.pbobjc.h"
#import "FriendExt.pbobjc.h"

N_Dec(kPlayerVoiceTagStateChangeNotification);// 用户声卡状态变更
N_Dec(kPlayerBlackWhaleVIPStateChangeNotification);// 用户黑鲸VIP状态变更
N_Dec(kUserInformationUpdatedNotification);

typedef NS_ENUM (NSInteger, EarningsType)
{
    EarningsTypePerson = 0,
    EarningsTypeRoom,
};
typedef void (^UserServiceCompletionBlock)(id responseObj, NSString *errorMessage);
typedef void (^UserServiceResultBlock)(id responseObj, BOOL success);
typedef void (^UserServiceLevelBlock)(PB3LevelRes *levelRes, NSString *errorMessage);
typedef void (^UserServicePrivacySettingInfoBlock)(PB3PrivacySettingRes *rsp, NSString *errorMessage);
typedef void (^UserServicePrivaceChangeBlock)(PB3ChangePrivacyRes *rsp, NSString *errorMessage);

@protocol UserServiceDelegate <NSObject>
@optional

- (void)userServiceSearchPlayerResultWithKeyword:(NSString *)keyword list:(NSArray<PB3SearchPlayerEntry*> *)list;
///上传头像成功
- (void)userServiceUploadOssHeaderImageSuccessWithImageUrl:(NSString *)imageUrl;
///上传头像失败
- (void)userServiceUploadOssHeaderImageFailWithErrorMessage:(NSString *)errorMessage;
///获取房间返利数据成功
- (void)userServiceRoomGiftTicketSuccessWithTicket:(int64_t)ticket;
///获取个人信息成功
- (void)userServiceLoadPlayerInfoSuccessWithResult:(PB3PlayerRes *)result;
///获取个人信息失败
- (void)userServiceLoadPlayerInfoFailWithErrorMessage:(NSString *)errorMessage;

///获取个人信息审核状态成功
- (void)userServiceLoadPlayerReviewInfoSuccessWithResult:(PB3UserAuditDetailRes *)result;
///获取个人信息审核状态失败
- (void)userServiceLoadPlayerReviewInfoFailWithErrorMessage:(NSString *)errorMessage;

///个人信息更新成功
- (void)userServiceUploadUserInfoSuccess;
///空间图片信息更新成功
- (void)userServiceUploadMiHomeSpaceImagesSuccess;

///用户声音上传成功
- (void)userServiceUploadPlayerVoiceFinish:(BOOL)success;

///删除用户声音
- (void)userServiceDeletePlayerVoiceFinish:(BOOL)success;

///发布印象
- (void)userServiceSendLeaveMessage:(PB3LeaveMessageInfo *)leaveMessage;

///粉丝牌发生变化
- (void)userServiceUpdateFansCardInfoList;
///当前佩戴的粉丝牌发生变化
- (void)userServiceUpdateCurrentFansCardInfoList;
@end

@protocol UserService<IZYGService>

@property (nonatomic, readonly, strong) DYMutilDelegates<id<UserServiceDelegate>> *delegateList;

///房间关注配置
@property (nonatomic, readonly, strong) PB3FocusBubbleConfRes *roomFocusConf;

/**
 更新个人信息(除性别)
 
 @param type  2名称，3性别.. nickname/sex/city/signature个性签名/mind心声/birthday
 @param obj 字符串
 @param completion 网络回调
 */
- (void)setupInfo:(int32_t)type
        updateObj:(NSString *)obj
       completion:(ZYGServiceRespCompletion)completion;

//更新性别
- (void)setupSex:(PB3SexType)sexType
      isRegister:(BOOL)isRegister
      completion:(ZYGServiceRespCompletion)completion;

//- (void)loadplayInfoWithPlayId:(int64_t)playId type:(int)type isFromRoom:(BOOL)isFromRoom isFromChat:(BOOL)isFromChat;
/*
 *  根据id获取列表
 */
- (void)searchPlayersWithPageNo:(int32_t)pageNo pageSize:(int32_t)pageSize keyword:(NSString *)keyword completion:(UserServiceCompletionBlock)completionBlock;


/// 综合搜索
/// @param pageNo 页码
/// @param keyword 关键字
/// @param completionBlock 回调
- (void)compositeSearchWithType:(GPBEnumArray *)types pageNo:(int32_t)pageNo keyword:(NSString *)keyword completion:(UserServiceCompletionBlock)completionBlock;

//获取玩家等级（原来@"12"接口）
- (void) getPlayerLevelBlock:(UserServiceLevelBlock) completionBlock;

/*
 *  超管操作
 */
- (void) superOperationById:(int64_t)playId
                    banType:(int32_t)banType
                    optType:(int32_t)optType
                       time:(int32_t)time;

//成为好友提示
//- (void) beFriendAlertWithUser:(DYIMUser *)user;

/*
 *  修改好友备注
 */
- (void)sendAliaName:(NSString *) aliaName
              player:(int64_t) playId
          completion:(UserServiceCompletionBlock)completionBlock;

///新的OSS上传头像的方法
- (void)uploadOssHeaderImageData:(NSData *)imageData;

///获取返利房间的魅力值
- (void)loadRoomGiftTicket;

///获取个人信息
- (void)loadPlayerInfo;

///获取个人信息审核情况
- (void)loadPlayerReviewInfo;

/// 获取通知开关
- (void)getUserNotificationSwitchStatus:(PB3SwitchStatusReq *)req completion:(void (^)(PB3SwitchStatusRes *res))completionBlock;

///获取隐私设置
- (void)loadPlayerPrivacySettingInfoCompletion:(UserServicePrivacySettingInfoBlock)completionBlock;

///获取隐私设置
- (void)loadPlayerPreferenceSettingInfoWithType:(PB3PrivacyType)switchType
                                     completion:(void (^)(BOOL isOn))completionBlock;

///修改隐私设置
- (void)changePrivacyType:(PB3PrivacyTypeVal *)type
               completion:(UserServicePrivaceChangeBlock)completionBlock;


/// 获取动态头像配置
- (void)getIconLevelRes:(PB3DynamicIconLevConfReq *)req
             completion:(void (^)(PB3DynamicIconLevConfRes *rsp, NSString *errorMessage))completionBlock;

///获取空间封面图片
- (void)loadMiHomeCoverImagesWithPlayerId:(int64_t)playerId
                      completionBlock:(void (^)(PB3TypeImageListRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock;

/// 举报
/// @param targetId 举报对象id
/// @param type 举报功能,type(0:个人 1:厅)
- (void)reportUser:(int64_t) targetId type:(int32_t)type;

//上传举报图片
- (void)uploadReportImage:(NSData *)data complete:(void(^)(NSString *imagepath))block;
- (void)uploadReportImage:(NSData *)data complete:(void(^)(NSString *imagepath))block failure:(void(^)(NSError *error))failureBlock;

//删除用户语音
- (void)deletePlayerProfileVoiceWithComplete:(void (^)(BOOL success , NSString *message))block;

//获取进房间关注语
- (void)loadRoomFocusBubbleConf;

//获取用户声鉴卡信息
- (void)loadPlayerVoiceCardInfoByPlayerId:(int64_t) playerId complete:(void(^)(PB3VoiceTagPlayerInfoRes *res,ZYGNetRequestError *error))block;

//兑换按钮显示配置
- (void)achieveWealthLimitConfWithComplete:(void(^)(PB3LevelLimitConfIOSRes *res,NSString *errorMessage))completionBlock;

//获取是否设置过性别、兴趣
- (void)loadHasSetSexAndInterest:(void(^)(PB3HasUpdateSexPasswdRes *rsp,ZYGNetRequestError *error))completionBlock;

/// 加入粉丝守护
/// @param targetId 加入粉丝对象
- (void)applyFansGuardian:(int64_t)targetId;

//亲密粉丝牌子列表
- (void)fetchIntimateFansCardInfoList:(void(^)(PB3IntimateFansCardInfoRes *rsp,ZYGNetRequestError *error))completionBlock;

//佩戴亲密粉丝牌子
- (void)setIntimateFansCardWithCardId:(int64_t)cardId
                           completion:(void(^)(PB3SetIntimateFansCardReq *rsp,NSString *errorMessage))completionBlock;

///粉丝列表
- (void)fetchIntimateFansListWithIndex:(NSInteger)index completion:(void(^)(PB3IntimateFansHostViewRes *rsp, NSString *errorMsg, NSInteger errorCode))block;

///修改粉丝名片卡名称
- (void)modifyFansCardName:(NSString *)name completion:(void(^)(PB3SetIntimateFansCardInfoRes *rsp, NSString *errorMsg, NSInteger errorCode))block;

///// 加载高光时刻
//- (void)fetchHighLightPlayId:(int64_t)playId index:(int32_t)index uniq:(BOOL)uniq sort:(PB3HighlightGiftMomentListSort)sort completionBlock:(void(^)(PB3HighlightGiftMomentListRes *rsp, NSString *errorMsg, NSInteger errorCode))callback;
//
///// 设置查看高光礼物时间范围
//- (void)setHighlightGiftTimeRange:(PB3HighlightGiftShowRange)range completionBlock:(void(^)(PB3HighlightGiftShowRangeRes *rsp, NSString *errorMsg, NSInteger errorCode))completionBlock;

#pragma mark - ChannelSubscribe

// 订阅频道
- (void)subscribeWithChannelType:(PB3ChannelPrefix)channelType
                       channelId:(int64_t)channelId;

// 取消订阅频道
- (void)desubscribeWithChannelType:(PB3ChannelPrefix)channelType;

// 批量订阅频道
//list key:PB3ChannelPrefix val:channelId
- (void)batchSubscribeWithDict:(GPBInt64Int64Dictionary *)dict;

// 批量取消订阅频道
//list val:PB3ChannelPrefix
- (void)batchDesubscribeWithList:(GPBInt64Array *)list;


- (void)changePassword:(NSString *)password accountID:(NSInteger)accountID completion:(void(^)(BOOL success, NSString *msg))completion;

//- (void)statisticInformationWithAccountID:(NSInteger)account completion:(void(^)(PB3AccountInteractInfoRes *, NSString *))completion;

- (void)loadContactListWithType:(PB3ContactType)type userID:(NSInteger)userID completion:(void(^)(NSArray<PB3Friender *> *, NSString *))completion;

- (void)sendGiftToUser:(NSInteger)receiver gift:(NSInteger)giftID count:(NSInteger)count msg:(NSString *)msg completion:(void(^)(BOOL success, NSString *))completion;

- (void)loadRelationshipWithUser:(NSInteger)userID completion:(void(^)(PB3FriendType relationship, NSString *errMsg))completion;

- (void)followUser:(NSInteger)userID completion:(void(^)(BOOL success, NSString *errMsg))completion;

- (void)unfollowUser:(NSInteger)userID completion:(void(^)(BOOL success, NSString *errMsg))completion;

- (void)loadUserInfomation:(NSInteger)userID completion:(void(^)(PB3PlayerInfo *player, NSString *errMsg))completion;

- (void)purchaseProduct:(NSInteger)pID completion:(void(^)(BOOL success, NSString *errMsg))completion;

- (void)uploadVoiceFile:(NSData *)data completed:(void(^_Nullable)(NSString *_Nullable url, NSString *_Nullable errMsg))completed;

@end
