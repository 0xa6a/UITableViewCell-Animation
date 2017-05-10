//
//  AnimationHelper.m
//  UITableViewCell-Animation
//
//  Created by Vincent on 3/17/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

+ (void)animateRotationOnZAxisForCell:(UITableViewCell *)cell clockwise:(BOOL)clockwise {
    CALayer *layer = cell.contentView.layer;
    CGFloat angle = (clockwise ? 1 : -1) * M_PI / 3;
    CATransform3D initialTransform = CATransform3DMakeRotation(angle, 0, 0, 1.0);
    layer.anchorPoint = CGPointMake(0, 0.5);
    layer.transform = initialTransform;
    [UIView animateWithDuration:0.5 animations:^{
        layer.transform = CATransform3DIdentity;
    }];
}

@end
