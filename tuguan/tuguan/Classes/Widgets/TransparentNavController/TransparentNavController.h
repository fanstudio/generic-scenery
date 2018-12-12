//
//  TransparentNavController.h
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransparentNavController : UINavigationController
/** 导航栏颜色,默认为white  */
@property (nonatomic, strong) UIColor *navigationBarColor;

/** 导航栏颜色alpha值，默认为1.0 */
@property (nonatomic, assign) CGFloat navigationBarAlpha;
@end

NS_ASSUME_NONNULL_END
