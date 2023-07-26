#import "DYAlert.h"

#import <Accelerate/Accelerate.h>

#import <objc/runtime.h>

#import <ZygoteFoundation/AppUtils.h>


#define VIEW_WIDTH CGRectGetWidth(self.view.frame)
#define VIEW_HEIGHT CGRectGetHeight(self.view.frame)
#define VIEWSAFEAREAINSETS(view) ({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = view.safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;})

#pragma mark - ===================配置模型===================

typedef NS_ENUM(NSInteger, DYBackgroundStyle) {
    /** 背景样式 模糊 */
    DYBackgroundStyleBlur,
    /** 背景样式 半透明 */
    DYBackgroundStyleTranslucent,
};

@interface DYAlertBaseConfigModel ()

@property (nonatomic, strong) NSMutableArray *modelActionArray;
@property (nonatomic, strong) NSMutableArray *modelItemArray;
@property (nonatomic, strong) NSMutableDictionary *modelItemInsetsInfo;

@property (nonatomic, assign) CGFloat modelOpenAnimationDuration;
@property (nonatomic, assign) CGFloat modelCloseAnimationDuration;
@property (nonatomic, assign) CGFloat modelBackgroundStyleColorAlpha;
@property (nonatomic, assign) NSInteger modelQueuePriority;

@property (nonatomic, strong) UIColor *modelHeaderColor;
@property (nonatomic, strong) UIColor *modelBackgroundColor;

@property (nonatomic, assign) BOOL modelIsClickBackgroundClose;
@property (nonatomic, assign) BOOL modelIsQueue;
@property (nonatomic, assign) BOOL modelIsContinueQueueDisplay;
@property (nonatomic, assign) BOOL modelIsAvoidKeyboard;
@property (nonatomic, assign) BOOL modelIsScrollEnabled;

@property (nonatomic, assign) CGPoint modelAlertCenterOffset;
@property (nonatomic, assign) UIEdgeInsets modelHeaderInsets;

@property (nonatomic, copy) NSString *modelIdentifier;

@property (nonatomic, copy) CGFloat (^modelMaxWidthBlock)(CGSize);
@property (nonatomic, copy) CGFloat (^modelMaxHeightBlock)(CGSize);

@property (nonatomic, copy) void(^modelOpenAnimationConfigBlock)(void (^animatingBlock)(void), void (^animatedBlock)(void));
@property (nonatomic, copy) void(^modelCloseAnimationConfigBlock)(void (^animatingBlock)(void), void (^animatedBlock)(void));
@property (nonatomic, copy) void (^modelFinishConfig)(void);
@property (nonatomic, copy) BOOL (^modelShouldClose)(void);
@property (nonatomic, copy) BOOL (^modelShouldActionClickClose)(NSInteger);
@property (nonatomic, copy) void (^modelCloseComplete)(void);

@property (nonatomic, assign) DYBackgroundStyle modelBackgroundStyle;
@property (nonatomic, assign) DYAlertAnimationStyle modelOpenAnimationStyle;
@property (nonatomic, assign) DYAlertAnimationStyle modelCloseAnimationStyle;

@property (nonatomic, assign) UIStatusBarStyle modelStatusBarStyle;
@property (nonatomic, assign) UIBlurEffectStyle modelBackgroundBlurEffectStyle;

@property (nonatomic, assign) CornerRadii modelCornerRadii;

@property (nonatomic, strong) DYAlertPresentation* modelPresentation;

@end

@implementation DYAlertBaseConfigModel

- (void)dealloc {
    _modelActionArray = nil;
    _modelItemArray = nil;
    _modelItemInsetsInfo = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 初始化默认值
        _modelHeaderInsets = UIEdgeInsetsMake(25.0f, 20.0f, 20.0f, 20.0f); //默认间距
        _modelOpenAnimationDuration = 0.3f; //默认打开动画时长
        _modelCloseAnimationDuration = 0.2f; //默认关闭动画时长
        _modelBackgroundStyleColorAlpha = 0.4f; //自定义背景样式颜色透明度 默认为半透明背景样式 透明度为0.45f
        _modelQueuePriority = 0; //默认队列优先级 (大于0时才会加入队列)
        
        _modelBackgroundColor = [UIColor blackColor]; //默认背景半透明颜色
        
        _modelIsClickBackgroundClose = NO; //默认点击背景不关闭
        _modelIsQueue = NO; //默认不加入队列
        _modelIsContinueQueueDisplay = YES; //默认继续队列显示
        _modelIsAvoidKeyboard = YES; //默认闪避键盘
        _modelIsScrollEnabled = YES; //默认可以滑动
        
        _modelBackgroundStyle = DYBackgroundStyleTranslucent; //默认为半透明背景样式
        _modelBackgroundBlurEffectStyle = UIBlurEffectStyleDark; //默认模糊效果类型Dark
        
        _modelCornerRadii = CornerRadiiMake(13.0f, 13.0f, 13.0f, 13.0f); //默认圆角半径
        
        __weak typeof(self) weakSelf = self;
        _modelOpenAnimationConfigBlock = ^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
            [UIView animateWithDuration:weakSelf.modelOpenAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                if (animatingBlock) animatingBlock();
            } completion:^(BOOL finished) {
                if (animatedBlock) animatedBlock();
            }];
        };
        
        _modelCloseAnimationConfigBlock = ^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
            [UIView animateWithDuration:weakSelf.modelCloseAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                if (animatingBlock) animatingBlock();
            } completion:^(BOOL finished) {
                if (animatedBlock) animatedBlock();
            }];
        };
        
        _modelShouldClose = ^{
            return YES;
        };
        _modelShouldActionClickClose = ^(NSInteger index){
            return YES;
        };
        _modelPresentation = [DYAlertPresentation windowLevel:UIWindowLevelAlert];
    }
    return self;
}

- (DYConfigToString)dyTitle {
    return ^(NSString *str){
        if (!str || str.length == 0) {
            return self;
        }
        return self.dyAddTitle(^(UILabel *label) {
            label.text = str;
        });
    };
}

- (DYConfigToString)dyContent {
    return ^(NSString *str){
        if (!str || str.length == 0) {
            return self;
        }
        return  self.dyAddContent(^(UILabel *label) {
            label.text = str;
        });
    };
}

- (DYConfigToView)dyCustomView {
    return ^(UIView *view){
        return self.dyAddCustomView(^(DYAlertCustomView *custom) {
            custom.view = view;
        });
    };
}

- (DYConfigToStringAndBlock)dyExpectAction {
    return ^(NSString *title, void(^block)(void)){
        if (!title || title.length == 0) {
            return self;
        }
        return self.dyAddAction(^(DYAction *action) {
            action.type = DYActionTypeDefault;
            action.title = title;
            action.clickBlock = block;
        });
    };
}

- (DYConfigToAttributeStringAndBlock)dyExpectAttributeAction {
    return ^(NSAttributedString *attributeTitle, void(^block)(void)){
        if (!attributeTitle || attributeTitle.string.length == 0) {
            return self;
        }
        return self.dyAddAction(^(DYAction *action) {
            action.type = DYActionTypeDefault;
            action.attributedTitle = attributeTitle;
            action.numberOfLines = 0;
            action.clickBlock = block;
        });
    };
}

- (DYConfigToStringAndBlock)dyNormalAction {
    return ^(NSString *title, void(^block)(void)){
        if (!title || title.length == 0) {
            return self;
        }
        return self.dyAddAction(^(DYAction *action) {
            action.type = DYActionTypeCancel;
            action.title = title;
            action.clickBlock = block;
        });
    };
}

- (DYConfigToAttributeStringAndBlock)dyNormalAttributeAction {
    return ^(NSAttributedString *attributeTitle, void(^block)(void)){
        if (!attributeTitle || attributeTitle.string.length == 0) {
            return self;
        }
        return self.dyAddAction(^(DYAction *action) {
            action.type = DYActionTypeCancel;
            action.attributedTitle = attributeTitle;
            action.numberOfLines = 0;
            action.clickBlock = block;
        });
    };
}

- (DYConfigToConfigLabel)dyAddTitle {
    return ^(void(^block)(UILabel *)){
        return self.dyAddItem(^(DYAlertItem *item) {
            item.type = DYAlertItemTypeTitle;
            item.insets = UIEdgeInsetsMake(5, 0, 5, 0);
            item.block = block;
        });
    };
}

- (DYConfigToConfigLabel)dyAddContent {
    return ^(void(^block)(UILabel *)){
        return self.dyAddItem(^(DYAlertItem *item) {
            item.type = DYAlertItemTypeContent;
            item.insets = UIEdgeInsetsMake(10, 0, 5, 0);
            item.block = block;
        });
    };
}

- (DYConfigToCustomView)dyAddCustomView {
    return ^(void(^block)(DYAlertCustomView *custom)){
        return self.dyAddItem(^(DYAlertItem *item) {
            item.type = DYAlertItemTypeCustomView;
            item.insets = UIEdgeInsetsMake(10, 0, 5, 0);
            item.block = block;
        });
    };
}

