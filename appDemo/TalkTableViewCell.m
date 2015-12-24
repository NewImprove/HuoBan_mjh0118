//
//  TalkTableViewCell.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/23.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "TalkTableViewCell.h"

@implementation TalkTableViewCell
@synthesize labelByCell,labelContentCell,buttonPresonMessage;

- (void)awakeFromNib {
    // Initialization code
    
    self.imagePresonCell.clipsToBounds = YES;
    self.imagePresonCell.layer.cornerRadius = 18;
    
//    self.buttonPresonMessage.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//15007124288
//fish9justin
- (IBAction)buttonPresonMessage:(id)sender {
}
@end
