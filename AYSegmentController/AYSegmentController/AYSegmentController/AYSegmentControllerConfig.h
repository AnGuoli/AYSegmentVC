//
//  AYSegmentControllerConfig.h
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/8.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AYSegmentControllerConfig : NSObject

+ (instancetype)defaultConfig;

/** Bar距离顶部的高度 */
@property (nonatomic, assign) CGFloat segmentBarTop;

/** Bar的x坐标 */
@property (nonatomic, assign) CGFloat segmentBarLeft;

/** Bar的高度 */
@property (nonatomic, assign) CGFloat segmentBarHeight;

/** Bar的宽度 */
@property (nonatomic, assign) CGFloat segmentBarWidth;

@end
