//
//  BannerView.h
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface BannerView : UIView

#pragma mark - property
/** 是否需要循环滚动,默认为NO */
@property (nonatomic, assign) BOOL enableInfiniteScroll;
/** 需要显示的数据模型 */
@property (nonatomic, strong) NSArray *needDisplayItems;


#pragma mark - interface

/** 创建显示JMGBannerViewCell的方式, =============注意该方法必须实现，且返回的不能是nil========= */
@property (nonatomic, strong) BannerViewCell *(^cellWithBannerView)(BannerView *bannerView);
/** 展示方式,注意该方法必须在加载数据之前实现，否则无法正常显示数据 */
@property (nonatomic, strong) void (^displayCellWithObject)(BannerView *bannerView, BannerViewCell *cell, NSObject *obj);
/** 展示页面改变 */
@property (nonatomic, strong) void (^didChangeDisplayPage)(BannerView *bannerView, NSInteger displayPage);
/** 展示的数据发生改变， */
@property (nonatomic, strong) void (^didChangeDisplayData)(BannerView *bannerView);
/** 用户手动滚动 */
@property (nonatomic, strong) void (^onUserManualScroll)(BOOL isBegin);

#pragma mark - 方法
/** 下一页 */
- (void)prePage;
/** 上一页 */
- (void)nextPage;

@end

NS_ASSUME_NONNULL_END