- (DYConfigToItem)dyAddItem {
    return ^(void(^block)(DYAlertItem *)){
        if (block) [self.modelItemArray addObject:block];
        return self;
    };
}

- (DYConfigToAction)dyAddAction {
    return ^(void(^block)(DYAction *)){
        if (block) [self.modelActionArray addObject:block];
        return self;
    };
}

- (DYConfigToReturnMaxSize)dyConfigMaxWidth {
    return ^(CGFloat(^block)(CGSize size)){
        if (block) self.modelMaxWidthBlock = block;
        return self;
    };
}

- (DYConfigToReturnMaxSize)dyConfigMaxHeight {
    return ^(CGFloat(^block)(CGSize size)){
        if (block) self.modelMaxHeightBlock = block;
        return self;
    };
}

- (DYConfigToBool)dyClickBackgroundClose {
    return ^(BOOL is){
        self.modelIsClickBackgroundClose = is;
        return self;
    };
}

- (DYConfigToString)dyIdentifier {
    return ^(NSString *string){
        if (!string || string.length == 0) {
            return self;
        }
        self.modelIdentifier = string;
        return self;
    };
}

- (DYConfigToBool)dyQueue {
    return ^(BOOL is){
        self.modelIsQueue = is;
        return self;
    };
}

- (DYConfigToInteger)dyPriority {
    return ^(NSInteger number){
        self.modelQueuePriority = number > 0 ? number : 0;
        return self;
    };
}

- (DYConfigToBool)dyContinueQueueDisplay {
    return ^(BOOL is){
        self.modelIsContinueQueueDisplay = is;
        return self;
    };
}

- (DYConfigToAnimationStyle)dyOpenAnimationStyle {
    return ^(DYAlertAnimationStyle style){
        self.modelOpenAnimationStyle = style;
        return self;
    };
}

- (DYConfigToAnimationStyle)dyCloseAnimationStyle {
    return ^(DYAlertAnimationStyle style){
        self.modelCloseAnimationStyle = style;
        return self;
    };
}

- (DYConfigToColor)dyHeaderColor {
    return ^(UIColor *color){
        self.modelHeaderColor = color;
        return self;
    };
}

- (DYConfigToEdgeInsets)dyHeaderInsets {
    return ^(UIEdgeInsets insets){
        if (insets.top < 0) insets.top = 0;
        if (insets.left < 0) insets.left = 0;
        if (insets.bottom < 0) insets.bottom = 0;
        if (insets.right < 0) insets.right = 0;
        self.modelHeaderInsets = insets;
        return self;
    };
}

- (DYConfigToEdgeInsets)dyItemInsets {
    return ^(UIEdgeInsets insets) {
        if (self.modelItemArray.count) {
            if (insets.top < 0) insets.top = 0;
            if (insets.left < 0) insets.left = 0;
            if (insets.bottom < 0) insets.bottom = 0;
            if (insets.right < 0) insets.right = 0;
            [self.modelItemInsetsInfo setObject: [NSValue valueWithUIEdgeInsets:insets]
                                         forKey:@(self.modelItemArray.count - 1)];
        } else {
            NSAssert(YES, @"请在添加的某一项后面设置间距");
        }
        return self;
    };
}

- (DYConfigToBlock)dyCloseComplete {
    return ^(void (^block)(void)){
        self.modelCloseComplete = block;
        return self;
    };
}

- (DYConfig)dyShow {
    return ^{
        if (self.modelFinishConfig) self.modelFinishConfig();
        return self;
    };
}


#pragma mark LazyLoading

- (NSMutableArray *)modelActionArray {
    if (!_modelActionArray) _modelActionArray = [NSMutableArray array];
    return _modelActionArray;
}

- (NSMutableArray *)modelItemArray {
    if (!_modelItemArray) _modelItemArray = [NSMutableArray array];
    return _modelItemArray;
}

- (NSMutableDictionary *)modelItemInsetsInfo {
    if (!_modelItemInsetsInfo) _modelItemInsetsInfo = [NSMutableDictionary dictionary];
    return _modelItemInsetsInfo;
}

@end

@interface DYAlert ()

@property (nonatomic, strong) UIWindow *mainWindow;

@property (nonatomic, strong) DYAlertWindow *DYWindow;

@property (nonatomic, strong) NSMutableArray <DYAlertBaseConfig *>*queueArray;

@property (nonatomic, strong) DYAlertBaseViewController *viewController;

@end

@protocol DYAlertProtocol <NSObject>

- (void)closeWithCompletionBlock:(void (^)(void))completionBlock;

@end

@implementation DYAlert

+ (DYAlert *)shareManager {
    static DYAlert *alertManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        alertManager = [[DYAlert alloc] init];
    });
    return alertManager;
}

+ (DYAlertConfig *)alert {
    return [[DYAlertConfig alloc] init];
}

+ (DYAlertWindow *)getAlertWindow {
    return [DYAlert shareManager].DYWindow;
}

+ (void)configMainWindow:(UIWindow *)window {
    if (window) [DYAlert shareManager].mainWindow = window;
}

+ (void)continueQueueDisplay {
    if ([DYAlert shareManager].queueArray.count) [DYAlert shareManager].queueArray.lastObject.config.modelFinishConfig();
}

+ (void)clearQueue {
    if ([self isQueueEmpty]) return;
    
    DYAlertBaseConfig * _Nullable last = [DYAlert shareManager].queueArray.lastObject;
    [[DYAlert shareManager].queueArray removeAllObjects];
    if ([last respondsToSelector:@selector(close)]) [last performSelector:@selector(close)];
}

+ (BOOL)isQueueEmpty {
    return [DYAlert shareManager].queueArray.count == 0;
}

+ (BOOL)containsQueueWithIdentifier:(NSString *)identifier {
    for (DYAlertBaseConfig *config in [DYAlert shareManager].queueArray) {
        if ([config.config.modelIdentifier isEqualToString:identifier]) return YES;
    }
    return NO;
}

+ (void)closeWithIdentifier:(NSString *)identifier completionBlock:(void (^ _Nullable)(void))completionBlock {
    [self closeWithIdentifier:identifier force:NO completionBlock:completionBlock];
}

+ (void)closeWithIdentifier:(NSString *)identifier force:(BOOL)force completionBlock:(void (^)(void))completionBlock {
    if ([DYAlert shareManager].queueArray.count) {
        BOOL isLast = false;
        NSUInteger count = [DYAlert shareManager].queueArray.count;
        NSMutableIndexSet *indexs = [[NSMutableIndexSet alloc] init];
        for (NSUInteger i = 0; i < count; i++) {
            DYAlertBaseConfig *config = [DYAlert shareManager].queueArray[i];
            DYAlertBaseConfigModel *model = config.config;
            if (model.modelIdentifier != nil && [identifier isEqualToString: model.modelIdentifier]) {
                if (i == count - 1 && [[DYAlert shareManager] viewController]) {
                    if (force) {
                        model.modelShouldClose = ^{ return YES; };
                    }
                    isLast = true;
                } else {
                    [indexs addIndex:i];
                }
            }
        }
        
        [[DYAlert shareManager].queueArray removeObjectsAtIndexes:indexs];
        if (isLast) {
            [DYAlert closeWithCompletionBlock:completionBlock];
        } else {
            if (completionBlock) completionBlock();
        }
    } else {
        if (completionBlock) completionBlock();
    }
}

+ (void)closeWithCompletionBlock:(void (^)(void))completionBlock {
    if ([DYAlert shareManager].queueArray.count) {
        DYAlertBaseConfig *item = [DYAlert shareManager].queueArray.lastObject;
        if ([item respondsToSelector:@selector(closeWithCompletionBlock:)]) [item performSelector:@selector(closeWithCompletionBlock:) withObject:completionBlock];
    } else {
        if (completionBlock) completionBlock();
    }
}

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
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle {
    
    [self alertWithTitle:title
                 content:content
              identifier:nil
            normalAction:nil
            expectAction:expectAction
      normalActionHandle:nil
      expectActionHandle:expectActionHandle];
}

/**
 便捷构造
 
 @param content 内容，传nil或空字符则不创建
 @param expectAction 期望按钮，传nil或空字符则不创建
 @param expectActionHandle 期望按钮回调，可传nil
 */
