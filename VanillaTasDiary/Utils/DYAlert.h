#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "DYAlertHelper.h"
#import "DYAlertConfigModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYAlert: NSObject

/** 初始化 */
+ (nonnull DYAlertConfig *)alert;

/** 获取Alert窗口 */
+ (nonnull DYAlertWindow *)getAlertWindow;

/** 设置主窗口，必须设置 iOS13 UISecene */
+ (void)configMainWindow:(UIWindow *)window;

/** 继续队列显示 */
+ (void)continueQueueDisplay;

/** 清空队列 */
+ (void)clearQueue;

/** 队列是否为空 */
+ (BOOL)isQueueEmpty;

/**
 查询队列中是否包含某一标识
 
 @param identifier 标识
 */
+ (BOOL)containsQueueWithIdentifier:(NSString *)identifier;

/**
 关闭指定标识 

 @param identifier 标识
 @param completionBlock 关闭完成回调
 */
+ (void)closeWithIdentifier:(NSString *)identifier completionBlock:(void (^ _Nullable)(void))completionBlock;

/**
 关闭指定标识

 @param identifier 标识
 @param force 是否强制关闭
 @param completionBlock 关闭完成回调
 */
+ (void)closeWithIdentifier:(NSString *)identifier force:(BOOL)force completionBlock:(void (^ _Nullable)(void))completionBlock;

/**
 关闭当前

 @param completionBlock 关闭完成回调
 */
+ (void)closeWithCompletionBlock:(void (^ _Nullable)(void))completionBlock;

/**
 便捷构造
 
 @param title 标题，传nil或空字符则不创建
 @param content 内容，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithTitle:(NSString * _Nullable)title
               content:(NSString * _Nullable)content
          expectAction:(NSString * _Nullable)expectAction
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle;

/**
 便捷构造
 
 @param content 内容，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithContent:(NSString * _Nullable)content
            expectAction:(NSString * _Nullable)expectAction
      expectActionHandle:(void (^ _Nullable)(void))expectActionHandle;

/**
 便捷构造
 
 @param content 内容，传nil或空字符则不创建
 @param normalAction 普通按钮，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param normalActionHandle 普通按钮回调，可传nil
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithContent:(NSString * _Nullable)content
            normalAction:(NSString * _Nullable)normalAction
            expectAction:(NSString * _Nullable)expectAction
      normalActionHandle:(void (^ _Nullable)(void))normalActionHandle
      expectActionHandle:(void (^ _Nullable)(void))expectActionHandle;

/**
 便捷构造
 
 @param title 标题，传nil或空字符则不创建
 @param content 内容，传nil或空字符则不创建
 @param normalAction 普通按钮，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param normalActionHandle 普通按钮回调，可传nil
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithTitle:(NSString * _Nullable)title
               content:(NSString * _Nullable)content
          normalAction:(NSString * _Nullable)normalAction
          expectAction:(NSString * _Nullable)expectAction
    normalActionHandle:(void (^ _Nullable)(void))normalActionHandle
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle;

/**
 便捷构造
 
 @param title 标题，传nil或空字符则不创建
 @param content 内容，传nil或空字符则不创建
 @param identifier 标识，传nil或空字符则不创建
 @param normalAction 普通按钮，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param normalActionHandle 普通按钮回调，可传nil
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithTitle:(NSString * _Nullable)title
               content:(NSString * _Nullable)content
            identifier:(NSString * _Nullable)identifier
          normalAction:(NSString * _Nullable)normalAction
          expectAction:(NSString * _Nullable)expectAction
    normalActionHandle:(void (^ _Nullable)(void))normalActionHandle
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle;

/**
 便捷构造
 
 @param customView 自定义视图
 */
+ (void)alertWithCustomView:(UIView *)customView;

/**
 便捷构造
 
 @param customView 自定义视图
 @param isClickBackgroundClose 点击背景是否关闭弹框
 */
+ (void)alertWithCustomView:(UIView *)customView
     isClickBackgroundClose:(BOOL)isClickBackgroundClose;

/**
 便捷构造
 
 @param config 配置模型
 */
