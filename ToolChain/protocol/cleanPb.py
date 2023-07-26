import os
import re
import sys

def remove_proto_two_unused_pre_action(text):

    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)

def remove_proto_two_unused_message_enum(text):
    text = remove_proto_two_unused_pre_action(text)
    
    keywords = [" PlayerInfo ", "HSC000000",
                "HSC00002A", "HSC000032",
                "HSC000033", "HSC000051",
                "HSC000052", "HSC000055",
                "UserDefined", "HSC000056",
                "FriendList", "PrivateMessageList",
                "PrivateMessageRecordList", "HSC000220",
                "OnOffStatus", "OnOffStatusList",
                "TaskRoomInfo", "UserSetting",
                "UserShortInfo", "RankInfo",
                "RoomMemberInfo",
                "RoomMemberInfoList", "HCS100004",
                "HSC100222", "HSC100240",
                "NoticeList",
                "HSC100351", "HSC100351",
                "AgentInfo", "HSC100360",
                "ChargeInfo", "HCS100361",
                "HSC100361",
                "HCS010009", "SCS000000",
                "SSC000000", "SSC000004",
                "SSC00000A", "SSC000006",
                "SSC000007", "SCS000010",
                "SSC000010", "SSC000014",
                "SSC000060", "SSC000070",
                "SSC000080", "SCS000113",
                "SCS000114", "SSC000114",
                "SSC000115", "ChatChannel",
                "SSC000118", "SCS000119",
                "PrivateMessageRecordType", "SSC000201",
                "SSC000204", "PrivateMessageRecord",
                "SSC000251", "IntimateFriend",
                "IntimateFriendList", "SSC000262",
                "SSC000264", "SSC000265",
                "SSC000271", "SCS000336",
                "ReceiveGift", "CrackEggRecord",

                "SCS000337", "SSC00033C",
                "GiftItem", "SSC000350",
                "SCS000356", "VoteVO",
                "SCS000358", "Vote",
                "SCS000360", "OnlineFlower",
                "SSC000702", "SSC000721",
                "SCS001006", "ScenePlayer",
                "ScenePlayerList", "SCS100000",
                "SSC100000", "SSC100001",
                "SCS100003", "SCS100028",
                "SSC100028", "SCS100040",
                "SSC100040", "SSC100041",
                "SSC100042", "SSC100048",
                "SCS100050", "SSC100052",
                "ChairStatus", "SSC100100",
                "SCS100130", "SSC100144",
                "DrawMoneyType", "Chair", 
                "AccountFlags",
                "MoneyType",                
                "LongList",
                "IntegerList", "StringList",
                "IntInt",
                "LongLong","Account",
                "Money",
                "PlayerList",
                "LongScene", "LongSceneInt",
                "LongSceneString", "LongSceneLong",
                "SceneString", "RoomMember",
                "RoomMemberList", "GiftInfo",

                "SceneIdList",
                "Certif",
                "CertifList", "CallMakeDeal",
                "IndexEntry", "IndexList",
                "SearchPlayerList", "RecommendPlayerEntry",
                "RecommendPlayerList", "OnlineStatus",
                "PlayerStatus", "PlayerStatusList",
                "DateRoomMatch", "TipOffsVO",
                "TjKeyWordRoomEntry",                
                " Room ", " Friend ", "UserInfo",

                "LongString",
                "LongIntString", "IntIntString",
                "LongStringList", "IntStringList",
                "LongIntList", "LongLongList",

                "IntIntList", "Double2",
                "DoubleList", "ByteList",

                " Player ", "RoomAdminType", "CertifType", "RoomType", 
                "LongVO",
                "StringVO",
                "RoomPattern",
                " Language ",
                " FriendType ",
                " DeviceType ",
                " WeekStar ",
                " HCS010000 ",
                " HCS010004 ",
                " HCS010002 ",
                " OnOffType ",
                #"HSC010001",
                ]
                
    old_proto_keyword = "syntax = \"proto2\";"
    if text.find(old_proto_keyword) == -1:
        return text
    else:
        i = 0
        while i < len(keywords):
            #print(keywords[i])
            text = re.sub(r"enum.*" + keywords[i] + "([\s\S]*?)\}", '', text)
            text = re.sub(r"message.*" + keywords[i] + "([\s\S]*?)\}", '', text)            
            i+=1
        return text

