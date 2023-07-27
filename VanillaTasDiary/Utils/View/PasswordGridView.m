//
//  PasswordGridView.m
//  huhuAudio
//
//  Created by 
//  Copyright © 2019 XYWL. All rights reserved.
//

#import "PasswordGridView.h"
#import <BlocksKit/UIView+BlocksKit.h>
#import <BlocksKit/UIGestureRecognizer+BlocksKit.h>
#import "Masonry.h"

static NSUInteger const kPasswordGridViewTag = 10000;

@interface PasswordGridView ()
<
UITextFieldDelegate
>

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray<UILabel *> *passwordGridViewList;
@property (nonatomic, copy) NSString *code;

@end

@implementation PasswordGridView

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setNeedResignFirstResponder:(BOOL)needResignFirstResponder
{
    _needResignFirstResponder = needResignFirstResponder;
    if (!_needResignFirstResponder) {
        [self.textField becomeFirstResponder];
    }
}

- (void)setup
{
    [self stackView];
    [self textField];
    
    _passwordGridViewList = [NSMutableArray array];
    if (_numberCount <= 0) _numberCount = 4;
    _gridBackgroundColor = [UIColor hx_colorWithHexString:@"#EBEBF7"];
    
    [self reloadView];
    
    @weakify(self);
    [self bk_whenTapped:^{
        @strongify(self);
        [self.textField becomeFirstResponder];
    }];
    UILongPressGestureRecognizer *longGes = [UILongPressGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        @strongify(self);
        if (UIGestureRecognizerStateBegan == state) {
            UIMenuController *menuController = [UIMenuController sharedMenuController];
            [menuController setTargetRect:self.bounds inView:self];
            [menuController setMenuVisible:YES animated:YES];
            [self becomeFirstResponder];
        }
    }];
    longGes.minimumPressDuration = 0.5;
    [self addGestureRecognizer:longGes];
}

- (void)textFieldChanged:(UITextField *)textField
{
    NSString *text = textField.text;
    if (text.length >= _numberCount) {
        [textField resignFirstResponder];
        text = [text substringToIndex:_numberCount];
    }
    [_passwordGridViewList enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (text.length <= idx) {
            obj.text = nil;
            return;
        }
        obj.text = [text substringWithRange:(NSRange){idx, 1}];
    }];
    
    if (text.length < _numberCount) {
        if ([self.delegate respondsToSelector:@selector(passwordGridView:didChangeWithCode:)]) {
            [self.delegate passwordGridView:self didChangeWithCode:text];
        }
        return;
    }
    
    if (text.length >= _numberCount) {
        if (self.code.length && [self.code isEqualToString:text]) {
            return;
        }
        self.code = text;
        if ([self.delegate respondsToSelector:@selector(passwordGridView:didFillfullWithCode:)]) {
            [self.delegate passwordGridView:self didFillfullWithCode:text];
        }
        return;
    }
}

- (void)setNumberCount:(int32_t)numberCount
{
    if (_numberCount == numberCount) return;
    if (numberCount <= 0) return;
    _numberCount = numberCount;
    
    [self reloadView];
}

- (void)setGridBackgroundColor:(UIColor *)color
{
    _gridBackgroundColor = color;
    
    [self reloadView];
}

- (void)setGridTextColor:(UIColor *)gridTextColor
{
    _gridTextColor = gridTextColor;
    
    [self reloadView];
}

- (void)setGridTextFont:(UIFont *)gridTextFont
{
    _gridTextFont = gridTextFont;
    
    [self reloadView];
}

- (void)clearInputText
{
    [_passwordGridViewList enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.text = @"";
    }];
    self.textField.text = @"";
}

- (void)prepareForInput {
    [self.textField becomeFirstResponder];
}

- (void)reloadView
{
    [_passwordGridViewList enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [_passwordGridViewList removeAllObjects];
    
    for (int32_t i = 0; i < _numberCount; ++i) {
        UILabel *label = [self passwordGridView];
        label.layer.cornerRadius = 8.f;
        label.tag = kPasswordGridViewTag + i;
        
        [_stackView addArrangedSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(45);
            make.height.mas_equalTo(45);
        }];
        [_passwordGridViewList addObject:label];
    }
}

+ (BOOL)isNumText:(NSString *)str {
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (!string.length) {
        return YES;
    }
    if (textField.text.length >= _numberCount && string.length) {
        return NO;
    }
    return [PasswordGridView isNumText:string];
}

#pragma mark - UIMenuController
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(select:) ||
        action == @selector(selectAll:)) {
        return NO;
    }
    if ((action == @selector(copy:) && self.textField.text.length)      //需要有文字才能支持复制
        || (action == @selector(cut:) && self.textField.text.length)    //需要有文字才能支持剪切
        || action == @selector(paste:)) {
        return YES;
    }
    return NO;
}

- (void)cut:(UIMenuController *)menu
{
    [UIPasteboard generalPasteboard].string = self.textField.text;
    self.textField.text = nil;
    [self textFieldChanged:self.textField];
}

- (void)copy:(UIMenuController *)menu
{
    [UIPasteboard generalPasteboard].string = self.textField.text;
}

- (void)paste:(UIMenuController *)menu
{
    __block NSString *originalText = self.textField.text;
    if (originalText.length >= _numberCount) return;
    
    NSString *string = [UIPasteboard generalPasteboard].string;
    if (!string.length) return;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        //只复制数字
        if ([PasswordGridView isNumText:substring]) {
            originalText = [originalText stringByAppendingString:substring];
            if (originalText.length >= _numberCount) {
                *stop = YES;
            }
        }
    }];
    
    self.textField.text = originalText;
    [self textFieldChanged:self.textField];
}

#pragma mark - Lazy loads
- (UIStackView *)stackView
{
    if (!_stackView) {
        UIStackView *stackView = [[UIStackView alloc] init];
        stackView.backgroundColor = [UIColor clearColor];
        stackView.alignment = UIStackViewAlignmentFill;
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.spacing = 6.f;
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:stackView];
        [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        _stackView = stackView;
    }
    return _stackView;
}

- (UITextField *)textField
{
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.delegate = self;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self
                      action:@selector(textFieldChanged:)
            forControlEvents:UIControlEventEditingChanged];
        textField.hidden = YES;
        [self addSubview:textField];
        
        _textField = textField;
    }
    
    return _textField;
}

- (UILabel *)passwordGridView
{
    UILabel *label = [[UILabel alloc] init];
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = [UIColor blackColor].CGColor;
    lineLayer.frame = CGRectMake(0, label.frame.size.height, label.frame.size.width,1.0);
    [lineLayer setMasksToBounds:YES];

    lineLayer.cornerRadius = 8;
    label.layer.cornerRadius = 8;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = self.gridTextFont ?: [UIFont boldSystemFontOfSize:16.f];
    label.backgroundColor = self.gridBackgroundColor ?: [UIColor clearColor];
    label.textColor = self.gridTextColor ?: [UIColor blackColor];
    label.lineBreakMode = NSLineBreakByClipping;
    [label.layer addSublayer:lineLayer];
    return label;
}

@end
