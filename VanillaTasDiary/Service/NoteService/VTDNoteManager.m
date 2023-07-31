//
//  VTDNoteManager.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/31.
//

#import "VTDNoteManager.h"
#import "UserExt.pbobjc.h"
#import "NetConfigModel.h"

@implementation VTDNoteManager

+ (instancetype)shared {
    static VTDNoteManager *_singleton = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _singleton = [[super allocWithZone:NULL] init];
    });
    return _singleton;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] shared];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return [[self class] shared];
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shared];
}

#pragma mark - Category
- (void)addNoteCategory:(VTDNoteCategoryModel *)model completion:(void(^ _Nullable )(NSError *))completion {
    PB3DiaryCategoryAddReq *req = [PB3DiaryCategoryAddReq message];
    req.categoryName = model.name;
    [ZYGService(IZYGNetworkService) sendRequestWithReq:req header:nil channelType:(ZYGChannelType_ShortConn) rspClass:[PB3DiaryCategoryAddRes class] ServiceName:kNetApiUserExtService functionName:@"DiaryCategoryAdd" completion:^(PB3DiaryCategoryAddRes *rsp, ZYGNetRequestError *error, ZYGNetRequestInfo *info) {
        DYLogInfo(@"addNoteCategory[DiaryCategoryAdd]rsp = %@,error = %@", rsp, error);
        
    }];
}

- (void)loadNoteCategoryWithCompletion:(void(^ _Nullable )(NSError *))completion {
    
}

- (void)deleteNoteCategoryWithID:(int64_t)cID completion:(void(^ _Nullable )(NSError *))completion {
    
}

#pragma mark - Note
- (void)addNoteWithCompletion:(void(^ _Nullable )(NSError *))completion {
    
}

- (void)loadNotesWithCategory:(int64_t)cID pageIndex:(int32_t)page  completion:(void(^ _Nullable )(NSError *))completion {
    
}

- (void)deleteNoteWithID:(int64_t)cID completion:(void(^ _Nullable )(NSError *))completion {
    
}

- (void)loadSharedNotesWithPage:(int32_t)page completion:(void(^ _Nullable )(NSError *))completion {
    
}

- (void)loadNoteInfoWithID:(int64_t)nID completion:(void(^ _Nullable )(NSError *))completion {
    
}

@end
