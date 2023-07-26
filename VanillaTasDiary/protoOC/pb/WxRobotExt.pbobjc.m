 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/WxRobotExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3WxRobotExtRoot

@implementation PB3WxRobotExtRoot

 
 

@end

#pragma mark - PB3WxRobotExtRoot_FileDescriptor

static GPBFileDescriptor *PB3WxRobotExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3WxRobotChatCommand

GPBEnumDescriptor *PB3WxRobotChatCommand_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WxccNone\000WxccStar\000WxccLucknum\000WxccAppoin"
        "tManager\000WxccDisappointManager\000WxccKickG"
        "roupMember\000WxccShowManager\000WxccSyncGroup"
        "Member\000WxccShowGroupManagerFunc\000WxccShow"
        "GroupGearFunc\000WxccGearTemplate\000WxccGearH"
        "ostSet\000WxccShowGearHost\000WxccThisWeekGear"
        "\000WxccLastWeekGear\000WxccEditLastWeekGear\000W"
        "xccNowGear\000WxccEditGroupNotice\000WxccGetAl"
        "lBoss\000WxccGetManBoss\000WxccGetWomanBoss\000Wx"
        "ccStopGetBoss\000";
    static const int32_t values[] = {
        PB3WxRobotChatCommand_WxccNone,
        PB3WxRobotChatCommand_WxccStar,
        PB3WxRobotChatCommand_WxccLucknum,
        PB3WxRobotChatCommand_WxccAppointManager,
        PB3WxRobotChatCommand_WxccDisappointManager,
        PB3WxRobotChatCommand_WxccKickGroupMember,
        PB3WxRobotChatCommand_WxccShowManager,
        PB3WxRobotChatCommand_WxccSyncGroupMember,
        PB3WxRobotChatCommand_WxccShowGroupManagerFunc,
        PB3WxRobotChatCommand_WxccShowGroupGearFunc,
        PB3WxRobotChatCommand_WxccGearTemplate,
        PB3WxRobotChatCommand_WxccGearHostSet,
        PB3WxRobotChatCommand_WxccShowGearHost,
        PB3WxRobotChatCommand_WxccThisWeekGear,
        PB3WxRobotChatCommand_WxccLastWeekGear,
        PB3WxRobotChatCommand_WxccEditLastWeekGear,
        PB3WxRobotChatCommand_WxccNowGear,
        PB3WxRobotChatCommand_WxccEditGroupNotice,
        PB3WxRobotChatCommand_WxccGetAllBoss,
        PB3WxRobotChatCommand_WxccGetManBoss,
        PB3WxRobotChatCommand_WxccGetWomanBoss,
        PB3WxRobotChatCommand_WxccStopGetBoss,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxRobotChatCommand)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxRobotChatCommand_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxRobotChatCommand_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxRobotChatCommand_WxccNone:
    case PB3WxRobotChatCommand_WxccStar:
    case PB3WxRobotChatCommand_WxccLucknum:
    case PB3WxRobotChatCommand_WxccAppointManager:
    case PB3WxRobotChatCommand_WxccDisappointManager:
    case PB3WxRobotChatCommand_WxccKickGroupMember:
    case PB3WxRobotChatCommand_WxccShowManager:
    case PB3WxRobotChatCommand_WxccSyncGroupMember:
    case PB3WxRobotChatCommand_WxccShowGroupManagerFunc:
    case PB3WxRobotChatCommand_WxccShowGroupGearFunc:
    case PB3WxRobotChatCommand_WxccGearTemplate:
    case PB3WxRobotChatCommand_WxccGearHostSet:
    case PB3WxRobotChatCommand_WxccShowGearHost:
    case PB3WxRobotChatCommand_WxccThisWeekGear:
    case PB3WxRobotChatCommand_WxccLastWeekGear:
    case PB3WxRobotChatCommand_WxccEditLastWeekGear:
    case PB3WxRobotChatCommand_WxccNowGear:
    case PB3WxRobotChatCommand_WxccEditGroupNotice:
    case PB3WxRobotChatCommand_WxccGetAllBoss:
    case PB3WxRobotChatCommand_WxccGetManBoss:
    case PB3WxRobotChatCommand_WxccGetWomanBoss:
    case PB3WxRobotChatCommand_WxccStopGetBoss:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3WxRobotCmdId

GPBEnumDescriptor *PB3WxRobotCmdId_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WrNone\000WrReqLoginQrCode\000WrReqWxRobotInfo"
        "\000WrRobotChat\000WrReqRobotFriend\000WrReqSyncG"
        "roupMember\000WrReqSyncRobotFriendList\000WrRe"
        "qRobotDeleteFriend\000WrReqRobotQuitGroup\000W"
        "rReqRobotGroupMemberName\000WrReqRobotGroup"
        "List\000WrReqRobotKickOutGroupMember\000";
    static const int32_t values[] = {
        PB3WxRobotCmdId_WrNone,
        PB3WxRobotCmdId_WrReqLoginQrCode,
        PB3WxRobotCmdId_WrReqWxRobotInfo,
        PB3WxRobotCmdId_WrRobotChat,
        PB3WxRobotCmdId_WrReqRobotFriend,
        PB3WxRobotCmdId_WrReqSyncGroupMember,
        PB3WxRobotCmdId_WrReqSyncRobotFriendList,
        PB3WxRobotCmdId_WrReqRobotDeleteFriend,
        PB3WxRobotCmdId_WrReqRobotQuitGroup,
        PB3WxRobotCmdId_WrReqRobotGroupMemberName,
        PB3WxRobotCmdId_WrReqRobotGroupList,
        PB3WxRobotCmdId_WrReqRobotKickOutGroupMember,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxRobotCmdId)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxRobotCmdId_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxRobotCmdId_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxRobotCmdId_WrNone:
    case PB3WxRobotCmdId_WrReqLoginQrCode:
    case PB3WxRobotCmdId_WrReqWxRobotInfo:
    case PB3WxRobotCmdId_WrRobotChat:
    case PB3WxRobotCmdId_WrReqRobotFriend:
    case PB3WxRobotCmdId_WrReqSyncGroupMember:
    case PB3WxRobotCmdId_WrReqSyncRobotFriendList:
    case PB3WxRobotCmdId_WrReqRobotDeleteFriend:
    case PB3WxRobotCmdId_WrReqRobotQuitGroup:
    case PB3WxRobotCmdId_WrReqRobotGroupMemberName:
    case PB3WxRobotCmdId_WrReqRobotGroupList:
    case PB3WxRobotCmdId_WrReqRobotKickOutGroupMember:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3WxRobotFunc

GPBEnumDescriptor *PB3WxRobotFunc_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WrfNone\000WrfConstellation\000WrfLuckyNum\000Wrf"
        "GroupManager\000WrfGroupGear\000Wrf8BossInfo\000";
    static const int32_t values[] = {
        PB3WxRobotFunc_WrfNone,
        PB3WxRobotFunc_WrfConstellation,
        PB3WxRobotFunc_WrfLuckyNum,
        PB3WxRobotFunc_WrfGroupManager,
        PB3WxRobotFunc_WrfGroupGear,
        PB3WxRobotFunc_Wrf8BossInfo,
    };
    static const char *extraTextFormatInfo = "\001\005c\201\344\344\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxRobotFunc)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxRobotFunc_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxRobotFunc_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxRobotFunc_WrfNone:
    case PB3WxRobotFunc_WrfConstellation:
    case PB3WxRobotFunc_WrfLuckyNum:
    case PB3WxRobotFunc_WrfGroupManager:
    case PB3WxRobotFunc_WrfGroupGear:
    case PB3WxRobotFunc_Wrf8BossInfo:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3RobotChatTargetType

