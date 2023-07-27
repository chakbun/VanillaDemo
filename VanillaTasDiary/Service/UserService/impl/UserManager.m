//
//  UserManager.m
//  huhuAudio
//
//  Created by 刘勇航 on 2018/12/4.
//  Copyright © 2018年 XYWL. All rights reserved.
//

#import "UserManager.h"
#import "IPlayerProtocol.h"
#import <DYBusinessServices/IOSSProtocol.h>
#import "UserExt.pbobjc.h"
#import <ZygoteNetwork/IZYGNetworkService.h>
#import "NetConfigModel.h"
#import "UserExt.pbobjc.h"
//#import "DYWebEntranceManager.h"
#import "SystemExt.pbobjc.h"
#import "ILoginProtocol.h"
#import <ZygoteNetwork/ZYGNetworkTime.h>
#import "StoreExt.pbobjc.h"

@interface UserManager ()<ZYGNetWorkServiceBroadCastDelegate,UserService>
{
    
}

@property (nonatomic, strong) DYMutilDelegates<id<UserServiceDelegate>> *delegateList;
///房间关注配置
@property (nonatomic, strong) PB3FocusBubbleConfRes *roomFocusConf;

@property (nonatomic, strong) PB3PrivacySettingRes *quickChatSwitchConfig;

@end

@implementation UserManager
WF_DEF_SINGLETION(UserManager)

#pragma mark - init
- (instancetype)init
{
    DYLogInfo(@" UserManager--init ");
    self = [super init];
    if(!self){
        return nil;
    }
    
    _delegateList = [DYMutilDelegates new];
    
    [ZYGService(IZYGNetworkService) addDelegate:self];
    //搜索UserId
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcSearchPlayer forClass:[PB3SearchPlayers class]];
    
    //个人审核信息
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcAuditDetail forClass:[PB3UserAuditDetailRes class]];
    
    //点单权限审核
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcPlayerFlagsKv forClass:[PB3BroadcastUpdateFlagsKV class]];
    
    //房间配置开关
    [ZYGService(IZYGNetworkService) registerCmdid:PB3SystemCmdId_SystemConfUpdate forClass:[PB3SysConfUpdate class]];
    
    //印象推送
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcLeaveMessage forClass:[PB3LeaveMessageInfo class]];
    
    //黑鲸VIP推送
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcBlackWhale forClass:[PB3BlackWhaleRes class]];
    
    //自身铭牌发生变化推送
    [ZYGService(IZYGNetworkService) registerCmdid:PB3UserCmdId_UcIntimateFansCardInfo forClass:[PB3PushIntimateFansCardInfo class]];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSueccessHandle:) name:kNotificationDidLogin object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(quickChatSwitchStatusChangeHandle:) name:kNotificationQuickChatSwitchStatusChanged object:nil];
    
    return self;
}

#pragma mark - 设置个人信息

//更新个人信息(除性别)
- (void)setupInfo:(int32_t)type
        updateObj:(NSString *)obj
       completion:(ZYGServiceRespCompletion)completion {
    if(type==3){
        NSAssert(NO, @"性别请使用 setupSex:completion:");
        return;
    }
    
    [self setupInfo:type
          updateObj:obj
          updateSex:0
         isRegister:NO
         completion:completion];

}

//更新性别
- (void)setupSex:(PB3SexType)sexType
      isRegister:(BOOL)isRegister
      completion:(ZYGServiceRespCompletion)completion {
    [self setupInfo:3
          updateObj:nil
          updateSex:sexType
         isRegister:isRegister
         completion:completion];
}

//可更新所有个人信息
- (void)setupInfo:(int32_t)type
        updateObj:(NSString *)obj
        updateSex:(PB3SexType)sexType
       isRegister:(BOOL)isRegister
       completion:(ZYGServiceRespCompletion)completion
{
    
    PB3UserInfoReq *req = [PB3UserInfoReq new];
    //服务端协议..根据 type 用作修改的属性顺序.
    req.type = type;
    if (isRegister) {
        req.sourceType = PB3SourceType_StRegister;
    }
    
    switch (type) {
        case 2:
        {
            req.nickname=obj;
            break;
        }
            
        case 3:
        {
            req.sex=sexType;
            break;
        }
        case 4:
        {
            req.city=obj;
            break;
        }
        case 5:
        {
            /** 个性签名 */
            req.signature=obj;
            break;
        }
        case 6:
        {
            /** 心声 */
            req.mind=obj;
            break;
        }
        case 7:
        {
            req.birthday=obj;
            break;
        }
        default:
        {
            NSAssert(NO, @"无此参数项");
            break;
        }
    }
    
    DYLogInfo(@"修改个人信息请求, req: %@",req);
    
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3UserInfoRes class]
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"SetUserInfo"
                                        completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                            if (completion) {
                                                if (!error) {
//                                                    [DYProgressHUD showInfoWithStatus:@"修改成功"];
                                                    
                                                    if (!DYCheckInvalidAndKindOfClass(rsp, PB3UserInfoRes))
                                                    {
                                                        PB3UserInfoRes *resp = (PB3UserInfoRes *)rsp;
                                                        switch (resp.type)
                                                        {
                                                            case 2:
                                                            {
                                                                ZYGService(IPlayerService).userReviewInfo.nickNameStatus = resp.status;
                                                                ZYGService(IPlayerService).userReviewInfo.nickName = resp.newValue;
                                                                if (resp.status == PB3AuditStatus_AsAuditPass) {
                                                                    ZYGService(IPlayerService).nickname = resp.oldValue;
                                                                }
                                                            }
                                                                break;
                                                            case 5:
                                                            {
                                                                ZYGService(IPlayerService).userReviewInfo.signStatus = resp.status;
                                                                ZYGService(IPlayerService).userReviewInfo.sign = resp.newValue;
                                                                if (resp.status == PB3AuditStatus_AsAuditPass) {
                                                                    ZYGService(IPlayerService).signature = resp.oldValue;
                                                                }
                                                            }
                                                                break;
                                                            case 6:
                                                            {
                                                                ZYGService(IPlayerService).userReviewInfo.mindStatus = resp.status;
                                                                ZYGService(IPlayerService).userReviewInfo.mind = resp.newValue;
                                                            }
                                                                break;
                                                            default:
                                                                break;
                                                        }
                                                        [[NSNotificationCenter defaultCenter] postNotificationName:kUserInformationUpdatedNotification object:nil];
                                                    }
                                                }
                                                [(id<UserServiceDelegate>)self.delegateList userServiceUploadUserInfoSuccess];
                                                completion(rsp,error,info);
                                            }
                                        }];
}

