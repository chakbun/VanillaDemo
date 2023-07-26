//
//  DYNeteaseToken.m
//  huhuAudio
//
//  Created by Easyin Wan on 2022/1/6.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import "DYNeteaseToken.h"
#import <ZygoteFoundation/NSObject+YYModel.h>

@implementation DYNeteaseToken

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

#pragma mark - NSCopying
- (instancetype)copyWithZone:(NSZone *)zone {
    DYNeteaseToken *model = [self yy_copyWithZone:zone];
    return model;
}

@end






