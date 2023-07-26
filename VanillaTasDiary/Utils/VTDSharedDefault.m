//
//  VTDSharedDefault.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/26.
//

#import "VTDSharedDefault.h"

static NSString *kAppFirstLaunch = @"kAppFirstLaunch";

@implementation VTDSharedDefault

+ (instancetype)shared {
    static VTDSharedDefault *_singleton = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        [NSUserDefaults.standardUserDefaults registerDefaults:@{
            kAppFirstLaunch: @YES,
        }];
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

- (BOOL)isAppFirstLaunch {
    return [[NSUserDefaults.standardUserDefaults valueForKey:kAppFirstLaunch] boolValue];
}

- (void)setAppFirstLaunch:(BOOL)appFirstLaunch {
    [NSUserDefaults.standardUserDefaults setValue:@(appFirstLaunch) forKey:kAppFirstLaunch];
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (NSString *)languageCode {
    NSString *lanCode = @"zh-Hans";
    return lanCode;
}

@end