- (void)handleCmdid:(uint32_t)cmdid serverPush:(ZYGPROTOServerPush *)serverPush withObj:(id)obj
{
    if (![obj isKindOfClass:[GPBMessage class]]) {
        return;
    }
    switch (serverPush.cmdId) {
        case PB3SystemCmdId_SystemConfUpdate: {
            PB3SysConfUpdate *sysConfUpdate = obj;
            if (sysConfUpdate.type == PB3SysConfType_TypeFocusRoomPop) {
                [self loadRoomFocusBubbleConf];
            }
            break;
        }
        case PB3UserCmdId_UcSearchPlayer: {
            //只将第一页的结果向上层传递
            PB3SearchPlayers *model = (PB3SearchPlayers *)obj;
            if (model.page != 1) return;
            [(id<UserServiceDelegate>)self.delegateList userServiceSearchPlayerResultWithKeyword:model.keyWord
                                                                                            list:[model.listArray copy]];
            
            break;
        }
        case PB3UserCmdId_UcAuditDetail: {
            if (DYCheckInvalidAndKindOfClass(obj, PB3UserAuditDetailRes)) return;
            ZYGService(IPlayerService).userReviewInfo = (PB3UserAuditDetailRes *)obj;
            PB3UserAuditDetailRes *rsp = (PB3UserAuditDetailRes *)obj;
            if (rsp.nickNameStatus == PB3AuditStatus_AsAuditPass)
            {
                ZYGService(IPlayerService).nickname = rsp.nickName;
            }
            else if (rsp.signStatus == PB3AuditStatus_AsAuditPass)
            {
                ZYGService(IPlayerService).signature = rsp.sign;
            }
            else if (rsp.voiceStatus == PB3AuditStatus_AsAuditPass)
            {
                ZYGService(IPlayerService).userReviewInfo.voiceStatus = PB3AuditStatus_AsAuditPass;
                [ZYGService(IPlayerService) updateVoice:rsp.voice voiceTime:rsp.voiceTime];
            }
            [ZYGService(IPlayerService) updateUserVoiceCardReviewState:rsp.voiceTagStatus];
            
            [(id<UserServiceDelegate>) self.delegateList userServiceLoadPlayerReviewInfoSuccessWithResult:obj];
            break;
        }
        case PB3UserCmdId_UcPlayerFlagsKv: {
            if (DYCheckInvalidAndKindOfClass(obj, PB3BroadcastUpdateFlagsKV)) {
                return;
            }
            PB3BroadcastUpdateFlagsKV *model = (PB3BroadcastUpdateFlagsKV *)obj;
            if (model.playerId == ZYGService(IPlayerService).playId && model.flagKey == PB3PlayerFlagKey_PfkBillPlayerAuth) {
                [ZYGService(IPlayerService) updatePlayerAuth:model.flagVal];
            }
            if (model.flagKey == PB3PlayerFlagKey_PfkIsMinors) {
                [ZYGService(IPlayerService) updateMinorState:model.flagVal];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:kBillPlayerAuthNotification object:obj];
            break;
        }
            case PB3UserCmdId_UcDelProfileVoice: {
                if (DYCheckInvalidAndKindOfClass(obj, PB3DelProfileVoiceRes)) {
                    return;
                }
                PB3DelProfileVoiceRes *model = (PB3DelProfileVoiceRes *)obj;
                [ZYGService(IPlayerService) updateVoiceTagState:model.isVoiceTag];
                [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerVoiceTagStateChangeNotification object:@(model.isVoiceTag)];
                break;
            }
        case PB3UserCmdId_UcLeaveMessage:{
            if (DYCheckInvalidAndKindOfClass(obj, PB3LeaveMessageInfo)) {
                return;
            }
            [(id<UserServiceDelegate>) self.delegateList userServiceSendLeaveMessage:obj];
            break;
        }
        case PB3UserCmdId_UcBlackWhale:
        {
            if (DYCheckInvalidAndKindOfClass(obj, PB3BlackWhaleRes)) return;
            [[NSNotificationCenter defaultCenter] postNotificationName:kPlayerBlackWhaleVIPStateChangeNotification object:obj];
            break;
        }
        case PB3UserCmdId_UcIntimateFansCardInfo:
        {
            if (DYCheckInvalidAndKindOfClass(obj, PB3PushIntimateFansCardInfo)) return;
            [self updateFansCardInfoItem:obj];
            break;
        }
        default:
            break;
    }
}

#pragma mark 搜索id获取列表
/*
 *  根据id获取列表
 */
- (void)searchPlayersWithPageNo:(int32_t)pageNo pageSize:(int32_t)pageSize keyword:(NSString *)keyword completion:(UserServiceCompletionBlock)completionBlock
{
    PB3SearchPlayersReq *req = [PB3SearchPlayersReq message];
    
    req.page = pageNo;
    req.pageSize = pageSize;
    req.keyWord = keyword;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3SearchPlayersRes class] ServiceName:kNetApiUserExtService functionName:@"SearchPlayers" completion:^(PB3SearchPlayersRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock)
            completionBlock(rsp, errorMessage);

    }];
}

//- (void)compositeSearchWithType:(GPBEnumArray *)types pageNo:(int32_t)pageNo keyword:(NSString *)keyword completion:(UserServiceCompletionBlock)completionBlock {
//    PB3CompositeSearchReq *req = [PB3CompositeSearchReq message];
//    req.searchTypesArray = types;
//    req.page = pageNo;
//    req.name = keyword;
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3CompositeSearchRes class] ServiceName:kNetApiIndexExtService functionName:@"CompositeSearch" completion:^(PB3CompositeSearchRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
//
//        NSString *errorMessage = nil;
//        if (nError) {
//            errorMessage = nError.errorMessage;
//        }
//        else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//        if (completionBlock)
//            completionBlock(rsp, errorMessage);
//
//    }];
//}

#pragma mark - IIMServiceDelegate
//- (void)imFriendDidChangeWithUser:(DYIMUser *)user operType:(PB3OperType)operType
//{
//    //功能取消
//    //[self beFriendAlertWithUser:user];
//}

//成为好友提示
//- (void) beFriendAlertWithUser:(DYIMUser *)user
//{
//    if (user.friendType == PB3FriendType_FtFriend) {
//        DYLogInfo(@"互相关注成为好友 -- user %@",@(user.userId));
//        NSString *content  = [NSString stringWithFormat:CustomLocalizedString(@"IM_BeFriend"), ZYGService(IPlayerService).nickname, user.nickname];
//        //延迟0.5，防止被后来的提示覆盖（如：已关注）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [DYProgressHUD showInfoWithStatus:content];
//        });
//    }
//}

#pragma mark ---关注等回调
- (void)friendshipDidCommitOper:(NSNotification *) notification
{
    
}

//获取玩家等级（原来@"12"接口）
- (void) getPlayerLevelBlock:(UserServiceLevelBlock) completionBlock{
    PB3LevelReq *req = [PB3LevelReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3LevelRes class]
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"GetLevel"
                                        completion:^(PB3LevelRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                                            NSString *errorMessage = nil;
                                            if (nError) {
                                                errorMessage = nError.errorMessage;
                                            }
                                            else if (!rsp) {
                                                errorMessage = L(@"ClientError");
                                            }
                                            if (completionBlock)
                                                completionBlock(rsp, errorMessage);
                                        }];
    
}