GPBEnumDescriptor *PB3RobotChatTargetType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RctGroup\000RctUser\000";
    static const int32_t values[] = {
        PB3RobotChatTargetType_RctGroup,
        PB3RobotChatTargetType_RctUser,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3RobotChatTargetType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3RobotChatTargetType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3RobotChatTargetType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3RobotChatTargetType_RctGroup:
    case PB3RobotChatTargetType_RctUser:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3ReqFriendType

GPBEnumDescriptor *PB3ReqFriendType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RftWxId\000RftWxAccount\000";
    static const int32_t values[] = {
        PB3ReqFriendType_RftWxId,
        PB3ReqFriendType_RftWxAccount,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3ReqFriendType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3ReqFriendType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3ReqFriendType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3ReqFriendType_RftWxId:
    case PB3ReqFriendType_RftWxAccount:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3WxMsgType

GPBEnumDescriptor *PB3WxMsgType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WmtNone\000WmtText\000WmtPic\000WmtFile\000WmtGift\000W"
        "mtGroupAt\000WmtWxCard\000WmtXml\000WmtApplets\000Wm"
        "tVoice\000WmtVideo\000WmtGroupNotice\000WmtQrcode"
        "\000";
    static const int32_t values[] = {
        PB3WxMsgType_WmtNone,
        PB3WxMsgType_WmtText,
        PB3WxMsgType_WmtPic,
        PB3WxMsgType_WmtFile,
        PB3WxMsgType_WmtGift,
        PB3WxMsgType_WmtGroupAt,
        PB3WxMsgType_WmtWxCard,
        PB3WxMsgType_WmtXml,
        PB3WxMsgType_WmtApplets,
        PB3WxMsgType_WmtVoice,
        PB3WxMsgType_WmtVideo,
        PB3WxMsgType_WmtGroupNotice,
        PB3WxMsgType_WmtQrcode,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxMsgType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxMsgType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxMsgType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxMsgType_WmtNone:
    case PB3WxMsgType_WmtText:
    case PB3WxMsgType_WmtPic:
    case PB3WxMsgType_WmtFile:
    case PB3WxMsgType_WmtGift:
    case PB3WxMsgType_WmtGroupAt:
    case PB3WxMsgType_WmtWxCard:
    case PB3WxMsgType_WmtXml:
    case PB3WxMsgType_WmtApplets:
    case PB3WxMsgType_WmtVoice:
    case PB3WxMsgType_WmtVideo:
    case PB3WxMsgType_WmtGroupNotice:
    case PB3WxMsgType_WmtQrcode:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3WxSex

GPBEnumDescriptor *PB3WxSex_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WxSexWoman\000WxSexMan\000";
    static const int32_t values[] = {
        PB3WxSex_WxSexWoman,
        PB3WxSex_WxSexMan,
    };
    static const char *extraTextFormatInfo = "\002\000\005\205\000\001\005\203\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxSex)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxSex_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxSex_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxSex_WxSexWoman:
    case PB3WxSex_WxSexMan:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3UserRobotStatus

GPBEnumDescriptor *PB3UserRobotStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "UrsNotActive\000UrsApplying\000UrsActive\000";
    static const int32_t values[] = {
        PB3UserRobotStatus_UrsNotActive,
        PB3UserRobotStatus_UrsApplying,
        PB3UserRobotStatus_UrsActive,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3UserRobotStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3UserRobotStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3UserRobotStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3UserRobotStatus_UrsNotActive:
    case PB3UserRobotStatus_UrsApplying:
    case PB3UserRobotStatus_UrsActive:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3GroupRobotStatus

GPBEnumDescriptor *PB3GroupRobotStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "GrsNotActive\000GrsApplying\000GrsActive\000";
    static const int32_t values[] = {
        PB3GroupRobotStatus_GrsNotActive,
        PB3GroupRobotStatus_GrsApplying,
        PB3GroupRobotStatus_GrsActive,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3GroupRobotStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3GroupRobotStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3GroupRobotStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3GroupRobotStatus_GrsNotActive:
    case PB3GroupRobotStatus_GrsApplying:
    case PB3GroupRobotStatus_GrsActive:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3WxGroupKickType

GPBEnumDescriptor *PB3WxGroupKickType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "WgktNone\000WgktAlarmOne\000WgktAlarmThree\000";
    static const int32_t values[] = {
        PB3WxGroupKickType_WgktNone,
        PB3WxGroupKickType_WgktAlarmOne,
        PB3WxGroupKickType_WgktAlarmThree,
    };
    static const char *extraTextFormatInfo = "\001\000d\204\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3WxGroupKickType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3WxGroupKickType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3WxGroupKickType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3WxGroupKickType_WgktNone:
    case PB3WxGroupKickType_WgktAlarmOne:
    case PB3WxGroupKickType_WgktAlarmThree:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3GearItemType

GPBEnumDescriptor *PB3GearItemType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "GitNone\000GitGift\000GitRandWords\000";
    static const int32_t values[] = {
        PB3GearItemType_GitNone,
        PB3GearItemType_GitGift,
        PB3GearItemType_GitRandWords,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3GearItemType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3GearItemType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3GearItemType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3GearItemType_GitNone:
    case PB3GearItemType_GitGift:
    case PB3GearItemType_GitRandWords:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3AlarmType

GPBEnumDescriptor *PB3AlarmType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "AtNone\000AtWarn\000";
    static const int32_t values[] = {
        PB3AlarmType_AtNone,
        PB3AlarmType_AtWarn,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3AlarmType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3AlarmType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3AlarmType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3AlarmType_AtNone:
    case PB3AlarmType_AtWarn:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3ReportAppType

GPBEnumDescriptor *PB3ReportAppType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RatNone\000RatOxygen\000";
    static const int32_t values[] = {
        PB3ReportAppType_RatNone,
        PB3ReportAppType_RatOxygen,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3ReportAppType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3ReportAppType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3ReportAppType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3ReportAppType_RatNone:
    case PB3ReportAppType_RatOxygen:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3ReportAppStatus

GPBEnumDescriptor *PB3ReportAppStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "RasNotActive\000RasApplying\000RasActive\000";
    static const int32_t values[] = {
        PB3ReportAppStatus_RasNotActive,
        PB3ReportAppStatus_RasApplying,
        PB3ReportAppStatus_RasActive,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3ReportAppStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3ReportAppStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3ReportAppStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3ReportAppStatus_RasNotActive:
    case PB3ReportAppStatus_RasApplying:
    case PB3ReportAppStatus_RasActive:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3ReqLoginQRCode

@implementation PB3ReqLoginQRCode

@dynamic robotWxId;

typedef struct PB3ReqLoginQRCode__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3ReqLoginQRCode__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqLoginQRCode_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqLoginQRCode__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqLoginQRCode class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqLoginQRCode__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotDetail

@implementation PB3ReqWxRobotDetail

@dynamic robotWxId;

typedef struct PB3ReqWxRobotDetail__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3ReqWxRobotDetail__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotDetail_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotDetail__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotDetail class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotDetail__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotChat

@implementation PB3WxRobotChat

@dynamic robotWxId;
@dynamic targetType;
@dynamic targetIdArray, targetIdArray_Count;
@dynamic msgType;
@dynamic sendContent;

typedef struct PB3WxRobotChat__storage_ {
  uint32_t _has_storage_[1];
  PB3RobotChatTargetType targetType;
  PB3WxMsgType msgType;
  NSString *robotWxId;
  NSMutableArray *targetIdArray;
  NSData *sendContent;
} PB3WxRobotChat__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotChat_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotChat__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetType",
        .dataTypeSpecific.enumDescFunc = PB3RobotChatTargetType_EnumDescriptor,
        .number = PB3WxRobotChat_FieldNumber_TargetType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotChat__storage_, targetType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "targetIdArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotChat_FieldNumber_TargetIdArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxRobotChat__storage_, targetIdArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "msgType",
        .dataTypeSpecific.enumDescFunc = PB3WxMsgType_EnumDescriptor,
        .number = PB3WxRobotChat_FieldNumber_MsgType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxRobotChat__storage_, msgType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "sendContent",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotChat_FieldNumber_SendContent,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3WxRobotChat__storage_, sendContent),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotChat class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotChat__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3WxRobotChat_TargetType_RawValue(PB3WxRobotChat *message) {
  GPBDescriptor *descriptor = [PB3WxRobotChat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotChat_FieldNumber_TargetType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxRobotChat_TargetType_RawValue(PB3WxRobotChat *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxRobotChat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotChat_FieldNumber_TargetType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3WxRobotChat_MsgType_RawValue(PB3WxRobotChat *message) {
  GPBDescriptor *descriptor = [PB3WxRobotChat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotChat_FieldNumber_MsgType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxRobotChat_MsgType_RawValue(PB3WxRobotChat *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxRobotChat descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotChat_FieldNumber_MsgType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3SendWmtGroupAt

@implementation PB3SendWmtGroupAt

@dynamic atListArray, atListArray_Count;
@dynamic msg;

typedef struct PB3SendWmtGroupAt__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *atListArray;
  NSString *msg;
} PB3SendWmtGroupAt__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "atListArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtGroupAt_FieldNumber_AtListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3SendWmtGroupAt__storage_, atListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "msg",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtGroupAt_FieldNumber_Msg,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3SendWmtGroupAt__storage_, msg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SendWmtGroupAt class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SendWmtGroupAt__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SendWmtCard

@implementation PB3SendWmtCard

@dynamic cardWxId;
@dynamic cardWxName;

typedef struct PB3SendWmtCard__storage_ {
  uint32_t _has_storage_[1];
  NSString *cardWxId;
  NSString *cardWxName;
} PB3SendWmtCard__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "cardWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtCard_FieldNumber_CardWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3SendWmtCard__storage_, cardWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "cardWxName",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtCard_FieldNumber_CardWxName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3SendWmtCard__storage_, cardWxName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SendWmtCard class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SendWmtCard__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SendWmtXmlArticle

@implementation PB3SendWmtXmlArticle

@dynamic title;
@dynamic desc;
@dynamic URL;
@dynamic imagePath;

typedef struct PB3SendWmtXmlArticle__storage_ {
  uint32_t _has_storage_[1];
  NSString *title;
  NSString *desc;
  NSString *URL;
  NSString *imagePath;
} PB3SendWmtXmlArticle__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "title",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtXmlArticle_FieldNumber_Title,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3SendWmtXmlArticle__storage_, title),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "desc",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtXmlArticle_FieldNumber_Desc,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3SendWmtXmlArticle__storage_, desc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "URL",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtXmlArticle_FieldNumber_URL,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3SendWmtXmlArticle__storage_, URL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "imagePath",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtXmlArticle_FieldNumber_ImagePath,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3SendWmtXmlArticle__storage_, imagePath),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SendWmtXmlArticle class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SendWmtXmlArticle__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003!!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SendWmtApplets

@implementation PB3SendWmtApplets

@dynamic imagePath;
@dynamic xmlMsg;

typedef struct PB3SendWmtApplets__storage_ {
  uint32_t _has_storage_[1];
  NSString *imagePath;
  NSString *xmlMsg;
} PB3SendWmtApplets__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "imagePath",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtApplets_FieldNumber_ImagePath,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3SendWmtApplets__storage_, imagePath),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "xmlMsg",
        .dataTypeSpecific.className = NULL,
        .number = PB3SendWmtApplets_FieldNumber_XmlMsg,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3SendWmtApplets__storage_, xmlMsg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SendWmtApplets class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SendWmtApplets__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotFriend

@implementation PB3ReqWxRobotFriend

@dynamic robotWxId;
@dynamic reqType;
@dynamic friend_p;

typedef struct PB3ReqWxRobotFriend__storage_ {
  uint32_t _has_storage_[1];
  PB3ReqFriendType reqType;
  NSString *robotWxId;
  NSString *friend_p;
} PB3ReqWxRobotFriend__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotFriend_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotFriend__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "reqType",
        .dataTypeSpecific.enumDescFunc = PB3ReqFriendType_EnumDescriptor,
        .number = PB3ReqWxRobotFriend_FieldNumber_ReqType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotFriend__storage_, reqType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "friend_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotFriend_FieldNumber_Friend_p,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotFriend__storage_, friend_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotFriend class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotFriend__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3ReqWxRobotFriend_ReqType_RawValue(PB3ReqWxRobotFriend *message) {
  GPBDescriptor *descriptor = [PB3ReqWxRobotFriend descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReqWxRobotFriend_FieldNumber_ReqType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3ReqWxRobotFriend_ReqType_RawValue(PB3ReqWxRobotFriend *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3ReqWxRobotFriend descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReqWxRobotFriend_FieldNumber_ReqType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3ReqWxRobotSynGroupMember

@implementation PB3ReqWxRobotSynGroupMember

@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3ReqWxRobotSynGroupMember__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
} PB3ReqWxRobotSynGroupMember__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotSynGroupMember_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotSynGroupMember__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotSynGroupMember_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotSynGroupMember__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotSynGroupMember class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotSynGroupMember__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotSynFriendList

@implementation PB3ReqWxRobotSynFriendList

@dynamic robotWxId;

typedef struct PB3ReqWxRobotSynFriendList__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3ReqWxRobotSynFriendList__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotSynFriendList_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotSynFriendList__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotSynFriendList class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotSynFriendList__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotDelFriend

@implementation PB3ReqWxRobotDelFriend

@dynamic robotWxId;
@dynamic delFriendId;

typedef struct PB3ReqWxRobotDelFriend__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *delFriendId;
} PB3ReqWxRobotDelFriend__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotDelFriend_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotDelFriend__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "delFriendId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotDelFriend_FieldNumber_DelFriendId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotDelFriend__storage_, delFriendId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotDelFriend class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotDelFriend__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotQuitGroup

@implementation PB3ReqWxRobotQuitGroup

@dynamic robotWxId;
@dynamic wxGroupId;

typedef struct PB3ReqWxRobotQuitGroup__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *wxGroupId;
} PB3ReqWxRobotQuitGroup__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotQuitGroup_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotQuitGroup__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxGroupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotQuitGroup_FieldNumber_WxGroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotQuitGroup__storage_, wxGroupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotQuitGroup class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotQuitGroup__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotGetGroupMemberName

@implementation PB3ReqWxRobotGetGroupMemberName

@dynamic robotWxId;
@dynamic groupId;
@dynamic memberWxIdArray, memberWxIdArray_Count;

typedef struct PB3ReqWxRobotGetGroupMemberName__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
  NSMutableArray *memberWxIdArray;
} PB3ReqWxRobotGetGroupMemberName__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotGetGroupMemberName_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotGetGroupMemberName__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotGetGroupMemberName_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotGetGroupMemberName__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "memberWxIdArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotGetGroupMemberName_FieldNumber_MemberWxIdArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotGetGroupMemberName__storage_, memberWxIdArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotGetGroupMemberName class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotGetGroupMemberName__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqWxRobotGetGroupList

@implementation PB3ReqWxRobotGetGroupList

@dynamic robotWxId;

typedef struct PB3ReqWxRobotGetGroupList__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3ReqWxRobotGetGroupList__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqWxRobotGetGroupList_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqWxRobotGetGroupList__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqWxRobotGetGroupList class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqWxRobotGetGroupList__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReqRobotKickOutGroupMember

@implementation PB3ReqRobotKickOutGroupMember

@dynamic robotWxId;
@dynamic groupId;
@dynamic memberWxId;

typedef struct PB3ReqRobotKickOutGroupMember__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
  NSString *memberWxId;
} PB3ReqRobotKickOutGroupMember__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqRobotKickOutGroupMember_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReqRobotKickOutGroupMember__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqRobotKickOutGroupMember_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReqRobotKickOutGroupMember__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "memberWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReqRobotKickOutGroupMember_FieldNumber_MemberWxId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3ReqRobotKickOutGroupMember__storage_, memberWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReqRobotKickOutGroupMember class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReqRobotKickOutGroupMember__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxLoginQRCodeReq

@implementation PB3WxLoginQRCodeReq

@dynamic qrCode;
@dynamic robotWxId;

typedef struct PB3WxLoginQRCodeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *qrCode;
  NSString *robotWxId;
} PB3WxLoginQRCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "qrCode",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxLoginQRCodeReq_FieldNumber_QrCode,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxLoginQRCodeReq__storage_, qrCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxLoginQRCodeReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxLoginQRCodeReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxLoginQRCodeReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxLoginQRCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxLoginQRCodeRes

@implementation PB3WxLoginQRCodeRes


typedef struct PB3WxLoginQRCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxLoginQRCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxLoginQRCodeRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxLoginQRCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxNotifyLoginReq

@implementation PB3WxNotifyLoginReq

@dynamic robotWxId;

typedef struct PB3WxNotifyLoginReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3WxNotifyLoginReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxNotifyLoginReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxNotifyLoginReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxNotifyLoginReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxNotifyLoginReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxNotifyLoginRes

@implementation PB3WxNotifyLoginRes


typedef struct PB3WxNotifyLoginRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxNotifyLoginRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxNotifyLoginRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxNotifyLoginRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxHeartbeatReq

@implementation PB3WxHeartbeatReq

@dynamic robotWxId;

typedef struct PB3WxHeartbeatReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
} PB3WxHeartbeatReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxHeartbeatReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxHeartbeatReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxHeartbeatReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxHeartbeatReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxHeartbeatRes

@implementation PB3WxHeartbeatRes


typedef struct PB3WxHeartbeatRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxHeartbeatRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxHeartbeatRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxHeartbeatRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotDetailReq

@implementation PB3WxRobotDetailReq

@dynamic hasInfo, info;

typedef struct PB3WxRobotDetailReq__storage_ {
  uint32_t _has_storage_[1];
  PB3WxUserDetail *info;
} PB3WxRobotDetailReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "info",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxRobotDetailReq_FieldNumber_Info,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotDetailReq__storage_, info),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotDetailReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotDetailReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotDetailRes

@implementation PB3WxRobotDetailRes


typedef struct PB3WxRobotDetailRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotDetailRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotDetailRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotDetailRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxChatMsg

@implementation PB3WxChatMsg

@dynamic msgType;
@dynamic content;

typedef struct PB3WxChatMsg__storage_ {
  uint32_t _has_storage_[1];
  PB3WxMsgType msgType;
  NSString *content;
} PB3WxChatMsg__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "msgType",
        .dataTypeSpecific.enumDescFunc = PB3WxMsgType_EnumDescriptor,
        .number = PB3WxChatMsg_FieldNumber_MsgType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxChatMsg__storage_, msgType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "content",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxChatMsg_FieldNumber_Content,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxChatMsg__storage_, content),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxChatMsg class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxChatMsg__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3WxChatMsg_MsgType_RawValue(PB3WxChatMsg *message) {
  GPBDescriptor *descriptor = [PB3WxChatMsg descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxChatMsg_FieldNumber_MsgType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxChatMsg_MsgType_RawValue(PB3WxChatMsg *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxChatMsg descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxChatMsg_FieldNumber_MsgType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3WxGroupChatReq

@implementation PB3WxGroupChatReq

@dynamic reportRobotWxId;
@dynamic hasSpeaker, speaker;
@dynamic groupId;
@dynamic groupName;
@dynamic hasWxChatMsg, wxChatMsg;
@dynamic chatId;
@dynamic sendTime;

typedef struct PB3WxGroupChatReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *reportRobotWxId;
  PB3WxUserInfo *speaker;
  NSString *groupId;
  NSString *groupName;
  PB3WxChatMsg *wxChatMsg;
  int64_t chatId;
  int64_t sendTime;
} PB3WxGroupChatReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "reportRobotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupChatReq_FieldNumber_ReportRobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, reportRobotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "speaker",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserInfo),
        .number = PB3WxGroupChatReq_FieldNumber_Speaker,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, speaker),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupChatReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupName",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupChatReq_FieldNumber_GroupName,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, groupName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxChatMsg",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxChatMsg),
        .number = PB3WxGroupChatReq_FieldNumber_WxChatMsg,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, wxChatMsg),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "chatId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupChatReq_FieldNumber_ChatId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, chatId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "sendTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupChatReq_FieldNumber_SendTime,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3WxGroupChatReq__storage_, sendTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxGroupChatReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxGroupChatReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\005I\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxGroupChatRes

@implementation PB3WxGroupChatRes


typedef struct PB3WxGroupChatRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxGroupChatRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxGroupChatRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxGroupChatRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxChatReq

@implementation PB3WxChatReq

@dynamic hasSpeaker, speaker;
@dynamic robotWxId;
@dynamic hasWxChatMsg, wxChatMsg;

typedef struct PB3WxChatReq__storage_ {
  uint32_t _has_storage_[1];
  PB3WxUserInfo *speaker;
  NSString *robotWxId;
  PB3WxChatMsg *wxChatMsg;
} PB3WxChatReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "speaker",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserInfo),
        .number = PB3WxChatReq_FieldNumber_Speaker,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxChatReq__storage_, speaker),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxChatReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxChatReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxChatMsg",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxChatMsg),
        .number = PB3WxChatReq_FieldNumber_WxChatMsg,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxChatReq__storage_, wxChatMsg),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxChatReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxChatReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\003I\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxChatRes

