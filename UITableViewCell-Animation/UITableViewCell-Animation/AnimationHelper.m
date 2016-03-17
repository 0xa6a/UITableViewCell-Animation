//
//  AnimationHelper.m
//  UITableViewCell-Animation
//
//  Created by Vincent on 3/17/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper
+ (void)animateForCell:(UITableViewCell *)cell {
    CALayer *layer = cell.contentView.layer;
    // transform
    CATransform3D start = CATransform3DMakeRotation(M_PI / 2, 0.0, 1.0, 0.0); // y 轴有旋转
    layer.transform = start;
    [UIView animateWithDuration:1.f animations:^{
        layer.transform = CATransform3DIdentity;
    }];
}
@end