+ (void)alertWithContent:(NSString * _Nullable)content
            expectAction:(NSString * _Nullable)expectAction
      expectActionHandle:(void (^ _Nullable)(void))expectActionHandle {
    
    [self alertWithTitle:nil
                 content:content
              identifier:nil
            normalAction:nil
            expectAction:expectAction
      normalActionHandle:nil
      expectActionHandle:expectActionHandle];
}

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
      expectActionHandle:(void (^ _Nullable)(void))expectActionHandle {
    
    [self alertWithTitle:nil
                 content:content
              identifier:nil
            normalAction:normalAction
            expectAction:expectAction
      normalActionHandle:normalActionHandle
      expectActionHandle:expectActionHandle];
}

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
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle {
    
    [self alertWithTitle:title
                 content:content
              identifier:nil
            normalAction:normalAction
            expectAction:expectAction
      normalActionHandle:normalActionHandle
      expectActionHandle:expectActionHandle];
}

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
    expectActionHandle:(void (^ _Nullable)(void))expectActionHandle {
    
    [DYAlert alert].config
    .dyTitle(title)
    .dyContent(content)
    .dyIdentifier(identifier)
    .dyNormalAction(normalAction, normalActionHandle)
    .dyExpectAction(expectAction, expectActionHandle)
    .dyShow();
}

/**
 便捷构造
 
 @param customView 自定义视图
 */
+ (void)alertWithCustomView:(UIView *)customView {
    if (!customView) return;
    
    [self alertWithCustomView:customView isClickBackgroundClose:NO];
}

/**
 便捷构造
 
 @param customView 自定义视图
 @param isClickBackgroundClose 点击背景是否关闭弹框
 */
+ (void)alertWithCustomView:(UIView *)customView
     isClickBackgroundClose:(BOOL)isClickBackgroundClose {
    if (!customView) return;
    
    DYAlertConfig *alertConfig = [DYAlert alert];
    DYAlertBaseConfigModel *configModel = alertConfig.config;
    configModel.dyCustomView(customView);
    configModel.dyItemInsets(UIEdgeInsetsZero);
    configModel.dyIdentifier(NSStringFromClass(customView.class));
    configModel.dyHeaderInsets(UIEdgeInsetsZero);
    configModel.dyHeaderColor(UIColor.clearColor);
    configModel.dyClickBackgroundClose(isClickBackgroundClose);
    configModel.dyShow();
    
}

/**
 便捷构造
 
 @param config 配置模型
 */
+ (void)alertWithConfig:(DYAlertConfigModel *)config {
    
    if (config.showType == kDYAlertConfigShowSystem) { // 系统样式
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:config.title message:config.content preferredStyle:UIAlertControllerStyleAlert];
        
        for (DYAlertAction *act in config.actions) {
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:act.title style:(UIAlertActionStyle)act.style handler:^(UIAlertAction * _Nonnull action) {
                if (act.handler) {
                    act.handler();
                }
            }];
            [alert addAction:alertAction];
        }
        
        if (config.expectAction) {
            UIAlertAction *expectAction = [UIAlertAction actionWithTitle:config.expectAction.title style:(UIAlertActionStyle)config.expectAction.style handler:^(UIAlertAction * _Nonnull action) {
                if (config.expectAction.handler) {
                    config.expectAction.handler();
                }
            }];
            [alert addAction:expectAction];
        }
        
        if (config.normalAction) {
            UIAlertAction *normalAction = [UIAlertAction actionWithTitle:config.normalAction.title style:(UIAlertActionStyle)config.normalAction.style handler:^(UIAlertAction * _Nonnull action) {
                if (config.normalAction.handler) {
                    config.normalAction.handler();
                }
            }];
            [alert addAction:normalAction];
        }
        
        [[DYNavigatorManager currentNavigator].topViewController presentViewController:alert
                                                                   animated:YES
                                                                 completion:nil];
        
    } else if (config.showType == kDYAlertConfigShowCustom) { // 自定义样式
        DYAlertConfig *alertConfig = [DYAlert alert];
        DYAlertBaseConfigModel *configModel = alertConfig.config;
        
        if (config.attributeTitle.string.length) {
            configModel.dyAddTitle(^(UILabel *label) {
                label.attributedText = config.attributeTitle;
                label.textAlignment = config.titleAlignment;
            });
        } else {
            if (config.title.length) {
                configModel.dyTitle(config.title);
            }
        }
        if (kDYAlertTypeNormal == config.alertType) {
            if (config.customView) {
                configModel.dyCustomView(config.customView);
            }
        } else if (kDYAlertTypeTextView == config.alertType) {
        }
        if (config.attributeContent.string.length) {
            configModel.dyAddContent(^(UILabel *label) {
                label.attributedText = config.attributeContent;
                label.textAlignment = config.contentAlignment;
            });
        } else {
            if (config.content.length) {
                configModel.dyContent(config.content);
            }
        }
        if (config.identifier.length) {
            configModel.dyIdentifier(config.identifier);
        }
        if (config.normalAction) {
            if (config.normalAction.attributeTitle.string.length > 0) {
                configModel.dyNormalAttributeAction(config.normalAction.attributeTitle, config.normalAction.handler);
            } else {
                configModel.dyNormalAction(config.normalAction.title, config.normalAction.handler);
            }
        }
        if (config.expectAction) {
            if (config.expectAction.attributeTitle.string.length > 0) {
                configModel.dyExpectAttributeAction(config.expectAction.attributeTitle, config.expectAction.handler);
            } else {
                configModel.dyExpectAction(config.expectAction.title, config.expectAction.handler);
            }
        }
        if (config.closeCompleteBlock) {
            configModel.dyCloseComplete(^{
                config.closeCompleteBlock();
            });
        }
        configModel.dyClickBackgroundClose(config.isClickBackgroundClose);
        
        configModel.dyShow();
    }
}

#pragma mark LazyLoading

- (void)setMainWindow:(UIWindow *)mainWindow {
    _mainWindow = mainWindow;
}

- (NSMutableArray <DYAlertBaseConfig *>*)queueArray{
    if (!_queueArray) _queueArray = [NSMutableArray array];
    return _queueArray;
}

- (DYAlertWindow *)DYWindow{
    if (!_DYWindow) {
        _DYWindow = [[DYAlertWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _DYWindow.rootViewController = [[UIViewController alloc] init];
        _DYWindow.backgroundColor = [UIColor clearColor];
        _DYWindow.windowLevel = UIWindowLevelAlert;
        _DYWindow.hidden = YES;
    }
    return _DYWindow;
}

@end

@interface UIView (DYAlertExtension)

@property (nonatomic, assign) CornerRadii DY_alert_cornerRadii;

@end

@implementation UIView (DYAlertExtension)

CornerRadii CornerRadiiMake(CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRight) {
    return (CornerRadii){
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
    };
}

CornerRadii CornerRadiiZero() {
    return (CornerRadii){0, 0, 0, 0};
}

CornerRadii CornerRadiiNull() {
    return (CornerRadii){-1, -1, -1, -1};
}

BOOL CornerRadiiEqualTo(CornerRadii lhs, CornerRadii rhs) {
    return lhs.topLeft == rhs.topRight
    && lhs.topRight == rhs.topRight
    && lhs.bottomLeft == rhs.bottomLeft
    && lhs.bottomRight == lhs.bottomRight;
}

// 切圆角函数
CGPathRef _Nullable DYCGPathCreateWithRoundedRect(CGRect bounds, CornerRadii cornerRadii) {
    const CGFloat minX = CGRectGetMinX(bounds);
    const CGFloat minY = CGRectGetMinY(bounds);
    const CGFloat maxX = CGRectGetMaxX(bounds);
    const CGFloat maxY = CGRectGetMaxY(bounds);
    
    const CGFloat topLeftCenterX = minX + cornerRadii.topLeft;
    const CGFloat topLeftCenterY = minY + cornerRadii.topLeft;
    
    const CGFloat topRightCenterX = maxX - cornerRadii.topRight;
    const CGFloat topRightCenterY = minY + cornerRadii.topRight;
    
    const CGFloat bottomLeftCenterX = minX + cornerRadii.bottomLeft;
    const CGFloat bottomLeftCenterY = maxY - cornerRadii.bottomLeft;
    
    const CGFloat bottomRightCenterX = maxX - cornerRadii.bottomRight;
    const CGFloat bottomRightCenterY = maxY - cornerRadii.bottomRight;
    // 虽然顺时针参数是YES，在iOS中的UIView中，这里实际是逆时针
    
    CGMutablePathRef path = CGPathCreateMutable();
    // 顶 左
    CGPathAddArc(path, NULL, topLeftCenterX, topLeftCenterY, cornerRadii.topLeft, M_PI, 3 * M_PI_2, NO);
    // 顶 右
    CGPathAddArc(path, NULL, topRightCenterX, topRightCenterY, cornerRadii.topRight, 3 * M_PI_2, 0, NO);
    // 底 右
    CGPathAddArc(path, NULL, bottomRightCenterX, bottomRightCenterY, cornerRadii.bottomRight, 0, M_PI_2, NO);
    // 底 左
    CGPathAddArc(path, NULL, bottomLeftCenterX, bottomLeftCenterY, cornerRadii.bottomLeft, M_PI_2,M_PI, NO);
    CGPathCloseSubpath(path);
    return path;
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *selStringsArray = @[@"layoutSubviews"];
        [selStringsArray enumerateObjectsUsingBlock:^(NSString *selString, NSUInteger idx, BOOL *stop) {
            NSString *DYSelString = [@"DY_alert_view_" stringByAppendingString:selString];
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(selString));
            Method DYMethod = class_getInstanceMethod(self, NSSelectorFromString(DYSelString));
            BOOL isAddedMethod = class_addMethod(self, NSSelectorFromString(selString), method_getImplementation(DYMethod), method_getTypeEncoding(DYMethod));
            if (isAddedMethod) {
                class_replaceMethod(self, NSSelectorFromString(DYSelString), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, DYMethod);
            }
        }];
    });
}

