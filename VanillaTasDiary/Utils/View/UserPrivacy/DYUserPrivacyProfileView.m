//
//  UserPrivacyProfileView.m
//  MZAudio
//
//  Created by 
//  Copyright © 2019 XYWL. All rights reserved.
//

#import "DYUserPrivacyProfileView.h"

#import <NSAttributedString+YYText.h>
#import "ILoginProtocol.h"
#import <YYLabel.h>
#import <ZygoteCategories/UIView+DY.h>
#import "Masonry.h"
//#import "DYWindowPopHelper+Convenience.h"
#import "UIImage+Ext.h"
#import <ZygoteCategories/UIImage+YYAdd.h>

#define DYUserPrivacyViewContentMaxHeight SCREEN_HEIGHT - ScaleHeight(180)

static NSString * const kDYUserPrivacyProfileViewAgreeBtnLayerName = @"kDYUserPrivacyProfileViewAgreeBtnLayerName";

@interface DYUserPrivacyProfileView ()<UITextViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView  *bgView;
@property (nonatomic, copy) privacyBlock scanBlock;
@property (nonatomic, copy) privacyBlock agreeBlock;
@property (nonatomic, copy) privacyViewBlock linkBlock;

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, strong) UIScrollView *scrollView;

/**内容textView*/
@property (nonatomic, strong) YYLabel  *textLabel;

@end
@implementation DYUserPrivacyProfileView

