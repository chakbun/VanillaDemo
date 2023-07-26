 
 

 
 
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#import <stdatomic.h>

#import "pb/NobilityExt.pbobjc.h"
#import "pb/CommonExt.pbobjc.h"
 

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PB3NobilityExtRoot

@implementation PB3NobilityExtRoot

 
 

@end

#pragma mark - PB3NobilityExtRoot_FileDescriptor

static GPBFileDescriptor *PB3NobilityExtRoot_FileDescriptor(void) {
   
   
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"pb"
                                                 objcPrefix:@"PB3"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum PB3NobilityCmdId

GPBEnumDescriptor *PB3NobilityCmdId_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "NcmdIdNull\000NcmdIdPlayDynamic\000NcmdIdUpdat"
        "ePrivilege\000NcmdIdUpdateMask\000NcmdIdUpdate"
        "Nobility\000";
    static const int32_t values[] = {
        PB3NobilityCmdId_NcmdIdNull,
        PB3NobilityCmdId_NcmdIdPlayDynamic,
        PB3NobilityCmdId_NcmdIdUpdatePrivilege,
        PB3NobilityCmdId_NcmdIdUpdateMask,
        PB3NobilityCmdId_NcmdIdUpdateNobility,
    };
    static const char *extraTextFormatInfo = "\005\000b\004\204\000\001b\004\213\000\002b\004\217\000\003b\004\212\000\004b\004\216\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3NobilityCmdId)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3NobilityCmdId_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3NobilityCmdId_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3NobilityCmdId_NcmdIdNull:
    case PB3NobilityCmdId_NcmdIdPlayDynamic:
    case PB3NobilityCmdId_NcmdIdUpdatePrivilege:
    case PB3NobilityCmdId_NcmdIdUpdateMask:
    case PB3NobilityCmdId_NcmdIdUpdateNobility:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3NobilityPriceType

GPBEnumDescriptor *PB3NobilityPriceType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "NobilityPriceTypeNull\000NobilityPriceTypeN"
        "ormal\000NobilityPriceTypeNormalRenew\000Nobil"
        "ityPriceTypeIosNormal\000NobilityPriceTypeI"
        "osNormalRenew\000";
    static const int32_t values[] = {
        PB3NobilityPriceType_NobilityPriceTypeNull,
        PB3NobilityPriceType_NobilityPriceTypeNormal,
        PB3NobilityPriceType_NobilityPriceTypeNormalRenew,
        PB3NobilityPriceType_NobilityPriceTypeIosNormal,
        PB3NobilityPriceType_NobilityPriceTypeIosNormalRenew,
    };
    static const char *extraTextFormatInfo = "\005\000\021\204\000\001\021\206\000\002\021\206\205\000\003\021\203\206\000\004\021\203\206\205\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3NobilityPriceType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3NobilityPriceType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3NobilityPriceType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3NobilityPriceType_NobilityPriceTypeNull:
    case PB3NobilityPriceType_NobilityPriceTypeNormal:
    case PB3NobilityPriceType_NobilityPriceTypeNormalRenew:
    case PB3NobilityPriceType_NobilityPriceTypeIosNormal:
    case PB3NobilityPriceType_NobilityPriceTypeIosNormalRenew:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3PrivilegeType

GPBEnumDescriptor *PB3PrivilegeType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PtNull\000PtMask\000PtShow\000PtShowPay\000PtShowHon"
        "ourableIdentity\000PtShowHallOfFame\000PtShowC"
        "ardFrame\000PtRoomShow\000PtRoomShowWelcome\000Pt"
        "RoomShowSitChar\000PtRoomShowCharBubble\000PtR"
        "oomShowSpeak\000PtWelfare\000PtWelfareHonourab"
        "leVehicle\000PtSpecial\000PtSpecialCmbPay\000PtSp"
        "ecialGift\000PtSpecialService\000PtPrivilegeMa"
        "gicSkill\000PtPrivilege\000PtPrivilegeMaskRank"
        "\000PtPrivilegeMaskEnter\000PtPrivilegeMaskSit"
        "Char\000PtPrivilegePreventBanSpeak\000PtPrivil"
        "egeFriendTrack\000PtPrivilegePreventKickOut"
        "\000PtPrivilegeHideTrack\000PtPrivilegeMoreDea"
        "lFriend\000PtPrivilegeNoDisturbing\000PtPrivil"
        "egePreventTrack\000PtExtra\000PtExtraAddHot\000";
    static const int32_t values[] = {
        PB3PrivilegeType_PtNull,
        PB3PrivilegeType_PtMask,
        PB3PrivilegeType_PtShow,
        PB3PrivilegeType_PtShowPay,
        PB3PrivilegeType_PtShowHonourableIdentity,
        PB3PrivilegeType_PtShowHallOfFame,
        PB3PrivilegeType_PtShowCardFrame,
        PB3PrivilegeType_PtRoomShow,
        PB3PrivilegeType_PtRoomShowWelcome,
        PB3PrivilegeType_PtRoomShowSitChar,
        PB3PrivilegeType_PtRoomShowCharBubble,
        PB3PrivilegeType_PtRoomShowSpeak,
        PB3PrivilegeType_PtWelfare,
        PB3PrivilegeType_PtWelfareHonourableVehicle,
        PB3PrivilegeType_PtSpecial,
        PB3PrivilegeType_PtSpecialCmbPay,
        PB3PrivilegeType_PtSpecialGift,
        PB3PrivilegeType_PtSpecialService,
        PB3PrivilegeType_PtPrivilegeMagicSkill,
        PB3PrivilegeType_PtPrivilege,
        PB3PrivilegeType_PtPrivilegeMaskRank,
        PB3PrivilegeType_PtPrivilegeMaskEnter,
        PB3PrivilegeType_PtPrivilegeMaskSitChar,
        PB3PrivilegeType_PtPrivilegePreventBanSpeak,
        PB3PrivilegeType_PtPrivilegeFriendTrack,
        PB3PrivilegeType_PtPrivilegePreventKickOut,
        PB3PrivilegeType_PtPrivilegeHideTrack,
        PB3PrivilegeType_PtPrivilegeMoreDealFriend,
        PB3PrivilegeType_PtPrivilegeNoDisturbing,
        PB3PrivilegeType_PtPrivilegePreventTrack,
        PB3PrivilegeType_PtExtra,
        PB3PrivilegeType_PtExtraAddHot,
    };
    static const char *extraTextFormatInfo = "\037\001b\204\000\002b\204\000\003b\204\203\000\004b\204\222\000\005b\204\212\000\006b\204\211\000\007b\210\000\010b\210\207\000\tb\210\207\000\nb\210\212\000\013b\210\205\000\014b\207\000\rb\207\221\000\016b\207\000\017b\207\206\000\020b\207\204\000\021b\207\207\000\022b\211\212\000\023b\211\000\024b\211\210\000\025b\211\211\000\026b\211\213\000\027b\211\217\000\030b\211\213\000\031b\211\216\000\032b\211\211\000\033b\211\216\000\034b\211\214\000\035b\211\214\000\036b\205\000\037b\205\206\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PrivilegeType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PrivilegeType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PrivilegeType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PrivilegeType_PtNull:
    case PB3PrivilegeType_PtMask:
    case PB3PrivilegeType_PtShow:
    case PB3PrivilegeType_PtShowPay:
    case PB3PrivilegeType_PtShowHonourableIdentity:
    case PB3PrivilegeType_PtShowHallOfFame:
    case PB3PrivilegeType_PtShowCardFrame:
    case PB3PrivilegeType_PtRoomShow:
    case PB3PrivilegeType_PtRoomShowWelcome:
    case PB3PrivilegeType_PtRoomShowSitChar:
    case PB3PrivilegeType_PtRoomShowCharBubble:
    case PB3PrivilegeType_PtRoomShowSpeak:
    case PB3PrivilegeType_PtWelfare:
    case PB3PrivilegeType_PtWelfareHonourableVehicle:
    case PB3PrivilegeType_PtSpecial:
    case PB3PrivilegeType_PtSpecialCmbPay:
    case PB3PrivilegeType_PtSpecialGift:
    case PB3PrivilegeType_PtSpecialService:
    case PB3PrivilegeType_PtPrivilegeMagicSkill:
    case PB3PrivilegeType_PtPrivilege:
    case PB3PrivilegeType_PtPrivilegeMaskRank:
    case PB3PrivilegeType_PtPrivilegeMaskEnter:
    case PB3PrivilegeType_PtPrivilegeMaskSitChar:
    case PB3PrivilegeType_PtPrivilegePreventBanSpeak:
    case PB3PrivilegeType_PtPrivilegeFriendTrack:
    case PB3PrivilegeType_PtPrivilegePreventKickOut:
    case PB3PrivilegeType_PtPrivilegeHideTrack:
    case PB3PrivilegeType_PtPrivilegeMoreDealFriend:
    case PB3PrivilegeType_PtPrivilegeNoDisturbing:
    case PB3PrivilegeType_PtPrivilegePreventTrack:
    case PB3PrivilegeType_PtExtra:
    case PB3PrivilegeType_PtExtraAddHot:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3BuyNobilityType

GPBEnumDescriptor *PB3BuyNobilityType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "BntNull\000BntOpen\000BntRenew\000BntUpgrade\000";
    static const int32_t values[] = {
        PB3BuyNobilityType_BntNull,
        PB3BuyNobilityType_BntOpen,
        PB3BuyNobilityType_BntRenew,
        PB3BuyNobilityType_BntUpgrade,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3BuyNobilityType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3BuyNobilityType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3BuyNobilityType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3BuyNobilityType_BntNull:
    case PB3BuyNobilityType_BntOpen:
    case PB3BuyNobilityType_BntRenew:
    case PB3BuyNobilityType_BntUpgrade:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3PayNobilityType

GPBEnumDescriptor *PB3PayNobilityType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PntNull\000PntGold\000PntWpay\000PntApay\000PntIap\000P"
        "ntCmb\000";
    static const int32_t values[] = {
        PB3PayNobilityType_PntNull,
        PB3PayNobilityType_PntGold,
        PB3PayNobilityType_PntWpay,
        PB3PayNobilityType_PntApay,
        PB3PayNobilityType_PntIap,
        PB3PayNobilityType_PntCmb,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PayNobilityType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PayNobilityType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PayNobilityType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PayNobilityType_PntNull:
    case PB3PayNobilityType_PntGold:
    case PB3PayNobilityType_PntWpay:
    case PB3PayNobilityType_PntApay:
    case PB3PayNobilityType_PntIap:
    case PB3PayNobilityType_PntCmb:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3BuyNobilityGoldType

GPBEnumDescriptor *PB3BuyNobilityGoldType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "BngtIos\000BngtH5\000";
    static const int32_t values[] = {
        PB3BuyNobilityGoldType_BngtIos,
        PB3BuyNobilityGoldType_BngtH5,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3BuyNobilityGoldType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3BuyNobilityGoldType_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3BuyNobilityGoldType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3BuyNobilityGoldType_BngtIos:
    case PB3BuyNobilityGoldType_BngtH5:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3PlayerNobilityStatus

GPBEnumDescriptor *PB3PlayerNobilityStatus_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PnsNull\000PnsUsing\000PnsOwned\000PnsProtected\000P"
        "nsOverdue\000";
    static const int32_t values[] = {
        PB3PlayerNobilityStatus_PnsNull,
        PB3PlayerNobilityStatus_PnsUsing,
        PB3PlayerNobilityStatus_PnsOwned,
        PB3PlayerNobilityStatus_PnsProtected,
        PB3PlayerNobilityStatus_PnsOverdue,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PlayerNobilityStatus)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PlayerNobilityStatus_IsValidValue];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PlayerNobilityStatus_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PlayerNobilityStatus_PnsNull:
    case PB3PlayerNobilityStatus_PnsUsing:
    case PB3PlayerNobilityStatus_PnsOwned:
    case PB3PlayerNobilityStatus_PnsProtected:
    case PB3PlayerNobilityStatus_PnsOverdue:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3PrivilegeSetType

GPBEnumDescriptor *PB3PrivilegeSetType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PstNull\000PstBool\000PstOtherPageSet\000PstProte"
        "ctEnterRoom\000";
    static const int32_t values[] = {
        PB3PrivilegeSetType_PstNull,
        PB3PrivilegeSetType_PstBool,
        PB3PrivilegeSetType_PstOtherPageSet,
        PB3PrivilegeSetType_PstProtectEnterRoom,
    };
    static const char *extraTextFormatInfo = "\002\002c\214\000\003c\220\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PrivilegeSetType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PrivilegeSetType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PrivilegeSetType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PrivilegeSetType_PstNull:
    case PB3PrivilegeSetType_PstBool:
    case PB3PrivilegeSetType_PstOtherPageSet:
    case PB3PrivilegeSetType_PstProtectEnterRoom:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - Enum PB3PrivilegeSetDataType

GPBEnumDescriptor *PB3PrivilegeSetDataType_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    static const char *valueNames =
        "PsdtNull\000PsdtBool\000PsdtStringImg\000PsdtProt"
        "ectEnterRoom\000PsdtMoreDealFriendInt\000";
    static const int32_t values[] = {
        PB3PrivilegeSetDataType_PsdtNull,
        PB3PrivilegeSetDataType_PsdtBool,
        PB3PrivilegeSetDataType_PsdtStringImg,
        PB3PrivilegeSetDataType_PsdtProtectEnterRoom,
        PB3PrivilegeSetDataType_PsdtMoreDealFriendInt,
    };
    static const char *extraTextFormatInfo = "\005\000d\204\000\001d\204\000\002d\211\000\003d\220\000\004d\221\000";
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(PB3PrivilegeSetDataType)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:PB3PrivilegeSetDataType_IsValidValue
                              extraTextFormatInfo:extraTextFormatInfo];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL PB3PrivilegeSetDataType_IsValidValue(int32_t value__) {
  switch (value__) {
    case PB3PrivilegeSetDataType_PsdtNull:
    case PB3PrivilegeSetDataType_PsdtBool:
    case PB3PrivilegeSetDataType_PsdtStringImg:
    case PB3PrivilegeSetDataType_PsdtProtectEnterRoom:
    case PB3PrivilegeSetDataType_PsdtMoreDealFriendInt:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - PB3NobilityConf

@implementation PB3NobilityConf

@dynamic nobilityId;
@dynamic name;
@dynamic icon;
@dynamic timeoutIcon;
@dynamic description_p;
@dynamic dynamicImg;
@dynamic nobilityLevel;
@dynamic privilegeIdsArray, privilegeIdsArray_Count;
@dynamic frameImg;
@dynamic price, price_Count;
@dynamic pcMinIcon;
@dynamic iconFrame;
@dynamic serverNum;
@dynamic dynamicImgBottom;
@dynamic pcDynamicImg;
@dynamic pcBigIcon;
@dynamic nameColor;
@dynamic isVipBuy;
@dynamic enterRoomEffect;
@dynamic enterRoomEffectIcon;
@dynamic enterRoomScreen;
@dynamic enterRoomEffectPc;
@dynamic enterRoomEffectIconPc;
@dynamic enterRoomScreenPc;

typedef struct PB3NobilityConf__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  int32_t nobilityLevel;
  NSString *name;
  NSString *icon;
  NSString *timeoutIcon;
  NSString *description_p;
  NSString *dynamicImg;
  GPBInt32Array *privilegeIdsArray;
  NSString *frameImg;
  GPBInt32ObjectDictionary *price;
  NSString *pcMinIcon;
  NSString *iconFrame;
  NSString *serverNum;
  NSString *dynamicImgBottom;
  NSString *pcDynamicImg;
  NSString *pcBigIcon;
  NSString *nameColor;
  NSString *enterRoomEffect;
  NSString *enterRoomEffectIcon;
  NSString *enterRoomScreen;
  NSString *enterRoomEffectPc;
  NSString *enterRoomEffectIconPc;
  NSString *enterRoomScreenPc;
} PB3NobilityConf__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_Icon,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "timeoutIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_TimeoutIcon,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, timeoutIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_Description_p,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "dynamicImg",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_DynamicImg,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, dynamicImg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nobilityLevel",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_NobilityLevel,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, nobilityLevel),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "privilegeIdsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_PrivilegeIdsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, privilegeIdsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "frameImg",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_FrameImg,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, frameImg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "price",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityPrice),
        .number = PB3NobilityConf_FieldNumber_Price,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, price),
        .flags = GPBFieldMapKeyInt32,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "pcMinIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_PcMinIcon,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, pcMinIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "iconFrame",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_IconFrame,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, iconFrame),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "serverNum",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_ServerNum,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, serverNum),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "dynamicImgBottom",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_DynamicImgBottom,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, dynamicImgBottom),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pcDynamicImg",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_PcDynamicImg,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, pcDynamicImg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "pcBigIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_PcBigIcon,
        .hasIndex = 13,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, pcBigIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nameColor",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_NameColor,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, nameColor),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isVipBuy",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_IsVipBuy,
        .hasIndex = 15,
        .offset = 16,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "enterRoomEffect",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomEffect,
        .hasIndex = 17,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomEffect),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "enterRoomEffectIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomEffectIcon,
        .hasIndex = 18,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomEffectIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "enterRoomScreen",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomScreen,
        .hasIndex = 19,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomScreen),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "enterRoomEffectPc",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomEffectPc,
        .hasIndex = 20,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomEffectPc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "enterRoomEffectIconPc",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomEffectIconPc,
        .hasIndex = 21,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomEffectIconPc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "enterRoomScreenPc",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityConf_FieldNumber_EnterRoomScreenPc,
        .hasIndex = 22,
        .offset = (uint32_t)offsetof(PB3NobilityConf__storage_, enterRoomScreenPc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityConf class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityConf__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityPrice

@implementation PB3NobilityPrice

@dynamic id_p;
@dynamic price;
@dynamic amount;
@dynamic presentGold;
@dynamic validDays;
@dynamic showPrice;
@dynamic showUnitName;
@dynamic showGold;
@dynamic showGoldUnitName;
@dynamic showPresentGold;
@dynamic showPresentUnitName;
@dynamic priceType;

typedef struct PB3NobilityPrice__storage_ {
  uint32_t _has_storage_[1];
  int32_t id_p;
  int32_t price;
  int32_t amount;
  int32_t presentGold;
  int32_t validDays;
  PB3NobilityPriceType priceType;
  NSString *showPrice;
  NSString *showUnitName;
  NSString *showGold;
  NSString *showGoldUnitName;
  NSString *showPresentGold;
  NSString *showPresentUnitName;
} PB3NobilityPrice__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "price",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_Price,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, price),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "amount",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_Amount,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, amount),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "presentGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_PresentGold,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, presentGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "validDays",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ValidDays,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, validDays),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "showPrice",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowPrice,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showPrice),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "showUnitName",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowUnitName,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showUnitName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "showGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowGold,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "showGoldUnitName",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowGoldUnitName,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showGoldUnitName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "showPresentGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowPresentGold,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showPresentGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "showPresentUnitName",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrice_FieldNumber_ShowPresentUnitName,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, showPresentUnitName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "priceType",
        .dataTypeSpecific.enumDescFunc = PB3NobilityPriceType_EnumDescriptor,
        .number = PB3NobilityPrice_FieldNumber_PriceType,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(PB3NobilityPrice__storage_, priceType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityPrice class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityPrice__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3NobilityPrice_PriceType_RawValue(PB3NobilityPrice *message) {
  GPBDescriptor *descriptor = [PB3NobilityPrice descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrice_FieldNumber_PriceType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityPrice_PriceType_RawValue(PB3NobilityPrice *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityPrice descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrice_FieldNumber_PriceType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3NobilityPrivilegeConf

@implementation PB3NobilityPrivilegeConf

@dynamic privilegeId;
@dynamic name;
@dynamic icon;
@dynamic route;
@dynamic description_p;
@dynamic setIcon;
@dynamic grayIcon;

typedef struct PB3NobilityPrivilegeConf__storage_ {
  uint32_t _has_storage_[1];
  int32_t privilegeId;
  NSString *name;
  NSString *icon;
  NSString *route;
  NSString *description_p;
  NSString *setIcon;
  NSString *grayIcon;
} PB3NobilityPrivilegeConf__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "privilegeId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_PrivilegeId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, privilegeId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_Icon,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "route",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_Route,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, route),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_Description_p,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "setIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_SetIcon,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, setIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "grayIcon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilegeConf_FieldNumber_GrayIcon,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeConf__storage_, grayIcon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityPrivilegeConf class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityPrivilegeConf__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetNobilityConfReq

@implementation PB3GetNobilityConfReq

@dynamic md5;

typedef struct PB3GetNobilityConfReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *md5;
} PB3GetNobilityConfReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "md5",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetNobilityConfReq_FieldNumber_Md5,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfReq__storage_, md5),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetNobilityConfReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetNobilityConfReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetNobilityConfRes

@implementation PB3GetNobilityConfRes

@dynamic nobilityConfArray, nobilityConfArray_Count;
@dynamic privilegeConfListArray, privilegeConfListArray_Count;
@dynamic md5;
@dynamic nameListArray, nameListArray_Count;
@dynamic photoListArray, photoListArray_Count;
@dynamic minorsSwitch;

typedef struct PB3GetNobilityConfRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *nobilityConfArray;
  NSMutableArray *privilegeConfListArray;
  NSString *md5;
  NSMutableArray *nameListArray;
  NSMutableArray *photoListArray;
} PB3GetNobilityConfRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityConfArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityConf),
        .number = PB3GetNobilityConfRes_FieldNumber_NobilityConfArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfRes__storage_, nobilityConfArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "privilegeConfListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityPrivilegeConf),
        .number = PB3GetNobilityConfRes_FieldNumber_PrivilegeConfListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfRes__storage_, privilegeConfListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "md5",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetNobilityConfRes_FieldNumber_Md5,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfRes__storage_, md5),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "nameListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskName),
        .number = PB3GetNobilityConfRes_FieldNumber_NameListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfRes__storage_, nameListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "photoListArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskPhoto),
        .number = PB3GetNobilityConfRes_FieldNumber_PhotoListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfRes__storage_, photoListArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "minorsSwitch",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetNobilityConfRes_FieldNumber_MinorsSwitch,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetNobilityConfRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetNobilityConfRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BuyNobilityReq

