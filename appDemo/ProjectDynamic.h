//
//  projectMessageTableViewCell.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/6.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModelCellProjectDetailDynamic.h"

@interface ProjectDynamic : UITableViewCell


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContentsHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContentsWidth;
@property (weak, nonatomic) IBOutlet UILabel *labelIsCreator;

@property (weak, nonatomic) IBOutlet UIImageView *imagePerson;

@property (weak, nonatomic) IBOutlet UILabel *labelLove;
@property (weak, nonatomic) IBOutlet UILabel *labelTalk;

@property (weak, nonatomic) IBOutlet UILabel *textContents;
@property (weak, nonatomic) IBOutlet UIImageView *imageContents;

@property (weak, nonatomic) IBOutlet UILabel *textProject;

@property (weak, nonatomic) IBOutlet UIButton *buttonBy;
@property (weak, nonatomic) IBOutlet UILabel *textBy;

@property (weak, nonatomic) IBOutlet UILabel *textTime;

@property (weak, nonatomic) IBOutlet UIImageView *imageTalk;

@property (weak, nonatomic) IBOutlet UIImageView *imageLove;


@property (weak, nonatomic) IBOutlet UIButton *buttonTalk;

@property (weak, nonatomic) IBOutlet UIButton *buttonLove;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;
@property (weak, nonatomic) IBOutlet UIImageView *imageButtonDelete;

@property(nonatomic,strong)DataModelCellProjectDetailDynamic *dataModelPD;
@property (weak, nonatomic) IBOutlet UIButton *buttonPresonMessage;



@end
