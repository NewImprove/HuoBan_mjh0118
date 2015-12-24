//
//  RemindTableViewCell.h
//  huoban
//
//  Created by Lyc on 15/12/17.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelContents;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (weak, nonatomic) IBOutlet UILabel *labelBy;
@property (weak, nonatomic) IBOutlet UIImageView *imagePreson;

@end
