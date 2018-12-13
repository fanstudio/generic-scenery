//
//  TopBannerCell.h
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "BannerViewCell.h"
@class HomeItem;
NS_ASSUME_NONNULL_BEGIN

@interface TopBannerCell : BannerViewCell

@property (nonatomic, strong) HomeItem *item;
@property (nonatomic, strong) void (^onUserClick)(HomeItem *item);

@end

NS_ASSUME_NONNULL_END
