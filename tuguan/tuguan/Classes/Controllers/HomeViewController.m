//
//  HomeViewController.m
//  tuguan
//
//  Created by 张帆 on 2018/12/11.
//  Copyright © 2018 fanstudio. All rights reserved.
//

#import "HomeViewController.h"
#import "TopBannerView.h"
#import "HomeItem.h"
#import "Common.h"

@interface HomeViewController ()

@property (nonatomic, weak) TopBannerView *banner;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTopBannerView];
    [self loadDataFromServer];
}

- (void)setupTopBannerView {
    TopBannerView *banner = [TopBannerView banner];
    [self.view addSubview:banner];
    self.banner = banner;
    
    WEAK_REF(weakSelf, self);
    banner.didUserClickItem = ^(HomeItem *item) {
        [weakSelf onUserClickItem:item];
        
    };
    
}

- (void)onUserClickItem:(HomeItem *)item {
    NSLog(@"%@", item);
}


- (void)loadDataFromServer {
    NSMutableArray *arr = [NSMutableArray new];
    //
    [arr addObject: [HomeItem itemwithText:@"text1" picture:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201306/2013062320262198.jpg" url:@"this is dsturl"]];
    [arr addObject: [HomeItem itemwithText:@"text2" picture:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201306/2013062320262198.jpg" url:@"this is dsturl"]];
    [arr addObject: [HomeItem itemwithText:@"text3" picture:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201306/2013062320262198.jpg" url:@"this is dsturl"]];
    
    self.banner.items = arr;
}

@end