/*
 *  超管操作
 */
- (void) superOperationById:(int64_t)playId
                    banType:(int32_t)banType
                    optType:(int32_t)optType
                       time:(int32_t)time
{
    PB3SuperManagerReq * req =[PB3SuperManagerReq message];
    req.banType = banType;
    req.time = time;
    req.opType = optType;
    req.playerId = playId;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3SuperManagerRes class]
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"SuperManager"
                                        completion:^(PB3SuperManagerRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
                                            DYLogInfo(@"PB3SuperManagerRes = %@,error = %@", rsp, error);
                                            if (error) {
                                                if (error.errorMessage) {
                                                    [DYProgressHUD showInfoWithStatus:error.errorMessage];
                                                }
                                            }else{
                                                [DYProgressHUD showInfoWithStatus:@"操作成功"];
                                            }
                                        }];
}
/*
 *  修改好友备注
 */
- (void)sendAliaName:(NSString *) aliaName
              player:(int64_t) playId
          completion:(UserServiceCompletionBlock)completionBlock{
    
}

- (void)uploadOssHeaderImageData:(NSData *)imageData
{
    DYOSSFileType imageType = [self contentTypeForImageData:imageData];
    if (imageType == DYOSSFileType_Unknow) {
        // 上传未知类型文件
        return;
    }
    DYOSSModel *ossModel = [self ossModelWithUploadType:PROTOUploadType_HeadIconImg UresOssCallbackReqUplodType:PB3UploadType_HeadIconImg fileType:imageType data:imageData obj:nil];
    [self uploadOssModel:ossModel uploadType:PB3UploadType_HeadIconImg completionBlock:nil];
}

- (void)uploadVoiceFile:(NSData *)data completed:(void(^_Nullable)(NSString *_Nullable url, NSString *_Nullable errMsg))completed {
    DYOSSModel *ossModel = [self ossModelWithUploadType:PROTOUploadType_Voice UresOssCallbackReqUplodType:PB3UploadType_Voice fileType:DYOSSFileType_AAC data:data obj:nil];
    
    @weakify(self);
    [ZYGService(IOSSService) upload:ossModel completion:^(id  _Nullable obj, NSError * _Nullable error) {
        @strongify(self);
        if (completed) {
            if (error) {
                completed(nil, @"Upload fail, please try again later.");
            }else {
                completed(obj, nil);
            }
        }
    }];
}


/// 获取资源的类型
/// @param data 数据
- (DYOSSFileType)contentTypeForImageData:(NSData *)data {
    DYOSSFileType imageType = DYOSSFileType_Unknow;
    if (data == nil) {
        return imageType;
    }
    
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            imageType = DYOSSFileType_JPG;
            break;
        case 0x89:
            imageType = DYOSSFileType_PNG;
            break;
        case 0x47:
            imageType = DYOSSFileType_GIF;
            break;
        default:
            break;
    }
    return imageType;
}
    


- (DYOSSModel *)ossModelWithUploadType:(PROTOUploadType)uploadType
           UresOssCallbackReqUplodType:(PB3UploadType)reqUploadType
                              fileType:(DYOSSFileType)fileType
                                  data:(NSData *)data
                                   obj:(id)obj
{
    DYOSSModel *model = [DYOSSModel new];
    model.uploadType  = uploadType;
    model.fileType = fileType;
    model.data        = data;
    model.object      = obj;
    
    DYOSSCallbackParam *param  = [[DYOSSCallbackParam alloc] init];
    PB3UresOssCallbackReq *req = [[PB3UresOssCallbackReq alloc] init];
    req.type                   = reqUploadType;
    param.req                  = req;
    param.serviceName          = [NetConfigModel ossCallbackServiecNameWithType:kOSSCallbackServerTypeUser];
    param.functionName         = @"UresOssCallback";
    model.callbackParam        = param;
    model.serviewName          = kNetApiConfigUresExtObjService;
    return model;
}

- (void)uploadOssModel:(DYOSSModel *)ossModel
     uploadType:(PB3UploadType)uploadType
