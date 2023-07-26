//
//  VTDSharedDefault.h
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VTDSharedDefault : NSObject

+ (instancetype)shared;

@property (nonatomic, assign, getter=isAppFirstLaunch) BOOL appFirstLaunch;

- (NSString *)languageCode;

@end

NS_ASSUME_NONNULL_END