- (void)DY_alert_updateCornerRadii {
    if (!CornerRadiiEqualTo([self DY_alert_cornerRadii], CornerRadiiNull())) {
        CAShapeLayer *lastLayer = (CAShapeLayer *)self.layer.mask;
        CGPathRef lastPath = CGPathCreateCopy(lastLayer.path);
        CGPathRef path = DYCGPathCreateWithRoundedRect(self.bounds, [self DY_alert_cornerRadii]);

        // 防止相同路径多次设置
        if (!CGPathEqualToPath(lastPath, path)) {
            // 移除原有路径动画
            [lastLayer removeAnimationForKey:@"path"];
            // 重置新路径mask
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.path = path;
            self.layer.mask = maskLayer;
            // 同步视图大小变更动画
            CAAnimation *temp = [self.layer animationForKey:@"bounds.size"];
            if (temp) {
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
                animation.duration = temp.duration;
                animation.fillMode = temp.fillMode;
                animation.timingFunction = temp.timingFunction;
                animation.fromValue = (__bridge id _Nullable)(lastPath);
                animation.toValue = (__bridge id _Nullable)(path);
                [maskLayer addAnimation:animation forKey:@"path"];
            }
        }
        CGPathRelease(lastPath);
        CGPathRelease(path);
    }
}

- (void)DY_alert_view_layoutSubviews {
    [self DY_alert_view_layoutSubviews];
    [self DY_alert_updateCornerRadii];
}

- (CornerRadii)DY_alert_cornerRadii {
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    CornerRadii cornerRadii;
    if (value) {
        [value getValue:&cornerRadii];
    } else {
        cornerRadii = CornerRadiiNull();
    }
    return cornerRadii;
}

- (void)setDY_alert_cornerRadii:(CornerRadii)cornerRadii{
    NSValue *value = [NSValue valueWithBytes:&cornerRadii objCType:@encode(CornerRadii)];
    objc_setAssociatedObject(self, @selector(DY_alert_cornerRadii), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface UIButton (DYAlertExtension)

@end

@implementation UIButton (DYAlertExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *selStringsArray = @[@"layoutSubviews"];
        [selStringsArray enumerateObjectsUsingBlock:^(NSString *selString, NSUInteger idx, BOOL *stop) {
            NSString *DYSelString = [@"DY_alert_button_" stringByAppendingString:selString];
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(selString));
            Method DYMethod = class_getInstanceMethod(self, NSSelectorFromString(DYSelString));
            BOOL isAddedMethod = class_addMethod(self, NSSelectorFromString(selString), method_getImplementation(DYMethod), method_getTypeEncoding(DYMethod));
            if (isAddedMethod) {
                class_replaceMethod(self, NSSelectorFromString(DYSelString), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, DYMethod);
            }
        }];
    });
}

- (void)DY_alert_button_layoutSubviews {
    [self DY_alert_button_layoutSubviews];
    [self DY_alert_updateCornerRadii];
}

@end

@implementation DYAlertWindow

@end

@interface DYAlertItem ()

@property (nonatomic, copy) void (^updateBlock)(DYAlertItem *);

@end

@implementation DYAlertItem

- (void)update{
    
    if (self.updateBlock) self.updateBlock(self);
}

@end

@interface DYAction ()

@property (nonatomic, copy) void (^updateBlock)(DYAction *);

@end

@implementation DYAction

- (instancetype)init {
    if (self = [super init]) {
        _numberOfLines = 1;
        _textAlignment = NSTextAlignmentLeft;
        _adjustsFontSizeToFitWidth = NO;
        _lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    return self;
}

- (void)update {
    if (self.updateBlock) self.updateBlock(self);
}

@end

@interface DYAlertItemView : UIView

@property (nonatomic, strong) DYAlertItem *item;

+ (DYAlertItemView *)view;

@end

@implementation DYAlertItemView

+ (DYAlertItemView *)view{
    
    return [[DYAlertItemView alloc] init];
}

@end

@interface DYAlertItemLabel : UILabel

@property (nonatomic, strong) DYAlertItem *item;

@property (nonatomic, copy) void (^textChangedBlock)(void);

+ (DYAlertItemLabel *)label;

@end

@implementation DYAlertItemLabel

+ (DYAlertItemLabel *)label {
    return [[DYAlertItemLabel alloc] init];
}

- (void)setText:(NSString *)text {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, [text length])];
    
    [super setAttributedText:attributedString.copy];
    
    if (self.textChangedBlock) self.textChangedBlock();
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    if (self.textChangedBlock) self.textChangedBlock();
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    if (self.textChangedBlock) self.textChangedBlock();
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    [super setNumberOfLines:numberOfLines];
    
    if (self.textChangedBlock) self.textChangedBlock();
}

@end

@interface DYAlertItemTextField : UITextField

@property (nonatomic, strong) DYAlertItem *item;

+ (DYAlertItemTextField *)textField;

@end

@implementation DYAlertItemTextField

+ (DYAlertItemTextField *)textField{
    
    return [[DYAlertItemTextField alloc] init];
}

@end

@interface DYAlertActionButton : UIButton

@property (nonatomic, strong) DYAction *action;

@property (nonatomic, copy) void (^heightChangedBlock)(void);

+ (DYAlertActionButton *)button;

@end

@implementation DYAlertActionButton

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    /// 刷新Action设置
    self.action = self.action;
}

+ (DYAlertActionButton *)button {
    return [DYAlertActionButton buttonWithType:UIButtonTypeCustom];;
}

- (void)setAction:(DYAction *)action {
    _action = action;
    self.clipsToBounds = YES;
    
    if (action.title) [self setTitle:action.title forState:UIControlStateNormal];
    if (action.highlight) [self setTitle:action.highlight forState:UIControlStateHighlighted];
    if (action.attributedTitle) [self setAttributedTitle:action.attributedTitle forState:UIControlStateNormal];
    if (action.attributedHighlight) [self setAttributedTitle:action.attributedHighlight forState:UIControlStateHighlighted];
    
    [self.titleLabel setNumberOfLines:action.numberOfLines];
    [self.titleLabel setTextAlignment:action.textAlignment];
    
    if (action.font) [self.titleLabel setFont:action.font];
    
    [self.titleLabel setAdjustsFontSizeToFitWidth:action.adjustsFontSizeToFitWidth];
    [self.titleLabel setLineBreakMode:action.lineBreakMode];
    
    if (action.titleColor) [self setTitleColor:action.titleColor forState:UIControlStateNormal];
    if (action.highlightColor) [self setTitleColor:action.highlightColor forState:UIControlStateHighlighted];
    if (action.backgroundColor) [self setBackgroundImage:[self getImageWithColor:action.backgroundColor] forState:UIControlStateNormal];
    if (action.backgroundHighlightColor) [self setBackgroundImage:[self getImageWithColor:action.backgroundHighlightColor] forState:UIControlStateHighlighted];
    if (action.backgroundImage) [self setBackgroundImage:action.backgroundImage forState:UIControlStateNormal];
    if (action.backgroundHighlightImage) [self setBackgroundImage:action.backgroundHighlightImage forState:UIControlStateHighlighted];
    if (action.image) [self setImage:action.image forState:UIControlStateNormal];
    if (action.highlightImage) [self setImage:action.highlightImage forState:UIControlStateHighlighted];
    if (action.height) [self setActionHeight:action.height];
    if (action.cornerRadius) [self.layer setCornerRadius:action.cornerRadius];
    
    [self setImageEdgeInsets:action.imageEdgeInsets];
    [self setTitleEdgeInsets:action.titleEdgeInsets];
    
    __weak typeof(self) weakSelf = self;
    action.updateBlock = ^(DYAction *act) {
        if (weakSelf) weakSelf.action = act;
    };
}

- (CGFloat)actionHeight {
    return self.frame.size.height;
}

- (void)setActionHeight:(CGFloat)height {
    BOOL isChange = [self actionHeight] == height ? NO : YES;
    CGRect buttonFrame = self.frame;
    buttonFrame.size.height = height;
    self.frame = buttonFrame;
    if (isChange) {
        if (self.heightChangedBlock) self.heightChangedBlock();
    }
}

- (UIImage *)getImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

@interface DYAlertCustomView ()

@property (nonatomic, strong) DYAlertItem *item;

@property (nonatomic, strong) UIView *container;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, copy) void (^sizeChangedBlock)(void);

@end

@implementation DYAlertCustomView