- (instancetype)initWithLinkBlock:(privacyViewBlock)linkBlock scanBlock:(privacyBlock)scanBlock agreeBlock:(privacyBlock)agreeBlock
{
    self = [super init];
    if (self) {
        self.linkBlock = linkBlock;
        self.scanBlock = scanBlock;
        self.agreeBlock = agreeBlock;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    CGFloat textH = SCREEN_HEIGHT * 0.45;
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH - 2 * 32, 425);
    self.center = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0);
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.cornerRadius = 16;
    self.clipsToBounds = YES;
    
    NSString *appDisplayName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    NSString *appName = appDisplayName;
    NSDictionary *appUserRule = [ZYGService(ILoginService) appUserRule];
    NSString *appUserRules = [appUserRule objectForKey:kLoginServiceUserRuleTitleKey];
    NSDictionary *appPrivacyRule = [ZYGService(ILoginService) appPrivacyRule];
    NSString *appPrivacyRules = [appPrivacyRule objectForKey:kLoginServiceUserRuleTitleKey];
    NSDictionary *appChildRule = [ZYGService(ILoginService) appChildrenRule];
    NSString *appChild = [appChildRule objectForKey:kLoginServiceUserRuleTitleKey];
    NSDictionary *thirdPartyInfo= [ZYGService(ILoginService) thirdPartyInfo];
    NSString *thirdPartyTitle = [thirdPartyInfo objectForKey:kLoginServiceUserRuleTitleKey];
    
    NSString *contentStr = [NSString stringWithFormat: @"欢迎您使用%@！我们将通过%@和%@帮助您了解我们所提供的服务，以及我们收集和处理您个人信息的情况，并告知您所享有的相关权利。\r\n 为向您提供更加安全、便捷的服务，%@将在您使用相关功能时申请有关设备权限，您可以通过【我的】-【设置】图标-【隐私设置】查询并选择是否授权我们收集这些信息。\r\n 如果您是18岁以下的未成年人，在使用我们的服务前您应在监护人的陪同下阅读《用户协议》和《隐私政策》，在征得您的监护人同意后，采用青少年模式使用我们的服务并向我们提供您的信息。如果您是14岁以下的未成年人，您需要和您的监护人一起仔细阅读%@，并征得您的监护人同意后，采用青少年模式使用我们的服务并向我们提供您的信息。\r\n 未经您的授权，我们不会主动向任何第三方共享您的个人信息。您可以通过仔细阅读《隐私政策》的相关内容，了解我们接入%@的情况。\r\n 请您务必在使用本软件前仔细阅读上述法律文件，点击“同意”即表示您和/或您的监护人已阅读并同意全部条款", appName, appUserRules, appPrivacyRules, appName, appChild,thirdPartyTitle];
    
    //头部title
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:IS_IPHONE_HEIGHT_568?16.f:18.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"用户协议和隐私政策";
    titleLabel.textColor = [UIColor hx_colorWithHexString:@"#171717"];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(28);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(200);
    }];
    
    UIColor *textColor = [UIColor hx_colorWithHexString:@"#515151"];
    
    NSMutableAttributedString *attributedContentString = [[NSMutableAttributedString alloc] initWithString:contentStr attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:IS_IPHONE_HEIGHT_568?12.f:14.f],NSForegroundColorAttributeName:textColor}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    
    //调整行间距
    [attributedContentString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [contentStr length])];
     @weakify(self);
    {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:appUserRules options:NSRegularExpressionIgnoreMetacharacters error:nil];
        NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:contentStr options:NSMatchingReportProgress range:NSMakeRange(0, contentStr.length)];
        for (NSTextCheckingResult *result in matches) {
            if (NSNotFound != result.range.location) {
                [attributedContentString yy_setTextHighlightRange:result.range
                                                            color:[UIColor hx_colorWithHexString:@"#FF8F20"]
                                                  backgroundColor:nil
                                                         userInfo:nil
                                                        tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    @strongify(self);
                    [self handleTapProtocolWithTitle:appUserRules urlString:[appUserRule objectForKey:kLoginServiceUserRuleUrlKey]];
                } longPressAction:nil];
            }
        }
    }
    {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:appPrivacyRules options:NSRegularExpressionIgnoreMetacharacters error:nil];
        NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:contentStr options:NSMatchingReportProgress range:NSMakeRange(0, contentStr.length)];
        for (NSTextCheckingResult *result in matches) {
            if (NSNotFound != result.range.location) {
                [attributedContentString yy_setTextHighlightRange:result.range
                                                            color:[UIColor hx_colorWithHexString:@"#FF8F20"]
                                                  backgroundColor:nil
                                                         userInfo:nil
                                                        tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                    @strongify(self);
                    [self handleTapProtocolWithTitle:appPrivacyRules urlString:[appPrivacyRule objectForKey:kLoginServiceUserRuleUrlKey]];
                } longPressAction:nil];
            }
        }
    }
    {
        NSRange range = [contentStr rangeOfString:appChild];
        if (NSNotFound != range.location) {
            [attributedContentString yy_setTextHighlightRange:range
                                                        color:[UIColor hx_colorWithHexString:@"#FF8F20"]
                                              backgroundColor:nil
                                                     userInfo:nil
                                                    tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                @strongify(self);
                [self handleTapProtocolWithTitle:appChild urlString:[appChildRule objectForKey:kLoginServiceUserRuleUrlKey]];
            } longPressAction:nil];
        }
    }
    {
        NSRange range = [contentStr rangeOfString:thirdPartyTitle];
        if (NSNotFound != range.location) {
            [attributedContentString yy_setTextHighlightRange:range
                                                        color:[UIColor hx_colorWithHexString:@"#FF8F20"]
                                              backgroundColor:nil
                                                     userInfo:nil
                                                    tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                @strongify(self);
                [self handleTapProtocolWithTitle:thirdPartyTitle urlString:[thirdPartyInfo objectForKey:kLoginServiceUserRuleUrlKey]];
            } longPressAction:nil];
        }
    }
    
    if (!self.scrollView) {
        self.scrollView = UIScrollView.new;
    }
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(12);
        make.right.mas_equalTo(self).offset(-20);
        make.left.mas_equalTo(self).offset(20);
        make.bottom.mas_equalTo(self).mas_offset(-100);
    }];
    
    //文字描述
    YYLabel *textLabel = [[YYLabel alloc] init];
    //textView.font            = [UIFont systemFontOfSize:15.0f];
    //textView.textColor       = DYSkinColor(DYSkinColorType_COLOR_T3);
    textLabel.textContainerInset = UIEdgeInsetsZero;
    textLabel.attributedText = attributedContentString;
    textLabel.numberOfLines = 0;
    //textView.editable = NO;
    self.textLabel = textLabel;
    [self.scrollView addSubview:textLabel];
    
    //刷新frame
    CGSize textSize = [contentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 2 * 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:IS_IPHONE_HEIGHT_568?12.f:14.f] ,NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    textH = textSize.height;

    
    //更新frame
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH - 2 * 32, 425);
    self.center = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0);
    
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
        make.width.mas_equalTo(self.scrollView);
        make.height.mas_equalTo(@(textH + 20));
    }];
    

    CGFloat width = 132;
    CGFloat height = 65.f;
    
    UIButton *scanBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
    scanBtn.bounds = (CGRect){0.f, 0.f, width, height};
    [scanBtn setTitleColor:[UIColor hx_colorWithHexString:@"#515151"] forState:UIControlStateNormal];
    scanBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [scanBtn addTarget:self action:@selector(scanBtnAction) forControlEvents:UIControlEventTouchUpInside];
    //[scanBtn setTitle:@"仅浏览" forState:UIControlStateNormal];
    [scanBtn setTitle:@"不同意" forState:UIControlStateNormal];
    self.scanBtn = scanBtn;

    height = 50.f;
    [scanBtn setBackgroundImage:[UIImage imageWithColor:[UIColor hx_colorWithHexString:@"#F4F4FB"]] forState:UIControlStateNormal];
    [scanBtn setBackgroundImage:[UIImage imageWithColor:[UIColor hx_colorWithHexString:@"#F4F4FB"]] forState:UIControlStateHighlighted];
    [self addSubview:scanBtn];
    [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.height.mas_offset(height);
        make.right.equalTo(self.mas_centerX).offset(-5);
        make.bottom.mas_equalTo(-20);
    }];

    scanBtn.layer.cornerRadius = height * 0.5f;
    scanBtn.layer.masksToBounds = YES;
    
    UIButton *agreeBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
    agreeBtn.bounds = (CGRect){0.f, 0.f, width, height};
    [agreeBtn setTitleColor:[UIColor hx_colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    agreeBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [agreeBtn addTarget:self action:@selector(agreeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [agreeBtn setTitle:@"同意" forState:UIControlStateNormal];
#if !ENABLE_ALIAS
    height = 50.f;
    [agreeBtn setBackgroundImage:[UIImage imageWithColor:[UIColor hx_colorWithHexString:@"#FF8F20"]] forState:UIControlStateNormal];
    [agreeBtn setBackgroundImage:[UIImage imageWithColor:[UIColor hx_colorWithHexString:@"#FF8F20"]] forState:UIControlStateHighlighted];
    [self addSubview:agreeBtn];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-20);
        make.height.mas_offset(height);
        make.left.equalTo(self.mas_centerX).offset(5);
        make.bottom.equalTo(scanBtn.mas_bottom);
    }];
#else
    [agreeBtn setBackgroundImage:[UIImage resizableImageWithName:kDYAliasImage(@"btn_big_operation")] forState:UIControlStateNormal];
    [agreeBtn setBackgroundImage:[UIImage resizableImageWithName:kDYAliasImage(@"btn_big_operation")] forState:UIControlStateHighlighted];
    [self addSubview:agreeBtn];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-15);
        make.height.mas_offset(height);
        make.width.mas_equalTo(width);
        make.centerY.mas_equalTo(scanBtn);
    }];
