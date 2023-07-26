//
//  DYNeteaseToken.h
//  huhuAudio
//
//  Created by Easyin Wan on 2022/1/6.
//  Copyright © 2022 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYNeteaseToken : NSObject
<
NSCoding,
NSCopying
>

@property (nonatomic, assign) int64_t playerId;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, assign) int64_t expiredTime;

@end
