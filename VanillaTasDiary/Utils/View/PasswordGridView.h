//
//  PasswordGridView.h
//  huhuAudio
//
//  Created by 
//  Copyright © 2019 XYWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PasswordGridView;
@protocol PasswordGridViewDelegate <NSObject>

- (void)passwordGridView:(UIView *)passwordGridView didChangeWithCode:(NSString *)code;

- (void)passwordGridView:(UIView *)passwordGridView didFillfullWithCode:(NSString *)code;

@end

@interface PasswordGridView : UIView

@property (nonatomic, weak) id<PasswordGridViewDelegate> delegate;

@property (nonatomic, assign) int32_t numberCount;
@property (nonatomic, strong) UIColor *gridBackgroundColor;
@property (nonatomic, strong) UIColor *gridTextColor;
@property (nonatomic, strong) UIFont *gridTextFont;
@property (nonatomic, assign) BOOL needResignFirstResponder;

- (void)clearInputText;
- (void)prepareForInput;
@end

