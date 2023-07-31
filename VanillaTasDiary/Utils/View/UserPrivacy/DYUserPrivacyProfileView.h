//
//  UserPrivacyProfileView.h
//  MZAudio
//
//  Created by 
//  Copyright © 2019 XYWL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^privacyBlock)(UIView *view);

typedef void(^privacyViewBlock)(UIViewController *viewController, id obj, NSString *title, NSString *urlStr);

@interface DYUserPrivacyProfileView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextView  *linkTextView;

@property (nonatomic, strong) UIButton *scanBtn;

@property (nonatomic, strong) UIButton *agreeBtn;

@property (nonatomic, assign) BOOL isHiddenOnClickCancel;


- (instancetype)initWithLinkBlock:(privacyViewBlock)linkBlock scanBlock:(privacyBlock)scanBlock agreeBlock:(privacyBlock)agreeBlock;

- (void)showWithViewController:(UIViewController *)viewController;

- (void)setHideState:(BOOL)state;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
