//
//  BannerView.m
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "BannerView.h"
#import "UIView+Extension.h"

@interface BannerView () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupScrollView];
    }
    return self;
}

- (void)setupScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // scrollView && UIImageView && contentSize
    self.scrollView.frame = self.bounds;
    NSInteger idx = 0;
    CGFloat width = self.width;
    CGFloat height = self.height;
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:BannerViewCell.class]) {
            view.frame = CGRectMake(idx * width, 0, width, height);
            idx++;
        }
    }
    self.scrollView.contentSize = CGSizeMake(self.data.count * width, 0);
    
    // set default offset
    if ([self isSupportInfiniteScroll]) {
        [self setRightContentOffset];
    }
}

#pragma mark - 对外接口

#pragma mark 改变显示的数据

- (void)setNeedDisplayItems:(NSArray *)needDisplayItems {
    _needDisplayItems = needDisplayItems;
    [self reloadData];
}

#pragma mark 改变显示的样式，循环与非循环切换

- (void)setEnableInfiniteScroll:(BOOL)enableInfiniteScroll {
    BOOL lastStatus = self.enableInfiniteScroll;
    _enableInfiniteScroll = enableInfiniteScroll;
    if (lastStatus != enableInfiniteScroll) {
        [self reloadData];
    }
}

#pragma mark - 工具方法

#pragma mark 数据重载

- (void)reloadData {
    [self removeAllImageViewInScrollView];  // 移出旧的图像
    [self smartExchangeImagesData];         // 根据是否需要无限循环滚动，进行数据处理
    [self addImageViewOnScrollView];        // 添加新图像
    if (self.didChangeDisplayData) {        // 这里注册一个block,以方便数据变动时，外界可以使用
        self.didChangeDisplayData(self);
    }
    [self setNeedsLayout];
}

- (void)removeAllImageViewInScrollView {
    for (UIView *view in self.scrollView.subviews) {
        // 注意这里必须是JMGBannerViewCell类型
        if ([view isKindOfClass:BannerViewCell.class]) {
            [view removeFromSuperview];
        }
    }
}

- (void)smartExchangeImagesData {
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.needDisplayItems];
    if ([self isSupportInfiniteScroll]) {
        // 大于2张才做循环滚动
        [arr addObject:self.needDisplayItems.firstObject];
        [arr insertObject:self.needDisplayItems.lastObject atIndex:0];
    }
    self.data = arr;
}

- (void)addImageViewOnScrollView {
    for (NSObject *obj in self.data) {
        // 显示的内容由外界调用，如何显示也交给外界
        BannerViewCell *cell = self.cellWithBannerView(self);
        if (self.displayCellWithObject) {
            self.displayCellWithObject(self, cell, obj);
        }
        
        [self.scrollView addSubview:cell];
    }
}

#pragma mark 支撑循环滚动

- (BOOL)isSupportInfiniteScroll {
    return (self.enableInfiniteScroll && self.needDisplayItems.count >= 2);
}

- (void)setRightContentOffset {
    [self.scrollView setContentOffset:CGPointMake(self.width, 0) animated:NO];
}

- (void)setLeftContentOffset {
    [self.scrollView setContentOffset:CGPointMake(self.width * (self.data.count - 2), 0) animated:NO];
}

- (void)setAutoInfiniteScroll {
    if (self.scrollView.contentOffset.x == 0) {
        // 向左循环滚动
        [self setLeftContentOffset];
    } else if (self.scrollView.contentOffset.x == self.scrollView.contentSize.width - self.width) {
        // 向右循环滚动
        [self setRightContentOffset];
    }
}

#pragma mark 计算当前显示的页数

- (void)setInfinitePageIndex {
    NSInteger currentRealPage = (NSInteger)(self.scrollView.contentOffset.x / self.scrollView.width);
    
    NSInteger displayPage = currentRealPage - 1;
    if (displayPage < 0) {
        displayPage = self.needDisplayItems.count - 1;
    }else if (displayPage == self.needDisplayItems.count) {
        displayPage = 0;
    }
    
    [self noticeCurrentDisplayPage:displayPage];
}

- (void)setPageIndex {
    NSInteger displayPage = (NSInteger)(self.scrollView.contentOffset.x / self.scrollView.width);
    [self noticeCurrentDisplayPage:displayPage];
}

- (void)noticeCurrentDisplayPage:(NSInteger)currentPage {
    if (self.didChangeDisplayPage) {
        self.didChangeDisplayPage(self, currentPage);
    }
}

#pragma mark - 内部事件

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self isSupportInfiniteScroll]) {
        [self setAutoInfiniteScroll];
        [self setInfinitePageIndex];
    } else {
        [self setPageIndex];
    }
}

#pragma mark - 对外方法

- (void)prePage {
    CGFloat offsetX = self.scrollView.contentOffset.x - self.scrollView.width;
    if (offsetX < 0) {
        offsetX = self.scrollView.contentSize.width - self.scrollView.width;
    }
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)nextPage {
    CGFloat offsetX = self.scrollView.contentOffset.x + self.scrollView.width;
    if (offsetX == self.scrollView.contentSize.width) {
        offsetX = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.onUserManualScroll) {
        self.onUserManualScroll(YES);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.onUserManualScroll) {
        self.onUserManualScroll(NO);
    }
}
@end
