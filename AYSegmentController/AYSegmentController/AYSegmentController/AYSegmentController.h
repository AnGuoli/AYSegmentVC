//
//  AYSegmentController.h
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYSegmentBar.h"
#import "AYSegmentControllerConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface AYSegmentController : UIViewController

/** 选项条 */
@property (nonatomic, weak) AYSegmentBar *segmentBar;

/** 是否开启预加载功能 默认为NO */
@property (nonatomic, assign) BOOL prefetchingEnabled;

/** 切换控制器时是否要开启动画过度效果 默认为NO */
@property (nonatomic, assign) BOOL switchControllerAnimationEnabled;

/** 背景view */
@property (nonatomic, weak) UIView *backgroundView;

/**
 * 设置数据源
 */
- (void)setUpWithItems:(NSArray <UIViewController *> *)items;

/**
 * 修改基本配置
 */
- (void)updateWithConfig:(void(^)(AYSegmentControllerConfig *config))block;

@end

@interface UIViewController (AYSegmentControllerItem)

@property (nullable, nonatomic, readonly, strong) AYSegmentController *segmentController;

@end

NS_ASSUME_NONNULL_END





