@implementation PB3WxChatRes


typedef struct PB3WxChatRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxChatRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxChatRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxChatRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxUserDetail

@implementation PB3WxUserDetail

@dynamic wxId;
@dynamic wxAccount;
@dynamic nickname;
@dynamic icon;
@dynamic sex;
@dynamic area;

typedef struct PB3WxUserDetail__storage_ {
  uint32_t _has_storage_[1];
  PB3WxSex sex;
  NSString *wxId;
  NSString *wxAccount;
  NSString *nickname;
  NSString *icon;
  NSString *area;
} PB3WxUserDetail__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "wxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserDetail_FieldNumber_WxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, wxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxAccount",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserDetail_FieldNumber_WxAccount,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, wxAccount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserDetail_FieldNumber_Nickname,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserDetail_FieldNumber_Icon,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sex",
        .dataTypeSpecific.enumDescFunc = PB3WxSex_EnumDescriptor,
        .number = PB3WxUserDetail_FieldNumber_Sex,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, sex),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "area",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserDetail_FieldNumber_Area,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3WxUserDetail__storage_, area),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxUserDetail class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxUserDetail__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3WxUserDetail_Sex_RawValue(PB3WxUserDetail *message) {
  GPBDescriptor *descriptor = [PB3WxUserDetail descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxUserDetail_FieldNumber_Sex];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxUserDetail_Sex_RawValue(PB3WxUserDetail *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxUserDetail descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxUserDetail_FieldNumber_Sex];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3WxUserInfo

@implementation PB3WxUserInfo

@dynamic wxId;
@dynamic wxAccount;
@dynamic nickname;

typedef struct PB3WxUserInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *wxId;
  NSString *wxAccount;
  NSString *nickname;
} PB3WxUserInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "wxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserInfo_FieldNumber_WxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxUserInfo__storage_, wxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxAccount",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserInfo_FieldNumber_WxAccount,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxUserInfo__storage_, wxAccount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nickname",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserInfo_FieldNumber_Nickname,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxUserInfo__storage_, nickname),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxUserInfo class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxUserInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotJoinWxGroupReq

