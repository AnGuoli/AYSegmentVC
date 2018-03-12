//
//  AYViewController.m
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/9.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "AYViewController.h"
#import "AYSegmentController.h"
#import "UIView+AYSegment.h"

#define AYColor_RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define AYRandomColor_RGB AYColor_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface AYViewController ()

@property (nonatomic, weak) AYSegmentController *segmentController;

@end

@implementation AYViewController

#pragma mark — Lazy

- (AYSegmentController *)segmentController {
    if (!_segmentController) {
        AYSegmentController *vc = [AYSegmentController new];
        [self addChildViewController:vc];
        _segmentController = vc;
    }
    return _segmentController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"欧冠16强";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentController.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentController.view];
    
    //    self.navigationItem.titleView = self.segmentController.segmentBar;
    
    //更新选项条的各项配置
    [self.segmentController.segmentBar updateWithConfig:^(AYSegmentBarConfig *config) {
        config.itemTitleNormalColor = [UIColor blueColor];
        config.itemTitleSelectColor = [UIColor redColor];
    }];
    
    // 开启预加载功能
    //    self.segmentController.prefetchingEnabled = YES;
    
    // 切换控制器有过渡动画效果
    self.segmentController.switchControllerAnimationEnabled = YES;
    
    // 是否开启渐变色
    self.segmentController.segmentBar.enableTitleColorGradient = YES;
    self.segmentController.segmentBar.enableTitleSizeGradient = YES;
    
    // 联动模式是否开启进度实时更新
    self.segmentController.segmentBar.linkMode = AYSegmentBarLinkModeProgress;
    
    // 选项条的滚动模式是否为居中模式
    self.segmentController.segmentBar.scrollMode = AYSegmentBarScrollModeNormal;
    
    //曼联、巴塞尔、巴黎圣日耳曼、拜仁慕尼黑、罗马、切尔西、巴塞罗那、尤文图斯、利物浦、塞维利亚、曼城、顿涅茨克矿工、贝西克塔斯、波尔图、热刺和皇家马德里
    
    UIViewController *vc1 = [UIViewController new];
    vc1.title = @"曼联";
    vc1.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc2 = [UIViewController new];
    vc2.title = @"巴塞尔";
    vc2.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc3 = [UIViewController new];
    vc3.title = @"巴黎圣日耳曼";
    vc3.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc4 = [UIViewController new];
    vc4.title = @"拜仁慕尼黑";
    vc4.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc5 = [UIViewController new];
    vc5.title = @"罗马";
    vc5.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc6 = [UIViewController new];
    vc6.title = @"切尔西";
    vc6.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc7 = [UIViewController new];
    vc7.title = @"巴塞罗那";
    vc7.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc8 = [UIViewController new];
    vc8.title = @"尤文图斯";
    vc8.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc9 = [UIViewController new];
    vc9.title = @"利物浦";
    vc9.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc10 = [UIViewController new];
    vc10.title = @"塞维利亚";
    vc10.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc11 = [UIViewController new];
    vc11.title = @"曼城";
    vc11.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc12 = [UIViewController new];
    vc12.title = @"顿涅茨克矿工";
    vc12.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc13 = [UIViewController new];
    vc13.title = @"贝西克塔斯";
    vc13.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc14 = [UIViewController new];
    vc14.title = @"波尔图";
    vc14.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc15 = [UIViewController new];
    vc15.title = @"热刺";
    vc15.view.backgroundColor = AYRandomColor_RGB;
    
    UIViewController *vc16 = [UIViewController new];
    vc16.title = @"皇家马德里";
    vc16.view.backgroundColor = AYRandomColor_RGB;
    
    
    // 配置子控制器
    [self.segmentController setUpWithItems:@[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10,vc11,vc12,vc13,vc14,vc15,vc16]];
    //    [self.segmentController setUpWithItems:@[vc1,vc2]];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.segmentController updateWithConfig:^(AYSegmentControllerConfig *config) {
        config.segmentBarTop = 64;
    }];
}


@end
