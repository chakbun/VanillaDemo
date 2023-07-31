//
//  UIImage+Ext.m
//  SampleBroadcaster
//
//  Created by 
//  Copyright © 2016年 videocore. All rights reserved.
//

#import "UIImage+Ext.h"
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import <Accelerate/Accelerate.h>

#if __has_include(<YYWebImage/UIImage+YYWebImage.h>)
#import <YYWebImage/UIImage+YYWebImage.h>
#import <YYWebImage/YYWebImageManager.h>
#else
#endif

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation UIImage (Ext)

#ifdef INTELNAL_VERSION

+ (void)load {
    Method imageNamedMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method home_imageNamedMethod = class_getClassMethod([UIImage class], @selector(dy_hook_imageNamed:));
    method_exchangeImplementations(imageNamedMethod, home_imageNamedMethod);
}

+ (__kindof UIImage *)dy_hook_imageNamed:(NSString *)imageName {
    UIImage *img = [UIImage dy_hook_imageNamed:imageName];
    if (img == nil && imageName != nil) {
//        NSString *descStr = [NSString stringWithFormat:@"%@,图片为空", imageName];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
//                                                      message:descStr
//                                                     delegate:nil
//                                            cancelButtonTitle:NSLocalizedString(@"继续",nil)
//                                            otherButtonTitles:NSLocalizedString(@"退出",nil), nil];
//        [alert show];
    }
    return img;
}

#endif


//圆形图片
+(UIImage*) circleImage:(UIImage*) image borderWidth:(CGFloat) bWidth
{
    return [self circleImage:image borderWidth:bWidth borderColor:nil];
}

//圆形图片
+(UIImage*) circleImage:(UIImage*) image borderWidth:(CGFloat) bWidth borderColor:(UIColor *) color
{
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (bWidth > 0) {
        CGContextSetLineWidth(context, bWidth);
    }
    UIColor *borderColor = color;
    if (bWidth > 0 && !borderColor) {
        borderColor = [UIColor lightGrayColor];
    }
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    if (bWidth > 0) {
        CGContextStrokePath(context);
    }
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}



