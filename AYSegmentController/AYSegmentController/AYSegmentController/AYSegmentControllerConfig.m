//
//  AYSegmentControllerConfig.m
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "AYSegmentControllerConfig.h"

@implementation AYSegmentControllerConfig

+ (instancetype)defaultConfig {
    AYSegmentControllerConfig *config = [[AYSegmentControllerConfig alloc] init];
    config.segmentBarTop = 20;
    config.segmentBarLeft = 0;
    config.segmentBarHeight = 44;
    config.segmentBarWidth = [UIScreen mainScreen].bounds.size.width;
    
    return config;
}

@end
