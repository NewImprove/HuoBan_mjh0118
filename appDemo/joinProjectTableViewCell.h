//
//  joinProjectTableViewCell.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface joinProjectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *viewLine;
@property (weak, nonatomic) IBOutlet UILabel *textContents;

@property (weak, nonatomic) IBOutlet UILabel *textTitle;


@property (weak, nonatomic) IBOutlet UILabel *textMoney;


@property (weak, nonatomic) IBOutlet UILabel *textTime;


@property (weak, nonatomic) IBOutlet UILabel *textPreson;

@end
