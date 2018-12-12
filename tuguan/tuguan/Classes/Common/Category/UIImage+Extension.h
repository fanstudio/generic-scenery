//
//  UIImage+Extension.h
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)
/**
 * 用于生成一张颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 用于生成一张宽度为1，带分割线的颜色图片，用于背景拉伸
 */
+ (UIImage *)bgImageWithColor:(UIColor *)color seperatorColor:(UIColor *)seperatorColor height:(CGFloat)height;

- (UIImage *)circleImageWidthBorder:(CGFloat)borderWidth;

+ (UIImage *)imageFromView:(UIView*)view;

+ (UIImage *)circleImageWidthRadius:(CGFloat)radius color:(UIColor *)color;

+ (UIImage *)calloutImageWith:(CGSize)size borderColor:(UIColor *)borderColor calloutColor:(UIColor *)calloutColor;
@end

NS_ASSUME_NONNULL_END
