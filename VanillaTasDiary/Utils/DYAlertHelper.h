#ifndef DYAlertHelper_h
#define DYAlertHelper_h

@class DYAlert
, DYAlertBaseConfig
, DYAlertConfig
, DYAlertBaseConfigModel
, DYAlertWindow
, DYAction
, DYAlertItem
, DYAlertCustomView
, DYAlertPresentation;

typedef NS_ENUM(NSInteger, DYAlertType) {
    DYAlertTypeAlert,
};


typedef NS_ENUM(NSInteger, DYActionType) {
    /** 默认 */
    DYActionTypeDefault,
    /** 取消 */
    DYActionTypeCancel,
};


typedef NS_ENUM(NSInteger, DYAlertItemType) {
    /** 标题 */
    DYAlertItemTypeTitle,
    /** 内容 */
    DYAlertItemTypeContent,
    /** 自定义视图 */
    DYAlertItemTypeCustomView,
};


typedef NS_ENUM(NSInteger, DYAlertCustomViewPositionType) {
    /** 居中 */
    DYAlertCustomViewPositionTypeCenter,
    /** 靠左 */
    DYAlertCustomViewPositionTypeLeft,
    /** 靠右 */
    DYAlertCustomViewPositionTypeRight
};

typedef NS_OPTIONS(NSInteger, DYAlertAnimationStyle) {
    /** 动画样式方向 默认 */
    DYAlertAnimationStyleOrientationNone    = 1 << 0,
    /** 动画样式方向 上 */
    DYAlertAnimationStyleOrientationTop     = 1 << 1,
    /** 动画样式方向 下 */
    DYAlertAnimationStyleOrientationBottom  = 1 << 2,
    /** 动画样式方向 左 */
    DYAlertAnimationStyleOrientationLeft    = 1 << 3,
    /** 动画样式方向 右 */
    DYAlertAnimationStyleOrientationRight   = 1 << 4,
    
    /** 动画样式 淡入淡出 */
    DYAlertAnimationStyleFade               = 1 << 12,
    
    /** 动画样式 缩放 放大 */
    DYAlertAnimationStyleZoomEnlarge        = 1 << 24,
    /** 动画样式 缩放 缩小 */
    DYAlertAnimationStyleZoomShrink         = 2 << 24,
};

typedef struct {
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRight;
} CornerRadii;

NS_ASSUME_NONNULL_BEGIN
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfig)(void);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToAny)(id any);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBool)(BOOL is);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToInteger)(NSInteger number);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToFloat)(CGFloat number);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToString)(NSString *str);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToView)(UIView *view);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToColor)(UIColor *color);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToSize)(CGSize size);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToPoint)(CGPoint point);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToEdgeInsets)(UIEdgeInsets insets);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToPresentation)(DYAlertPresentation *presentation);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToAnimationStyle)(DYAlertAnimationStyle style);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBlurEffectStyle)(UIBlurEffectStyle style);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToInterfaceOrientationMask)(UIInterfaceOrientationMask);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToReturnMaxSize)(CGFloat(^)(CGSize size));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToAction)(void(^)(DYAction *action));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToCustomView)(void(^)(DYAlertCustomView *custom));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToCornerRadii)(CornerRadii);
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToStringAndBlock)(NSString *str, void (^ _Nullable)(void));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToAttributeStringAndBlock)(NSAttributedString *attrStr, void (^ _Nullable)(void));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToConfigLabel)(void(^ _Nullable)(UILabel *label));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToConfigTextField)(void(^ _Nullable)(UITextField *textField));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToItem)(void(^)(DYAlertItem *item));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBlock)(void(^block)(void));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBlockReturnBool)(BOOL(^block)(void));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBlockIntegerReturnBool)(BOOL(^block)(NSInteger index));
typedef DYAlertBaseConfigModel * _Nonnull (^DYConfigToBlockAndBlock)(void(^)(void (^animatingBlock)(void) , void (^animatedBlock)(void)));
NS_ASSUME_NONNULL_END

#endif /* DYAlertHelper_h */
