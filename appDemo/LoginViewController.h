//
//  ViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//
@class LoginViewController;
@protocol LoginViewControllerDelegate <NSObject>

-(void)LoginViewControllerClose:(LoginViewController*)controller;

@end


#import <UIKit/UIKit.h>
#import "CDPMonitorKeyboard.h"
#import "RegisterAccountViewController.h"
#import "ToolClass.h"
#import "HomePageTableViewController.h"
#import "UserSelfViewController.h"
#import "CommonCrypto/CommonDigest.h"
#import "JSONKit.h"
#import "CommonBase64.h"
#import "ToolClass.h"
#import "CDPMonitorKeyboard.h"
#import "HomePageTableViewController.h"
#import "MainTabBarViewController.h"
#import "HttpClassSelf.h"
#import "UserSelfViewController.h"
#import "UserInfomation.h"
#import "DataModel.h"
#import "ProjectModel.h"
#import "ProjectDynamicTableViewController.h"
#import "ImageSameWidth.h"
#import "MainTabBarViewController.h"
#import "ForgotPWDViewController.h"


@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textUNTopNum;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;

- (IBAction)buttonClose:(id)sender;
//账号框
@property (weak, nonatomic) IBOutlet UITextField *textFieldUN;
//密码框
@property (weak, nonatomic) IBOutlet UITextField *textFieldPWD;

//登陆按钮
- (IBAction)Login:(id)sender;
//找回密码
- (IBAction)forgotPWD:(id)sender;
//注册用户
- (IBAction)registerAccount:(id)sender;
//点击背景
-(IBAction)backgroundTap:(id)sender;
-(IBAction)textfieldUNNEXT:(id)sender;

@property(nonatomic,strong)id<LoginViewControllerDelegate>delegate;
@end