@implementation PB3BuyNobilityReq

@dynamic nobilityId;
@dynamic buyType;
@dynamic payType;
@dynamic hasPrice, price;
@dynamic roomId;
@dynamic benefitId;
@dynamic buyGoldType;
@dynamic hasCoupon, coupon;

typedef struct PB3BuyNobilityReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  PB3BuyNobilityType buyType;
  PB3PayNobilityType payType;
  PB3BuyNobilityGoldType buyGoldType;
  PB3NobilityPrice *price;
  PB3CouponUsedData *coupon;
  int64_t roomId;
  int64_t benefitId;
} PB3BuyNobilityReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3BuyNobilityReq_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "buyType",
        .dataTypeSpecific.enumDescFunc = PB3BuyNobilityType_EnumDescriptor,
        .number = PB3BuyNobilityReq_FieldNumber_BuyType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, buyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "payType",
        .dataTypeSpecific.enumDescFunc = PB3PayNobilityType_EnumDescriptor,
        .number = PB3BuyNobilityReq_FieldNumber_PayType,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, payType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "price",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityPrice),
        .number = PB3BuyNobilityReq_FieldNumber_Price,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, price),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PB3BuyNobilityReq_FieldNumber_RoomId,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "benefitId",
        .dataTypeSpecific.className = NULL,
        .number = PB3BuyNobilityReq_FieldNumber_BenefitId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, benefitId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "buyGoldType",
        .dataTypeSpecific.enumDescFunc = PB3BuyNobilityGoldType_EnumDescriptor,
        .number = PB3BuyNobilityReq_FieldNumber_BuyGoldType,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, buyGoldType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "coupon",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3CouponUsedData),
        .number = PB3BuyNobilityReq_FieldNumber_Coupon,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3BuyNobilityReq__storage_, coupon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BuyNobilityReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BuyNobilityReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3BuyNobilityReq_BuyType_RawValue(PB3BuyNobilityReq *message) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_BuyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3BuyNobilityReq_BuyType_RawValue(PB3BuyNobilityReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_BuyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3BuyNobilityReq_PayType_RawValue(PB3BuyNobilityReq *message) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_PayType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3BuyNobilityReq_PayType_RawValue(PB3BuyNobilityReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_PayType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3BuyNobilityReq_BuyGoldType_RawValue(PB3BuyNobilityReq *message) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_BuyGoldType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3BuyNobilityReq_BuyGoldType_RawValue(PB3BuyNobilityReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3BuyNobilityReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3BuyNobilityReq_FieldNumber_BuyGoldType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3BuyNobilityRes

@implementation PB3BuyNobilityRes

@dynamic hasNobilityDynamic, nobilityDynamic;

typedef struct PB3BuyNobilityRes__storage_ {
  uint32_t _has_storage_[1];
  PB3NobilityDynamic *nobilityDynamic;
} PB3BuyNobilityRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityDynamic",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityDynamic),
        .number = PB3BuyNobilityRes_FieldNumber_NobilityDynamic,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BuyNobilityRes__storage_, nobilityDynamic),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BuyNobilityRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BuyNobilityRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PlayerNobilityInfo

@implementation PB3PlayerNobilityInfo

@dynamic nobilityId;
@dynamic createAt;
@dynamic status;
@dynamic endAt;
@dynamic protectAt;
@dynamic openDays;
@dynamic showEndAt;
@dynamic protectDays;

typedef struct PB3PlayerNobilityInfo__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  PB3PlayerNobilityStatus status;
  int32_t openDays;
  int32_t protectDays;
  NSString *showEndAt;
  int64_t createAt;
  int64_t endAt;
  int64_t protectAt;
} PB3PlayerNobilityInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "createAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_CreateAt,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, createAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PB3PlayerNobilityStatus_EnumDescriptor,
        .number = PB3PlayerNobilityInfo_FieldNumber_Status,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "endAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_EndAt,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, endAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "protectAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_ProtectAt,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, protectAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "openDays",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_OpenDays,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, openDays),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "showEndAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_ShowEndAt,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, showEndAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "protectDays",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfo_FieldNumber_ProtectDays,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfo__storage_, protectDays),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerNobilityInfo class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlayerNobilityInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3PlayerNobilityInfo_Status_RawValue(PB3PlayerNobilityInfo *message) {
  GPBDescriptor *descriptor = [PB3PlayerNobilityInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PlayerNobilityInfo_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3PlayerNobilityInfo_Status_RawValue(PB3PlayerNobilityInfo *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3PlayerNobilityInfo descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3PlayerNobilityInfo_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3PlayerNobilityInfoReq

@implementation PB3PlayerNobilityInfoReq

@dynamic playerId;

typedef struct PB3PlayerNobilityInfoReq__storage_ {
  uint32_t _has_storage_[1];
  int64_t playerId;
} PB3PlayerNobilityInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3PlayerNobilityInfoReq_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfoReq__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerNobilityInfoReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlayerNobilityInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PlayerNobilityInfoRes

@implementation PB3PlayerNobilityInfoRes

@dynamic hasNobilityInfo, nobilityInfo;
@dynamic hasMaskInfo, maskInfo;

typedef struct PB3PlayerNobilityInfoRes__storage_ {
  uint32_t _has_storage_[1];
  PB3PlayerNobilityInfo *nobilityInfo;
  PB3MaskInfo *maskInfo;
} PB3PlayerNobilityInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerNobilityInfo),
        .number = PB3PlayerNobilityInfoRes_FieldNumber_NobilityInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfoRes__storage_, nobilityInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3PlayerNobilityInfoRes_FieldNumber_MaskInfo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfoRes__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerNobilityInfoRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlayerNobilityInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PlayerNobilityInfoListReq

@implementation PB3PlayerNobilityInfoListReq


typedef struct PB3PlayerNobilityInfoListReq__storage_ {
  uint32_t _has_storage_[1];
} PB3PlayerNobilityInfoListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerNobilityInfoListReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3PlayerNobilityInfoListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3PlayerNobilityInfoListRes

@implementation PB3PlayerNobilityInfoListRes

@dynamic listArray, listArray_Count;

typedef struct PB3PlayerNobilityInfoListRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PB3PlayerNobilityInfoListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerNobilityInfo),
        .number = PB3PlayerNobilityInfoListRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3PlayerNobilityInfoListRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3PlayerNobilityInfoListRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3PlayerNobilityInfoListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityPrivilege

@implementation PB3NobilityPrivilege

@dynamic hasPrivilege, privilege;
@dynamic isCustomSet;
@dynamic setType;
@dynamic status;
@dynamic tips;
@dynamic dataType;
@dynamic extraData;
@dynamic showArrow;
@dynamic img;

typedef struct PB3NobilityPrivilege__storage_ {
  uint32_t _has_storage_[1];
  PB3PrivilegeSetType setType;
  PB3PrivilegeSetDataType dataType;
  PB3NobilityPrivilegeConf *privilege;
  NSString *tips;
  NSData *extraData;
  NSString *img;
} PB3NobilityPrivilege__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "privilege",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityPrivilegeConf),
        .number = PB3NobilityPrivilege_FieldNumber_Privilege,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, privilege),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "isCustomSet",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_IsCustomSet,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "setType",
        .dataTypeSpecific.enumDescFunc = PB3PrivilegeSetType_EnumDescriptor,
        .number = PB3NobilityPrivilege_FieldNumber_SetType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, setType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "status",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_Status,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "tips",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_Tips,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, tips),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "dataType",
        .dataTypeSpecific.enumDescFunc = PB3PrivilegeSetDataType_EnumDescriptor,
        .number = PB3NobilityPrivilege_FieldNumber_DataType,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, dataType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "extraData",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_ExtraData,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, extraData),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "showArrow",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_ShowArrow,
        .hasIndex = 9,
        .offset = 10,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "img",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityPrivilege_FieldNumber_Img,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilege__storage_, img),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityPrivilege class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityPrivilege__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3NobilityPrivilege_SetType_RawValue(PB3NobilityPrivilege *message) {
  GPBDescriptor *descriptor = [PB3NobilityPrivilege descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrivilege_FieldNumber_SetType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityPrivilege_SetType_RawValue(PB3NobilityPrivilege *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityPrivilege descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrivilege_FieldNumber_SetType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3NobilityPrivilege_DataType_RawValue(PB3NobilityPrivilege *message) {
  GPBDescriptor *descriptor = [PB3NobilityPrivilege descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrivilege_FieldNumber_DataType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityPrivilege_DataType_RawValue(PB3NobilityPrivilege *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityPrivilege descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityPrivilege_FieldNumber_DataType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3NobilityPrivilegeReq

@implementation PB3NobilityPrivilegeReq


typedef struct PB3NobilityPrivilegeReq__storage_ {
  uint32_t _has_storage_[1];
} PB3NobilityPrivilegeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityPrivilegeReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3NobilityPrivilegeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityPrivilegeRes

@implementation PB3NobilityPrivilegeRes

@dynamic listArray, listArray_Count;

typedef struct PB3NobilityPrivilegeRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PB3NobilityPrivilegeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityPrivilege),
        .number = PB3NobilityPrivilegeRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3NobilityPrivilegeRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityPrivilegeRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityPrivilegeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpdateMaskInfoReq

@implementation PB3UpdateMaskInfoReq

@dynamic maskNameId;
@dynamic maskIconId;

typedef struct PB3UpdateMaskInfoReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t maskNameId;
  int32_t maskIconId;
} PB3UpdateMaskInfoReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "maskNameId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdateMaskInfoReq_FieldNumber_MaskNameId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpdateMaskInfoReq__storage_, maskNameId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "maskIconId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdateMaskInfoReq_FieldNumber_MaskIconId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3UpdateMaskInfoReq__storage_, maskIconId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpdateMaskInfoReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpdateMaskInfoReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpdateMaskInfoRes

@implementation PB3UpdateMaskInfoRes


typedef struct PB3UpdateMaskInfoRes__storage_ {
  uint32_t _has_storage_[1];
} PB3UpdateMaskInfoRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpdateMaskInfoRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3UpdateMaskInfoRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpdateBoolPrivilegeReq

@implementation PB3UpdateBoolPrivilegeReq

@dynamic privilegeId;
@dynamic status;

typedef struct PB3UpdateBoolPrivilegeReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t privilegeId;
} PB3UpdateBoolPrivilegeReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "privilegeId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdateBoolPrivilegeReq_FieldNumber_PrivilegeId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpdateBoolPrivilegeReq__storage_, privilegeId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "status",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdateBoolPrivilegeReq_FieldNumber_Status,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpdateBoolPrivilegeReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpdateBoolPrivilegeReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3UpdateBoolPrivilegeRes

@implementation PB3UpdateBoolPrivilegeRes


typedef struct PB3UpdateBoolPrivilegeRes__storage_ {
  uint32_t _has_storage_[1];
} PB3UpdateBoolPrivilegeRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpdateBoolPrivilegeRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3UpdateBoolPrivilegeRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityDynamic

@implementation PB3NobilityDynamic

@dynamic nobilityId;
@dynamic playerId;
@dynamic id2;
@dynamic name;
@dynamic icon;
@dynamic buyType;
@dynamic msg;
@dynamic roomId;
@dynamic orderId;

typedef struct PB3NobilityDynamic__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  PB3BuyNobilityType buyType;
  NSString *name;
  NSString *icon;
  NSString *msg;
  NSString *orderId;
  int64_t playerId;
  int64_t id2;
  int64_t roomId;
} PB3NobilityDynamic__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_PlayerId,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "id2",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_Id2,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, id2),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_Name,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_Icon,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "buyType",
        .dataTypeSpecific.enumDescFunc = PB3BuyNobilityType_EnumDescriptor,
        .number = PB3NobilityDynamic_FieldNumber_BuyType,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, buyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "msg",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_Msg,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, msg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "roomId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_RoomId,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, roomId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "orderId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityDynamic_FieldNumber_OrderId,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3NobilityDynamic__storage_, orderId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityDynamic class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityDynamic__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3NobilityDynamic_BuyType_RawValue(PB3NobilityDynamic *message) {
  GPBDescriptor *descriptor = [PB3NobilityDynamic descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityDynamic_FieldNumber_BuyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityDynamic_BuyType_RawValue(PB3NobilityDynamic *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityDynamic descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityDynamic_FieldNumber_BuyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3UpdatePrivilege

@implementation PB3UpdatePrivilege

@dynamic privilegeId;
@dynamic status;
@dynamic playerId;

typedef struct PB3UpdatePrivilege__storage_ {
  uint32_t _has_storage_[1];
  int32_t privilegeId;
  int64_t playerId;
} PB3UpdatePrivilege__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "privilegeId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdatePrivilege_FieldNumber_PrivilegeId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3UpdatePrivilege__storage_, privilegeId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "status",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdatePrivilege_FieldNumber_Status,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3UpdatePrivilege_FieldNumber_PlayerId,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3UpdatePrivilege__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3UpdatePrivilege class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3UpdatePrivilege__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NoticeUpdateMask

@implementation PB3NoticeUpdateMask

@dynamic hasMaskInfo, maskInfo;

typedef struct PB3NoticeUpdateMask__storage_ {
  uint32_t _has_storage_[1];
  PB3MaskInfo *maskInfo;
} PB3NoticeUpdateMask__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3NoticeUpdateMask_FieldNumber_MaskInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NoticeUpdateMask__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NoticeUpdateMask class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NoticeUpdateMask__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NoticeNobility

@implementation PB3NoticeNobility

@dynamic hasNobilityInfo, nobilityInfo;
@dynamic hasMaskInfo, maskInfo;
@dynamic playerId;

typedef struct PB3NoticeNobility__storage_ {
  uint32_t _has_storage_[1];
  PB3PlayerNobilityInfo *nobilityInfo;
  PB3MaskInfo *maskInfo;
  int64_t playerId;
} PB3NoticeNobility__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3PlayerNobilityInfo),
        .number = PB3NoticeNobility_FieldNumber_NobilityInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NoticeNobility__storage_, nobilityInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3NoticeNobility_FieldNumber_MaskInfo,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NoticeNobility__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NoticeNobility_FieldNumber_PlayerId,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NoticeNobility__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NoticeNobility class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NoticeNobility__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RoomNobilityInfo

@implementation PB3RoomNobilityInfo

@dynamic hasMaskInfo, maskInfo;
@dynamic openNobilityAt;
@dynamic isStealthEnter;
@dynamic isStealthSit;
@dynamic nobilityId;
@dynamic level;
@dynamic chairId;

typedef struct PB3RoomNobilityInfo__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  int32_t level;
  int32_t chairId;
  PB3MaskInfo *maskInfo;
  int64_t openNobilityAt;
} PB3RoomNobilityInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "maskInfo",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskInfo),
        .number = PB3RoomNobilityInfo_FieldNumber_MaskInfo,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RoomNobilityInfo__storage_, maskInfo),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "openNobilityAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_OpenNobilityAt,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RoomNobilityInfo__storage_, openNobilityAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "isStealthEnter",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_IsStealthEnter,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "isStealthSit",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_IsStealthSit,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_NobilityId,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3RoomNobilityInfo__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "level",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_Level,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3RoomNobilityInfo__storage_, level),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "chairId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomNobilityInfo_FieldNumber_ChairId,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3RoomNobilityInfo__storage_, chairId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomNobilityInfo class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RoomNobilityInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3HallOfFame

