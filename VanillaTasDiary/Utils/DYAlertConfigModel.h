//
//  DYAlertConfigModel.h
//  huhuAudio
//
//  Created by zhanlong on 2021/10/12.
//  Copyright © 2021 XYWL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DYAlertActionHandler)(void);

typedef NS_ENUM(NSUInteger, kDYAlertConfigShowType) {
    kDYAlertConfigShowCustom = 0,   // 使用自定义样式
    kDYAlertConfigShowSystem,       // 使用系统样式
};

typedef NS_ENUM(NSUInteger, kDYAlertActionStyle) {
    kDYAlertActionStyleNormal = 0,  // 使用自定义普通按钮样式/系统普通样式
    kDYAlertActionStyleExpect,      // 使用自定义期望按钮样式/系统取消样式
};

typedef NS_ENUM(NSUInteger, kDYAlertType) {
    kDYAlertTypeNormal = 0,     // 使用普通样式
    kDYAlertTypeTextView,       // 使用文本输入框样式
};

@interface DYAlertAction : NSObject <NSCopying>

@property (nonatomic, copy, readonly, nullable) NSString *title;

@property (nonatomic, copy, readonly, nullable) NSAttributedString *attributeTitle;

@property (nonatomic, assign, readonly) kDYAlertActionStyle style;

@property (nonatomic, copy, readonly) DYAlertActionHandler handler;

+ (instancetype)actionWithTitle:(nullable NSString *)title
                          style:(kDYAlertActionStyle)style
                        handler:(DYAlertActionHandler)handler;

/// 只支持自定义按钮样式
+ (instancetype)actionWithAttributeTitle:(nullable NSAttributedString *)attributeTitle
                                   style:(kDYAlertActionStyle)style
                                 handler:(DYAlertActionHandler)handler;
 
@end

@interface DYAlertConfigModel : NSObject

/** 展示样式，默认使用自定义样式  */
@property (nonatomic, assign) kDYAlertConfigShowType showType;
/** Alert样式，默认使用普通样式  */
@property (nonatomic, assign) kDYAlertType alertType;
/** 标题，可传nil */
@property (nonatomic, copy) NSString *title;
/** 内容，可传nil */
@property (nonatomic, copy) NSString *content;
/** 期望按钮，可传nil */
@property (nonatomic, strong) DYAlertAction *expectAction;
/** 普通按钮，可传nil */
@property (nonatomic, strong) DYAlertAction *normalAction;

#pragma mark - 以下属性只有在自定义样式下才生效
/** 富文本标题，可传nil ，富文本标题会覆盖普通标题*/
@property (nonatomic, copy) NSAttributedString *attributeTitle;
/** 富文本内容，可传nil ，富文本内容会覆盖普通内容*/
@property (nonatomic, copy) NSAttributedString *attributeContent;
/** 富文本标题文本对齐方式， 默认左对齐 */
@property (nonatomic, assign) NSTextAlignment titleAlignment;
/** 富文本内容文本对齐方式， 默认左对齐*/
@property (nonatomic, assign) NSTextAlignment contentAlignment;
/** 弹框标识，可传nil */
@property (nonatomic, copy) NSString *identifier;
/** 自定义view，在标题和内容之间展示，也可以独立展示，支持 Masonry 布局 */
@property (nonatomic, strong) UIView *customView;
/** 点击背景关闭回调 */
@property (nonatomic, copy) dispatch_block_t closeCompleteBlock;
/** 点击背景是否关闭，默认点击背景不关闭 */
@property (nonatomic, assign) BOOL isClickBackgroundClose;

#pragma mark - TextView专用属性，当为 kDYAlertTypeTextView 类型时生效，会覆盖 customView 属性
/** 占位文本，默认文本为 nil */
@property (nonatomic, copy) NSString *textViewPlaceholder;
/** 文本内容，默认nil */
@property (nonatomic, copy) NSString *textViewDefaultText;
/** 文本输入框最新输入内容，默认nil */
@property (nonatomic, copy) NSString *textViewCurrentText;
/** 最大显示行数，默认 2 行 */
@property (nonatomic, assign) NSInteger textViewShowLineNum;
/** 最大输入个数，默认 20 个字 */
@property (nonatomic, assign) NSInteger textViewMaxInputNum;
/** 是否弹出键盘，默认不弹出 */
@property (nonatomic, assign) BOOL textViewIsPopKeyboard;

#pragma mark - 以下属性只有在系统样式下才生效
/** 多 actions */
@property (nonatomic, copy) NSArray<DYAlertAction *> *actions;

@end