- (instancetype)init {
    if (self = [super init]) {
        _positionType = DYAlertCustomViewPositionTypeCenter;
    }
    return self;
}

- (void)dealloc {
    self.view = nil;
    
    if (_container) {
        [_container removeObserver:self forKeyPath:@"frame"];
        [_container removeObserver:self forKeyPath:@"bounds"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    UIView *view = (UIView *)object;
    if ([view isEqual:self.container] && self.isAutoWidth) {
        if ([keyPath isEqualToString:@"frame"] || [keyPath isEqualToString:@"bounds"]) {
            for (UIView *subView in view.subviews) {
                CGRect temp = subView.frame;
                temp.size.width = view.bounds.size.width;
                subView.frame = temp;
            }
        }
    }
    
    if ([view isEqual:self.view]) {
        if ([keyPath isEqualToString:@"frame"]) {
            if (self.isAutoWidth) {
                self.size = CGSizeMake(view.frame.size.width, self.size.height);
            }
            if (!CGSizeEqualToSize(self.size, view.frame.size)) {
                self.size = view.frame.size;
                [self updateContainerFrame:view];
                if (self.sizeChangedBlock) self.sizeChangedBlock();
            }
        }
        
        if ([keyPath isEqualToString:@"bounds"]) {
            if (self.isAutoWidth) {
                self.size = CGSizeMake(view.bounds.size.width, self.size.height);
            }
            if (!CGSizeEqualToSize(self.size, view.bounds.size)) {
                self.size = view.bounds.size;
                [self updateContainerFrame:view];
                if (self.sizeChangedBlock) self.sizeChangedBlock();
            }
        }
    }
    
    [CATransaction commit];
}

- (void)updateContainerFrame:(UIView *)view {
    view.frame = view.bounds;
    self.container.bounds = view.bounds;
}

- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectZero];
        _container.backgroundColor = UIColor.clearColor;
        _container.clipsToBounds = true;
        [_container addObserver: self forKeyPath: @"frame" options: NSKeyValueObservingOptionNew context: nil];
        [_container addObserver: self forKeyPath: @"bounds" options: NSKeyValueObservingOptionNew context: nil];
    }
    return _container;
}

- (void)setView:(UIView *)view {
    if (_view) {
        [_view removeFromSuperview];
        [_view removeObserver:self forKeyPath:@"frame"];
        [_view removeObserver:self forKeyPath:@"bounds"];
    }
    
    _view = view;
    if (_view) {
        [view addObserver: self forKeyPath: @"frame" options: NSKeyValueObservingOptionNew context: nil];
        [view addObserver: self forKeyPath: @"bounds" options: NSKeyValueObservingOptionNew context: nil];
        
        [view layoutIfNeeded];
        [view layoutSubviews];
        
        _size = view.frame.size;
        [self updateContainerFrame:view];
        [self.container addSubview:view];
        
        // 保证使用AutoLayout的自定义视图在容器视图内的位置正确
        if (view.translatesAutoresizingMaskIntoConstraints == NO) {
            {
                NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                              attribute:NSLayoutAttributeCenterX
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.container
                                                                              attribute:NSLayoutAttributeCenterX
                                                                             multiplier:1
                                                                               constant:0];
                [self.container addConstraint: constraint];
            }
            {
                NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.container
                                                                              attribute:NSLayoutAttributeCenterY
                                                                             multiplier:1
                                                                               constant:0];
                [self.container addConstraint: constraint];
            }
        }
    }
}

@end

@interface DYAlertPresentationWindow: DYAlertPresentation

@property (nonatomic, assign) UIWindowLevel windowLevel;

@end

@interface DYAlertPresentationViewController: DYAlertPresentation

@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation DYAlertPresentation

+ (DYAlertPresentationWindow *)windowLevel:(UIWindowLevel)level {
    DYAlertPresentationWindow *presentation = [[DYAlertPresentationWindow alloc] init];
    presentation.windowLevel = level;
    return presentation;
}

+ (DYAlertPresentationViewController *)viewController:(UIViewController *)controller {
    DYAlertPresentationViewController *presentation = [[DYAlertPresentationViewController alloc] init];
    presentation.viewController = controller;
    return presentation;
}

@end

@implementation DYAlertPresentationWindow

@end

@implementation DYAlertPresentationViewController

@end


@interface DYAlertBaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) DYAlertBaseConfigModel *config;

@property (nonatomic, strong) UIWindow *currentKeyWindow;

@property (nonatomic, strong) UIVisualEffectView *backgroundVisualEffectView;

@property (nonatomic, assign) BOOL isShowing;

@property (nonatomic, assign) BOOL isClosing;

@property (nonatomic, copy) void (^openFinishBlock)(void);

@property (nonatomic, copy) void (^closeFinishBlock)(void);

@end

@implementation DYAlertBaseViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _config = nil;
    _currentKeyWindow = nil;
    _backgroundVisualEffectView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (self.config.modelBackgroundStyle == DYBackgroundStyleBlur) {
        self.backgroundVisualEffectView = [[UIVisualEffectView alloc] initWithEffect:nil];
        self.backgroundVisualEffectView.frame = self.view.frame;
        [self.view addSubview:self.backgroundVisualEffectView];
    }
    
    self.view.backgroundColor = [self.config.modelBackgroundColor colorWithAlphaComponent:0.0f];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (self.backgroundVisualEffectView) self.backgroundVisualEffectView.frame = self.view.frame;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    if (self.config.modelIsClickBackgroundClose) [self closeAnimationsWithCompletionBlock:nil];
}

#pragma mark start animations

- (void)showAnimationsWithCompletionBlock:(void (^)(void))completionBlock {
    [AppUtils dismissKeyboard];
    [self.view setUserInteractionEnabled:NO];
    [self.view layoutIfNeeded];
}

#pragma mark close animations

- (void)closeAnimationsWithCompletionBlock:(void (^)(void))completionBlock {
    [AppUtils dismissKeyboard];
}

#pragma mark LazyLoading

- (UIWindow *)currentKeyWindow {
    if (!_currentKeyWindow) _currentKeyWindow = [DYAlert shareManager].mainWindow;
    if (!_currentKeyWindow) _currentKeyWindow = [UIApplication sharedApplication].keyWindow;
    if (_currentKeyWindow.windowLevel != UIWindowLevelNormal) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"windowLevel == %ld AND hidden == 0 ", UIWindowLevelNormal];
        _currentKeyWindow = [[UIApplication sharedApplication].windows filteredArrayUsingPredicate:predicate].firstObject;
    }
    if (_currentKeyWindow) if (![DYAlert shareManager].mainWindow) [DYAlert shareManager].mainWindow = _currentKeyWindow;
    return _currentKeyWindow;
}

#pragma mark - 状态栏

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.config.modelStatusBarStyle;
}

@end

#pragma mark - Alert

@interface DYAlertViewController ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIScrollView *alertView;

@property (nonatomic, strong) NSMutableArray <id>*alertItemArray;

@property (nonatomic, strong) NSMutableArray <DYAlertActionButton *>*alertActionArray;

@end

@implementation DYAlertViewController
{
    CGRect keyboardFrame;
    BOOL isShowingKeyboard;
}

- (void)dealloc {
    _alertView = nil;
    _alertItemArray = nil;
    _alertActionArray = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNotification];
    [self configAlert];
}