#endif
    
    self.agreeBtn = agreeBtn;
    agreeBtn.layer.cornerRadius = height * 0.5f;
    agreeBtn.layer.masksToBounds = YES;
}

- (void)show
{
    [self showWithViewController:nil];
}

- (void)showWithViewController:(UIViewController *)viewController;
{
    // 大背景
    self.bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];;
    [_bgView addSubview:self];
//    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgViewHandle)];
//    tap.delegate = self;
//    [_bgView addGestureRecognizer:tap];
    
    if (viewController) {
        [viewController.view addSubview:_bgView];
        
        self.viewController = viewController;
    }
    else {
        [[[[UIApplication sharedApplication] delegate] window] addSubview:_bgView];
    }
}

- (void)tapBgViewHandle
{
    [self hide];
}

- (void)setHideState:(BOOL)state
{
    _bgView.hidden = state;
}

//隐藏弹窗
- (void)hide
{
    if (_bgView) {
        [_bgView removeFromSuperview];
        _bgView = nil;
    }
}

- (void)scanBtnAction
{
    !self.scanBlock ?: self.scanBlock(self);
    if (!self.isHiddenOnClickCancel) return;
    [self hide];
}

- (void)agreeBtnAction
{
    !self.agreeBlock ?: self.agreeBlock(self);
    [self hide];
}

//- (BOOL)textView:(UITextView*)textView shouldInteractWithURL:(NSURL*)URL inRange:(NSRange)characterRange
//{
//    if ([URL.absoluteString containsString:@"privacy"]) {
//        //这里调用方法跳到隐私政策页面
//        !self.linkBlock ?: self.linkBlock(self);
//        [self hide];
//        return NO;
//    }else{
//        return YES;
//    }
//}

//用户协议
- (void)handleTapProtocolWithTitle:(NSString *)title urlString:(NSString *)urlString
{
    //这里调用方法跳到隐私政策页面
    !self.linkBlock ?: self.linkBlock(self.viewController, self, title, urlString);
    [self hide];
    
    //[self getWeb:urlString title:title];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[self class]]) {
        return NO;
    }
    return YES;
}

@end
