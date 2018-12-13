//
//  RootNavigationController.m
//  tuguan
//
//  Created by 张帆 on 2018/12/11.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "RootNavigationController.h"
#import "Common.h"
#import "UIBarButtonItem+Extension.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarColor = BASE_COLOR_GRAY;
    
    [self setupDefsTitleStyle];
}

#pragma mark - 设置标题风格

- (void)setupDefsTitleStyle {
    // 设置标题的字体和颜色
    NSMutableDictionary *titleAttrs = [NSMutableDictionary dictionary];
    titleAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttrs[NSFontAttributeName] = FONT_TITLE1;
    self.navigationBar.titleTextAttributes = titleAttrs;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - 重载，统一设置导航栏左侧返回按钮，以及push隐藏tabBar

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"my_left" highLightImage:nil action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