@implementation PB3RobotJoinWxGroupReq

@dynamic robotWxId;
@dynamic groupId;
@dynamic groupName;
@dynamic inviterWxId;

typedef struct PB3RobotJoinWxGroupReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
  NSString *groupName;
  NSString *inviterWxId;
} PB3RobotJoinWxGroupReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotJoinWxGroupReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RobotJoinWxGroupReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotJoinWxGroupReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RobotJoinWxGroupReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupName",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotJoinWxGroupReq_FieldNumber_GroupName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3RobotJoinWxGroupReq__storage_, groupName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "inviterWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotJoinWxGroupReq_FieldNumber_InviterWxId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3RobotJoinWxGroupReq__storage_, inviterWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotJoinWxGroupReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RobotJoinWxGroupReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotJoinWxGroupRes

@implementation PB3RobotJoinWxGroupRes


typedef struct PB3RobotJoinWxGroupRes__storage_ {
  uint32_t _has_storage_[1];
} PB3RobotJoinWxGroupRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotJoinWxGroupRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RobotJoinWxGroupRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotLeaveWxGroupReq

@implementation PB3RobotLeaveWxGroupReq

@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3RobotLeaveWxGroupReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
} PB3RobotLeaveWxGroupReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotLeaveWxGroupReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RobotLeaveWxGroupReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotLeaveWxGroupReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RobotLeaveWxGroupReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotLeaveWxGroupReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RobotLeaveWxGroupReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotLeaveWxGroupRes

@implementation PB3RobotLeaveWxGroupRes


typedef struct PB3RobotLeaveWxGroupRes__storage_ {
  uint32_t _has_storage_[1];
} PB3RobotLeaveWxGroupRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotLeaveWxGroupRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RobotLeaveWxGroupRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSyncGroupMembersReq

@implementation PB3WxRobotSyncGroupMembersReq

@dynamic robotWxId;
@dynamic groupId;
@dynamic membersArray, membersArray_Count;

typedef struct PB3WxRobotSyncGroupMembersReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *groupId;
  NSMutableArray *membersArray;
} PB3WxRobotSyncGroupMembersReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotSyncGroupMembersReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotSyncGroupMembersReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotSyncGroupMembersReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotSyncGroupMembersReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "membersArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxRobotSyncGroupMembersReq_FieldNumber_MembersArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxRobotSyncGroupMembersReq__storage_, membersArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSyncGroupMembersReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotSyncGroupMembersReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSyncGroupMembersRes

@implementation PB3WxRobotSyncGroupMembersRes


typedef struct PB3WxRobotSyncGroupMembersRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotSyncGroupMembersRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSyncGroupMembersRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotSyncGroupMembersRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxUserJoinGroupReq

@implementation PB3WxUserJoinGroupReq

@dynamic groupId;
@dynamic hasMembers, members;

typedef struct PB3WxUserJoinGroupReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *groupId;
  PB3WxUserDetail *members;
} PB3WxUserJoinGroupReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxUserJoinGroupReq_FieldNumber_GroupId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxUserJoinGroupReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "members",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxUserJoinGroupReq_FieldNumber_Members,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxUserJoinGroupReq__storage_, members),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxUserJoinGroupReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxUserJoinGroupReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxUserJoinGroupRes

@implementation PB3WxUserJoinGroupRes


typedef struct PB3WxUserJoinGroupRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxUserJoinGroupRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxUserJoinGroupRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxUserJoinGroupRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotAddFriendReq

@implementation PB3WxRobotAddFriendReq

@dynamic robotWxId;
@dynamic hasFriend_p, friend_p;

typedef struct PB3WxRobotAddFriendReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  PB3WxUserDetail *friend_p;
} PB3WxRobotAddFriendReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotAddFriendReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotAddFriendReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "friend_p",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxRobotAddFriendReq_FieldNumber_Friend_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotAddFriendReq__storage_, friend_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotAddFriendReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotAddFriendReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotAddFriendRes

@implementation PB3WxRobotAddFriendRes


typedef struct PB3WxRobotAddFriendRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotAddFriendRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotAddFriendRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotAddFriendRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotFriendInfoReq

@implementation PB3WxRobotFriendInfoReq

@dynamic robotWxId;
@dynamic hasFriend_p, friend_p;

typedef struct PB3WxRobotFriendInfoReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  PB3WxUserDetail *friend_p;
} PB3WxRobotFriendInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotFriendInfoReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotFriendInfoReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "friend_p",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxRobotFriendInfoReq_FieldNumber_Friend_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotFriendInfoReq__storage_, friend_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotFriendInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotFriendInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotFriendInfoRes

@implementation PB3WxRobotFriendInfoRes


typedef struct PB3WxRobotFriendInfoRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotFriendInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotFriendInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotFriendInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSynFriendListReq

@implementation PB3WxRobotSynFriendListReq

@dynamic robotWxId;
@dynamic friendsArray, friendsArray_Count;

typedef struct PB3WxRobotSynFriendListReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSMutableArray *friendsArray;
} PB3WxRobotSynFriendListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotSynFriendListReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotSynFriendListReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "friendsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxUserDetail),
        .number = PB3WxRobotSynFriendListReq_FieldNumber_FriendsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxRobotSynFriendListReq__storage_, friendsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSynFriendListReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotSynFriendListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSynFriendListRes

@implementation PB3WxRobotSynFriendListRes


typedef struct PB3WxRobotSynFriendListRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotSynFriendListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSynFriendListRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotSynFriendListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotDelFriendReq

@implementation PB3WxRobotDelFriendReq