//根据颜色和尺寸获得一张图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//缩放
+(UIImage *)scaleImageToSize:(UIImage *)image toSquare:(CGFloat)value
{
    CGSize oldsize = image.size;
    CGRect rect;
    UIImage *newimage;
    CGImageRef imageRef;
    if (oldsize.width >value || oldsize.height>value)
    {
        CGFloat scaledWidth = value;
        CGFloat scaledHeight = value;
        if (oldsize.width > oldsize.height)
        {
            scaledHeight =oldsize.height*(value/oldsize.width);
            rect.size.width = value;
            rect.size.height = scaledHeight;
            rect.origin.x = 0;
            rect.origin.y = 0;
        } else {
            scaledWidth =oldsize.width*(value/oldsize.height);
            rect.size.width = scaledWidth;
            rect.size.height = value;
            rect.origin.x = 0;
            rect.origin.y = 0;
        }
        UIGraphicsBeginImageContext(oldsize); // this will crop
        [image drawInRect:CGRectMake(0,0,scaledWidth,scaledHeight)];
        UIImage* newImage1= UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        imageRef = CGImageCreateWithImageInRect([newImage1 CGImage], rect);
        newimage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }else{
        return image;
    }
    return newimage;
    
}
//等比例缩放
+(UIImage *)scaleToSize:(UIImage *)image toScale:(CGSize)asize
{
    CGSize oldsize = image.size;
    CGRect rect;
    if (asize.width/asize.height > oldsize.width/oldsize.height)
    {
        rect.size.width = asize.height*oldsize.width/oldsize.height;
        rect.size.height = asize.height;
        rect.origin.x = (asize.width - rect.size.width)/2;
        rect.origin.y = 0;
        
    } else {
        rect.size.width = asize.width;
        rect.size.height = asize.width*oldsize.height/oldsize.width;
        rect.origin.x = 0;
        rect.origin.y = (asize.height - rect.size.height)/2;
    }
    
    UIGraphicsBeginImageContextWithOptions(asize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
    [image drawInRect:rect];
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
    
}

//等比例缩放
+(UIImage *)scaleToSize:(UIImage *)image toSquare:(CGFloat)value
{
    CGSize oldsize = image.size;
    CGRect rect;
    UIImage *newimage;
    CGImageRef imageRef;
    if (oldsize.width >value&& oldsize.height>value)
    {
        CGFloat scaledWidth = value;
        CGFloat scaledHeight = value;
        if (oldsize.width > oldsize.height)
        {
            scaledWidth =oldsize.width/(oldsize.height/value);
            rect.size.width = value;
            rect.size.height = value;
            rect.origin.x = (scaledWidth - value)/2;
            rect.origin.x = (oldsize.width - oldsize.height)/2;
            rect.origin.y = 0;
        } else {
            scaledHeight =oldsize.height/(oldsize.width/value);
            rect.size.width = value;
            rect.size.height = value;
            rect.origin.x = 0;
            rect.origin.y = (scaledHeight - value)/2;
        }
        UIGraphicsBeginImageContext(oldsize); // this will crop
        [image drawInRect:CGRectMake(0,0,scaledWidth,scaledHeight)];
        UIImage* newImage1= UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        imageRef = CGImageCreateWithImageInRect([newImage1 CGImage], rect);
        newimage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }else if (oldsize.width >value)
    {
        rect.size.width = value;
        rect.size.height = oldsize.height;
        rect.origin.x = (oldsize.width - value)/2;
        rect.origin.y = 0;
        imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
        newimage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }else if (oldsize.height >value){
        rect.size.width = oldsize.width;
        rect.size.height = value;
        rect.origin.x = 0;
        rect.origin.y = (oldsize.height - value)/2;
        imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
        newimage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }else{
        return image;
    }
    return newimage;
    
}
//指定宽度按比例缩放
+(UIImage *) scaleToWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        DYLogInfo(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}

//根据指定区域截取图片
+ (UIImage *)clipImageInRect:(CGRect)rect rawImg:(UIImage *) oldImg
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([oldImg CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}
//正方形
+ (UIImage *)squareToSize:(UIImage *)image toScale:(CGSize)reSize
{
    
    CGRect rect;
    if(reSize.height<reSize.width)
    {
        rect = CGRectMake((reSize.width - reSize.height)/2.0, 0, reSize.height, reSize.height);
    }else{
        rect = CGRectMake(0, (reSize.height - reSize.width)/2.0, reSize.width, reSize.width);
    }
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, rect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    return smallImage;
}


//获取视频缩略图
+ (UIImage *)movieToImageWithUrl:(NSURL *) videoURL
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = 0;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 15) actualTime:NULL error:&thumbnailImageGenerationError];
    
    if (!thumbnailImageRef)
        DYLogInfo(@"thumbnailImageGenerationError %@", thumbnailImageGenerationError);
    
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef]  : nil;
    //NSData *imageData = UIImagePNGRepresentation(thumbnailImage);
    CGImageRelease(thumbnailImageRef);
    
    return thumbnailImage;
    
    
}