@implementation PB3HallOfFame

@dynamic playerId;
@dynamic name;
@dynamic icon;
@dynamic joinTimestamp;
@dynamic joinDays;
@dynamic nobilityId;

typedef struct PB3HallOfFame__storage_ {
  uint32_t _has_storage_[1];
  int32_t joinDays;
  int32_t nobilityId;
  NSString *name;
  NSString *icon;
  int64_t playerId;
  int64_t joinTimestamp;
} PB3HallOfFame__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_Icon,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "joinTimestamp",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_JoinTimestamp,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, joinTimestamp),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "joinDays",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_JoinDays,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, joinDays),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFame_FieldNumber_NobilityId,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3HallOfFame__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3HallOfFame class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3HallOfFame__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3HallOfFameReq

@implementation PB3HallOfFameReq

@dynamic page;

typedef struct PB3HallOfFameReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t page;
} PB3HallOfFameReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "page",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFameReq_FieldNumber_Page,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3HallOfFameReq__storage_, page),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3HallOfFameReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3HallOfFameReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3HallOfFameRes

@implementation PB3HallOfFameRes

@dynamic famousArray, famousArray_Count;
@dynamic hasMyNobility, myNobility;
@dynamic sumFamous;

typedef struct PB3HallOfFameRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t sumFamous;
  NSMutableArray *famousArray;
  PB3HallOfFame *myNobility;
} PB3HallOfFameRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "famousArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3HallOfFame),
        .number = PB3HallOfFameRes_FieldNumber_FamousArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3HallOfFameRes__storage_, famousArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "myNobility",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3HallOfFame),
        .number = PB3HallOfFameRes_FieldNumber_MyNobility,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3HallOfFameRes__storage_, myNobility),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "sumFamous",
        .dataTypeSpecific.className = NULL,
        .number = PB3HallOfFameRes_FieldNumber_SumFamous,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3HallOfFameRes__storage_, sumFamous),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3HallOfFameRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3HallOfFameRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RoomRankMaskSetReq

