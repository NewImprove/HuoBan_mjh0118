//
//  ProjectAllOneTableViewCell.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/8.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModelCellProjectDetailDynamic.h"

@interface ProjectDynamicSelf : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagePreson;
@property (weak, nonatomic) IBOutlet UILabel *textBy;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet UILabel *textTitle;
@property (weak, nonatomic) IBOutlet UILabel *textContents;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewRight;
@property (weak, nonatomic) IBOutlet UILabel *textlove;
@property (weak, nonatomic) IBOutlet UILabel *textTalk;
@property (weak, nonatomic) IBOutlet UIImageView *imageContents;
//@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property(nonatomic,strong)DataModelCellProjectDetailDynamic *dataModelDynamic;

@end
