//
//  UIBarButtonItem+Extension.h
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)
+ (instancetype)barButtonWithTarget:(id)target Image:(nullable NSString *)image highLightImage:(nullable NSString *)highLightImage action:(SEL)action;

+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
