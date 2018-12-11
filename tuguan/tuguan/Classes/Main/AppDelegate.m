//
//  AppDelegate.m
//  tuguan
//
//  Created by 张帆 on 2018/12/6.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - 程序入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [RootTabBarController new];
    [self.window makeKeyAndVisible];
                   
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
