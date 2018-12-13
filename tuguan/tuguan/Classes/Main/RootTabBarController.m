//
//  RootTabBarController.m
//  tuguan
//
//  Created by 张帆 on 2018/12/11.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "RootTabBarController.h"

#import "Common.h"
#import "HomeViewController.h"
#import "PoiViewController.h"
#import "GuidViewController.h"
#import "RootNavigationController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置tabBar颜色
    self.tabBar.barTintColor = VIEW_BASE_COLOR;
    
    // 2.初始化各项子控制器
    HomeViewController *home = [HomeViewController new];
    [self addchildVC:home title:@"首页" image:@"home-gray" selectedImage:@"home" needNav:NO];
    
    PoiViewController *poi = [PoiViewController new];
    [self addchildVC:poi title:@"景点" image:@"poi-gray" selectedImage:@"poi" needNav:YES];
    
    GuidViewController *guid = [GuidViewController new];
    [self addchildVC:guid title:@"向导" image:@"guid-gray" selectedImage:@"guid" needNav:YES];
    
}

/**
 */
- (void)addchildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage needNav:(BOOL)needNav {
    
    // 1.配置控制器
    // 1.1 设置控制器的tabBarItem名称
    vc.tabBarItem.title = title;
    
    // 1.2 设置tabBar文字颜色
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSForegroundColorAttributeName] = BASE_COLOR_GRAY;
    NSMutableDictionary *selectedAtribute = [NSMutableDictionary dictionary];
    selectedAtribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [vc.tabBarItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:selectedAtribute forState:UIControlStateSelected];
    
    // 1.3 设置图片
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 2.根据是否需要包装Nav将子控制器添加到TabBarController中(关键步骤)
    if (needNav) {
        RootNavigationController *nav = [[RootNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    } else {
        [self addChildViewController:vc];
    }
}
@end
