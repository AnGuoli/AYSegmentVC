//
//  AYSegmentBarButton.m
//  AYSegmentController
//
//  Created by 国立安 on 2018/3/7.
//  Copyright © 2018年 国立安. All rights reserved.
//

#import "AYSegmentBarButton.h"

@implementation AYSegmentBarButton

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