def remove_proto_two_unused_import_statement(text):
    keywords = ["import \"client/socket0001.proto\";"]
    i = 0
    while i < len(keywords):
        #print(keywords[i])
        text = re.sub(keywords[i], '', text)
        i+=1
    return text

def remove_hole_message(text):
    keywords = ["WithdrawDiamandReq", "WithdrawDiamandRes", 
                "RoomChangeCoinReq", "RoomChangeCoinRes", 
                "SettingPasswdReq", "SettingPasswdRes",
                "DiamondChangCoinReq", "DiamondChangCoinRes",
                "Diamond", "BindBank", "Withdrawal",
                "ChongZhi", "PayChannel", "GetPlayerPayReq", "WithdrawProtocol", "WithdrawNotice",
                "ChargeExtraData", "WithdrawCheckReq", "WithdrawCheckRes", "WithdrawType",
                 "ReplaceWithdraw", "WithdrawRemain", "WithdrawAssetsType"] 
    i = 0
    while i < len(keywords):
        #print(keywords[i])
        text = re.sub(r"message.*" + keywords[i] + "([\s\S]*?)\}", '', text)
        text = re.sub(r"rpc.*" + keywords[i] + "([\s\S]*?);", "", text)
        text = re.sub(r"enum.*" + keywords[i] + "([\s\S]*?)\}", '', text)
        i+=1
    return text

def remove_hole_line(text):
    keywords = ["ANDROID_PHONE", "ANDROID", 
                "WORLDCUP_DIAMOND", "GOOGLE_PAY", 
                "IAP_PAY", "IOS_CERTIF", "IOS_CRETIF", 
                "payment_url", "WithdrawType", "withdraw", "Withdraw", 
                "Diamond", "Alipay", "AliPay", "BindBank","BIND_BANK", "PayChannel"]
    i = 0
    while i < len(keywords):
        #print(keywords[i])
        text = re.sub(r".*" + keywords[i] + ".*", '', text)
        i+=1
    return text

def remove_comments(text):
    argList = sys.argv
    argLen = len(sys.argv)
    if argLen >= 2 and argList[1] == "Release":
        def replacer(match):
            s = match.group(0)
            if s.startswith('/'):
                return " " # note: a space and not an empty string
            else:
                return s
        pattern = re.compile(
            r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
            re.DOTALL | re.MULTILINE
        )
        return re.sub(pattern, replacer, text)
    else:
        return text    

if __name__ == '__main__':
    for root, dirs, files in os.walk("./pb/"):
        for filename in files:
            if filename.endswith('.proto'):
                filename = os.path.join(root, filename)
                code_original = open(filename).read()
                code_new = remove_hole_message(code_original)
                code_new = remove_hole_line(code_new)
                code_new = remove_comments(code_new)
                
                fh = open(filename, "w")
                fh.write(code_new)
                fh.close()

    for root, dirs, files in os.walk("./client/"):
        for filename in files:
            if filename.endswith('.proto'):
                filename = os.path.join(root, filename)
                code_original = open(filename).read()

                code_new = code_original;
                code_new = remove_proto_two_unused_message_enum(code_new)
                code_new = remove_proto_two_unused_import_statement(code_new)
                code_new = remove_hole_message(code_new)

                code_new = remove_hole_line(code_new)
                code_new = remove_comments(code_new)
                
                fh = open(filename, "w")
                fh.write(code_new)
                fh.close()

    for root, dirs, files in os.walk("./plugin_pb/"):
        for filename in files:
            if filename.endswith('.proto'):
                filename = os.path.join(root, filename)
                code_original = open(filename).read()
                code_new = remove_hole_message(code_original)
                code_new = remove_hole_line(code_new)
                code_new = remove_comments(code_new)
                fh = open(filename, "w")
                fh.write(code_new)
                fh.close()
    
    for root, dirs, files in os.walk("./auth_pb/"):
        for filename in files:
            if filename.endswith('.proto'):
                filename = os.path.join(root, filename)
                code_original = open(filename).read()
                code_new = remove_hole_message(code_original)
                code_new = remove_hole_line(code_new)
                code_new = remove_comments(code_new)
                fh = open(filename, "w")
                fh.write(code_new)
                fh.close()