@dynamic robotWxId;
@dynamic delFriendId;

typedef struct PB3WxRobotDelFriendReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSString *delFriendId;
} PB3WxRobotDelFriendReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotDelFriendReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotDelFriendReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "delFriendId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotDelFriendReq_FieldNumber_DelFriendId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotDelFriendReq__storage_, delFriendId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotDelFriendReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotDelFriendReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotDelFriendRes

@implementation PB3WxRobotDelFriendRes


typedef struct PB3WxRobotDelFriendRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotDelFriendRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotDelFriendRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotDelFriendRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GroupMemberBase

@implementation PB3GroupMemberBase

@dynamic wxId;
@dynamic memberName;

typedef struct PB3GroupMemberBase__storage_ {
  uint32_t _has_storage_[1];
  NSString *wxId;
  NSString *memberName;
} PB3GroupMemberBase__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "wxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GroupMemberBase_FieldNumber_WxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GroupMemberBase__storage_, wxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "memberName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GroupMemberBase_FieldNumber_MemberName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GroupMemberBase__storage_, memberName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GroupMemberBase class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GroupMemberBase__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotGroupMemberNameReq

@implementation PB3WxRobotGroupMemberNameReq

@dynamic groupId;
@dynamic memberListArray, memberListArray_Count;

typedef struct PB3WxRobotGroupMemberNameReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *groupId;
  NSMutableArray *memberListArray;
} PB3WxRobotGroupMemberNameReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotGroupMemberNameReq_FieldNumber_GroupId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotGroupMemberNameReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "memberListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3GroupMemberBase),
        .number = PB3WxRobotGroupMemberNameReq_FieldNumber_MemberListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxRobotGroupMemberNameReq__storage_, memberListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotGroupMemberNameReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotGroupMemberNameReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotGroupMemberNameRes

@implementation PB3WxRobotGroupMemberNameRes


typedef struct PB3WxRobotGroupMemberNameRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotGroupMemberNameRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotGroupMemberNameRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotGroupMemberNameRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxGroup

@implementation PB3WxGroup

@dynamic groupId;
@dynamic groupName;

typedef struct PB3WxGroup__storage_ {
  uint32_t _has_storage_[1];
  NSString *groupId;
  NSString *groupName;
} PB3WxGroup__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroup_FieldNumber_GroupId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxGroup__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupName",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroup_FieldNumber_GroupName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxGroup__storage_, groupName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxGroup class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxGroup__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSynGroupListReq

@implementation PB3WxRobotSynGroupListReq

@dynamic robotWxId;
@dynamic groupListArray, groupListArray_Count;

typedef struct PB3WxRobotSynGroupListReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *robotWxId;
  NSMutableArray *groupListArray;
} PB3WxRobotSynGroupListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotSynGroupListReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotSynGroupListReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxGroup),
        .number = PB3WxRobotSynGroupListReq_FieldNumber_GroupListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxRobotSynGroupListReq__storage_, groupListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSynGroupListReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotSynGroupListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotSynGroupListRes

@implementation PB3WxRobotSynGroupListRes


typedef struct PB3WxRobotSynGroupListRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotSynGroupListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotSynGroupListRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotSynGroupListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxInfoReq

@implementation PB3GetH5WxInfoReq

@dynamic code;

typedef struct PB3GetH5WxInfoReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *code;
} PB3GetH5WxInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "code",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxInfoReq_FieldNumber_Code,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5WxInfoReq__storage_, code),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxInfoRes

@implementation PB3GetH5WxInfoRes

@dynamic isBindPhone;
@dynamic openId;
@dynamic wxName;
@dynamic wxIcon;

typedef struct PB3GetH5WxInfoRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *wxName;
  NSString *wxIcon;
} PB3GetH5WxInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "isBindPhone",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxInfoRes_FieldNumber_IsBindPhone,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxInfoRes_FieldNumber_OpenId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5WxInfoRes__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxInfoRes_FieldNumber_WxName,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetH5WxInfoRes__storage_, wxName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxInfoRes_FieldNumber_WxIcon,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3GetH5WxInfoRes__storage_, wxIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetWxH5SmsCodeReq

@implementation PB3GetWxH5SmsCodeReq

@dynamic phone;

typedef struct PB3GetWxH5SmsCodeReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *phone;
} PB3GetWxH5SmsCodeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5SmsCodeReq_FieldNumber_Phone,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetWxH5SmsCodeReq__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetWxH5SmsCodeReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetWxH5SmsCodeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetWxH5SmsCodeRes

@implementation PB3GetWxH5SmsCodeRes


typedef struct PB3GetWxH5SmsCodeRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetWxH5SmsCodeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetWxH5SmsCodeRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetWxH5SmsCodeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetWxH5BindPhoneReq

@implementation PB3GetWxH5BindPhoneReq

@dynamic openId;
@dynamic phone;
@dynamic smsCode;

typedef struct PB3GetWxH5BindPhoneReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *phone;
  NSString *smsCode;
} PB3GetWxH5BindPhoneReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5BindPhoneReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetWxH5BindPhoneReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "phone",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5BindPhoneReq_FieldNumber_Phone,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetWxH5BindPhoneReq__storage_, phone),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "smsCode",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5BindPhoneReq_FieldNumber_SmsCode,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetWxH5BindPhoneReq__storage_, smsCode),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetWxH5BindPhoneReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetWxH5BindPhoneReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetWxH5BindPhoneRes

@implementation PB3GetWxH5BindPhoneRes

@dynamic wxName;
@dynamic wxIcon;

typedef struct PB3GetWxH5BindPhoneRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *wxName;
  NSString *wxIcon;
} PB3GetWxH5BindPhoneRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "wxName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5BindPhoneRes_FieldNumber_WxName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetWxH5BindPhoneRes__storage_, wxName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "wxIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetWxH5BindPhoneRes_FieldNumber_WxIcon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetWxH5BindPhoneRes__storage_, wxIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetWxH5BindPhoneRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetWxH5BindPhoneRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupReq

@implementation PB3GetH5RobotGroupReq

@dynamic openId;
@dynamic robotWxId;

typedef struct PB3GetH5RobotGroupReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
} PB3GetH5RobotGroupReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupRes

@implementation PB3GetH5RobotGroupRes

@dynamic groupListArray, groupListArray_Count;

typedef struct PB3GetH5RobotGroupRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *groupListArray;
} PB3GetH5RobotGroupRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "groupListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxGroup),
        .number = PB3GetH5RobotGroupRes_FieldNumber_GroupListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupRes__storage_, groupListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxUserRobotReq

@implementation PB3GetH5WxUserRobotReq

@dynamic openId;

typedef struct PB3GetH5WxUserRobotReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
} PB3GetH5WxUserRobotReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxUserRobotReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5WxUserRobotReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxUserRobotReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxUserRobotReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UserRobot

@implementation PB3UserRobot

@dynamic robotWxId;
@dynamic robotWxName;
@dynamic robotIcon;
@dynamic status;

typedef struct PB3UserRobot__storage_ {
  uint32_t _has_storage_[1];
  PB3UserRobotStatus status;
  NSString *robotWxId;
  NSString *robotWxName;
  NSString *robotIcon;
} PB3UserRobot__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UserRobot_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UserRobot__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxName",
        .dataTypeSpecific.className = NULL,
        .number = PB3UserRobot_FieldNumber_RobotWxName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3UserRobot__storage_, robotWxName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3UserRobot_FieldNumber_RobotIcon,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3UserRobot__storage_, robotIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PB3UserRobotStatus_EnumDescriptor,
        .number = PB3UserRobot_FieldNumber_Status,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3UserRobot__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UserRobot class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UserRobot__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3UserRobot_Status_RawValue(PB3UserRobot *message) {
  GPBDescriptor *descriptor = [PB3UserRobot descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3UserRobot_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3UserRobot_Status_RawValue(PB3UserRobot *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3UserRobot descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3UserRobot_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetH5WxUserRobotRes

@implementation PB3GetH5WxUserRobotRes

@dynamic robotListArray, robotListArray_Count;

typedef struct PB3GetH5WxUserRobotRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *robotListArray;
} PB3GetH5WxUserRobotRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3UserRobot),
        .number = PB3GetH5WxUserRobotRes_FieldNumber_RobotListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5WxUserRobotRes__storage_, robotListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxUserRobotRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxUserRobotRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5ApplyActiveRobotReq

@implementation PB3GetH5ApplyActiveRobotReq

@dynamic openId;
@dynamic robotWxId;

typedef struct PB3GetH5ApplyActiveRobotReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
} PB3GetH5ApplyActiveRobotReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyActiveRobotReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyActiveRobotReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyActiveRobotReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyActiveRobotReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyActiveRobotReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5ApplyActiveRobotReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5ApplyActiveRobotRes

@implementation PB3GetH5ApplyActiveRobotRes


typedef struct PB3GetH5ApplyActiveRobotRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5ApplyActiveRobotRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyActiveRobotRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5ApplyActiveRobotRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupInfoReq

@implementation PB3GetH5RobotGroupInfoReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3GetH5RobotGroupInfoReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
} PB3GetH5RobotGroupInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupInfoReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupInfoReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupInfoReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupInfoReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupInfoReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupInfoReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupInfoRes

