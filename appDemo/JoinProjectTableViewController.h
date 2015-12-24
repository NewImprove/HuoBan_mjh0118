//
//  JoinProjectTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "joinProjectTableViewCell.h"

@interface JoinProjectTableViewController : UITableViewController

@property(nonatomic,strong)NSMutableArray *aryDataChou;


@property(nonatomic,strong)NSString *projectID;

@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

- (IBAction)buttonCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;

@property(nonatomic)NSInteger countDownJoinDate;

@property(nonatomic,strong)NSDate *dataDate;

@end
