//
//  PayForProjectTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPayForAddAndNameViewController.h"

@interface PayForProjectTableViewController : UITableViewController<UIApplicationDelegate,EditPayForAddNameNumDelegate>
@property (weak, nonatomic) IBOutlet UIButton *buttonPay;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonEditMessage;
- (IBAction)buttonEditMessage:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *choseView;
@property (weak, nonatomic) IBOutlet UILabel *choseLabelTitle;
@property(weak,nonatomic)IBOutlet UILabel *choseLabelPayMoney;
@property (weak, nonatomic) IBOutlet UILabel *choseLabeldate;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelTelephontNum;
@property (weak, nonatomic) IBOutlet UILabel *labelProjectEnd;
@property (weak, nonatomic) IBOutlet UIImageView *imageFire;

@property (weak, nonatomic) IBOutlet UILabel *choseLabelPreson;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (weak, nonatomic) IBOutlet UILabel *addLabelAdd;


- (IBAction)buttonAlipay:(id)sender;

- (IBAction)buttonWeChat:(id)sender;

@property(nonatomic,strong)NSMutableDictionary *dicPayDataModel;
- (IBAction)cancel:(id)sender;

@property(nonatomic,strong)NSString *projectID;

@property (weak, nonatomic) IBOutlet UIButton *buttonAlipay;
@property (weak, nonatomic) IBOutlet UIButton *buttonWeChat;
@property(nonatomic,strong)NSDate *projectEndDate;
- (IBAction)buttonPay:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewButtonPay;


@end
