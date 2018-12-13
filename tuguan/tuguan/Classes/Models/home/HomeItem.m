//
//  HomeItem.m
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "HomeItem.h"

@implementation HomeItem
+ (instancetype)itemwithText:(NSString *)text picture:(NSString *)picture url:(NSString *)url {
    HomeItem *item = [self new];
    item.text = text;
    item.picture = picture;
    item.url = url;
    return item;
}

+ (instancetype)itemwithText:(NSString *)text textColor:(UIColor *)textColor subText:(NSString *)subText picture:(NSString *)picture url:(NSString *)url {
    HomeItem *item = [HomeItem itemwithText:text picture:picture url:url];
    item.textColor = textColor;
    item.subText = subText;
    
    return item;
}
@end
