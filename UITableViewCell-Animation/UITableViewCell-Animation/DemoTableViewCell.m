//
//  DemoTableViewCell.m
//  UITableViewCell-Animation
//
//  Created by Vincent on 3/17/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "DemoTableViewCell.h"

@interface DemoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end

@implementation DemoTableViewCell

- (void)setIcon:(NSString *)icon name:(NSString *)name {
    self.icon.image = [UIImage imageNamed:icon];
    self.name.text = name;
}

- (void)awakeFromNib {
    // Initialization code
    self.name.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.f green:arc4random_uniform(255) / 255.f blue:arc4random_uniform(255) / 255.f alpha:1.f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
