//
//  AppSettingViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

@class AppSettingViewController;
@protocol AppSettingViewControllerDelegate <NSObject>

-(void)appSettingViewControllerCancelLogin:(AppSettingViewController*)controller;

@end

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface AppSettingViewController : UIViewController<LoginViewControllerDelegate>

- (IBAction)CleanDataModel:(id)sender;

- (IBAction)cancelLoginIn:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;
- (IBAction)buttonCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageLogo;

@property (weak, nonatomic) IBOutlet UIView *viewLine;
@property (weak, nonatomic) IBOutlet UIButton *CleanDataModel;

@property (weak, nonatomic) IBOutlet UIImageView *imageClose;
@property (weak, nonatomic) IBOutlet UIButton *cancelLoginIn;

@property(nonatomic,strong)id<AppSettingViewControllerDelegate>delegate;
@end
