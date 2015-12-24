//
//  ProjectAllMessageTableViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/8.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateDynamicViewController.h"
#import "SendProjectListTableViewController.h"
#import "TalkViewController.h"


@interface ProjectDynamicTableViewController : UITableViewController<CreateDynamicDelegate,UINavigationControllerDelegate,SendProjectListDelegate,talkViewDelegate,UIAlertViewDelegate>

- (IBAction)buttonRemind:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelNaLeftTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonRemind;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewRemid;

- (IBAction)buttonPresonMessageClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonAddBar;

- (IBAction)buttonAddBar:(id)sender;

-(void)sendDynamicPush:(NSString*)strProjectID title:(NSString*)strTitle;

@property(nonatomic)BOOL isRemind;

@end
