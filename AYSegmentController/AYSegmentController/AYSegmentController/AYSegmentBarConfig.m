//
//  AYSegmentBarConfig.m
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "AYSegmentBarConfig.h"

@implementation AYSegmentBarConfig

+ (instancetype)defaultConfig {
    AYSegmentBarConfig *config = [[AYSegmentBarConfig alloc] init];
    config.backgroundColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:14];
    config.fontChangeDelta = 1.15;
    config.itemTitleNormalColor = [UIColor blackColor];
    config.itemTitleSelectColor = [UIColor redColor];
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorPaddingWithBottom = 0;
    config.minMargin = 30;
    config.indicatorHidden = NO;
    config.indicatorRounded = YES;
    config.onNaviBarWidth = [UIScreen mainScreen].bounds.size.width;
    config.isSplitBtnWidth = NO;
    config.itemMargin = 15;
    config.itemWidthDelta = 0;
    
    return config;
}



@end
