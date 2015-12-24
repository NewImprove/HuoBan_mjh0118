//
//  DynamicUpListTableViewCell.m
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "DynamicUpListTableViewCell.h"

@implementation DynamicUpListTableViewCell

- (void)awakeFromNib {

    self.imageViewPreson.clipsToBounds =YES;
    self.imageViewPreson.layer.cornerRadius = 22;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
