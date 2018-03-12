//
//  UIColor+AYSegment.h
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AYSegment)

/**
 指定颜色，获取颜色的RGB值
 
 @param components RGB数组
 */
- (void)getRGBComponents:(CGFloat [3])components;



@end
