//
//  TopBannerView.h
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "BannerView.h"
@class HomeItem;

NS_ASSUME_NONNULL_BEGIN

@interface TopBannerView : BannerView

@property (nonatomic, assign, readonly) CGFloat realDisplayScale;
/**顶部轮播图*/
@property (nonatomic, strong) NSArray <HomeItem *> *items;
/** 轮播图点击 */
@property (nonatomic, strong) void (^didUserClickItem)(HomeItem *item);
/** 是否开启自动轮播 */
@property (nonatomic, assign) BOOL isTimerOn;

+ (instancetype)banner;
@end

NS_ASSUME_NONNULL_END
