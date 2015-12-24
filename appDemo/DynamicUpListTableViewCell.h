//
//  DynamicUpListTableViewCell.h
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicUpListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPreson;
@property (weak, nonatomic) IBOutlet UILabel *labelPresonName;
@property (weak, nonatomic) IBOutlet UIButton *buttonPresonMessage;

@end