completionBlock:(void (^)(NSString *imageUrl, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    [self uploadOssModel:ossModel uploadType:uploadType option:nil completionBlock:completionBlock];
}

- (void)uploadOssModel:(DYOSSModel *)ossModel
            uploadType:(PB3UploadType)uploadType
                option:(id)optionData
       completionBlock:(void (^)(NSString *imageUrl, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    @weakify(self);
    [ZYGService(IOSSService) upload:ossModel completion:^(id  _Nullable obj, NSError * _Nullable error) {
        @strongify(self);
        if (error)
        {
            switch (uploadType) {
                case PB3UploadType_HeadIconImg:
                {
                    [(id<UserServiceDelegate>) self.delegateList userServiceUploadOssHeaderImageFailWithErrorMessage:@"修改失败"];
                    break;
                }
                case PB3UploadType_ZoneCover:
                {
                    if (completionBlock){
                        completionBlock(@"", @"图片上传失败，请重试", 0);
                    }
                    break;
                }
                case PB3UploadType_UserVoice:
                {
                    if (completionBlock){
                        completionBlock(nil, @"用户声音上传失败，请重试", 0);
                    }
                    break;
                }
//                case PB3UploadType_VoiceTag:
//                {
//                    if (completionBlock){
//                        completionBlock(nil, @"用户声音上传失败，请重试", 0);
//                    }
//                    break;
//                }
                default:
                    break;
            }
        }
        else
        {
            [self saveOssImageWithUrl:obj uploadType:uploadType  duration:ossModel.voiceDuration option:optionData completionBlock:completionBlock];
        }
    }];
}

- (void)saveOssImageWithUrl:(NSString *)imageUrl
                 uploadType:(PB3UploadType)uploadType
                   duration:(int64_t)voiceDuration
                     option:(id)optionData
            completionBlock:(void (^)(NSString *imageUrl, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    NSURL *url       = [NSURL URLWithString:imageUrl];
    NSString *urlStr = [url relativePath];
    //去掉第一个斜杠
    if (urlStr.length > 1) {
        urlStr = [urlStr substringFromIndex:1];
    }
    PB3SaveOssImageListReq *req = [PB3SaveOssImageListReq message];
    if(imageUrl.length){
        req.URLArray                = @[ imageUrl ].mutableCopy;
        req.type                    = uploadType;
        req.voiceTime               = (int32_t)voiceDuration;
    }
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                     cmdid:ZYGPROTOOperationType_OpSendSms
                    header:nil
                  rspClass:[PB3SaveOssImageListRes class]
               ServiceName:kNetApiUserExtService
              functionName:@"SaveOssImageList"
                completion:^(PB3SaveOssImageListRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                    NSString *errorMessage = nil;
                    BOOL success = YES;
                    if (nError) {
                        errorMessage = nError.errorMessage;
                        success = NO;
                    }
                    else if (!rsp) {
                        errorMessage = L(@"ClientError");
                        success = NO;
                    }
                    switch (uploadType) {
                        case PB3UploadType_HeadIconImg:
                        {
                            if (success) {
                                DYLogInfo(@"头像OSS上传保存成功");
                                [(id<UserServiceDelegate>) self.delegateList userServiceUploadOssHeaderImageSuccessWithImageUrl:urlStr];
                                [[NSNotificationCenter defaultCenter] postNotificationName:kUserInformationUpdatedNotification object:nil];
                            }
                            else {
                                DYLogInfo(@"头像OSS上传保存失败code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
                                [(id<UserServiceDelegate>) self.delegateList userServiceUploadOssHeaderImageFailWithErrorMessage:errorMessage];
                            }
                            break;
                        }
                        case PB3UploadType_ZoneCover:
                        {
                            if (completionBlock) {
                                completionBlock(urlStr, errorMessage, nError.errorCode);
                            }
                            if (success) {
                                [(id<UserServiceDelegate>) self.delegateList userServiceUploadMiHomeSpaceImagesSuccess];
                            }
                            break;
                        }
                        case PB3UploadType_UserVoice://用户声音
//                        case PB3UploadType_VoiceTag://用户声卡
                        {
                            if (completionBlock) {
                                completionBlock(urlStr, errorMessage, nError.errorCode);
                            }
                            [(id<UserServiceDelegate>)self.delegateList userServiceUploadPlayerVoiceFinish:success];
                            break;
                        }
                        default:
                            break;
                    }
                }];
}

///获取个人信息
- (void)loadPlayerInfo
{
    PB3PlayerReq *req = [PB3PlayerReq message];
    [ZYGService(IZYGNetworkService)
     sendRequestWithReq:req
     cmdid:ZYGPROTOOperationType_OpSendSms
     header:nil
     rspClass:[PB3PlayerRes class]
     ServiceName:kNetApiUserExtService
     functionName:@"GetPlayer"
     completion:^(PB3PlayerRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"房间返利code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
            [(id<UserServiceDelegate>) self.delegateList userServiceLoadPlayerInfoFailWithErrorMessage:errorMessage];
        }
        else {
#if ENABLE_MODULE_ORDER
            [ZYGService(IPlayerService) updateBillPlayerStatus:(int32_t)rsp.billPlayer.status];
#endif
            [ZYGService(IPlayerService) updatePlayer:rsp loginKey:ZYGService(IPlayerService).loginKey isLogin:NO];
            DYLogInfo(@"获取个人信息成功");
            [(id<UserServiceDelegate>) self.delegateList userServiceLoadPlayerInfoSuccessWithResult:rsp];
        }
    }];
}

- (void)loadRoomGiftTicket
{
    PB3RoomGiftTicketReq *req = [PB3RoomGiftTicketReq message];
    req.playerId = ZYGService(IPlayerService).playId;
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                     cmdid:ZYGPROTOOperationType_OpSendSms
                    header:nil
                  rspClass:[PB3RoomGiftTicketRes class]
               ServiceName:kNetApiUserExtService
              functionName:@"H5RoomGiftTicket"
                completion:^(PB3RoomGiftTicketRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                    NSString *errorMessage = nil;
                    if (nError) {
                        errorMessage = nError.errorMessage;
                    }
                    else if (!rsp) {
                        errorMessage = L(@"ClientError");
                    }
                    if (errorMessage) {
                        DYLogInfo(@"房间返利code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
                    }
                    else {
                        DYLogInfo(@"房间返利请求成功");
                        ZYGService(IPlayerService).isOpenRoomTicket = rsp.result;
                        [(id<UserServiceDelegate>) self.delegateList userServiceRoomGiftTicketSuccessWithTicket:rsp.value];
                    }
                }];
}

- (void)loginSueccessHandle:(NSNotification *)notification
{
    [self loadPlayerReviewInfo];
}

- (void)quickChatSwitchStatusChangeHandle:(NSNotification *)notification
{
    [self loadPlayerPrivacySettingInfoCompletion:^(PB3PrivacySettingRes *rsp, NSString *errorMessage) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationQuickChatSwitchStatusUpdated object:nil];
    }];
}

///获取个人信息审核情况
- (void)loadPlayerReviewInfo
{
    PB3UserAuditDetailReq *req = [PB3UserAuditDetailReq message];
    
    [ZYGService(IZYGNetworkService)
     sendRequestWithReq:req
     cmdid:ZYGPROTOOperationType_OpSendSms
     header:nil
     rspClass:[PB3UserAuditDetailRes class]
     ServiceName:kNetApiUserExtService
     functionName:@"UserAuditDetail"
     completion:^(PB3UserAuditDetailRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (errorMessage) {
            DYLogInfo(@"个人信息审核code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
            [(id<UserServiceDelegate>) self.delegateList userServiceLoadPlayerReviewInfoFailWithErrorMessage:errorMessage];
        }
        else {
            DYLogInfo(@"获取个人信息审核成功");
            ZYGService(IPlayerService).userReviewInfo = rsp;
            [(id<UserServiceDelegate>) self.delegateList userServiceLoadPlayerReviewInfoSuccessWithResult:rsp];
        }
    }];
    
}

///获取隐私设置
- (void)loadPlayerPrivacySettingInfoCompletion:(UserServicePrivacySettingInfoBlock)completionBlock
{
    PB3PrivacySettingReq *req = [PB3PrivacySettingReq message];
    
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                     cmdid:ZYGPROTOOperationType_OpSendSms
                    header:nil
                  rspClass:[PB3PrivacySettingRes class]
               ServiceName:kNetApiUserExtService
              functionName:@"PrivacySetting"
                completion:^(PB3PrivacySettingRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                    NSString *errorMessage = nil;
                    if (nError) {
                        errorMessage = nError.errorMessage;
                    }
                    else if (!rsp) {
                        errorMessage = L(@"ClientError");
                    }
                    if (errorMessage) {
                        DYLogInfo(@"隐私设置信息code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
                    }
                    else {
                        DYLogInfo(@"隐私设置信息请求成功");
                        self.quickChatSwitchConfig = rsp;
                    }
                    if (completionBlock) {
                        completionBlock(rsp, errorMessage);
                    }
                }];
    
}

- (void)loadPlayerPreferenceSettingInfoWithType:(PB3PrivacyType)switchType completion:(void (^)(BOOL))completionBlock
{
    if (self.quickChatSwitchConfig) {
        [self getSwitchStatusWithType:switchType completion:completionBlock];
    } else {
        [self loadPlayerPrivacySettingInfoCompletion:^(PB3PrivacySettingRes *rsp, NSString *errorMessage) {
            if (errorMessage.length) {
                [DYProgressHUD showInfoWithStatus:errorMessage];
                return;
            }
            [self getSwitchStatusWithType:switchType completion:completionBlock];
        }];
    }
}

- (void)getSwitchStatusWithType:(PB3PrivacyType)switchType completion:(void (^)(BOOL))completionBlock
{
    __block BOOL isOn = NO;
    [self.quickChatSwitchConfig.onOffListArray enumerateObjectsUsingBlock:^(PB3PrivacyTypeVal * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.onOffType == switchType) {
            isOn = obj.onOffVal;
            *stop = YES;
        }
    }];
    if (completionBlock) {
        completionBlock(isOn);
    }
}

