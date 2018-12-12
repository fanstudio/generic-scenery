//
//  TransparentNavController.m
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "TransparentNavController.h"
#import "UIImage+Extension.h"

@interface TransparentNavController ()

@end

@implementation TransparentNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarColor = [UIColor whiteColor];
    self.navigationBarAlpha = 1.0;
}

- (void)setNavigationBarColor:(UIColor *)navigationBarColor {
    if (!navigationBarColor) return;
    _navigationBarColor = navigationBarColor;
    
    [self setupNavigationBarColor:navigationBarColor];
}

- (void)setNavigationBarAlpha:(CGFloat)navigationBarAlpha {
    _navigationBarAlpha = navigationBarAlpha;
    
    UIColor *newColor = [self.navigationBarColor colorWithAlphaComponent:navigationBarAlpha];
    [self setupNavigationBarColor:newColor];
}

- (void)setupNavigationBarColor:(UIColor *)color {
    UINavigationBar *navBar = self.navigationBar;
    
    // 设置导航栏的颜色
    UIImage *bgImage = [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
    [navBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    // 去掉默认的分隔线
    UIImage *seperatorImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
    navBar.shadowImage = seperatorImage;
}

@end
