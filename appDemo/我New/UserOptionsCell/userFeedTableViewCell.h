//
//  userFeedTableViewCell.h
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "huobanUserFeedData.h"

@interface userFeedTableViewCell : UITableViewCell

@property (nonatomic,strong) huobanUserFeedData * model;

+ (CGFloat) feedTableViewCellWithModel:(huobanUserFeedData *) model;

@end
