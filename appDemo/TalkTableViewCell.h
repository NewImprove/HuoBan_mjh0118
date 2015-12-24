//
//  TalkTableViewCell.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/23.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imagePresonCell;

@property (weak, nonatomic) IBOutlet UILabel *labelByCell;



@property (weak, nonatomic) IBOutlet UIButton *buttonPresonMessage;

@property (weak, nonatomic) IBOutlet UILabel *labelContentCell;


@end