- (void)configNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notify {
    BOOL local = YES;
    
    if (@available(iOS 9.0, *)) {
        local = [[[notify userInfo] objectForKey:UIKeyboardIsLocalUserInfoKey] boolValue];
    }
    
    if (self.config.modelIsAvoidKeyboard && local) {
        double duration = [[[notify userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        UIViewAnimationCurve curve = [[[notify userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
        keyboardFrame = [[[notify userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        isShowingKeyboard = keyboardFrame.origin.y < SCREEN_HEIGHT;
        [UIView beginAnimations:@"keyboardWillChangeFrame" context:NULL];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:curve];
        [self updateAlertLayout];
        [UIView commitAnimations];
    }
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self updateAlertLayout];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    
    [self updateAlertLayout];
}

- (void)updateAlertLayout {
    [self updateAlertLayoutWithViewWidth:VIEW_WIDTH ViewHeight:VIEW_HEIGHT];
}

- (void)updateAlertLayoutWithViewWidth:(CGFloat)viewWidth ViewHeight:(CGFloat)viewHeight {
    CGFloat alertViewMaxWidth = self.config.modelMaxWidthBlock(CGSizeMake(viewWidth, viewHeight));
    CGFloat alertViewMaxHeight = self.config.modelMaxHeightBlock(CGSizeMake(viewWidth, viewHeight));
    CGPoint offset = self.config.modelAlertCenterOffset;
    
    // 解决设置 transform 导致触发layoutsubviews的问题 (动画效果异常)
    CGAffineTransform transform = self.containerView.transform;
    
    self.containerView.transform = CGAffineTransformIdentity;
    if (isShowingKeyboard) {
        if (keyboardFrame.size.height) {
            CGFloat alertViewHeight = [self updateAlertItemsLayoutWithMaxWidth:alertViewMaxWidth];
            // 处理非全屏时当前视图在窗口中的位置 解决键盘遮挡范围计算问题
            CGRect current = [self.view convertRect:self.view.bounds toView:self.view.window];
            CGFloat keyboardY = keyboardFrame.origin.y - current.origin.y;
            CGRect alertViewFrame = self.alertView.frame;
            CGFloat tempAlertViewHeight = keyboardY - alertViewHeight < 20 ? keyboardY - 20 : alertViewHeight;
            tempAlertViewHeight = tempAlertViewHeight > alertViewMaxHeight ? alertViewMaxHeight : tempAlertViewHeight;
            CGFloat tempAlertViewY = keyboardY - tempAlertViewHeight - 10;
            CGFloat originalAlertViewY = (viewHeight - alertViewFrame.size.height) * 0.5f + offset.y;
            alertViewFrame.size.height = tempAlertViewHeight;
            alertViewFrame.size.width = alertViewMaxWidth;
            self.alertView.frame = alertViewFrame;
            [self.alertView layoutIfNeeded];
            
            CGRect containerFrame = self.containerView.frame;
            containerFrame.size.width = alertViewFrame.size.width;
            containerFrame.size.height = alertViewFrame.size.height;
            containerFrame.origin.x = (viewWidth - alertViewFrame.size.width) * 0.5f + offset.x;
            containerFrame.origin.y = tempAlertViewY < originalAlertViewY ? tempAlertViewY : originalAlertViewY;
            self.containerView.frame = containerFrame;
            [self.alertView scrollRectToVisible:[self findFirstResponder:self.alertView].frame animated:YES];
        }
    } else {
        CGFloat alertViewHeight = [self updateAlertItemsLayoutWithMaxWidth:alertViewMaxWidth];
        alertViewMaxHeight -= ABS(offset.y);
        CGRect alertViewFrame = self.alertView.frame;
        alertViewFrame.size.width = alertViewMaxWidth;
        alertViewFrame.size.height = alertViewHeight > alertViewMaxHeight ? alertViewMaxHeight : alertViewHeight;
        self.alertView.frame = alertViewFrame;
        
        CGRect containerFrame = self.containerView.frame;
        containerFrame.size.width = alertViewFrame.size.width;
        containerFrame.size.height = alertViewFrame.size.height;
        containerFrame.origin.x = (viewWidth - alertViewMaxWidth) * 0.5f + offset.x;
        containerFrame.origin.y = (viewHeight - alertViewFrame.size.height) * 0.5f + offset.y;
        self.containerView.frame = containerFrame;
    }
    self.containerView.transform = transform;
}

- (CGFloat)updateAlertItemsLayoutWithMaxWidth:(CGFloat)alertViewMaxWidth {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    __block CGFloat alertViewHeight = 0.0f;
    [self.alertItemArray enumerateObjectsUsingBlock:^(id  _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) alertViewHeight += self.config.modelHeaderInsets.top;
        if ([item isKindOfClass:UIView.class]) {
            DYAlertItemView *view = (DYAlertItemView *)item;
            CGRect viewFrame = view.frame;
            viewFrame.origin.x = self.config.modelHeaderInsets.left + view.item.insets.left + VIEWSAFEAREAINSETS(view).left;
            viewFrame.origin.y = alertViewHeight + view.item.insets.top;
            viewFrame.size.width = alertViewMaxWidth - viewFrame.origin.x - self.config.modelHeaderInsets.right - view.item.insets.right - VIEWSAFEAREAINSETS(view).left - VIEWSAFEAREAINSETS(view).right;
            if ([item isKindOfClass:UILabel.class]) viewFrame.size.height = [item sizeThatFits:CGSizeMake(viewFrame.size.width, MAXFLOAT)].height;
            view.frame = viewFrame;
            alertViewHeight += view.frame.size.height + view.item.insets.top + view.item.insets.bottom;
        } else if ([item isKindOfClass:DYAlertCustomView.class]) {
            DYAlertCustomView *custom = (DYAlertCustomView *)item;
            CGRect viewFrame = custom.container.frame;
            if (custom.isAutoWidth) {
                custom.positionType = DYAlertCustomViewPositionTypeCenter;
                viewFrame.size.width = alertViewMaxWidth - self.config.modelHeaderInsets.left - custom.item.insets.left - self.config.modelHeaderInsets.right - custom.item.insets.right;
            }
            
            switch (custom.positionType) {
                case DYAlertCustomViewPositionTypeCenter:
                    viewFrame.origin.x = (alertViewMaxWidth - viewFrame.size.width) * 0.5f;
                    break;
                case DYAlertCustomViewPositionTypeLeft:
                    viewFrame.origin.x = self.config.modelHeaderInsets.left + custom.item.insets.left;
                    break;
                case DYAlertCustomViewPositionTypeRight:
                    viewFrame.origin.x = alertViewMaxWidth - self.config.modelHeaderInsets.right - custom.item.insets.right - viewFrame.size.width;
                    break;
                default:
                    break;
            }
            
            viewFrame.origin.y = alertViewHeight + custom.item.insets.top;
            custom.container.frame = viewFrame;
            alertViewHeight += viewFrame.size.height + custom.item.insets.top + custom.item.insets.bottom;
        }
        
        if (item == self.alertItemArray.lastObject) alertViewHeight += self.config.modelHeaderInsets.bottom;
    }];
    
    NSInteger alertActionCount = self.alertActionArray.count;
    for (int i = 0; i < alertActionCount; i++) {
        DYAlertActionButton *button = self.alertActionArray[i];
        CGRect buttonFrame = button.frame;
        
        if (i == 0 && UIEdgeInsetsEqualToEdgeInsets(button.action.insets, UIEdgeInsetsZero)) {
            // 15 是左默认间距
            buttonFrame.origin.x = 15;
        } else {
            buttonFrame.origin.x = button.action.insets.left;
        }
        
        if (i == alertActionCount - 1 && UIEdgeInsetsEqualToEdgeInsets(button.action.insets, UIEdgeInsetsZero)) {
            // 15 分别是左右默认间距
            buttonFrame.size.width = alertViewMaxWidth - 15 - 15;
        } else {
            buttonFrame.size.width = alertViewMaxWidth - button.action.insets.left - button.action.insets.right;
        }
        
        buttonFrame.origin.y = alertViewHeight + button.action.insets.top;
        button.frame = buttonFrame;
        alertViewHeight += buttonFrame.size.height + button.action.insets.top + button.action.insets.bottom;
    }
    
    if (self.alertActionArray.count == 2) {
        DYAlertActionButton *buttonA = self.alertActionArray.count == self.config.modelActionArray.count ? self.alertActionArray.firstObject : self.alertActionArray.lastObject;
        DYAlertActionButton *buttonB = self.alertActionArray.count == self.config.modelActionArray.count ? self.alertActionArray.lastObject : self.alertActionArray.firstObject;
        
        UIEdgeInsets buttonAInsets = buttonA.action.insets;
        UIEdgeInsets buttonBInsets = buttonB.action.insets;
        
        CGFloat buttonAHeight = CGRectGetHeight(buttonA.frame) + buttonAInsets.top + buttonAInsets.bottom;
        CGFloat buttonBHeight = CGRectGetHeight(buttonB.frame) + buttonBInsets.top + buttonBInsets.bottom;
                
        CGFloat minHeight = buttonAHeight < buttonBHeight ? buttonAHeight : buttonBHeight;
        CGFloat minY = (buttonA.frame.origin.y - buttonAInsets.top) > (buttonB.frame.origin.y - buttonBInsets.top) ? (buttonB.frame.origin.y - buttonBInsets.top) : (buttonA.frame.origin.y - buttonAInsets.top);
        
        if (UIEdgeInsetsEqualToEdgeInsets(buttonA.action.insets, UIEdgeInsetsZero)) {
            buttonA.frame = CGRectMake(15, minY + buttonAInsets.top, (alertViewMaxWidth / 2) - 15 - buttonAInsets.right, buttonA.frame.size.height);
        } else {
            buttonA.frame = CGRectMake(buttonAInsets.left, minY + buttonAInsets.top, (alertViewMaxWidth / 2) - buttonAInsets.left - buttonAInsets.right, buttonA.frame.size.height);
        }
        
        if (UIEdgeInsetsEqualToEdgeInsets(buttonB.action.insets, UIEdgeInsetsZero)) {
            buttonB.frame = CGRectMake((alertViewMaxWidth / 2) + buttonBInsets.left, minY + buttonBInsets.top, (alertViewMaxWidth / 2) - buttonBInsets.left - 15, buttonB.frame.size.height);
        } else {
            buttonB.frame = CGRectMake((alertViewMaxWidth / 2) + buttonBInsets.left, minY + buttonBInsets.top, (alertViewMaxWidth / 2) - buttonBInsets.left - buttonBInsets.right, buttonB.frame.size.height);
        }
        alertViewHeight -= minHeight;
    }
    
    self.alertView.contentSize = CGSizeMake(alertViewMaxWidth, alertViewHeight);
    [CATransaction commit];
    return alertViewHeight + 10;
}

- (void)configAlert {
    __weak typeof(self) weakSelf = self;
    _containerView = [UIView new];
    [self.view addSubview: _containerView];
    
    [self.containerView addSubview: self.alertView];
    self.alertView.scrollEnabled = self.config.modelIsScrollEnabled;
    
    self.alertView.DY_alert_cornerRadii = self.config.modelCornerRadii;
    [self.config.modelItemArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        void (^itemBlock)(DYAlertItem *) = obj;
        DYAlertItem *item = [[DYAlertItem alloc] init];
        if (itemBlock) itemBlock(item);
        NSValue *insetValue = [self.config.modelItemInsetsInfo objectForKey:@(idx)];
        if (insetValue) item.insets = insetValue.UIEdgeInsetsValue;
        switch (item.type) {
            case DYAlertItemTypeTitle: {
                void(^block)(UILabel *label) = item.block;
                DYAlertItemLabel *label = [DYAlertItemLabel label];
                [self.alertView addSubview:label];
                [self.alertItemArray addObject:label];
                
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:18.f weight:UIFontWeightHeavy];
                label.numberOfLines = 0;
                
                if (block) block(label);
                label.item = item;
                label.textChangedBlock = ^{
                    if (weakSelf) [weakSelf updateAlertLayout];
                };
            }
                break;
            case DYAlertItemTypeContent: {
                void(^block)(UILabel *label) = item.block;
                DYAlertItemLabel *label = [DYAlertItemLabel label];
                [self.alertView addSubview:label];
                [self.alertItemArray addObject:label];
                
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
                label.numberOfLines = 0;
                
                if (block) block(label);
                label.item = item;
                label.textChangedBlock = ^{
                    if (weakSelf) [weakSelf updateAlertLayout];
                };
            }
                break;
                
            case DYAlertItemTypeCustomView: {
                void(^block)(DYAlertCustomView *) = item.block;
                DYAlertCustomView *custom = [[DYAlertCustomView alloc] init];
                block(custom);
                [self.alertView addSubview:custom.container];
                [self.alertItemArray addObject:custom];
                
                custom.item = item;
                custom.sizeChangedBlock = ^{
                    if (weakSelf) [weakSelf updateAlertLayout];
                };
            }
                break;
            default:
                break;
        }
    }];
    
    [self.config.modelActionArray enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL * _Nonnull stop) {
        void (^block)(DYAction *action) = item;
        DYAction *action = [[DYAction alloc] init];
        if (block) block(action);
        if (!action.font) action.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightHeavy];
        if (!action.title) action.title = @"";
        if (!action.titleColor) {
            if (action.type == DYActionTypeDefault) {
            } else {
                action.titleColor = [UIColor colorWithRed:21/255.0f green:123/255.0f blue:245/255.0f alpha:1.0f];
            }
        }
                
        if (!action.backgroundImage) {
        }
        
        if (!action.backgroundColor) action.backgroundColor = self.config.modelHeaderColor;
        
        if (!action.backgroundHighlightColor) {
            if (@available(iOS 13.0, *)) {
                action.backgroundHighlightColor = [UIColor systemGray6Color];
                
            } else {
                action.backgroundHighlightColor = [UIColor colorWithWhite:0.97 alpha:1.0f];
            }
        }
        
        if (!action.height) action.height = 65.0f;
        DYAlertActionButton *button = [DYAlertActionButton button];
        button.action = action;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:button];
        [self.alertActionArray addObject:button];
        
        button.heightChangedBlock = ^{
            if (weakSelf) [weakSelf updateAlertLayout];
        };
    }];
    
    // 更新布局
    [self updateAlertLayout];
    [self showAnimationsWithCompletionBlock:^{
        if (weakSelf) [weakSelf updateAlertLayout];
    }];
}

- (void)buttonAction:(DYAlertActionButton *)sender {
    BOOL isClose = NO;
    void (^clickBlock)(void) = nil;
    
    switch (sender.action.type) {
        case DYActionTypeDefault:
            isClose = sender.action.isClickNotClose ? NO : YES;
            break;
            
        case DYActionTypeCancel:
            isClose = YES;
            break;
            
        default:
            break;
    }
    
    clickBlock = sender.action.clickBlock;
    NSInteger index = [self.alertActionArray indexOfObject:sender];
    if (isClose) {
        if (self.config.modelShouldActionClickClose && !self.config.modelShouldActionClickClose(index)) return;
        [self closeAnimationsWithCompletionBlock:^{
            if (clickBlock) clickBlock();
        }];
    } else {
        if (clickBlock) clickBlock();
    }
}

#pragma mark start animations

- (void)showAnimationsWithCompletionBlock:(void (^)(void))completionBlock {
    [super showAnimationsWithCompletionBlock:completionBlock];
    
    if (self.isShowing) return;
    self.isShowing = YES;
    
    CGFloat viewWidth = VIEW_WIDTH;
    CGFloat viewHeight = VIEW_HEIGHT;
    CGRect containerFrame = self.containerView.frame;
    
    if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleOrientationNone) {
        containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
        containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
    } else if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleOrientationTop) {
        containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
        containerFrame.origin.y = 0 - containerFrame.size.height;
    } else if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleOrientationBottom) {
        containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
        containerFrame.origin.y = viewHeight;
    } else if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleOrientationLeft) {
        containerFrame.origin.x = 0 - containerFrame.size.width;
        containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
    } else if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleOrientationRight) {
        containerFrame.origin.x = viewWidth;
        containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
    }
    
    self.containerView.frame = containerFrame;
    if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleFade) self.containerView.alpha = 0.0f;
    if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleZoomEnlarge) self.containerView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    if (self.config.modelOpenAnimationStyle & DYAlertAnimationStyleZoomShrink) self.containerView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
    
    __weak typeof(self) weakSelf = self;
    if (self.config.modelOpenAnimationConfigBlock) self.config.modelOpenAnimationConfigBlock(^{
        if (!weakSelf) return ;
        if (weakSelf.config.modelBackgroundStyle == DYBackgroundStyleTranslucent) {
            weakSelf.view.backgroundColor = [weakSelf.view.backgroundColor colorWithAlphaComponent:weakSelf.config.modelBackgroundStyleColorAlpha];
        } else if (weakSelf.config.modelBackgroundStyle == DYBackgroundStyleBlur) {
            weakSelf.backgroundVisualEffectView.effect = [UIBlurEffect effectWithStyle:weakSelf.config.modelBackgroundBlurEffectStyle];
        }
        
        CGRect containerFrame = weakSelf.containerView.frame;
        containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
        containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
        
        weakSelf.containerView.frame = containerFrame;
        weakSelf.containerView.alpha = 1.0f;
        weakSelf.containerView.transform = CGAffineTransformIdentity;
    }, ^{
        if (!weakSelf) return ;
        weakSelf.isShowing = NO;
        [weakSelf.view setUserInteractionEnabled:YES];
        if (weakSelf.openFinishBlock) weakSelf.openFinishBlock();
        if (completionBlock) completionBlock();
    });
    
}