@implementation PB3GetH5RobotGroupInfoRes

@dynamic status;
@dynamic robotFucArray, robotFucArray_Count;

typedef struct PB3GetH5RobotGroupInfoRes__storage_ {
  uint32_t _has_storage_[1];
  PB3GroupRobotStatus status;
  GPBEnumArray *robotFucArray;
} PB3GetH5RobotGroupInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PB3GroupRobotStatus_EnumDescriptor,
        .number = PB3GetH5RobotGroupInfoRes_FieldNumber_Status,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupInfoRes__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "robotFucArray",
        .dataTypeSpecific.enumDescFunc = PB3WxRobotFunc_EnumDescriptor,
        .number = PB3GetH5RobotGroupInfoRes_FieldNumber_RobotFucArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupInfoRes__storage_, robotFucArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3GetH5RobotGroupInfoRes_Status_RawValue(PB3GetH5RobotGroupInfoRes *message) {
  GPBDescriptor *descriptor = [PB3GetH5RobotGroupInfoRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GetH5RobotGroupInfoRes_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3GetH5RobotGroupInfoRes_Status_RawValue(PB3GetH5RobotGroupInfoRes *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3GetH5RobotGroupInfoRes descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GetH5RobotGroupInfoRes_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetH5ApplyActiveGroupReq

@implementation PB3GetH5ApplyActiveGroupReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3GetH5ApplyActiveGroupReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
} PB3GetH5ApplyActiveGroupReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyActiveGroupReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyActiveGroupReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyActiveGroupReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyActiveGroupReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyActiveGroupReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyActiveGroupReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyActiveGroupReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5ApplyActiveGroupReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5ApplyActiveGroupRes

@implementation PB3GetH5ApplyActiveGroupRes


typedef struct PB3GetH5ApplyActiveGroupRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5ApplyActiveGroupRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyActiveGroupRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5ApplyActiveGroupRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxGroupManagerSet

@implementation PB3WxGroupManagerSet

@dynamic keyWordsArray, keyWordsArray_Count;
@dynamic kickKeyWordsMsg;
@dynamic kickKeyWordsName;
@dynamic kickSendWebURL;
@dynamic kickSendApplets;
@dynamic kickSendNameCard;
@dynamic kickSendFileVideo;
@dynamic kickSendMsgLength;
@dynamic msgLengthLimit;
@dynamic kickMsgLineNum;
@dynamic msgLineNumLimit;
@dynamic kickSendFrequency;
@dynamic frequencyTime;
@dynamic frequencyNum;
@dynamic kickType;
@dynamic kickSendQrCode;

typedef struct PB3WxGroupManagerSet__storage_ {
  uint32_t _has_storage_[1];
  int32_t msgLengthLimit;
  int32_t msgLineNumLimit;
  int32_t frequencyTime;
  int32_t frequencyNum;
  PB3WxGroupKickType kickType;
  NSMutableArray *keyWordsArray;
} PB3WxGroupManagerSet__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "keyWordsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KeyWordsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, keyWordsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "kickKeyWordsMsg",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickKeyWordsMsg,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickKeyWordsName",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickKeyWordsName,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickSendWebURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendWebURL,
        .hasIndex = 4,
        .offset = 5,   
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickSendApplets",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendApplets,
        .hasIndex = 6,
        .offset = 7,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickSendNameCard",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendNameCard,
        .hasIndex = 8,
        .offset = 9,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickSendFileVideo",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendFileVideo,
        .hasIndex = 10,
        .offset = 11,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "kickSendMsgLength",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendMsgLength,
        .hasIndex = 12,
        .offset = 13,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "msgLengthLimit",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_MsgLengthLimit,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, msgLengthLimit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "kickMsgLineNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickMsgLineNum,
        .hasIndex = 15,
        .offset = 16,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "msgLineNumLimit",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_MsgLineNumLimit,
        .hasIndex = 17,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, msgLineNumLimit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "kickSendFrequency",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendFrequency,
        .hasIndex = 18,
        .offset = 19,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "frequencyTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_FrequencyTime,
        .hasIndex = 20,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, frequencyTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "frequencyNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_FrequencyNum,
        .hasIndex = 21,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, frequencyNum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "kickType",
        .dataTypeSpecific.enumDescFunc = PB3WxGroupKickType_EnumDescriptor,
        .number = PB3WxGroupManagerSet_FieldNumber_KickType,
        .hasIndex = 22,
        .offset = (uint32_t)offsetof(PB3WxGroupManagerSet__storage_, kickType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "kickSendQrCode",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxGroupManagerSet_FieldNumber_KickSendQrCode,
        .hasIndex = 23,
        .offset = 24,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxGroupManagerSet class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxGroupManagerSet__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\004\004\244\243\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3WxGroupManagerSet_KickType_RawValue(PB3WxGroupManagerSet *message) {
  GPBDescriptor *descriptor = [PB3WxGroupManagerSet descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxGroupManagerSet_FieldNumber_KickType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxGroupManagerSet_KickType_RawValue(PB3WxGroupManagerSet *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxGroupManagerSet descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxGroupManagerSet_FieldNumber_KickType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetH5WxGroupSetReq

@implementation PB3GetH5WxGroupSetReq

@dynamic openId;
@dynamic groupId;
@dynamic robotWxId;

typedef struct PB3GetH5WxGroupSetReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *groupId;
  NSString *robotWxId;
} PB3GetH5WxGroupSetReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetReq_FieldNumber_RobotWxId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxGroupSetReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxGroupSetReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxGroupSetRes

@implementation PB3GetH5WxGroupSetRes

@dynamic hasGroupSet, groupSet;

typedef struct PB3GetH5WxGroupSetRes__storage_ {
  uint32_t _has_storage_[1];
  PB3WxGroupManagerSet *groupSet;
} PB3GetH5WxGroupSetRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "groupSet",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxGroupManagerSet),
        .number = PB3GetH5WxGroupSetRes_FieldNumber_GroupSet,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetRes__storage_, groupSet),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxGroupSetRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxGroupSetRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxGroupSetCommitReq

@implementation PB3GetH5WxGroupSetCommitReq

@dynamic openId;
@dynamic groupId;
@dynamic robotWxId;
@dynamic hasGroupSet, groupSet;

typedef struct PB3GetH5WxGroupSetCommitReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *groupId;
  NSString *robotWxId;
  PB3WxGroupManagerSet *groupSet;
} PB3GetH5WxGroupSetCommitReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetCommitReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetCommitReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetCommitReq_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetCommitReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5WxGroupSetCommitReq_FieldNumber_RobotWxId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetCommitReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupSet",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3WxGroupManagerSet),
        .number = PB3GetH5WxGroupSetCommitReq_FieldNumber_GroupSet,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetH5WxGroupSetCommitReq__storage_, groupSet),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxGroupSetCommitReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5WxGroupSetCommitReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5WxGroupSetCommitRes

@implementation PB3GetH5WxGroupSetCommitRes


typedef struct PB3GetH5WxGroupSetCommitRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5WxGroupSetCommitRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5WxGroupSetCommitRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5WxGroupSetCommitRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotChatTestReq

@implementation PB3RobotChatTestReq

@dynamic robotWxId;
@dynamic targetType;
@dynamic targetIdArray, targetIdArray_Count;
@dynamic sendContent;

typedef struct PB3RobotChatTestReq__storage_ {
  uint32_t _has_storage_[1];
  PB3RobotChatTargetType targetType;
  NSString *robotWxId;
  NSMutableArray *targetIdArray;
  NSString *sendContent;
} PB3RobotChatTestReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotChatTestReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RobotChatTestReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "targetType",
        .dataTypeSpecific.enumDescFunc = PB3RobotChatTargetType_EnumDescriptor,
        .number = PB3RobotChatTestReq_FieldNumber_TargetType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RobotChatTestReq__storage_, targetType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "targetIdArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotChatTestReq_FieldNumber_TargetIdArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RobotChatTestReq__storage_, targetIdArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sendContent",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotChatTestReq_FieldNumber_SendContent,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3RobotChatTestReq__storage_, sendContent),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotChatTestReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RobotChatTestReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3RobotChatTestReq_TargetType_RawValue(PB3RobotChatTestReq *message) {
  GPBDescriptor *descriptor = [PB3RobotChatTestReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RobotChatTestReq_FieldNumber_TargetType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3RobotChatTestReq_TargetType_RawValue(PB3RobotChatTestReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3RobotChatTestReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RobotChatTestReq_FieldNumber_TargetType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3RobotChatTestRes

@implementation PB3RobotChatTestRes


typedef struct PB3RobotChatTestRes__storage_ {
  uint32_t _has_storage_[1];
} PB3RobotChatTestRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotChatTestRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RobotChatTestRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupGearReq

@implementation PB3GetH5RobotGroupGearReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3GetH5RobotGroupGearReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
} PB3GetH5RobotGroupGearReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupGearReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupGearReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupGearReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupGearReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupGearReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupGearRes

@implementation PB3GetH5RobotGroupGearRes

@dynamic hasGear, gear;

typedef struct PB3GetH5RobotGroupGearRes__storage_ {
  uint32_t _has_storage_[1];
  PB3RobotGroupGear *gear;
} PB3GetH5RobotGroupGearRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "gear",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3RobotGroupGear),
        .number = PB3GetH5RobotGroupGearRes_FieldNumber_Gear,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearRes__storage_, gear),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupGearRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupGearRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupGearCommitReq

@implementation PB3GetH5RobotGroupGearCommitReq

@dynamic openId;
@dynamic hasGear, gear;

typedef struct PB3GetH5RobotGroupGearCommitReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  PB3RobotGroupGear *gear;
} PB3GetH5RobotGroupGearCommitReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5RobotGroupGearCommitReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearCommitReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "gear",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3RobotGroupGear),
        .number = PB3GetH5RobotGroupGearCommitReq_FieldNumber_Gear,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5RobotGroupGearCommitReq__storage_, gear),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupGearCommitReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5RobotGroupGearCommitReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5RobotGroupGearCommitRes

@implementation PB3GetH5RobotGroupGearCommitRes


typedef struct PB3GetH5RobotGroupGearCommitRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5RobotGroupGearCommitRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5RobotGroupGearCommitRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5RobotGroupGearCommitRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RobotGroupGear

@implementation PB3RobotGroupGear

@dynamic robotWxId;
@dynamic groupId;
@dynamic isOpen;
@dynamic startNoticeTime;
@dynamic startNotice;
@dynamic startNoticeEdit;
@dynamic endNoticeTime;
@dynamic endNoticeText;
@dynamic gearNum;
@dynamic cancelKeyWordArray, cancelKeyWordArray_Count;
@dynamic itemListArray, itemListArray_Count;
@dynamic isSendConfirm;
@dynamic confirmInterval;
@dynamic giftLimit;
@dynamic openRandWords;
@dynamic fillKeyWordArray, fillKeyWordArray_Count;

typedef struct PB3RobotGroupGear__storage_ {
  uint32_t _has_storage_[1];
  int32_t startNoticeTime;
  int32_t endNoticeTime;
  int32_t gearNum;
  int32_t confirmInterval;
  int32_t giftLimit;
  NSString *robotWxId;
  NSString *groupId;
  NSString *startNotice;
  NSString *startNoticeEdit;
  NSString *endNoticeText;
  NSMutableArray *cancelKeyWordArray;
  NSMutableArray *itemListArray;
  NSMutableArray *fillKeyWordArray;
} PB3RobotGroupGear__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_GroupId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isOpen",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_IsOpen,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "startNoticeTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_StartNoticeTime,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, startNoticeTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "startNotice",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_StartNotice,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, startNotice),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "startNoticeEdit",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_StartNoticeEdit,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, startNoticeEdit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "endNoticeTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_EndNoticeTime,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, endNoticeTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "endNoticeText",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_EndNoticeText,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, endNoticeText),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "gearNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_GearNum,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, gearNum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "cancelKeyWordArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_CancelKeyWordArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, cancelKeyWordArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "itemListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3GearItem),
        .number = PB3RobotGroupGear_FieldNumber_ItemListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, itemListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "isSendConfirm",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_IsSendConfirm,
        .hasIndex = 10,
        .offset = 11,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "confirmInterval",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_ConfirmInterval,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, confirmInterval),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "giftLimit",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_GiftLimit,
        .hasIndex = 13,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, giftLimit),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "openRandWords",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_OpenRandWords,
        .hasIndex = 14,
        .offset = 15,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "fillKeyWordArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3RobotGroupGear_FieldNumber_FillKeyWordArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RobotGroupGear__storage_, fillKeyWordArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RobotGroupGear class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RobotGroupGear__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GearItem

@implementation PB3GearItem

@dynamic itemName;
@dynamic itemGearNum;
@dynamic itemSeq;
@dynamic keyWordItemListArray, keyWordItemListArray_Count;
@dynamic itemType;
@dynamic isCover;