- (void)getUserNotificationSwitchStatus:(PB3SwitchStatusReq *)req completion:(void (^)(PB3SwitchStatusRes *))completionBlock
{
    if (!req) {
        return;
    }
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:PB3SwitchStatusRes.class
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"SwitchStatus" completion:^(PB3SwitchStatusRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error && error.errorMessage.length) {
            DYLogInfo(@"请求接口: SwitchStatus == 失败: req: %@ error: %@", req, error.errorMessage);
        }
        if (completionBlock && rsp) {
            completionBlock(rsp);
        }
    }];
}

- (void)getIconLevelRes:(PB3DynamicIconLevConfReq *)req completion:(void (^)(PB3DynamicIconLevConfRes *, NSString *))completionBlock
{
     [ZYGService(IZYGNetworkService)
      sendRequestWithReq:req
      cmdid:ZYGPROTOOperationType_OpSendSms
      header:nil
      rspClass:[PB3DynamicIconLevConfRes class]
      ServiceName:kNetApiUserExtService
      functionName: @"GetDynamicIconLevConf" completion:^(PB3DynamicIconLevConfRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
         NSString *errorMessage;
         if (error) {
             errorMessage = error.errorMessage;
         } else if (!rsp) {
             errorMessage = L(@"ClientError");
         }
    
         if (rsp) {
             completionBlock(rsp, errorMessage);
         }
     }];
}

///修改隐私设置
- (void)changePrivacyType:(PB3PrivacyTypeVal *)type
               completion:(UserServicePrivaceChangeBlock)completionBlock;
{
    PB3ChangePrivacyReq *req = [PB3ChangePrivacyReq message];
    req.onOff = type;
    
    [ZYGService(IZYGNetworkService)
        sendRequestWithReq:req
                     cmdid:ZYGPROTOOperationType_OpSendSms
                    header:nil
                  rspClass:[PB3ChangePrivacyRes class]
               ServiceName:kNetApiUserExtService
              functionName:@"ChangePrivacy"
                completion:^(PB3ChangePrivacyRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
                    NSString *errorMessage = nil;
                    if (nError) {
                        errorMessage = nError.errorMessage;
                    }
                    else if (!rsp) {
                        errorMessage = L(@"ClientError");
                    }
                    if (errorMessage) {
                        DYLogInfo(@"修改隐私设置code:%@,message:%@", @(nError.errorCode), nError.errorMessage);
                    }
                    else {
                        DYLogInfo(@"修改隐私设置成功");
                    }
                    if (completionBlock) {
                        completionBlock(rsp, errorMessage);
                    }
                }];
}

///获取空间封面图片
- (void)loadMiHomeCoverImagesWithPlayerId:(int64_t)playerId
                      completionBlock:(void (^)(PB3TypeImageListRes *rsp, NSString *errorMessage, NSInteger errorCode))completionBlock
{
    PB3TypeImageListReq *req = [PB3TypeImageListReq message];
    req.playerId = playerId;
    req.type = PB3UploadType_ZoneCover;
    
    [ZYGService(IZYGNetworkService)
     sendRequestWithReq:req
     cmdid:ZYGPROTOOperationType_OpSendSms
     header:nil
     rspClass:[PB3TypeImageListRes class]
     ServiceName:kNetApiUserExtService
     functionName:@"TypeImageList"
     completion:^(PB3TypeImageListRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock) {
            completionBlock(rsp, errorMessage, nError.errorCode);
        }
    }];
}


/// 举报
/// @param targetId 举报对象id
/// @param type 举报功能,type(0:个人 1:厅)
- (void)reportUser:(int64_t) targetId type:(int32_t)type
{
//    DYWebEntranceModel *model = [DYWebEntranceManager.sharedInstance modelWithType:kDYWebEntranceTypeReportFeedback];
//    NSString *url = model.url;
//    NSString *param = [model paramUrlWithArray:@[@(type),@(targetId)].mutableCopy];
//    if (url) {
//        url = [NSString stringWithFormat:@"%@?%@%@",model.url,param,model.path ? : @""];
//        [[ZYGRouter router] open:kRouterWebController params:[DYRouterParamsBuilder buildRouterWebWithUrl:url title:model.title]];
//    }
}

/// 加入粉丝守护
/// @param targetId 加入粉丝对象
- (void)applyFansGuardian:(int64_t)targetId
{
//    DYWebEntranceModel *model = [DYWebEntranceManager.sharedInstance modelWithType:kDYWebEntranceTypeHostFans];
//    NSString *url = model.url;
//    NSString *param = [model paramUrlWithArray:@[@(targetId)].mutableCopy];
//    if (url) {
//        url = [NSString stringWithFormat:@"%@?%@%@",model.url,param,model.path ? : @""];
//        [[ZYGRouter router] open:kRouterWebController params:[DYRouterParamsBuilder buildRouterWebWithUrl:url title:model.title]];
//    }
}

//上传举报图片
- (void)uploadReportImage:(NSData *)data complete:(void(^)(NSString *imagepath))block
{
    [self uploadReportImage:data complete:block failure:nil];
}

- (void)uploadReportImage:(NSData *)data complete:(void (^)(NSString *imagepath))block failure:(void (^)(NSError *error))failureBlock {
    DYOSSModel *model = [DYOSSModel new];
    model.uploadType = PROTOUploadType_TipOffsImg;
    model.fileType = DYOSSFileType_PNG;
    model.data = data;

    DYOSSCallbackParam *param = [[DYOSSCallbackParam alloc] init];
    PB3UresOssCallbackReq *req = [[PB3UresOssCallbackReq alloc] init];
    req.type = PB3UploadType_TipOffsImg;
    param.req = req;
    param.serviceName = [NetConfigModel ossCallbackServiecNameWithType:kOSSCallbackServerTypeUser];
    param.functionName = @"UresOssCallback";
    model.callbackParam = param;
    model.serviewName = @"mizhua.ures.UresExtObj";

    [ZYGService(IOSSService) upload:model
                 completion:^(id _Nullable obj, NSError *_Nullable error) {
                   if (error != nil) {
                       DYLogInfo(@"上传失败%@", error);
                       if (failureBlock) {
                           failureBlock(error);
                       }
                       return;
                   }
                   NSString *imgPath = [NSURL URLWithString:obj].path;
                   if (block) {
                       block(imgPath);
                   }
                 }];
}