@implementation PB3RoomRankMaskSetReq

@dynamic oper;
@dynamic roomIdsArray, roomIdsArray_Count;

typedef struct PB3RoomRankMaskSetReq__storage_ {
  uint32_t _has_storage_[1];
  PB3CommonOperType oper;
  GPBInt64Array *roomIdsArray;
} PB3RoomRankMaskSetReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "oper",
        .dataTypeSpecific.enumDescFunc = PB3CommonOperType_EnumDescriptor,
        .number = PB3RoomRankMaskSetReq_FieldNumber_Oper,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RoomRankMaskSetReq__storage_, oper),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "roomIdsArray",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRankMaskSetReq_FieldNumber_RoomIdsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RoomRankMaskSetReq__storage_, roomIdsArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldPacked),
        .dataType = GPBDataTypeSInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomRankMaskSetReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RoomRankMaskSetReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3RoomRankMaskSetReq_Oper_RawValue(PB3RoomRankMaskSetReq *message) {
  GPBDescriptor *descriptor = [PB3RoomRankMaskSetReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRankMaskSetReq_FieldNumber_Oper];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3RoomRankMaskSetReq_Oper_RawValue(PB3RoomRankMaskSetReq *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3RoomRankMaskSetReq descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRankMaskSetReq_FieldNumber_Oper];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3RoomRankMaskSetRes

@implementation PB3RoomRankMaskSetRes


typedef struct PB3RoomRankMaskSetRes__storage_ {
  uint32_t _has_storage_[1];
} PB3RoomRankMaskSetRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomRankMaskSetRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RoomRankMaskSetRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RoomRankMaskListReq

@implementation PB3RoomRankMaskListReq


typedef struct PB3RoomRankMaskListReq__storage_ {
  uint32_t _has_storage_[1];
} PB3RoomRankMaskListReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomRankMaskListReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3RoomRankMaskListReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RoomRankMaskListRes

@implementation PB3RoomRankMaskListRes

@dynamic roomsArray, roomsArray_Count;

typedef struct PB3RoomRankMaskListRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *roomsArray;
} PB3RoomRankMaskListRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "roomsArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3MaskRoomInfo),
        .number = PB3RoomRankMaskListRes_FieldNumber_RoomsArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3RoomRankMaskListRes__storage_, roomsArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomRankMaskListRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RoomRankMaskListRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MaskRoomInfo

