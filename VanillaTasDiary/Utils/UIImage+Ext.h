//
//  UIImage+Ext.h
//  SampleBroadcaster
//
//  Created by 
//  Copyright © 2016年 videocore. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIImage (Ext)

/**
 *	@brief 获取圆形头像
 *
 *	@param 	icon 	图片名称
 *
 *	@param 	bWidth     描边宽
 *
 *	@return	UIImage 重绘后的图片
 */

+(UIImage*) circleImage:(UIImage*) image borderWidth:(CGFloat) bWidth;

//圆形图片
+(UIImage*) circleImage:(UIImage*) image borderWidth:(CGFloat) bWidth borderColor:(UIColor *) color;

/**
 *	@brief	根据颜色和尺寸获得一张图片
 *
 *	@param 	color 	图片颜色
 *	@param 	size 	图片尺寸
 *
 *	@return	UIImage 返回绘制的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *    @brief 缩放
 *
 *    @param     image     图片
 *    @param     value     图片尺寸
 *
 *    @return    UIImage 返回绘制的图片
 */
+(UIImage *)scaleImageToSize:(UIImage *)image toSquare:(CGFloat)value;
/**
 *	@brief 等比例缩放
 *
 *	@param 	image 	图片
 *	@param 	size 	图片尺寸
 *
 *	@return	UIImage 返回绘制的图片
 */
+(UIImage*)scaleToSize:(UIImage*)image toScale:(CGSize)asize;
+(UIImage *)scaleToSize:(UIImage *)image toSquare:(CGFloat)value;
/**
 *	@brief 获取视频的缩略图
 *
 *	@param 	image 	图片
 *	@param 	size 	图片尺寸
 *
 *	@return	UIImage 返回绘制的图片
 */
+ (UIImage *)squareToSize:(UIImage *)image toScale:(CGSize)reSize;


//指定宽度按比例缩放
+(UIImage *) scaleToWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

//根据指定区域截取图片
+ (UIImage *)clipImageInRect:(CGRect)rect rawImg:(UIImage *) oldImg;


//在图片上添加水印
+ (instancetype)waterMarkWithImageName:(UIImage *)backgroundImage andMarkImageName:(UIImage *)markName;

//截屏，指定图层
+(UIImage *)screenShot:(CALayer *) targetLayer;

//截屏，指定图层
+(UIImage *)screenShot:(CALayer *) targetLayer targetRect:(CGRect)tRect;

//截屏，整个屏幕
+ (UIImage *)fullScreenshot;

+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;

//获得某个范围内的屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r;

//图片去色
+(UIImage *)grayImage:(UIImage *)sourceImage;

//将文字转成图片
+(UIImage *)imageFromText:(NSArray*) arrContent withFont: (CGFloat)fontSize;

/**
 * 返回一张可以随意拉伸不变形的图片
 *
 * @param name 图片名称
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName;

+ (UIImage *)resizableImageWithImage:(UIImage *)image;

/**
 * 多张图片合成一张
 * @param rect
 * @param imgArray 图片数组
 * @param imgPointArray 图片坐标
 */
+(UIImage *) mergedImageOnRect:(CGRect)rect WithImageArray:(NSArray *)imgArray AndImageRectArray:(NSArray *)imgRectArray;

/**
 * 给某张图片添加背景图，两张图片合成一张，两张图片必须一样大
 * @param originImage 原图
 * @param backgroundImage 背景图
 * @return 返回合成后的图片
 */
+ (UIImage *)mergeImage:(UIImage *)originImage backgroundImage:(UIImage *)backgroundImage;

//计算图片大小kb
+ (CGFloat)calulateImageFileSize:(UIImage *)image;

/**
 生成一张渐变色的图片
 @param colors 颜色数组
 @param rect 图片大小
 @return 返回渐变图片
 */
+ (UIImage *)gradientImageWithColors:(NSArray *)colors
                                rect:(CGRect)rect
                        cornerRadius:(float) radius;

/**
生成一张渐变色的图片
@param colors 颜色数组
@param size 图片大小
@return 返回渐变图片
*/
+ (UIImage *)gradientImageWithColors:(NSArray *)colors
                                size:(CGSize)size
                        cornerRadius:(float) radius;

/**
 旋转图片
 */
+ (UIImage *)image:(UIImage *)image
          rotation:(UIImageOrientation)orientation;

/**
 返回指定大小，颜色，渐变模式的渐变色图片
 */
+ (UIImage *)gradientColorImageFromColors:(NSArray<UIColor *>*)colors
                             gradientType:(GradientType)gradientType
                                  imgSize:(CGSize)imgSize;

//生成一张指定颜色、尺寸、圆角的图片
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius;

//中间点拉伸图片
- (UIImage *)resizeImageByCenter;

//生成二维码
+ (UIImage *)QRCodeGenerateByURL:(NSString *)urlString centerImage:(UIImage *)cImage;

//将图片压缩至某个文件大小之内
+ (UIImage *)compressQualityWithOriginalImage:(UIImage *)originalImg andMaxLength:(NSInteger)maxLength;

///缩放图片(根据机型使用缩放倍图)
+ (UIImage *)imageByResizeWithImage:(UIImage *)image toSize:(CGSize)size;

/// 设置图片透明度
/// @param alpha 透明度
/// @param image 图片
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage *)image;


/// 图片高斯模糊效果
/// @param image 图片
/// @param blur 模糊系数(取值范围 0.0 - 1.0)
+ (UIImage*)imageBlurImage:(UIImage *)image WithBlurNumber:(CGFloat)blur;

/// 拉伸图片
+ (UIImage *)dy_resizableImageWith:(UIImage *)image originalSize:(CGSize)originalSize capInsets:(UIEdgeInsets)capInsets;

@end
