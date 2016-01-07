//
//  UserCreateProjectTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 16/1/5.
//  Copyright © 2016年 lyc. All rights reserved.
//



#import "UserCreateProjectTableViewCell.h"


/**
   背景色: #F9ED31 249,237,49
 */
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.f alpha:1.0]




@implementation UserCreateProjectTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = RGB(249, 237, 49);
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        label.text = @"发起项目";
        [self addSubview:label];
        ;
        
        
    }
    return self;
}

@end