@implementation PB3MaskRoomInfo

@dynamic id_p;
@dynamic icon;
@dynamic name;
@dynamic greeting;

typedef struct PB3MaskRoomInfo__storage_ {
  uint32_t _has_storage_[1];
  NSString *icon;
  NSString *name;
  NSString *greeting;
  int64_t id_p;
} PB3MaskRoomInfo__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskRoomInfo_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MaskRoomInfo__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskRoomInfo_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MaskRoomInfo__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskRoomInfo_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3MaskRoomInfo__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "greeting",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskRoomInfo_FieldNumber_Greeting,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3MaskRoomInfo__storage_, greeting),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MaskRoomInfo class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MaskRoomInfo__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MaskName

@implementation PB3MaskName

@dynamic id_p;
@dynamic name;
@dynamic isDefault;

typedef struct PB3MaskName__storage_ {
  uint32_t _has_storage_[1];
  int32_t id_p;
  NSString *name;
} PB3MaskName__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskName_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MaskName__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskName_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MaskName__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isDefault",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskName_FieldNumber_IsDefault,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MaskName class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MaskName__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MaskPhoto

@implementation PB3MaskPhoto

@dynamic id_p;
@dynamic icon;
@dynamic dynamicImg;
@dynamic name;
@dynamic isDefault;

typedef struct PB3MaskPhoto__storage_ {
  uint32_t _has_storage_[1];
  int32_t id_p;
  NSString *icon;
  NSString *dynamicImg;
  NSString *name;
} PB3MaskPhoto__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "id_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskPhoto_FieldNumber_Id_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MaskPhoto__storage_, id_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskPhoto_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3MaskPhoto__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "dynamicImg",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskPhoto_FieldNumber_DynamicImg,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3MaskPhoto__storage_, dynamicImg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskPhoto_FieldNumber_Name,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3MaskPhoto__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "isDefault",
        .dataTypeSpecific.className = NULL,
        .number = PB3MaskPhoto_FieldNumber_IsDefault,
        .hasIndex = 4,
        .offset = 5,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MaskPhoto class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MaskPhoto__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BuyNobilityLogReq

@implementation PB3BuyNobilityLogReq

@dynamic index;

typedef struct PB3BuyNobilityLogReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t index;
} PB3BuyNobilityLogReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "index",
        .dataTypeSpecific.className = NULL,
        .number = PB3BuyNobilityLogReq_FieldNumber_Index,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BuyNobilityLogReq__storage_, index),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BuyNobilityLogReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BuyNobilityLogReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3BuyNobilityLogRes

@implementation PB3BuyNobilityLogRes

