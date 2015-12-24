//
//  MainTableViewCell.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/6.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCFireworksButton.h"
#import "SDCycleScrollView.h"
#import "DataModelHomeCard.h"
#import "TYMProgressBarView.h"


@interface HomePageTableViewCell : UITableViewCell
//项目大图
@property (weak, nonatomic) IBOutlet UIImageView *MainImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageJoined;

//by-项目发起人
@property (weak, nonatomic) IBOutlet UILabel *textBy;
@property (weak, nonatomic) IBOutlet UIImageView *imageLove;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textSunmarizeDown;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textButtonDown;

//项目title
@property (weak, nonatomic) IBOutlet UILabel *textTitle;
@property (weak, nonatomic) IBOutlet UILabel *textPercentage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWeightMain;

//项目简介
@property (weak, nonatomic) IBOutlet UILabel *textSummarize;
@property (weak, nonatomic) IBOutlet UIButton *buttonPerson;
@property (weak, nonatomic) IBOutlet UIButton *buttonDate;
@property (weak, nonatomic) IBOutlet UIButton *buttonCountry;
@property (weak, nonatomic) IBOutlet UIButton *buttonType;

@property (weak, nonatomic) IBOutlet MCFireworksButton *buttoncase;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewRightWeight;

@property(nonatomic,strong) TYMProgressBarView *HomePageProgressBarView;
@property(nonatomic,strong)DataModelHomeCard *dataModelCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelByTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelProgress;

@property(nonatomic,strong)UILabel *progressLabel;
- (IBAction)buttonType:(id)sender;
- (IBAction)buttonPreson:(id)sender;
- (IBAction)buttonDate:(id)sender;
- (IBAction)buttonCountry:(id)sender;

@end
