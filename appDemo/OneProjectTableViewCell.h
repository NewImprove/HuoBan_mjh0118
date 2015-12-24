//
//  OneProjectTableViewCell.h
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneProjectTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPreson;
@property (weak, nonatomic) IBOutlet UILabel *labelBy;

@property (weak, nonatomic) IBOutlet UILabel *labelIsCreator;


@property (weak, nonatomic) IBOutlet UILabel *labelProjectName;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;


@property (weak, nonatomic) IBOutlet UILabel *labelContents;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewContent;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewContentWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewContentHeight;

@property (weak, nonatomic) IBOutlet UIButton *buttonLove;

@property (weak, nonatomic) IBOutlet UIButton *buttonTalk;

@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;


@property (weak, nonatomic) IBOutlet UILabel *labelComment;


@property (weak, nonatomic) IBOutlet UILabel *labelLove;

@property (weak, nonatomic) IBOutlet UIButton *buttonPresonMessage;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLove;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTalk;


@property (weak, nonatomic) IBOutlet UIImageView *imageViewDelete;



@end