@dynamic listArray, listArray_Count;
@dynamic nextIndex;

typedef struct PB3BuyNobilityLogRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t nextIndex;
  NSMutableArray *listArray;
} PB3BuyNobilityLogRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3NobilityLog),
        .number = PB3BuyNobilityLogRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3BuyNobilityLogRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "nextIndex",
        .dataTypeSpecific.className = NULL,
        .number = PB3BuyNobilityLogRes_FieldNumber_NextIndex,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3BuyNobilityLogRes__storage_, nextIndex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3BuyNobilityLogRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3BuyNobilityLogRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityLog

@implementation PB3NobilityLog

@dynamic nobilityId;
@dynamic buyType;
@dynamic num;
@dynamic payType;
@dynamic buyGold;
@dynamic refundGold;
@dynamic buyTime;
@dynamic endTime;
@dynamic status;
@dynamic buyRmb;

typedef struct PB3NobilityLog__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
  PB3BuyNobilityType buyType;
  int32_t num;
  PB3PayNobilityType payType;
  PB3PlayerNobilityStatus status;
  int64_t buyGold;
  int64_t refundGold;
  int64_t buyTime;
  int64_t endTime;
  int64_t buyRmb;
} PB3NobilityLog__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "buyType",
        .dataTypeSpecific.enumDescFunc = PB3BuyNobilityType_EnumDescriptor,
        .number = PB3NobilityLog_FieldNumber_BuyType,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, buyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "num",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_Num,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, num),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "payType",
        .dataTypeSpecific.enumDescFunc = PB3PayNobilityType_EnumDescriptor,
        .number = PB3NobilityLog_FieldNumber_PayType,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, payType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "buyGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_BuyGold,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, buyGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "refundGold",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_RefundGold,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, refundGold),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "buyTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_BuyTime,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, buyTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "endTime",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_EndTime,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, endTime),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "status",
        .dataTypeSpecific.enumDescFunc = PB3PlayerNobilityStatus_EnumDescriptor,
        .number = PB3NobilityLog_FieldNumber_Status,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, status),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "buyRmb",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityLog_FieldNumber_BuyRmb,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3NobilityLog__storage_, buyRmb),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityLog class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityLog__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3NobilityLog_BuyType_RawValue(PB3NobilityLog *message) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_BuyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityLog_BuyType_RawValue(PB3NobilityLog *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_BuyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3NobilityLog_PayType_RawValue(PB3NobilityLog *message) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_PayType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityLog_PayType_RawValue(PB3NobilityLog *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_PayType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3NobilityLog_Status_RawValue(PB3NobilityLog *message) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_Status];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3NobilityLog_Status_RawValue(PB3NobilityLog *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3NobilityLog descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3NobilityLog_FieldNumber_Status];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3MinNobilityReq

@implementation PB3MinNobilityReq

@dynamic privilegeId;

typedef struct PB3MinNobilityReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t privilegeId;
} PB3MinNobilityReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "privilegeId",
        .dataTypeSpecific.className = NULL,
        .number = PB3MinNobilityReq_FieldNumber_PrivilegeId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MinNobilityReq__storage_, privilegeId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MinNobilityReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MinNobilityReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3MinNobilityRes

@implementation PB3MinNobilityRes

@dynamic nobilityId;

typedef struct PB3MinNobilityRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t nobilityId;
} PB3MinNobilityRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityId",
        .dataTypeSpecific.className = NULL,
        .number = PB3MinNobilityRes_FieldNumber_NobilityId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3MinNobilityRes__storage_, nobilityId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3MinNobilityRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3MinNobilityRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3FollowToRoomReq

@implementation PB3FollowToRoomReq


typedef struct PB3FollowToRoomReq__storage_ {
  uint32_t _has_storage_[1];
} PB3FollowToRoomReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3FollowToRoomReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3FollowToRoomReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3FollowToRoomRes

@implementation PB3FollowToRoomRes

@dynamic banFollowMe;
@dynamic friendFollow;

typedef struct PB3FollowToRoomRes__storage_ {
  uint32_t _has_storage_[1];
} PB3FollowToRoomRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "banFollowMe",
        .dataTypeSpecific.className = NULL,
        .number = PB3FollowToRoomRes_FieldNumber_BanFollowMe,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "friendFollow",
        .dataTypeSpecific.className = NULL,
        .number = PB3FollowToRoomRes_FieldNumber_FriendFollow,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3FollowToRoomRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3FollowToRoomRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SetFollowToRoomReq

@implementation PB3SetFollowToRoomReq

@dynamic banFollowMe;
@dynamic friendFollow;

typedef struct PB3SetFollowToRoomReq__storage_ {
  uint32_t _has_storage_[1];
} PB3SetFollowToRoomReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "banFollowMe",
        .dataTypeSpecific.className = NULL,
        .number = PB3SetFollowToRoomReq_FieldNumber_BanFollowMe,
        .hasIndex = 0,
        .offset = 1,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "friendFollow",
        .dataTypeSpecific.className = NULL,
        .number = PB3SetFollowToRoomReq_FieldNumber_FriendFollow,
        .hasIndex = 2,
        .offset = 3,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SetFollowToRoomReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3SetFollowToRoomReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3SetFollowToRoomRes

@implementation PB3SetFollowToRoomRes


typedef struct PB3SetFollowToRoomRes__storage_ {
  uint32_t _has_storage_[1];
} PB3SetFollowToRoomRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3SetFollowToRoomRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3SetFollowToRoomRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CustomerServiceReq

@implementation PB3CustomerServiceReq


typedef struct PB3CustomerServiceReq__storage_ {
  uint32_t _has_storage_[1];
} PB3CustomerServiceReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CustomerServiceReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3CustomerServiceReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3CustomerServiceRes

@implementation PB3CustomerServiceRes

@dynamic name;
@dynamic icon;
@dynamic description_p;
@dynamic route;

typedef struct PB3CustomerServiceRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
  NSString *icon;
  NSString *description_p;
  NSString *route;
} PB3CustomerServiceRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3CustomerServiceRes_FieldNumber_Name,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3CustomerServiceRes__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3CustomerServiceRes_FieldNumber_Icon,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3CustomerServiceRes__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "description_p",
        .dataTypeSpecific.className = NULL,
        .number = PB3CustomerServiceRes_FieldNumber_Description_p,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3CustomerServiceRes__storage_, description_p),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "route",
        .dataTypeSpecific.className = NULL,
        .number = PB3CustomerServiceRes_FieldNumber_Route,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3CustomerServiceRes__storage_, route),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3CustomerServiceRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3CustomerServiceRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3OpenNobilityPopItem

@implementation PB3OpenNobilityPopItem

@dynamic title;
@dynamic msg;
@dynamic background;
@dynamic image;

typedef struct PB3OpenNobilityPopItem__storage_ {
  uint32_t _has_storage_[1];
  NSString *title;
  NSString *msg;
  NSString *background;
  NSString *image;
} PB3OpenNobilityPopItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "title",
        .dataTypeSpecific.className = NULL,
        .number = PB3OpenNobilityPopItem_FieldNumber_Title,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3OpenNobilityPopItem__storage_, title),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "msg",
        .dataTypeSpecific.className = NULL,
        .number = PB3OpenNobilityPopItem_FieldNumber_Msg,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3OpenNobilityPopItem__storage_, msg),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "background",
        .dataTypeSpecific.className = NULL,
        .number = PB3OpenNobilityPopItem_FieldNumber_Background,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3OpenNobilityPopItem__storage_, background),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "image",
        .dataTypeSpecific.className = NULL,
        .number = PB3OpenNobilityPopItem_FieldNumber_Image,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3OpenNobilityPopItem__storage_, image),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3OpenNobilityPopItem class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3OpenNobilityPopItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3AfterOpenNobilityPopReq

