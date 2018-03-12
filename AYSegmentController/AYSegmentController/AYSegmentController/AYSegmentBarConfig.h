//
//  AYSegmentBarConfig.h
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface AYSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 按钮普通状态下文字颜色 */
@property (nonatomic, strong) UIColor *itemTitleNormalColor;

/** 按钮选中状态下文字颜色 */
@property (nonatomic, strong) UIColor *itemTitleSelectColor;

/** 指示器颜色 */
@property (nonatomic, strong) UIColor *indicatorColor;

/** 按钮文字字体 */
@property (nonatomic, strong) UIFont *itemFont;

/** 字体缩放比例差值 */
@property (nonatomic, assign) CGFloat fontChangeDelta;

/** 指示器高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;

/** 指示器距离底部的高度 */
@property (nonatomic, assign) CGFloat indicatorPaddingWithBottom;

/** 文字间的最小间距 */
@property (nonatomic, assign) CGFloat minMargin;

/** 在导航条上的宽度 */
@property (nonatomic, assign) CGFloat onNaviBarWidth;

/** 按钮左右两端的外边距 */
@property (nonatomic, assign) CGFloat itemMargin;

/** 按钮宽度差 */
@property (nonatomic, assign) CGFloat itemWidthDelta;

/** 指示器是否为圆角 */
@property (nonatomic, assign) BOOL indicatorRounded;

/** 指示器是否隐藏 */
@property (nonatomic, assign) BOOL indicatorHidden;

/** 是否平分按钮宽度 */
@property (nonatomic, assign) BOOL isSplitBtnWidth;








@end