//删除用户语音
- (void)deletePlayerProfileVoiceWithComplete:(void (^)(BOOL success , NSString *message))block
{
    PB3DelProfileVoiceReq *req = [PB3DelProfileVoiceReq message];
    [ZYGService(IZYGNetworkService)
     sendRequestWithReq:req
     cmdid:ZYGPROTOOperationType_OpSendSms
     header:nil
     rspClass:[PB3DelProfileVoiceRes class]
     ServiceName:kNetApiUserExtService
     functionName:@"DelProfileVoiceRpc"
     completion:^(PB3DelProfileVoiceRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
         NSString *msg = nil;
        BOOL success = NO;
        if (!error) {
            [ZYGService(IPlayerService) updateVoice:nil voiceTime:0];
            [ZYGService(IPlayerService) updateUserReviewInfoVoice:nil voiceTime:0 state:PB3AuditStatus_AsAuditPass];
            success = YES;
        }else{
           msg = error.errorMessage;
        }
        if (block) {
            block(!error,msg);
        }
        
        [(id<UserServiceDelegate>) self.delegateList userServiceDeletePlayerVoiceFinish:success];
        
    }];
}
//获取进房间关注语
- (void)loadRoomFocusBubbleConf
{
    PB3FocusBubbleConfReq *req = [PB3FocusBubbleConfReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3FocusBubbleConfRes class]
                                       ServiceName:kNetApiIndexExtService
                                      functionName:@"FocusBubbleConf"
                                        completion:^(PB3FocusBubbleConfRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (!error && rsp) {
            self.roomFocusConf = rsp;
        }
    }];
}

//获取用户声鉴卡信息
- (void)loadPlayerVoiceCardInfoByPlayerId:(int64_t) playerId complete:(void(^)(PB3VoiceTagPlayerInfoRes *res,ZYGNetRequestError *error))block
{
    if (playerId <= 0) {
        DYLogInfo(@"请求声卡信息playerId<=0");
        return;
    }
    PB3VoiceTagPlayerInfoReq *req = [PB3VoiceTagPlayerInfoReq message];
    req.playerId = playerId;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:[PB3VoiceTagPlayerInfoRes class]
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"VoiceTagPlayerInfo"
                                        completion:^(PB3VoiceTagPlayerInfoRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            DYLogInfo(@"PB3VoiceTagPlayerInfoRes === error:%d", ZYGNetRequestErrorTypeNet == error.errorType);
        }
        if (block) {
            block(rsp,error);
        }
    }];
}

- (void)achieveWealthLimitConfWithComplete:(void(^)(PB3LevelLimitConfIOSRes *res,NSString *errorMessage))completionBlock
{
    PB3LevelLimitConfIOSReq *req = [PB3LevelLimitConfIOSReq message];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3LevelLimitConfIOSRes class] ServiceName:kNetApiIndexExtService functionName:@"LevelLimitConfIOS" completion:^(PB3LevelLimitConfIOSRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (nError) {
            errorMessage = nError.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock)
            completionBlock(rsp, errorMessage);
    }];
}
//获取是否设置过性别、兴趣
- (void)loadHasSetSexAndInterest:(void(^)(PB3HasUpdateSexPasswdRes *rsp,ZYGNetRequestError *error))completionBlock
{
    PB3HasUpdateSexPasswdReq *req = [PB3HasUpdateSexPasswdReq message];
    
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                            header:nil
                                       channelType:ZYGChannelType_ShortConn
                                          rspClass:[PB3HasUpdateSexPasswdRes class]
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"HasUpdateSexPasswd"
                                        completion:^(PB3HasUpdateSexPasswdRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (error) {
            DYLogInfo(@"PB3HasUpdateSexPasswdRes === error:%d", ZYGNetRequestErrorTypeNet == error.errorType);
        }
        if (rsp) {
            if (completionBlock) {
                completionBlock(rsp,error);
            }
        }else{
            DYLogInfo(@"PB3HasUpdateSexPasswdRes = nil, === error:%d", ZYGNetRequestErrorTypeNet == error.errorType);
            if (completionBlock) {
                completionBlock(nil,error);
            }
        }
    }];
}
#pragma mark - 粉丝
//亲密粉丝牌子列表
- (void)fetchIntimateFansCardInfoList:(void(^)(PB3IntimateFansCardInfoRes *rsp,ZYGNetRequestError *error))completionBlock
{
    PB3IntimateFansCardInfoReq *req = [PB3IntimateFansCardInfoReq message];
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:PB3IntimateFansCardInfoRes.class
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"IntimateFansCardInfo"
                                        completion:^(PB3IntimateFansCardInfoRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (!error && rsp) {
            [ZYGService(IPlayerService) updateFansCardInfoList:rsp];
        }
        if (completionBlock) {
            completionBlock(rsp,error);
        }
        [(id<UserServiceDelegate>) self.delegateList userServiceUpdateFansCardInfoList];
    }];
}
//佩戴亲密粉丝牌子
- (void)setIntimateFansCardWithCardId:(int64_t)cardId
                           completion:(void(^)(PB3SetIntimateFansCardReq *rsp,NSString *errorMessage))completionBlock
{
    PB3SetIntimateFansCardReq *req = [PB3SetIntimateFansCardReq message];
    req.playerId = cardId;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
                                             cmdid:ZYGPROTOOperationType_OpSendSms
                                            header:nil
                                          rspClass:PB3SetIntimateFansCardRes.class
                                       ServiceName:kNetApiUserExtService
                                      functionName:@"SetIntimateFansCard"
                                        completion:^(PB3SetIntimateFansCardReq *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        if (!error && rsp) {
            [ZYGService(IPlayerService) updateCurrentFansCardInfoItem:rsp.playerId];
        }
        NSString *errorMessage = nil;
        if (error) {
            errorMessage = error.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (completionBlock) {
            completionBlock(rsp,errorMessage);
        }
        [(id<UserServiceDelegate>) self.delegateList userServiceUpdateCurrentFansCardInfoList];
    }];
}

- (void)updateFansCardInfoItem:(PB3PushIntimateFansCardInfo *)cardInfo
{
    switch (cardInfo.pushType) {
        case PB3PushIntimateFansCardInfoType_PifcitUpd:
        {
            [ZYGService(IPlayerService) updateFansCardInfoItem:cardInfo];
            [(id<UserServiceDelegate>) self.delegateList userServiceUpdateFansCardInfoList];
            break;
        }
        case PB3PushIntimateFansCardInfoType_PifcitAdd:
        {
            [self fetchIntimateFansCardInfoList:nil];
            break;
        }
        case PB3PushIntimateFansCardInfoType_PifcitDel:
        {
            [self fetchIntimateFansCardInfoList:nil];
            break;
        }
        default:
            break;
    }
}