+ (void)alertWithConfig:(DYAlertConfigModel *)config;

@end

@interface DYAlertBaseConfigModel: NSObject

@end

@interface DYAlertItem: NSObject

/** item类型 */
@property (nonatomic, assign) DYAlertItemType type;

/** item间距范围 */
@property (nonatomic, assign) UIEdgeInsets insets;

/** item设置视图Block */
@property (nonatomic, copy) void (^block)(id view);

- (void)update;

@end

@interface DYAction: NSObject

/** action类型 */
@property (nonatomic, assign) DYActionType type;

/** action标题 */
@property (nonatomic, strong) NSString *title;

/** action高亮标题 */
@property (nonatomic, strong) NSString *highlight;

/** action标题(attributed) */
@property (nonatomic, strong) NSAttributedString *attributedTitle;

/** action高亮标题(attributed) */
@property (nonatomic, strong) NSAttributedString *attributedHighlight;

/** action标题行数 默认为: 1 */
@property (nonatomic, assign) NSInteger numberOfLines;

/** action标题对齐方式 默认为: NSTextAlignmentLeft */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/** action字体 */
@property (nonatomic, strong) UIFont *font;

/** action字体大小随宽度变化 默认为: NO */
@property (nonatomic, assign) BOOL adjustsFontSizeToFitWidth;

/** action断行模式 默认为: NSLineBreakByTruncatingMiddle */
@property (nonatomic, assign) NSLineBreakMode lineBreakMode;

/** action标题颜色 */
@property (nonatomic, strong) UIColor *titleColor;

/** action高亮标题颜色 */
@property (nonatomic, strong) UIColor *highlightColor;

/** action背景颜色 (与 backgroundImage 相同) */
@property (nonatomic, strong) UIColor *backgroundColor;

/** action高亮背景颜色 */
@property (nonatomic, strong) UIColor *backgroundHighlightColor;

/** action背景图片 (与 backgroundColor 相同) */
@property (nonatomic, strong) UIImage *backgroundImage;

/** action高亮背景图片 */
@property (nonatomic, strong) UIImage *backgroundHighlightImage;

/** action图片 */
@property (nonatomic, strong) UIImage *image;

/** action高亮图片 */
@property (nonatomic, strong) UIImage *highlightImage;

/** action间距范围 */
@property (nonatomic, assign) UIEdgeInsets insets;

/** action图片的间距范围 */
@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;

/** action标题的间距范围 */
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;

/** action圆角曲率 */
@property (nonatomic, assign) CGFloat cornerRadius;

/** action高度 */
@property (nonatomic, assign) CGFloat height;

/** action点击不关闭 (仅适用于默认类型) */
@property (nonatomic, assign) BOOL isClickNotClose;

/** action点击事件回调Block */
@property (nonatomic, copy) void (^ _Nullable clickBlock)(void);

- (void)update;

@end

@interface DYAlertCustomView: NSObject

/** 自定义视图对象 */
@property (nonatomic, strong, nullable) UIView *view;

/** 自定义视图位置类型 (默认为居中) */
@property (nonatomic, assign) DYAlertCustomViewPositionType positionType;

/** 是否自动适应宽度 (不支持 AutoLayout 布局的视图)*/
@property (nonatomic, assign) BOOL isAutoWidth;

@end

@interface DYAlertPresentation: NSObject

+ (DYAlertPresentation *)windowLevel: (UIWindowLevel)level;

+ (DYAlertPresentation *)viewController: (UIViewController *)controller;

@end

@interface DYAlertBaseConfig: NSObject

@property (nonatomic, strong, nonnull) DYAlertBaseConfigModel *config;

@end

@interface DYAlertConfig: DYAlertBaseConfig

@end

@interface DYAlertWindow: UIWindow @end

@interface DYAlertBaseViewController: UIViewController @end

@interface DYAlertViewController: DYAlertBaseViewController @end


@interface UIView (CornerRadii)

CornerRadii CornerRadiiMake(CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRight);

CornerRadii CornerRadiiZero(void);

CornerRadii CornerRadiiNull(void);

@end

NS_ASSUME_NONNULL_END
