//
//  UIBarButtonItem+Extension.m
//  tuguan
//
//  Created by 张帆 on 2018/12/12.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "Size.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)barButtonWithTarget:(id)target Image:(nullable NSString *)image highLightImage:(nullable NSString *)highLightImage action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    if (highLightImage) {
        [btn setImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = FONT_LEVEL2;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
