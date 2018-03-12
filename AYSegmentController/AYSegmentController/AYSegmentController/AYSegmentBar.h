//
//  AYSegmentBar.h
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/6.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYSegmentBarConfig.h"


typedef NS_ENUM(NSInteger, AYSegmentBarScrollMode) {
    AYSegmentBarScrollModeNormal, // 默认滚动模式
    AYSegmentBarScrollModeCenter  // 中间滚动模式
};


typedef NS_ENUM(NSInteger, AYSegmentBarLinkMode) {
    AYSegmentBarLinkModeNormal,   // 默认联动模式
    AYSegmentBarLinkModeProgress  // 根据进度的联动模式
};

@protocol AYSegmentBarDelegate;


@interface AYSegmentBar : UIView

/** 数据源 */
@property (nonatomic, copy) NSArray <NSString *> *items;

/** 代理 */
@property (nonatomic, weak) id <AYSegmentBarDelegate> delegate;

/** 当前选中的索引, 双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;

/** 滚动模式 */
@property (nonatomic, assign) AYSegmentBarScrollMode scrollMode;

/** 联动模式 */
@property (nonatomic, assign) AYSegmentBarLinkMode linkMode;

/** 指示器进度 */
@property (nonatomic, assign) CGFloat indicatorProgress;

/** 是否开启标题颜色渐变 默认为NO */
@property (nonatomic, assign) BOOL enableTitleColorGradient;

/** 是否开启标题大小渐变 默认为NO */
@property (nonatomic, assign) BOOL enableTitleSizeGradient;

/**
 * 配置Bar的各种参数
 */

- (void)updateWithConfig:(void(^)(AYSegmentBarConfig *config))block;

@end

@protocol AYSegmentBarDelegate <NSObject>

- (void)segmentBar:(AYSegmentBar *)segmentBar didSelectedIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex;

@end

UIKIT_EXTERN NSString * const AYSegmentBarSelectionDidChangeNotification;









