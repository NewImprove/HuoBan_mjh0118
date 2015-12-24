//
//  joinProjectTableViewCell.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "joinProjectTableViewCell.h"

#import <QuartzCore/QuartzCore.h>

@implementation joinProjectTableViewCell
@synthesize textContents,textLabel,textPreson,textTime,textTitle,viewLine;




- (void)awakeFromNib {
    self.viewLine.layer.borderColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;
    
    self.viewLine.layer.borderWidth = 1;
    
    self.viewLine.clipsToBounds = YES;
    self.viewLine.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
