//
//  OneProjectTableViewCell.m
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "OneProjectTableViewCell.h"
#import "DataModel.h"

@implementation OneProjectTableViewCell

- (void)awakeFromNib {
    // Initialization code

    DataModel *dataModelOneProject = [[DataModel alloc] init];
    
    //    _dateFormatterProjectDynamic = [[NSDateFormatter alloc] init];
    
    //    [_dateFormatterProjectDynamic setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *striOS = dataModelOneProject.userInfomation.iOSDeviceSize;
    
    
    if([striOS isEqualToString:@"iPhone6Plus"]){
       
        self.imageViewDelete.image = [UIImage imageNamed:@"DeleteDynamic@3x"];
        self.imageViewTalk.image = [UIImage imageNamed:@"pinglun15@3x"];
        
    }else{
        self.imageViewDelete.image = [UIImage imageNamed:@"DeleteDynamic@2x"];
        self.imageViewTalk.image = [UIImage imageNamed:@"pinglun15@2x"];
    }
 
    self.imageViewPreson.clipsToBounds = YES;
    self.imageViewPreson.layer.cornerRadius = 22;
    
    self.imageViewContent.clipsToBounds = YES;
    self.imageViewContent.contentMode = UIViewContentModeScaleAspectFit;
    self.imageViewContent.layer.cornerRadius = 8;




}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
