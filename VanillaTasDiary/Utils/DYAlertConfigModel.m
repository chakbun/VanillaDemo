//
//  DYAlertConfigModel.m
//  huhuAudio
//
//  Created by zhanlong on 2021/10/12.
//  Copyright © 2021 XYWL. All rights reserved.
//

#import "DYAlertConfigModel.h"
#import <ZygoteFoundation/YYModel.h>
#import <ZygoteFoundation/NSObject+YYModel.h>

@interface DYAlertAction ()

@property (nonatomic, copy, readwrite, nullable) NSString *title;

@property (nonatomic, copy, readwrite, nullable) NSAttributedString *attributeTitle;

@property (nonatomic, assign, readwrite) kDYAlertActionStyle style;

@property (nonatomic, copy, readwrite) DYAlertActionHandler handler;

@end

@implementation DYAlertAction

+ (instancetype)actionWithTitle:(nullable NSString *)title
                          style:(kDYAlertActionStyle)style
                        handler:(DYAlertActionHandler)handler {
    
    DYAlertAction *alertAction = [[DYAlertAction alloc] init];
    alertAction.title = title;
    alertAction.style = style;
    alertAction.handler = handler;
    return alertAction;
}

+ (instancetype)actionWithAttributeTitle:(nullable NSAttributedString *)attributeTitle
                                   style:(kDYAlertActionStyle)style
                                 handler:(DYAlertActionHandler)handler {
    DYAlertAction *alertAction = [[DYAlertAction alloc] init];
    alertAction.attributeTitle = attributeTitle;
    alertAction.style = style;
    alertAction.handler = handler;
    return alertAction;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    DYAlertAction *model = [self yy_copyWithZone:zone];
    return model;
}

- (NSString *)description {
    return [self yy_modelToJSONString];
}

- (NSString *)debugDescription {
    return [self yy_modelToJSONString];
}

@end

@implementation DYAlertConfigModel

@end
