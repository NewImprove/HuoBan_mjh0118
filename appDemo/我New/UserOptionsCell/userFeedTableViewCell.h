//
//  userFeedTableViewCell.h
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "huobanUserFeedData.h"


@protocol UserFeedTableViewCellDelegate <NSObject>

- (void) deleteFeedTableViewCellWithIndexPaht:(NSIndexPath *)indexpath;

@end

@interface userFeedTableViewCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath * indexpath;

@property (nonatomic,assign) id<UserFeedTableViewCellDelegate>feeddelegate;

@property (nonatomic,strong) huobanUserFeedData * model;

+ (CGFloat) feedTableViewCellWithModel:(huobanUserFeedData *) model;

@end
