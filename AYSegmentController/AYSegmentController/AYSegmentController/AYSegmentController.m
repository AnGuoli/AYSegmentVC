//
//  AYSegmentController.m
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "AYSegmentController.h"
#import "UIView+AYSegment.h"
#import <objc/message.h>

@interface UIViewController ()

@property (nonatomic, strong, readwrite) AYSegmentController *segmentController;

@end


@interface AYSegmentController () <AYSegmentBarDelegate, UIScrollViewDelegate>

/** 内容视图 */
@property (nonatomic, weak) UIScrollView  *contentView;

/** 基本配置 */
@property (nonatomic, strong) AYSegmentControllerConfig *config;

@end

@implementation AYSegmentController
{
    BOOL _initAnimatedFlag;
}

#pragma mark — Public
- (void)setUpWithItems:(NSArray<UIViewController *> *)items {
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    NSMutableArray *titleItems = [NSMutableArray array];
    for (UIViewController *vc in items) {
        vc.segmentController = self;
        [self addChildViewController:vc];
        [titleItems addObject:vc.title];
    }
    
    self.segmentBar.items = titleItems;
    
    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
}

- (void)updateWithConfig:(void (^)(AYSegmentControllerConfig * config))block {
    if (block) {
        block(self.config);
    }
    self.segmentBar.top = self.config.segmentBarTop;
    self.segmentBar.height = self.config.segmentBarHeight;
    
    // 刷新布局
    [self.segmentBar setNeedsLayout];
    [self.segmentBar layoutIfNeeded];
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if ([self.segmentBar.superview isKindOfClass:[UINavigationBar class]]) {
        self.segmentBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.width, self.navigationController.navigationBar.height);
        self.contentView.frame = CGRectMake(self.navigationController.navigationBar.left, 0, self.view.width, self.view.height);
    } else {
        self.segmentBar.frame = CGRectMake(self.config.segmentBarLeft, self.config.segmentBarTop, self.config.segmentBarWidth, self.config.segmentBarHeight);
        self.contentView.frame = CGRectMake(0, self.segmentBar.bottom, self.view.width, self.view.height - self.segmentBar.bottom);
    }
    
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    self.segmentBar.selectIndex = self.segmentBar.selectIndex;
    
    [self.view sendSubviewToBack:self.backgroundView];
    self.backgroundView.frame = self.contentView.frame;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _initAnimatedFlag = YES;
}

#pragma mark — Private
- (void)addChildVcViewToIndex:(NSInteger)index {
    UIViewController *childVc = self.childViewControllers[index];
    childVc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:childVc.view];
}

- (void)showChildVCViewsAtIndex:(NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    [self addChildVcViewToIndex:index];
    
    // 滚动到对应位置
    if (self.switchControllerAnimationEnabled) {
        if (_initAnimatedFlag) {
            [UIView animateWithDuration:0.25f animations:^{
                [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:NO];
            }];
        } else {
            [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:NO];
        }
    } else {
        [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:NO];
    }
    
    // 是否开启预加载功能
    if (!self.prefetchingEnabled) return;
    
    // 添加左右视图
    
    NSInteger leftIndex = index - 1;
    NSInteger rightIndex = index + 1;
    if (leftIndex >= 0) [self addChildVcViewToIndex:leftIndex];
    if (rightIndex <= self.childViewControllers.count - 1) [self addChildVcViewToIndex:rightIndex];
    // 移除视图
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        if (i == index) continue;
        if (i == leftIndex) continue;
        if (i == rightIndex) continue;
        UIViewController *vc = self.childViewControllers[i];
        [vc.view removeFromSuperview];
    }
}

#pragma mark — Lazy
- (AYSegmentBar *)segmentBar {
    if (!_segmentBar) {
        AYSegmentBar *segmentBar = [[AYSegmentBar alloc] initWithFrame:CGRectMake(self.config.segmentBarLeft, self.config.segmentBarTop, self.config.segmentBarWidth, self.config.segmentBarHeight)];
        segmentBar.delegate = self;
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        contentView.showsVerticalScrollIndicator = NO;
        contentView.showsHorizontalScrollIndicator = NO;
        contentView.scrollsToTop = NO;
        contentView.bounces = NO;
        contentView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (AYSegmentControllerConfig *)config {
    if (!_config) {
        _config = [AYSegmentControllerConfig defaultConfig];
    }
    return _config;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        UIView *backgroundView = [[UIView alloc] init];
        [self.view addSubview:backgroundView];
        [self.view sendSubviewToBack:backgroundView];
        backgroundView.backgroundColor = [UIColor clearColor];
        _backgroundView = backgroundView;
    }
    return _backgroundView;
}

#pragma mark — AYSegmentBarDelegate
- (void)segmentBar:(AYSegmentBar *)segmentBar didSelectedIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    [self showChildVCViewsAtIndex:toIndex];
}

#pragma mark — UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算最后的索引
    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    self.segmentBar.selectIndex = index;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 拖拽比例
    CGFloat bili = scrollView.contentOffset.x / scrollView.width;
    
    if (self.segmentBar.linkMode == AYSegmentBarScrollModeNormal && !self.segmentBar.enableTitleSizeGradient && !self.segmentBar.enableTitleColorGradient) {
        return;
    }
    self.segmentBar.indicatorProgress = bili;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIViewController (AYSegmentControllerItem)

static const char AYSegmentControllerKey = '\0';

- (void)setSegmentController:(AYSegmentController *)segmentController {
    [self willChangeValueForKey:@"segmentController"];
    objc_setAssociatedObject(self, &AYSegmentControllerKey, segmentController, OBJC_ASSOCIATION_RETAIN);
    [self didChangeValueForKey:@"segmentController"];
}

- (AYSegmentController *)segmentController {
    id obj = objc_getAssociatedObject(self, &AYSegmentControllerKey);
    while (!obj) {
        obj = objc_getAssociatedObject(self.parentViewController, &AYSegmentControllerKey);
    }
    return obj;
}

@end
