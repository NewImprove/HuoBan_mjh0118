//
//  userFollowerTableViewCell.h
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuoBanUserFollowModel.h"

@interface userFollowerTableViewCell : UITableViewCell

@property (nonatomic,strong) HuoBanUserFollowData * model;



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
