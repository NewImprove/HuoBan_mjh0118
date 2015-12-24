//
//  SimpleTableCell.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/25.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *ViewImage;

@property (weak, nonatomic) IBOutlet UILabel *textTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonPeople;
@property (weak, nonatomic) IBOutlet UIButton *buttonDate;

@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UIButton *buttonType;

@end