//在图片上添加水印
+ (instancetype)waterMarkWithImageName:(UIImage *)backgroundImage andMarkImageName:(UIImage *)markName{
    
    UIImage *bgImage = backgroundImage;
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *waterImage = markName;
//    CGFloat scale = 1;
//    CGFloat margin = 5;
    CGFloat waterW = 60;
    CGFloat waterH = 60;
    CGFloat waterX = bgImage.size.width/2.0-waterW/2.0;
    CGFloat waterY = bgImage.size.height/2.0-waterH/2.0;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


//截屏，指定图层
+(UIImage *)screenShot:(CALayer *) targetLayer
{
    CGRect rect = targetLayer.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    [targetLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//截屏，指定图层
+(UIImage *)screenShot:(CALayer *) targetLayer targetRect:(CGRect)tRect
{
    CGRect rect = tRect;
    if (CGRectEqualToRect(tRect, CGRectZero)) {
        rect = targetLayer.bounds;
    }
    UIImage *rewImage = [self screenShot:targetLayer];
    
    UIGraphicsBeginImageContext(rect.size);
    [rewImage drawInRect:rect];
    UIImage *compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return compressedImg;
}


//满屏截图
+ (UIImage *)fullScreenshot
{
    // Source (Under MIT License): https://github.com/shinydevelopment/SDScreenshotCapture/blob/master/SDScreenshotCapture/SDScreenshotCapture.m#L35
    
    BOOL ignoreOrientation = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0");
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    CGSize imageSize = CGSizeZero;
    if (UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation)
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        
        // Correct for the screen orientation
        if(!ignoreOrientation)
        {
            if(orientation == UIInterfaceOrientationLandscapeLeft)
            {
                CGContextRotateCTM(context, (CGFloat)M_PI_2);
                CGContextTranslateCTM(context, 0, -imageSize.width);
            }
            else if(orientation == UIInterfaceOrientationLandscapeRight)
            {
                CGContextRotateCTM(context, (CGFloat)-M_PI_2);
                CGContextTranslateCTM(context, -imageSize.height, 0);
            }
            else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
            {
                CGContextRotateCTM(context, (CGFloat)M_PI);
                CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
            }
        }
        
        if([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
        else
            [window.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}



//在程序中如何把两张图片合成为一张图片
- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2 {
    UIGraphicsBeginImageContext(image1.size);
    
    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];
    
    // Draw image2
    [image2 drawInRect:CGRectMake(0, 0, image2.size.width, image2.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

+ (UIImage*)addImage:(UIImage*)image1 toImage:(UIImage*)image2
{
    UIGraphicsBeginImageContextWithOptions(image1.size, NO, [[UIScreen mainScreen] scale]);

    // Draw image1
    [image1 drawInRect:CGRectMake(0, 0, image1.size.width, image1.size.height)];

    // Draw image2
    [image2 drawInRect:CGRectMake((image1.size.width - image2.size.width) / 2, (image1.size.height - image2.size.height) / 2, image2.size.width, image2.size.height)];

    UIImage* resultingImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return resultingImage;
}

 //获得某个范围内的屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}


//图片去色
+(UIImage *)grayImage:(UIImage *)sourceImage
{
//    int bitmapInfo = kCGImageAlphaNone;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), sourceImage.CGImage);
    CGImageRef image =CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    CGContextRelease(context);
    return grayImage;
}


#define CONTENT_MAX_WIDTH 100
//将文字转成图片
+(UIImage *)imageFromText:(NSArray*) arrContent withFont: (CGFloat)fontSize
{
    // set the font type and size
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSMutableArray *arrHeight = [[NSMutableArray alloc] initWithCapacity:arrContent.count];
    
    NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    
    CGSize nameMaxSize=CGSizeMake(CONTENT_MAX_WIDTH, MAXFLOAT);//最大宽高
    
    CGFloat fHeight = 0.0f;
    for (NSString *sContent in arrContent) {
        CGSize stringSize =[sContent boundingRectWithSize:nameMaxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attrs context:nil].size;
//        CGSize stringSize = [sContent sizeWithFont:font constrainedToSize:CGSizeMake(CONTENT_MAX_WIDTH, 50) lineBreakMode:NSLineBreakByWordWrapping];
        [arrHeight addObject:[NSNumber numberWithFloat:stringSize.height]];
        
        fHeight += stringSize.height;
    }
    
    
    CGSize newSize = CGSizeMake(50, 50);
    
    UIGraphicsBeginImageContextWithOptions(newSize,NO,0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetCharacterSpacing(ctx, 10);
    CGContextSetTextDrawingMode (ctx, kCGTextFillStroke);
    CGContextSetRGBFillColor (ctx, 0.98, 0.82, 0, 1); // 6
    CGContextSetRGBStrokeColor (ctx, 1.0, 1.0, 1.0, 1);
    
    int nIndex = 0;
    CGFloat fPosY = 20.0f;
    for (NSString *sContent in arrContent) {
        NSNumber *numHeight = [arrHeight objectAtIndex:nIndex];
        CGRect rect = CGRectMake(10, fPosY, CONTENT_MAX_WIDTH , [numHeight floatValue]);
        
        
        [sContent drawInRect:rect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentLeft];
        
        fPosY += [numHeight floatValue];
        nIndex++;
    }
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return image;
    
}

/**
 * 返回一张可以随意拉伸不变形的图片
 *
 * @param name 图片名称
 */
+ (UIImage *)resizableImageWithName:(NSString *)imageName
{
    
    // 加载原有图片
    UIImage *norImage = [UIImage imageNamed:imageName];
    // 获取原有图片的宽高的一半
    CGFloat w = norImage.size.width * 0.5;
    CGFloat h = norImage.size.height * 0.5;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [norImage resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}

+ (UIImage *)resizableImageWithImage:(UIImage *)image
{
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}

//多张图片合成一张
+(UIImage *) mergedImageOnRect:(CGRect)rect WithImageArray:(NSArray *)imgArray AndImageRectArray:(NSArray *)imgRectArray
{
    
   UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    int i = 0;
    for (UIImage *img in imgArray) {
        CGRect oneRect=CGRectFromString(imgRectArray[i]);
        [img drawInRect:oneRect];
        i+=1;
    }
    
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return resImage;
}

+ (UIImage *)mergeImage:(UIImage *)originImage backgroundImage:(UIImage *)backgroundImage {
    NSArray *imgArray = [[NSArray alloc] initWithObjects:backgroundImage, originImage, nil];
    NSArray *imgPointArray = [[NSArray alloc] initWithObjects:
                              NSStringFromCGRect(CGRectMake(0, 0, originImage.size.width, originImage.size.height)),
                              NSStringFromCGRect(CGRectMake(0, 0, originImage.size.width, originImage.size.height)),
                                 nil];
    UIImage *mergeImage = [UIImage mergedImageOnRect:CGRectMake(0, 0, originImage.size.width, originImage.size.height) WithImageArray:imgArray AndImageRectArray:imgPointArray];
    return mergeImage;
}

//计算图片大小kb
+ (CGFloat)calulateImageFileSize:(UIImage *)image {
    NSData *data = UIImagePNGRepresentation(image);
    if (!data) {
        data = UIImageJPEGRepresentation(image, 0.5);//需要改成0.5才接近原图片大小
    }
    NSString *size = [NSString stringWithFormat:@"%.3f",[data length] / 1024.0];
    return [size floatValue];
}


/**
 生成一张渐变色的图片
 @param colors 颜色数组
 @param rect 图片大小
 @return 返回渐变图片
 */
+ (UIImage *)gradientImageWithColors:(NSArray *)colors
                                rect:(CGRect)rect
                        cornerRadius:(float) radius
{
    if (!colors.count || CGRectEqualToRect(rect, CGRectZero)) {
        return nil;
    }
    
    if (![NSThread isMainThread]) {
        //renderInContext会触发CALayer的layoutSublayers
        DYLogError(@"UI run not in main threadcallStack:%@", [NSThread callStackSymbols]);
        return nil;
    }
 
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.frame = rect;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    NSMutableArray *mutColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = [NSArray arrayWithArray:mutColors];
    
    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.opaque, 0);
    // 贝塞尔裁切
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [path addClip];
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}


/**
生成一张渐变色的图片
@param colors 颜色数组
@param size 图片大小
@return 返回渐变图片
*/
+ (UIImage *)gradientImageWithColors:(NSArray *)colors
        size:(CGSize)size
cornerRadius:(float) radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
   
    return [self gradientImageWithColors:colors rect:rect cornerRadius:radius];
}

/**
 返回指定大小，颜色，渐变模式的渐变色图片
 */
+ (UIImage *)gradientColorImageFromColors:(NSArray<UIColor *>*)colors
                             gradientType:(GradientType)gradientType
                                  imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 旋转图片
 */
+ (UIImage *)image:(UIImage *)image
          rotation:(UIImageOrientation)orientation {
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;

    switch (orientation) {
      case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0,0,image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;

      case UIImageOrientationRight:
            rotate = 3 *M_PI_2;
            rect = CGRectMake(0,0,image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;

      case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0,0,image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;

      default:
            rotate = 0.0;
            rect = CGRectMake(0,0,image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX,translateY);
    CGContextScaleCTM(context, scaleX,scaleY);

    //绘制图片
    CGContextDrawImage(context, CGRectMake(0,0,rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    return newPic;
}

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius {
    if (!color) color = UIColor.whiteColor;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//中间点拉伸图片
- (UIImage *)resizeImageByCenter{
    CGFloat top = self.size.height*0.5-1; // 顶端盖高度
    CGFloat bottom = top ; // 底端盖高度
    CGFloat left = self.size.width*0.5-1; // 左端盖宽度
    CGFloat right = left; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
   UIImage *newImage = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return newImage;
}

//生成二维码
+ (UIImage *)QRCodeGenerateByURL:(NSString *)urlString centerImage:(UIImage *)cImage
{
    //
    NSArray *filters = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    NSLog(@"%@",filters);
    //二维码过滤器
    CIFilter *qrImageFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //设置过滤器默认属性
    [qrImageFilter setDefaults];
    
    NSString *urls = urlString;
    //将字符串转换成 NSdata (虽然二维码本质上是 字符串,但是这里需要转换,不转换就崩溃)
    NSData *qrImageData = [urls dataUsingEncoding:NSUTF8StringEncoding];
    
    //我们可以打印,看过滤器的 输入属性.这样我们才知道给谁赋值
    NSLog(@"%@",qrImageFilter.inputKeys);
    /*
     inputMessage,        //二维码输入信息
     inputCorrectionLevel //二维码错误的等级,就是容错率
     */
    //设置过滤器的 输入值  ,KVC赋值
    [qrImageFilter setValue:qrImageData forKey:@"inputMessage"];
    
    //取出图片
    CIImage *qrImage = [qrImageFilter outputImage];
    
    //但是图片 发现有的小 (27,27),我们需要放大..我们进去CIImage 内部看属性
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    
    //转成 UI的 类型
    UIImage *qrUIImage = [UIImage imageWithCIImage:qrImage];
    
    //----------------给 二维码 中间增加一个 自定义图片----------------
    //开启绘图,获取图形上下文  (上下文的大小,就是二维码的大小)
    UIGraphicsBeginImageContext(qrUIImage.size);
    
    //把二维码图片画上去. (这里是以,图形上下文,左上角为 (0,0)点)
    [qrUIImage drawInRect:CGRectMake(0, 0, qrUIImage.size.width, qrUIImage.size.height)];

    //再把小图片画上去
    if (cImage) {
        CGFloat sImageW = 143;
        CGFloat sImageH= sImageW;
        CGFloat sImageX = (qrUIImage.size.width - sImageW) * 0.5;
        CGFloat sImgaeY = (qrUIImage.size.height - sImageH) * 0.5;
        [cImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    }

    //获取当前画得的这张图片
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return finalyImage;
}

+ (UIImage *)compressQualityWithOriginalImage:(UIImage *)originalImg andMaxLength:(NSInteger)maxLength {
    NSData *data = UIImagePNGRepresentation(originalImg);
    CGFloat compression = 1;
    if (data.length < maxLength) return originalImg;
    UIImage *image = [UIImage imageWithData:data];
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    
    return [UIImage imageWithData:data];
}

///缩放图片(根据机型使用缩放倍图)
+ (UIImage *)imageByResizeWithImage:(UIImage *)image toSize:(CGSize)size
{
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 设置图片透明度
/// @param alpha 透明度
/// @param image 图片
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, image.CGImage);

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

/// 图片高斯模糊效果
/// @param image 图片
/// @param blur 模糊系数(取值范围 0.0 - 1.0)
+ (UIImage*)imageBlurImage:(UIImage *)image WithBlurNumber:(CGFloat)blur
{
    //    NSInteger boxSize = (NSInteger)(10 * 5);
    NSData *imageData = UIImageJPEGRepresentation(image, 1); // convert to jpeg
    UIImage* destImage = [UIImage imageWithData:imageData];
    
    
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = destImage.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    
    //create vImage_Buffer with data from CGImageRef
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    // Create a third buffer for intermediate processing
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //perform convolution
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

+ (UIImage *)dy_resizableImageWith:(UIImage *)image originalSize:(CGSize)originalSize capInsets:(UIEdgeInsets)capInsets {
    UIImage *scaleImage = [UIImage dy_scaleToSize:image size:originalSize];
    if (scaleImage == nil) return image;
    UIImage *newImage = [scaleImage resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    return newImage;
}

+ (UIImage *)dy_scaleToSize:(UIImage *)image size:(CGSize)size {
    if (image == nil || size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 2);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
