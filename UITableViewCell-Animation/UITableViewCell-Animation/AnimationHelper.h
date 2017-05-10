//
//  AnimationHelper.h
//  UITableViewCell-Animation
//
//  Created by Vincent on 3/17/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationHelper : NSObject

+ (void)animateRotationOnZAxisForCell:(UITableViewCell *)cell clockwise:(BOOL)clockwise;

@end