///粉丝列表
- (void)fetchIntimateFansListWithIndex:(NSInteger)index completion:(void(^)(PB3IntimateFansHostViewRes *rsp, NSString *errorMsg, NSInteger errorCode))block
{
    PB3IntimateFansHostViewReq *req = [PB3IntimateFansHostViewReq message];
//    req.index = index;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:PB3IntimateFansHostViewRes.class ServiceName:kNetApiUserExtService functionName:@"IntimateFansHostView" completion:^(PB3IntimateFansHostViewRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (error) {
            errorMessage = error.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (block) {
            block(rsp, errorMessage, error.errorCode);
        }
    }];
}

///修改粉丝名片卡名称
- (void)modifyFansCardName:(NSString *)name completion:(void(^)(PB3SetIntimateFansCardInfoRes *rsp, NSString *errorMsg, NSInteger errorCode))block
{
    PB3SetIntimateFansCardInfoReq *req = [PB3SetIntimateFansCardInfoReq message];
    req.cardName = name;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:PB3SetIntimateFansCardInfoRes.class ServiceName:kNetApiUserExtService functionName:@"SetIntimateFansCardInfo" completion:^(PB3SetIntimateFansCardInfoRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSString *errorMessage = nil;
        if (error) {
            errorMessage = error.errorMessage;
        }
        else if (!rsp) {
            errorMessage = L(@"ClientError");
        }
        if (block) {
            block(rsp, errorMessage, error.errorCode);
        }
    }];
}

#pragma mark - ChannelSubscribe

- (void)subscribeWithChannelType:(PB3ChannelPrefix)channelType
                       channelId:(int64_t)channelId
{
    GPBInt64Int64Dictionary *dict = [[GPBInt64Int64Dictionary alloc] init];
    [dict setInt64:channelId forKey:channelType];
    [ZYGService(UserService) batchSubscribeWithDict:dict];
}

- (void)desubscribeWithChannelType:(PB3ChannelPrefix)channelType
{
    GPBInt64Array *list = [[GPBInt64Array alloc] init];
    [list addValue:channelType];
    [ZYGService(UserService) batchDesubscribeWithList:list];
}

//list key:PB3ChannelPrefix val:channelId
- (void)batchSubscribeWithDict:(GPBInt64Int64Dictionary *)dict
{
//    if (ZYGService(IPlayerService).accountID <= 0) {
//        DYLogInfo(@"Long link not login, ChannelSubscribe cancel!");
//        return;
//    }
//
//    long currentTimeMillis = ZYGNetworkTime.currentTimeMillis;
//    NSMutableArray<PB3ChannelSubscribeReq *> *subList = [NSMutableArray array];
//    [dict enumerateKeysAndInt64sUsingBlock:^(int64_t key, int64_t value, BOOL * _Nonnull stop) {
//        PB3ChannelSubscribeReq *subReq = [PB3ChannelSubscribeReq message];
//        subReq.channelType = (PB3ChannelPrefix)key;
//        subReq.channelId = value;
//        subReq.timestamp = currentTimeMillis;
//        [subList addObject:subReq];
//    }];
//
//    PB3BatchChannelSubscribeReq *req = [PB3BatchChannelSubscribeReq message];
//    req.channelListArray = subList;
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
//                                            header:nil
//                                       channelType:ZYGChannelType_LongConn
//                                          rspClass:PB3BatchChannelSubscribeRes.class
//                                       ServiceName:kNetApiUserExtService
//                                      functionName:@"BatchChannelSubscribe"
//                                        completion:^(PB3BatchChannelSubscribeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        NSString *errorMessage = nil;
//        if (error) {
//            errorMessage = error.errorMessage;
//        } else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//
//        if (errorMessage) {
//            DYLogError(@"BatchChannelSubscribe error: %@", dict);
//        } else {
//            DYLogInfo(@"BatchChannelSubscribe success: %@", dict);
//        }
//    }];
}

////list val:PB3ChannelPrefix
- (void)batchDesubscribeWithList:(GPBInt64Array *)list
{
//    if (ZYGService(IPlayerService).accountID <= 0) {
//        DYLogInfo(@"Long link not login, ChannelDesubscribe cancel!");
//        return;
//    }
//
//    long currentTimeMillis = ZYGNetworkTime.currentTimeMillis;
//    NSMutableArray<PB3ChannelDesubscribeReq *> *subList = [NSMutableArray array];
//    [list enumerateValuesWithBlock:^(int64_t value, NSUInteger idx, BOOL * _Nonnull stop) {
//        PB3ChannelDesubscribeReq *subReq = [PB3ChannelDesubscribeReq message];
//        subReq.channelType = (PB3ChannelPrefix)value;
//        subReq.timestamp = currentTimeMillis;
//        [subList addObject:subReq];
//    }];
//
//    PB3BatchChannelDesubscribeReq *req = [PB3BatchChannelDesubscribeReq message];
//    req.channelListArray = subList;
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req
//                                            header:nil
//                                       channelType:ZYGChannelType_LongConn
//                                          rspClass:PB3BatchChannelDesubscribeRes.class
//                                       ServiceName:kNetApiUserExtService
//                                      functionName:@"BatchChannelDesubscribe"
//                                        completion:^(PB3BatchChannelDesubscribeRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        NSString *errorMessage = nil;
//        if (error) {
//            errorMessage = error.errorMessage;
//        } else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//
//        if (errorMessage) {
//            DYLogError(@"BatchChannelDesubscribe error: %@", list);
//        } else {
//            DYLogInfo(@"BatchChannelDesubscribe success: %@", list);
//        }
//    }];
}
//
//- (void)fetchHighLightPlayId:(int64_t)playId index:(int32_t)index uniq:(BOOL)uniq sort:(PB3HighlightGiftMomentListSort)sort completionBlock:(void (^)(PB3HighlightGiftMomentListRes *, NSString *, NSInteger))callback {
//    PB3HighlightGiftMomentListReq *req = [PB3HighlightGiftMomentListReq message];
//    req.playerId = playId;
//    req.index = index;
//    req.isUniq = uniq;
//    req.sort = sort;
//
//    [ZYGService(IZYGNetworkService)
//     sendRequestWithReq:req
//     cmdid:ZYGPROTOOperationType_OpSendSms
//     header:nil
//     rspClass:[PB3HighlightGiftMomentListRes class]
//     ServiceName:kNetApiGiftExtService
//     functionName:@"HighlightGiftMomentList"
//     completion:^(PB3HighlightGiftMomentListRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
//        NSString *errorMessage = nil;
//        if (nError) {
//            errorMessage = nError.errorMessage;
//        } else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//
//        if (callback) {
//            callback(rsp, errorMessage, nError.errorCode);
//        }
//    }];
//}
//
//- (void)setHighlightGiftTimeRange:(PB3HighlightGiftShowRange)range completionBlock:(void (^)(PB3HighlightGiftShowRangeRes *, NSString *, NSInteger))completionBlock
//{
//    PB3HighlightGiftShowRangeReq *req = [PB3HighlightGiftShowRangeReq message];
//    req.range = range;
//    [ZYGService(IZYGNetworkService)
//     sendRequestWithReq:req
//     cmdid:ZYGPROTOOperationType_OpSendSms
//     header:nil
//     rspClass:[PB3HighlightGiftShowRangeRes class]
//     ServiceName:kNetApiGiftExtService
//     functionName:@"HighlightGiftShowRange"
//     completion:^(PB3HighlightGiftShowRangeRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
//        NSString *errorMessage = nil;
//        if (nError) {
//            errorMessage = nError.errorMessage;
//        } else if (!rsp) {
//            errorMessage = L(@"ClientError");
//        }
//
//        if (completionBlock) {
//            completionBlock(rsp, errorMessage, nError.errorCode);
//        }
//    }];
//}

