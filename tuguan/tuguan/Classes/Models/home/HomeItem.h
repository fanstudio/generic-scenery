//
//  HomeItem.h
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeItem : NSObject
/** 文字 */
@property (nonatomic, copy) NSString *text;
/** 文字颜色 */
@property (nonatomic, strong) UIColor *textColor;
/** 子文字 */
@property (nonatomic, copy) NSString *subText;
/** 图片 */
@property (nonatomic, copy) NSString *picture;
/** 超链接 */
@property (nonatomic, copy) NSString *url;

+ (instancetype)itemwithText:(NSString *)text picture:(NSString *)picture url:(NSString *)url;
+ (instancetype)itemwithText:(NSString *)text textColor:(UIColor *)textColor subText:(NSString *)subText picture:(NSString *)picture url:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