#pragma mark close animations

- (void)closeAnimationsWithCompletionBlock:(void (^)(void))completionBlock {
    [super closeAnimationsWithCompletionBlock:completionBlock];
    
    if (self.isClosing) return;
    if (self.config.modelShouldClose && !self.config.modelShouldClose()) return;
    
    self.isClosing = YES;
    
    CGFloat viewWidth = VIEW_WIDTH;
    CGFloat viewHeight = VIEW_HEIGHT;
    
    __weak typeof(self) weakSelf = self;
    if (self.config.modelCloseAnimationConfigBlock) self.config.modelCloseAnimationConfigBlock(^{
        if (!weakSelf) return ;
        if (weakSelf.config.modelBackgroundStyle == DYBackgroundStyleTranslucent) {
            weakSelf.view.backgroundColor = [weakSelf.view.backgroundColor colorWithAlphaComponent:0.0f];
        } else if (weakSelf.config.modelBackgroundStyle == DYBackgroundStyleBlur) {
            weakSelf.backgroundVisualEffectView.alpha = 0.0f;
        }
        
        CGRect containerFrame = weakSelf.containerView.frame;
        if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleOrientationNone) {
            containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
            containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
        } else if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleOrientationTop) {
            containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
            containerFrame.origin.y = 0 - containerFrame.size.height;
        } else if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleOrientationBottom) {
            containerFrame.origin.x = (viewWidth - containerFrame.size.width) * 0.5f;
            containerFrame.origin.y = viewHeight;
        } else if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleOrientationLeft) {
            containerFrame.origin.x = 0 - containerFrame.size.width;
            containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
        } else if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleOrientationRight) {
            containerFrame.origin.x = viewWidth;
            containerFrame.origin.y = (viewHeight - containerFrame.size.height) * 0.5f;
        }
        
        weakSelf.containerView.frame = containerFrame;
        if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleFade) weakSelf.containerView.alpha = 0.0f;
        if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleZoomEnlarge) weakSelf.containerView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
        if (weakSelf.config.modelCloseAnimationStyle & DYAlertAnimationStyleZoomShrink) weakSelf.containerView.transform = CGAffineTransformMakeScale(0.6f, 0.6f);
    }, ^{
        
        if (!weakSelf) return ;
        weakSelf.isClosing = NO;
        if (weakSelf.closeFinishBlock) weakSelf.closeFinishBlock();
        if (completionBlock) completionBlock();
    });
    
}

