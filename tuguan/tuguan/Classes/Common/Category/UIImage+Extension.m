//
//  UIImage+Extension.m
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color) return nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)bgImageWithColor:(UIColor *)color seperatorColor:(UIColor *)seperatorColor height:(CGFloat)height {
    if (!color || !seperatorColor || !height) return nil;
    
    // 背景色
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, height)];
    bgView.backgroundColor = color;
    
    // 分割线
    UIView *seperator = [[UIView alloc] initWithFrame:CGRectMake(0, bgView.frame.size.height - 1, bgView.frame.size.width, 1)];
    seperator.backgroundColor = seperatorColor;
    [bgView addSubview:seperator];
    
    // UIView生成图片
    UIGraphicsBeginImageContextWithOptions(bgView.frame.size, NO, 0.0);
    [bgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)circleImageWidthBorder:(CGFloat)borderWidth {
    
    // 1.开启，并获取当前的图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画边框(大圆)
    [[UIColor whiteColor] set];
    CGFloat bigRadius = self.size.width * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    CGFloat x = borderWidth;
    CGFloat y = x;
    CGFloat width = smallRadius * 2;
    CGFloat height = width;
    [self drawInRect:CGRectMake(x, y, width, height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageFromView:(UIView*)view {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)circleImageWidthRadius:(CGFloat)radius color:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(2 * radius, 2 * radius), NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画边框(大圆)
    [color set];
    CGContextAddArc(ctx, radius, radius, radius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (UIImage *)calloutImageWith:(CGSize)size borderColor:(UIColor *)borderColor calloutColor:(UIColor *)calloutColor {
    // 来源:http://www.cnblogs.com/ericiOScnblogs/p/4314689.html
    
    // 设置三角形的底边的宽与高
    CGFloat triangleWidth = 8;
    CGFloat triangleHeight = 4;
    CGFloat viewW = size.width;
    CGFloat viewH = size.height;
    
    CGFloat strokeWidth = 1;
    CGFloat borderRadius = 5;
    CGFloat offset = strokeWidth;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineJoin(context, kCGLineJoinRound);        // 两个线相交点的平滑处理
    CGContextSetLineWidth(context, strokeWidth);            // 设置画笔宽度
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor); // border的颜色,设置画笔颜色
    CGContextSetFillColorWithColor(context, calloutColor.CGColor);  // 设置填充颜色
    
    // 画三角形
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, borderRadius + offset, viewH - triangleHeight - offset);
    CGContextAddLineToPoint(context, round((viewW - triangleWidth) / 2.0f) + offset, viewH - triangleHeight - offset);
    CGContextAddLineToPoint(context, round(viewW / 2.0f), viewH - offset);
    CGContextAddLineToPoint(context, round((viewW + triangleWidth) / 2.0f) + offset, viewH - triangleHeight - offset);
    
    // 画其余部分
    CGContextAddArcToPoint(context, viewW - offset, viewH - triangleHeight - offset, viewW-offset, triangleHeight + offset, borderRadius-strokeWidth);
    CGContextAddArcToPoint(context, viewW-offset, offset, viewW-borderRadius-offset, offset, borderRadius-strokeWidth);
    CGContextAddArcToPoint(context, offset, offset, offset, borderRadius+offset, borderRadius-strokeWidth);
    CGContextAddArcToPoint(context, offset, viewH-triangleHeight-offset, borderRadius+offset, viewH-triangleHeight-offset, borderRadius-strokeWidth);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // 拿到画好的图像
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