@implementation PB3AfterOpenNobilityPopReq

@dynamic orderId;

typedef struct PB3AfterOpenNobilityPopReq__storage_ {
  uint32_t _has_storage_[1];
  NSString *orderId;
} PB3AfterOpenNobilityPopReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "orderId",
        .dataTypeSpecific.className = NULL,
        .number = PB3AfterOpenNobilityPopReq_FieldNumber_OrderId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3AfterOpenNobilityPopReq__storage_, orderId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3AfterOpenNobilityPopReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3AfterOpenNobilityPopReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3AfterOpenNobilityPopRes

@implementation PB3AfterOpenNobilityPopRes

@dynamic listArray, listArray_Count;

typedef struct PB3AfterOpenNobilityPopRes__storage_ {
  uint32_t _has_storage_[1];
  NSMutableArray *listArray;
} PB3AfterOpenNobilityPopRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3OpenNobilityPopItem),
        .number = PB3AfterOpenNobilityPopRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3AfterOpenNobilityPopRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3AfterOpenNobilityPopRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3AfterOpenNobilityPopRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityRoomRewardReq

@implementation PB3NobilityRoomRewardReq

@dynamic index;

typedef struct PB3NobilityRoomRewardReq__storage_ {
  uint32_t _has_storage_[1];
  int32_t index;
} PB3NobilityRoomRewardReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "index",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityRoomRewardReq_FieldNumber_Index,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityRoomRewardReq__storage_, index),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityRoomRewardReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityRoomRewardReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityRoomRewardRes

@implementation PB3NobilityRoomRewardRes

@dynamic nextIndex;
@dynamic listArray, listArray_Count;

typedef struct PB3NobilityRoomRewardRes__storage_ {
  uint32_t _has_storage_[1];
  int32_t nextIndex;
  NSMutableArray *listArray;
} PB3NobilityRoomRewardRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nextIndex",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityRoomRewardRes_FieldNumber_NextIndex,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityRoomRewardRes__storage_, nextIndex),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "listArray",
        .dataTypeSpecific.className = GPBStringifySymbol(PB3RoomRewardItem),
        .number = PB3NobilityRoomRewardRes_FieldNumber_ListArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(PB3NobilityRoomRewardRes__storage_, listArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityRoomRewardRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityRoomRewardRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3RoomRewardItem

@implementation PB3RoomRewardItem

@dynamic playerId;
@dynamic playerId2;
@dynamic name;
@dynamic icon;
@dynamic sex;
@dynamic createAt;
@dynamic tick;
@dynamic buyType;
@dynamic nobilityName;
@dynamic day;
@dynamic benefitId;
@dynamic benefitId2;
@dynamic benefitName;

typedef struct PB3RoomRewardItem__storage_ {
  uint32_t _has_storage_[1];
  PB3SexType sex;
  PB3BuyNobilityType buyType;
  NSString *name;
  NSString *icon;
  NSString *nobilityName;
  NSString *day;
  NSString *benefitName;
  int64_t playerId;
  int64_t playerId2;
  int64_t createAt;
  int64_t tick;
  int64_t benefitId;
  int64_t benefitId2;
} PB3RoomRewardItem__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "playerId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_PlayerId,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, playerId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "playerId2",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_PlayerId2,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, playerId2),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "icon",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_Icon,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, icon),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "sex",
        .dataTypeSpecific.enumDescFunc = PB3SexType_EnumDescriptor,
        .number = PB3RoomRewardItem_FieldNumber_Sex,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, sex),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "createAt",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_CreateAt,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, createAt),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "tick",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_Tick,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, tick),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "buyType",
        .dataTypeSpecific.enumDescFunc = PB3BuyNobilityType_EnumDescriptor,
        .number = PB3RoomRewardItem_FieldNumber_BuyType,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, buyType),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "nobilityName",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_NobilityName,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, nobilityName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "day",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_Day,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, day),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "benefitId",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_BenefitId,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, benefitId),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "benefitId2",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_BenefitId2,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, benefitId2),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "benefitName",
        .dataTypeSpecific.className = NULL,
        .number = PB3RoomRewardItem_FieldNumber_BenefitName,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(PB3RoomRewardItem__storage_, benefitName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3RoomRewardItem class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3RoomRewardItem__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t PB3RoomRewardItem_Sex_RawValue(PB3RoomRewardItem *message) {
  GPBDescriptor *descriptor = [PB3RoomRewardItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRewardItem_FieldNumber_Sex];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3RoomRewardItem_Sex_RawValue(PB3RoomRewardItem *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3RoomRewardItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRewardItem_FieldNumber_Sex];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

int32_t PB3RoomRewardItem_BuyType_RawValue(PB3RoomRewardItem *message) {
  GPBDescriptor *descriptor = [PB3RoomRewardItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRewardItem_FieldNumber_BuyType];
  return GPBGetMessageInt32Field(message, field);
}

void SetPB3RoomRewardItem_BuyType_RawValue(PB3RoomRewardItem *message, int32_t value) {
  GPBDescriptor *descriptor = [PB3RoomRewardItem descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:PB3RoomRewardItem_FieldNumber_BuyType];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

#pragma mark - PB3NobilityGainReq

@implementation PB3NobilityGainReq


typedef struct PB3NobilityGainReq__storage_ {
  uint32_t _has_storage_[1];
} PB3NobilityGainReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityGainReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3NobilityGainReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3NobilityGainRes

@implementation PB3NobilityGainRes

@dynamic nobilityGain;
@dynamic isShow;

typedef struct PB3NobilityGainRes__storage_ {
  uint32_t _has_storage_[1];
  int64_t nobilityGain;
} PB3NobilityGainRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "nobilityGain",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityGainRes_FieldNumber_NobilityGain,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3NobilityGainRes__storage_, nobilityGain),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "isShow",
        .dataTypeSpecific.className = NULL,
        .number = PB3NobilityGainRes_FieldNumber_IsShow,
        .hasIndex = 1,
        .offset = 2,   
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3NobilityGainRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3NobilityGainRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetNobilityConfCDNReq

@implementation PB3GetNobilityConfCDNReq


typedef struct PB3GetNobilityConfCDNReq__storage_ {
  uint32_t _has_storage_[1];
} PB3GetNobilityConfCDNReq__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetNobilityConfCDNReq class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:NULL
                                    fieldCount:0
                                   storageSize:sizeof(PB3GetNobilityConfCDNReq__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

#pragma mark - PB3GetNobilityConfCDNRes

@implementation PB3GetNobilityConfCDNRes

@dynamic ossURL;

typedef struct PB3GetNobilityConfCDNRes__storage_ {
  uint32_t _has_storage_[1];
  NSString *ossURL;
} PB3GetNobilityConfCDNRes__storage_;

 
 
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "ossURL",
        .dataTypeSpecific.className = NULL,
        .number = PB3GetNobilityConfCDNRes_FieldNumber_OssURL,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(PB3GetNobilityConfCDNRes__storage_, ossURL),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PB3GetNobilityConfCDNRes class]
                                     rootClass:[PB3NobilityExtRoot class]
                                          file:PB3NobilityExtRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PB3GetNobilityConfCDNRes__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\001\001\003\241!!\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif   
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

 