- (void)changePassword:(NSString *)password accountID:(NSInteger)accountID completion:(void(^)(BOOL success, NSString *msg))completion {
    PB3ChangePasswdReq *req = [PB3ChangePasswdReq message];
    req.value = password;
//    req.playerId = accountID;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3ChangePasswdRes.class ServiceName:kNetApiUserExtService functionName:@"ChangePasswd" completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSLog(@"changePassword[ChangePasswd] = %@,error = %@", rsp, error);
        if (completion) {
            completion(error == nil, error.errorMessage);
        }
    }];
}

//- (void)statisticInformationWithAccountID:(NSInteger)account completion:(void(^)(PB3AccountInteractInfoRes *, NSString *))completion {
//    PB3AccountInteractInfoReq *req = [PB3AccountInteractInfoReq message];
//    req.playerId = account;
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3AccountInteractInfoRes.class ServiceName:kNetApiUserExtService functionName:@"AccountInteractInfo" completion:^(id rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        NSLog(@"statisticInformationWithCompletion[AccountInteractInfo] = %@,error = %@", rsp, error);
//        if (completion) {
//            completion(rsp, error.errorMessage);
//        }
//    }];
//}

- (void)loadContactListWithType:(PB3ContactType)type userID:(NSInteger)userID completion:(void(^)(NSArray<PB3Friender *> *, NSString *))completion {
//    PB3ContactListReq *req = [PB3ContactListReq message];
//    req.contactType = type;
//    req.ownerId = userID;
//    req.forceFullSync = YES;
//    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3ContactListRes.class ServiceName:kNetApiFriendExtService functionName:@"ContactList" completion:^(PB3ContactListRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
//        NSLog(@"loadContactListWithCompletion[ContactList] = %@,error = %@", rsp, error);
//        if (completion) {
//            completion(rsp.listArray, error.errorMessage);
//        }
//    }];
}

- (void)sendGiftToUser:(NSInteger)receiver gift:(NSInteger)giftID count:(NSInteger)count msg:(NSString *)msg completion:(void(^)(BOOL success, NSString *))completion {
    PB3GiftPresentReq *req = [PB3GiftPresentReq message];
    req.toId = receiver;
    req.giftNum = (int)count;
    req.giftEntry = (int)giftID;
    req.msg = msg;
    req.content = msg;
    req.source = PB3SendGiftSource_SgsDefault;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3GiftPresentRes.class ServiceName:kNetApiGiftExtService functionName:@"Present" completion:^(PB3GiftPresentRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSLog(@"sendGiftToUser = %@,error = %@", rsp, error);
        if (completion) {
            completion(error==nil, error.errorMessage);
        }
    }];
}

- (void)loadRelationshipWithUser:(NSInteger)userID completion:(void(^)(PB3FriendType relationship, NSString *errMsg))completion {
    PB3GetFriendRelReq *req = [PB3GetFriendRelReq message];
    req.playerId = ZYGService(IPlayerService).accountID;
    req.targetId = userID;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3GetFriendRelRes.class ServiceName:kNetApiFriendExtService functionName:@"GetFriendRel" completion:^(PB3GetFriendRelRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSLog(@"loadRelationshipWithUser = %@,error = %@", rsp, error);
        if (completion) {
            completion(rsp.friendType, error.errorMessage);
        }
    }];
}

- (void)followUser:(NSInteger)userID completion:(void(^)(BOOL success, NSString *errMsg))completion {
    [self managerFriend:userID type:PB3OperType_Follow completion:completion];
}

- (void)unfollowUser:(NSInteger)userID completion:(void(^)(BOOL success, NSString *errMsg))completion {
    [self managerFriend:userID type:PB3OperType_Unfollow completion:completion];
}

- (void)managerFriend:(NSInteger)userID type:(PB3OperType)type completion:(void(^)(BOOL success, NSString *errMsg))completion {
    PB3FriendOperReq *req = [PB3FriendOperReq message];
    req.id_p = userID;
    req.oper = type;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3FriendOperRes.class ServiceName:kNetApiFriendExtService functionName:@"FriendOper" completion:^(PB3GetFriendRelRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSLog(@"managerFriend[type=%i] resp = %@,error = %@", (int)type, rsp, error);
        if (completion) {
            completion(error == nil, error.errorMessage);
        }
    }];
}

- (void)loadUserInfomation:(NSInteger)userID completion:(void(^)(PB3PlayerInfo *player, NSString *errMsg))completion {
    PB3PlayerInfoListReq *req = [PB3PlayerInfoListReq message];
    GPBInt64Array *ids = [GPBInt64Array array];
    [ids addValue:userID];
    req.idsArray = ids;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req cmdid:ZYGPROTOOperationType_OpSendSms header:nil rspClass:[PB3PlayerInfoListRes class] ServiceName:kNetApiUserExtService functionName:@"GetPlayerInfoList" completion:^(PB3PlayerInfoListRes *rsp, ZYGNetRequestError *nError, ZYGNetRequestInfo *info) {
        if (completion) {
            if (rsp.listArray.count > 0) {
                completion(rsp.listArray.firstObject, nError.errorMessage);
            }else {
                completion(nil, nError.errorMessage);
            }
        }
    }];
}

- (void)purchaseProduct:(NSInteger)pID completion:(void(^)(BOOL success, NSString *errMsg))completion {
    PB3BuyReq *req = [PB3BuyReq message];
    req.id_p = (int)pID;
    req.num = 1;
    req.type = 0;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:ZYGChannelType_ShortConn rspClass:PB3BuyRes.class ServiceName:kNetApiStoreExtService functionName:@"Buy" completion:^(PB3BuyRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        NSLog(@"purchaseProduct[pID=%i] resp = %@,error = %@", (int)pID, rsp, error);
        if (completion) {
            completion(error == nil, error.errorMessage);
        }
    }];
}

@end
