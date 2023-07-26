//
//  ILoginProtocol.m
//  huhuAudio
//
//  Created by flyhuang on 2018/12/24.
//  Copyright © 2018 XYWL. All rights reserved.
//

#import "ILoginProtocol.h"

N_Def(kCheckActivityOnNotification);
N_Def(kCheckActivityOnNotification_switchModel);
N_Def(kVeryCodeNotification);
N_Def(kBindPhoneNotification);
N_Def(kSendSMSCodeNotification);
N_Def(kRegisterNotification);
N_Def(kReSetPasswordNotification);
N_Def(kGetUserSigNotification);
N_Def(kGetUserSigNotification_UserSigRes);
N_Def(kLoginResultNotification);
N_Def(kLongLinkSuccessNotification);
N_Def(kLongLinkNotification_PROTOLoginRes);
N_Def(kLoginRegisterServiceDidLoginNotification);   //登录完成，playId已经有值
N_Def(kNotificationDidLogin);
N_Def(kNotificationQuickChatSwitchStatusChanged);
N_Def(kNotificationQuickChatSwitchStatusUpdated);
N_Def(kNotificationDidShortLogin);
N_Def(kNotificationLogout);
N_Def(kWillLogoutNotification);
N_Def(kUpdateSpecailNotification);

N_Def(kGetKeySuccessNotification);
N_Def(kGetUserIdsNotification);
N_Def(kPlayerChooseAccountNotification);
N_Def(kPlayerChooseAccountHaveRemind);

N_Def(kPlayerFlagsNotification);// 用户Flag发送变化
N_Def(kHomeAlertNotification);// 弹出普通样式弹窗
N_Def(kNotificationUserPrivacyKeyChanged);

N_Def(kNewUserDidChooseGender);             //新注册用户选择了性别
N_Def(kNotificationUserMultiLoginStatusChange); //多端登录状态改变
N_Def(kNotificationUserDeviceOffline); //设备离线
