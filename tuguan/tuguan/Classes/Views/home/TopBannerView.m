//
//  TopBannerView.m
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "TopBannerView.h"
#import "TopBannerCell.h"
#import "Common.h"

@interface TopBannerView ()

@property (nonatomic, weak) BannerView *banner;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TopBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addDefaultParams];
        [self setupBannerView];
    }
    return self;
}

- (void)addDefaultParams {
    _realDisplayScale = 0.9;
    self.backgroundColor = BASE_COLOR_DISABLE;
}

- (void)setupBannerView {
    BannerView *banner = [BannerView new];
    [self addSubview:banner];
    self.banner = banner;
    
    banner.enableInfiniteScroll = YES;
    WEAK_REF(weakSelf, self);
    banner.cellWithBannerView = ^ (BannerView *banner) {
        TopBannerCell *cell = [TopBannerCell new];
        cell.onUserClick = weakSelf.didUserClickItem;
        return cell;
    };
    banner.displayCellWithObject = ^(BannerView *banner, BannerViewCell *cell, NSObject *obj) {
        TopBannerCell *c = (TopBannerCell *)cell;
        HomeItem *showItem = (HomeItem *)obj;
        c.item = showItem;
    };
    banner.onUserManualScroll = ^(BOOL isBegin) {
        if (isBegin) {
            [weakSelf removeTimer];
        } else {
            [weakSelf addTimer];
        }
    };
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.banner.frame = self.bounds;
}

#pragma mark - 对外接口

+ (instancetype)banner {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.35)];
}

- (void)setItems:(NSArray<HomeItem *> *)items {
    _items = items;
    self.banner.needDisplayItems = items;
}

- (void)setIsTimerOn:(BOOL)isTimerOn {
    _isTimerOn = isTimerOn;
    
    if (isTimerOn) {
        [self addTimer];
    } else {
        [self removeTimer];
    }
}

#pragma mark - 定时器自动轮播
- (void)addTimer {
    [self removeTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                                  target:self
                                                selector:@selector(autoScoll)
                                                userInfo:nil repeats:YES];
}

- (void)autoScoll {
    [self.banner nextPage];
}

- (void)removeTimer {
    if (!self.timer) return;
    [self.timer invalidate];
    self.timer = nil;
}

@end
