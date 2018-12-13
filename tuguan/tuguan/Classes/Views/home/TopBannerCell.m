//
//  TopBannerCell.m
//  tuguan
//
//  Created by 张帆 on 2018/12/13.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "TopBannerCell.h"
#import "UIView+Extension.h"
#import "Common.h"

@interface TopBannerCell ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *textLabel;
@property (nonatomic, weak) UIView *labelContentView;
@property (nonatomic, weak) UIButton *button;

@end

@implementation TopBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupLabelContentView];
        [self setupLabel];
        [self setupButton];
    }
    return self;
}

- (void)setupImageView {
    UIImageView *imageView = [UIImageView new];
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)setupLabelContentView {
    UIView *labelContentView = [UIView new];
    [self addSubview:labelContentView];
    self.labelContentView = labelContentView;
    labelContentView.backgroundColor = COVER_COLOR;
}

- (void)setupLabel {
    UILabel *textLabel = [UILabel new];
    [self.labelContentView addSubview:textLabel];
    self.textLabel = textLabel;
    textLabel.font = FONT_LEVEL1;
    textLabel.textColor = [UIColor whiteColor];
}

- (void)setupButton {
    UIButton *button = [UIButton new];
    [self addSubview:button];
    self.button = button;
    
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    self.labelContentView.frame = CGRectMake(0, self.height - 44, self.width, 44);
    self.textLabel.frame = CGRectMake(PADDING, 0, self.labelContentView.width - 2 * PADDING, self.labelContentView.height);
    self.button.frame = self.bounds;
}

- (void)setItem:(HomeItem *)item {
    _item = item;
#warning need add net tool
    //[JMGNetTool setImage:self.imageView urlPath:item.picture];
    self.imageView.backgroundColor = RandomColor;
    //self.textLabel.text = item.text;
}

- (void)onClick {
    if (self.onUserClick) {
        self.onUserClick(self.item);
    }
}

@end