#pragma mark Tool

- (UIView *)findFirstResponder:(UIView *)view {
    if (view.isFirstResponder) return view;
    
    for (UIView *subView in view.subviews) {
        UIView *firstResponder = [self findFirstResponder:subView];
        if (firstResponder) return firstResponder;
    }
    return nil;
}

#pragma mark delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return (touch.view == self.alertView) ? YES : NO;
}

#pragma mark LazyLoading

- (UIScrollView *)alertView {
    if (!_alertView) {
        _alertView = [[UIScrollView alloc] init];
        _alertView.backgroundColor = self.config.modelHeaderColor;
        _alertView.directionalLockEnabled = YES;
        _alertView.bounces = NO;
    }
    return _alertView;
}

- (NSMutableArray *)alertItemArray {
    if (!_alertItemArray) _alertItemArray = [NSMutableArray array];
    return _alertItemArray;
}

- (NSMutableArray <DYAlertActionButton *>*)alertActionArray {
    if (!_alertActionArray) _alertActionArray = [NSMutableArray array];
    return _alertActionArray;
}

@end

@interface DYAlertBaseConfig ()<DYAlertProtocol>

@property (nonatomic, assign) BOOL isShowing;

- (void)show;

@end

@implementation DYAlertBaseConfig

- (void)dealloc {
    _config = nil;
}

- (nonnull instancetype)init {
    if (self = [super init]) {
        self.isShowing = NO;
        __weak typeof(self) weakSelf = self;
        self.config.modelFinishConfig = ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!strongSelf) return;
            if ([DYAlert shareManager].queueArray.count) {
                DYAlertBaseConfig *last = [DYAlert shareManager].queueArray.lastObject;
                
                // 当前未加入队列，同时已显示的优先级高于当前，则跳过
                if (!strongSelf.config.modelIsQueue && last.config.modelQueuePriority > strongSelf.config.modelQueuePriority) return;
                
                // 已显示的未加入队列，同时已显示的优先级小于等于当前，关闭已显示的并移除
                if (!last.config.modelIsQueue && last.config.modelQueuePriority <= strongSelf.config.modelQueuePriority) {
                    [last close];
                    [[DYAlert shareManager].queueArray removeObject:last];
                }
                
                // 已显示的已加入队列，同时已显示的优先级小于等于当前，关闭已显示的不移除
                if (last.config.modelIsQueue && last.config.modelQueuePriority <= strongSelf.config.modelQueuePriority) {
                    [last close];
                }
                
                if (![[DYAlert shareManager].queueArray containsObject:strongSelf]) {
                    [[DYAlert shareManager].queueArray addObject:strongSelf];
                    [[DYAlert shareManager].queueArray sortUsingComparator:^NSComparisonResult(DYAlertBaseConfig *configA, DYAlertBaseConfig *configB) {
                        return configA.config.modelQueuePriority > configB.config.modelQueuePriority ? NSOrderedDescending
                        : configA.config.modelQueuePriority == configB.config.modelQueuePriority ? NSOrderedSame : NSOrderedAscending;
                    }];
                }
                
                if ([DYAlert shareManager].queueArray.lastObject == strongSelf) [strongSelf show];
            } else {
                [strongSelf show];
                [[DYAlert shareManager].queueArray addObject:strongSelf];
            }
        };
    }
    return self;
}

- (void)show {
    if (![DYAlert shareManager].viewController) return;
    [DYAlert shareManager].viewController.config = self.config;
    if ([self.config.modelPresentation isKindOfClass:DYAlertPresentationWindow.class]) {
        DYAlertPresentationWindow *presentation = (DYAlertPresentationWindow *)self.config.modelPresentation;
        [DYAlert shareManager].DYWindow.rootViewController = [DYAlert shareManager].viewController;
        [DYAlert shareManager].DYWindow.windowLevel = presentation.windowLevel;
        [DYAlert shareManager].DYWindow.hidden = NO;
        [[DYAlert shareManager].DYWindow makeKeyAndVisible];
        self.isShowing = YES;
    }
    
    if ([self.config.modelPresentation isKindOfClass:DYAlertPresentationViewController.class]) {
        DYAlertPresentationViewController *presentation = (DYAlertPresentationViewController *)self.config.modelPresentation;
        if (!presentation.viewController) return;
        
        [presentation.viewController addChildViewController:[DYAlert shareManager].viewController];
        [presentation.viewController.view addSubview:[DYAlert shareManager].viewController.view];
        
        [DYAlert shareManager].viewController.view.frame = presentation.viewController.view.bounds;
        [DYAlert shareManager].viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [[DYAlert shareManager].viewController didMoveToParentViewController:presentation.viewController];
        
        self.isShowing = YES;
    }
    
    __weak typeof(self) weakSelf = self;
    [DYAlert shareManager].viewController.openFinishBlock = ^{
    };
    
    [DYAlert shareManager].viewController.closeFinishBlock = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (!strongSelf) return;
        
        if ([DYAlert shareManager].queueArray.lastObject == strongSelf) {
            [strongSelf close];
            [[DYAlert shareManager].queueArray removeObject:strongSelf];
            if (strongSelf.config.modelIsContinueQueueDisplay) [DYAlert continueQueueDisplay];
        } else {
            [[DYAlert shareManager].queueArray removeObject:strongSelf];
        }
        
        if (strongSelf.config.modelCloseComplete) strongSelf.config.modelCloseComplete();
    };
}

- (void)close {
    if (!self.isShowing) {
        DYLogError(@"没有正常释放DYAlertWindow \n CallStack:%@", NSThread.callStackSymbols);
        NSAssert(NO, @"没有正常释放DYAlertWindow \n CallStack:%@", NSThread.callStackSymbols);
        return;
    }
    
    if ([self.config.modelPresentation isKindOfClass:DYAlertPresentationWindow.class]) {
        [DYAlert shareManager].DYWindow.hidden = YES;
        [[DYAlert shareManager].DYWindow resignKeyWindow];
        [DYAlert shareManager].DYWindow.rootViewController = nil;
        // 在频繁进退房的情况下，有可能导致DYAlertWindow被设置为keywindow，导致UI响应事件被拦截。怀疑是某个地方从windows取出了DYAlertWindow设置为keywindow导致的，现改为 close 的情况下直接销毁 DYAlertWindow
        [DYAlert shareManager].DYWindow = nil;
    }
    
    if ([self.config.modelPresentation isKindOfClass:DYAlertPresentationViewController.class]) {
        [[DYAlert shareManager].viewController willMoveToParentViewController:nil];
        [[DYAlert shareManager].viewController.view removeFromSuperview];
        [[DYAlert shareManager].viewController removeFromParentViewController];
    }
    
    [DYAlert shareManager].viewController = nil;
}

- (void)closeWithCompletionBlock:(void (^)(void))completionBlock {
    if ([DYAlert shareManager].viewController) [[DYAlert shareManager].viewController closeAnimationsWithCompletionBlock:completionBlock];
}

#pragma mark - LazyLoading

- (DYAlertBaseConfigModel *)config {
    if (!_config) _config = [[DYAlertBaseConfigModel alloc] init];
    return _config;
}

@end

@implementation DYAlertConfig

- (instancetype)init {
    if (self = [super init]) {
        self.config
        .dyConfigMaxWidth(^CGFloat(CGSize size) {
            return 260.0f;
        })
        .dyConfigMaxHeight(^CGFloat(CGSize size) {
            return size.height - 40.0f - VIEWSAFEAREAINSETS([DYAlert getAlertWindow]).top - VIEWSAFEAREAINSETS([DYAlert getAlertWindow]).bottom;
        })
        .dyOpenAnimationStyle(DYAlertAnimationStyleOrientationNone | DYAlertAnimationStyleFade | DYAlertAnimationStyleZoomEnlarge)
        .dyCloseAnimationStyle(DYAlertAnimationStyleOrientationNone | DYAlertAnimationStyleFade | DYAlertAnimationStyleZoomShrink);
    }
    return self;
}

- (void)show {
    [DYAlert shareManager].viewController = [[DYAlertViewController alloc] init];
    [super show];
}

@end