typedef struct PB3GearItem__storage_ {
  uint32_t _has_storage_[1];
  int32_t itemGearNum;
  int32_t itemSeq;
  PB3GearItemType itemType;
  NSString *itemName;
  NSMutableArray *keyWordItemListArray;
} PB3GearItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "itemName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearItem_FieldNumber_ItemName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GearItem__storage_, itemName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "itemGearNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearItem_FieldNumber_ItemGearNum,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GearItem__storage_, itemGearNum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "itemSeq",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearItem_FieldNumber_ItemSeq,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GearItem__storage_, itemSeq),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "keyWordItemListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3GearKeyWordItem),
        .number = PB3GearItem_FieldNumber_KeyWordItemListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GearItem__storage_, keyWordItemListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "itemType",
        .dataTypeSpecific.enumDescFunc = PB3GearItemType_EnumDescriptor,
        .number = PB3GearItem_FieldNumber_ItemType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GearItem__storage_, itemType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "isCover",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearItem_FieldNumber_IsCover,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GearItem class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GearItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3GearItem_ItemType_RawValue(PB3GearItem *message) {
  GPBDescriptor *descriptor = [PB3GearItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GearItem_FieldNumber_ItemType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3GearItem_ItemType_RawValue(PB3GearItem *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3GearItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GearItem_FieldNumber_ItemType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GearKeyWordItem

@implementation PB3GearKeyWordItem

@dynamic kwItemName;
@dynamic kwItemSeq;
@dynamic keyWordsArray, keyWordsArray_Count;

typedef struct PB3GearKeyWordItem__storage_ {
  uint32_t _has_storage_[1];
  int32_t kwItemSeq;
  NSString *kwItemName;
  NSMutableArray *keyWordsArray;
} PB3GearKeyWordItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "kwItemName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearKeyWordItem_FieldNumber_KwItemName,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GearKeyWordItem__storage_, kwItemName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "kwItemSeq",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearKeyWordItem_FieldNumber_KwItemSeq,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GearKeyWordItem__storage_, kwItemSeq),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "keyWordsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3GearKeyWordItem_FieldNumber_KeyWordsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GearKeyWordItem__storage_, keyWordsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GearKeyWordItem class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GearKeyWordItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3WxRobotAlarmReq

@implementation PB3WxRobotAlarmReq

@dynamic robotWxId;
@dynamic fromWxId;
@dynamic fromWxName;
@dynamic alarmType;
@dynamic content;

typedef struct PB3WxRobotAlarmReq__storage_ {
  uint32_t _has_storage_[1];
  PB3AlarmType alarmType;
  NSString *robotWxId;
  NSString *fromWxId;
  NSString *fromWxName;
  NSString *content;
} PB3WxRobotAlarmReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotAlarmReq_FieldNumber_RobotWxId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3WxRobotAlarmReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "fromWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotAlarmReq_FieldNumber_FromWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3WxRobotAlarmReq__storage_, fromWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "fromWxName",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotAlarmReq_FieldNumber_FromWxName,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3WxRobotAlarmReq__storage_, fromWxName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "alarmType",
        .dataTypeSpecific.enumDescFunc = PB3AlarmType_EnumDescriptor,
        .number = PB3WxRobotAlarmReq_FieldNumber_AlarmType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3WxRobotAlarmReq__storage_, alarmType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "content",
        .dataTypeSpecific.className = NULL,
        .number = PB3WxRobotAlarmReq_FieldNumber_Content,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3WxRobotAlarmReq__storage_, content),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotAlarmReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3WxRobotAlarmReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3WxRobotAlarmReq_AlarmType_RawValue(PB3WxRobotAlarmReq *message) {
  GPBDescriptor *descriptor = [PB3WxRobotAlarmReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotAlarmReq_FieldNumber_AlarmType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3WxRobotAlarmReq_AlarmType_RawValue(PB3WxRobotAlarmReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3WxRobotAlarmReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3WxRobotAlarmReq_FieldNumber_AlarmType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3WxRobotAlarmRes

@implementation PB3WxRobotAlarmRes


typedef struct PB3WxRobotAlarmRes__storage_ {
  uint32_t _has_storage_[1];
} PB3WxRobotAlarmRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3WxRobotAlarmRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3WxRobotAlarmRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetReportBossInfoReq

@implementation PB3GetReportBossInfoReq

@dynamic appType;
@dynamic bossName;
@dynamic bossId;
@dynamic bossSex;
@dynamic roomId;
@dynamic roomName;
@dynamic guildName;
@dynamic guildId;
@dynamic chair;
@dynamic roomPattern;
@dynamic reportTime;

typedef struct PB3GetReportBossInfoReq__storage_ {
  uint32_t _has_storage_[1];
  PB3ReportAppType appType;
  int32_t bossSex;
  int32_t chair;
  int32_t roomPattern;
  NSString *bossName;
  NSString *roomName;
  NSString *guildName;
  int64_t bossId;
  int64_t roomId;
  int64_t guildId;
  int64_t reportTime;
} PB3GetReportBossInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appType",
        .dataTypeSpecific.enumDescFunc = PB3ReportAppType_EnumDescriptor,
        .number = PB3GetReportBossInfoReq_FieldNumber_AppType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, appType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "bossName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_BossName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, bossName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "bossId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_BossId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, bossId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "bossSex",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_BossSex,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, bossSex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_RoomId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "roomName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_RoomName,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, roomName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "guildName",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_GuildName,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, guildName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "guildId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_GuildId,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, guildId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "chair",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_Chair,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, chair),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "roomPattern",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_RoomPattern,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, roomPattern),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "reportTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetReportBossInfoReq_FieldNumber_ReportTime,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PB3GetReportBossInfoReq__storage_, reportTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetReportBossInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetReportBossInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3GetReportBossInfoReq_AppType_RawValue(PB3GetReportBossInfoReq *message) {
  GPBDescriptor *descriptor = [PB3GetReportBossInfoReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GetReportBossInfoReq_FieldNumber_AppType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3GetReportBossInfoReq_AppType_RawValue(PB3GetReportBossInfoReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3GetReportBossInfoReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3GetReportBossInfoReq_FieldNumber_AppType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetReportBossInfoRes

@implementation PB3GetReportBossInfoRes


typedef struct PB3GetReportBossInfoRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetReportBossInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetReportBossInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetReportBossInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5AppBossFuncInfoReq

@implementation PB3GetH5AppBossFuncInfoReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;

typedef struct PB3GetH5AppBossFuncInfoReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
} PB3GetH5AppBossFuncInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5AppBossFuncInfoReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5AppBossFuncInfoReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5AppBossFuncInfoReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5AppBossFuncInfoReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5AppBossFuncInfoReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5AppBossFuncInfoReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5AppBossFuncInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5AppBossFuncInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportAppUsingInfo

@implementation PB3ReportAppUsingInfo

@dynamic appType;
@dynamic isUsing;
@dynamic getManBoss;
@dynamic getWomanBoss;

typedef struct PB3ReportAppUsingInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3ReportAppType appType;
} PB3ReportAppUsingInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appType",
        .dataTypeSpecific.enumDescFunc = PB3ReportAppType_EnumDescriptor,
        .number = PB3ReportAppUsingInfo_FieldNumber_AppType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportAppUsingInfo__storage_, appType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "isUsing",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportAppUsingInfo_FieldNumber_IsUsing,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "getManBoss",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportAppUsingInfo_FieldNumber_GetManBoss,
        .hasIndex = 3,
        .offset = 4,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "getWomanBoss",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportAppUsingInfo_FieldNumber_GetWomanBoss,
        .hasIndex = 5,
        .offset = 6,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportAppUsingInfo class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportAppUsingInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3ReportAppUsingInfo_AppType_RawValue(PB3ReportAppUsingInfo *message) {
  GPBDescriptor *descriptor = [PB3ReportAppUsingInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppUsingInfo_FieldNumber_AppType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3ReportAppUsingInfo_AppType_RawValue(PB3ReportAppUsingInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3ReportAppUsingInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppUsingInfo_FieldNumber_AppType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3ReportAppInfo

@implementation PB3ReportAppInfo

@dynamic appStatus;
@dynamic hasUsingInfo, usingInfo;

typedef struct PB3ReportAppInfo__storage_ {
  uint32_t _has_storage_[1];
  PB3ReportAppStatus appStatus;
  PB3ReportAppUsingInfo *usingInfo;
} PB3ReportAppInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appStatus",
        .dataTypeSpecific.enumDescFunc = PB3ReportAppStatus_EnumDescriptor,
        .number = PB3ReportAppInfo_FieldNumber_AppStatus,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportAppInfo__storage_, appStatus),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "usingInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3ReportAppUsingInfo),
        .number = PB3ReportAppInfo_FieldNumber_UsingInfo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReportAppInfo__storage_, usingInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportAppInfo class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportAppInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3ReportAppInfo_AppStatus_RawValue(PB3ReportAppInfo *message) {
  GPBDescriptor *descriptor = [PB3ReportAppInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppInfo_FieldNumber_AppStatus];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3ReportAppInfo_AppStatus_RawValue(PB3ReportAppInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3ReportAppInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppInfo_FieldNumber_AppStatus];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetH5AppBossFuncInfoRes

@implementation PB3GetH5AppBossFuncInfoRes

@dynamic appInfoArray, appInfoArray_Count;

typedef struct PB3GetH5AppBossFuncInfoRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *appInfoArray;
} PB3GetH5AppBossFuncInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appInfoArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3ReportAppInfo),
        .number = PB3GetH5AppBossFuncInfoRes_FieldNumber_AppInfoArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5AppBossFuncInfoRes__storage_, appInfoArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5AppBossFuncInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5AppBossFuncInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5ApplyAppBossFuncReq

@implementation PB3GetH5ApplyAppBossFuncReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;
@dynamic applyAppsArray, applyAppsArray_Count;

typedef struct PB3GetH5ApplyAppBossFuncReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
  GPBEnumArray *applyAppsArray;
} PB3GetH5ApplyAppBossFuncReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyAppBossFuncReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyAppBossFuncReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyAppBossFuncReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyAppBossFuncReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5ApplyAppBossFuncReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyAppBossFuncReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "applyAppsArray",
        .dataTypeSpecific.enumDescFunc = PB3ReportAppType_EnumDescriptor,
        .number = PB3GetH5ApplyAppBossFuncReq_FieldNumber_ApplyAppsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5ApplyAppBossFuncReq__storage_, applyAppsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyAppBossFuncReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5ApplyAppBossFuncReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5ApplyAppBossFuncRes

@implementation PB3GetH5ApplyAppBossFuncRes


typedef struct PB3GetH5ApplyAppBossFuncRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5ApplyAppBossFuncRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5ApplyAppBossFuncRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5ApplyAppBossFuncRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5SaveAppBossFuncInfoReq

@implementation PB3GetH5SaveAppBossFuncInfoReq

@dynamic openId;
@dynamic robotWxId;
@dynamic groupId;
@dynamic usingAppArray, usingAppArray_Count;

typedef struct PB3GetH5SaveAppBossFuncInfoReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
  NSString *robotWxId;
  NSString *groupId;
  NSMutableArray *usingAppArray;
} PB3GetH5SaveAppBossFuncInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5SaveAppBossFuncInfoReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5SaveAppBossFuncInfoReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "robotWxId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5SaveAppBossFuncInfoReq_FieldNumber_RobotWxId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3GetH5SaveAppBossFuncInfoReq__storage_, robotWxId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "groupId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5SaveAppBossFuncInfoReq_FieldNumber_GroupId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3GetH5SaveAppBossFuncInfoReq__storage_, groupId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "usingAppArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3ReportAppUsingInfo),
        .number = PB3GetH5SaveAppBossFuncInfoReq_FieldNumber_UsingAppArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5SaveAppBossFuncInfoReq__storage_, usingAppArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5SaveAppBossFuncInfoReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5SaveAppBossFuncInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5SaveAppBossFuncInfoRes

@implementation PB3GetH5SaveAppBossFuncInfoRes


typedef struct PB3GetH5SaveAppBossFuncInfoRes__storage_ {
  uint32_t _has_storage_[1];
} PB3GetH5SaveAppBossFuncInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5SaveAppBossFuncInfoRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetH5SaveAppBossFuncInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetH5BossAppConfReq

@implementation PB3GetH5BossAppConfReq

@dynamic openId;

typedef struct PB3GetH5BossAppConfReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *openId;
} PB3GetH5BossAppConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "openId",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetH5BossAppConfReq_FieldNumber_OpenId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetH5BossAppConfReq__storage_, openId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5BossAppConfReq class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5BossAppConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3ReportAppConf

@implementation PB3ReportAppConf

@dynamic appType;
@dynamic appName;

typedef struct PB3ReportAppConf__storage_ {
  uint32_t _has_storage_[1];
  PB3ReportAppType appType;
  NSString *appName;
} PB3ReportAppConf__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "appType",
        .dataTypeSpecific.enumDescFunc = PB3ReportAppType_EnumDescriptor,
        .number = PB3ReportAppConf_FieldNumber_AppType,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3ReportAppConf__storage_, appType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "appName",
        .dataTypeSpecific.className = NULL,
        .number = PB3ReportAppConf_FieldNumber_AppName,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3ReportAppConf__storage_, appName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3ReportAppConf class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3ReportAppConf__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3ReportAppConf_AppType_RawValue(PB3ReportAppConf *message) {
  GPBDescriptor *descriptor = [PB3ReportAppConf descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppConf_FieldNumber_AppType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3ReportAppConf_AppType_RawValue(PB3ReportAppConf *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3ReportAppConf descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3ReportAppConf_FieldNumber_AppType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3GetH5BossAppConfRes

@implementation PB3GetH5BossAppConfRes

@dynamic confArray, confArray_Count;

typedef struct PB3GetH5BossAppConfRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *confArray;
} PB3GetH5BossAppConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "confArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3ReportAppConf),
        .number = PB3GetH5BossAppConfRes_FieldNumber_ConfArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetH5BossAppConfRes__storage_, confArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetH5BossAppConfRes class]
                                     rootClass:[PB3WxRobotExtRoot class]
                                          file:PB3WxRobotExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetH5BossAppConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
