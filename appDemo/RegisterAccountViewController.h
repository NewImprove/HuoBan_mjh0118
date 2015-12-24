//
//  CreateANViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpClassSelf.h"
#import "MKNetworkKit.h"
@class RegisterAccountViewController;

@protocol RegisterAccountViewControllerDelegate <NSObject>

//返回代理方法
-(void)RegisterAccountViewController:(RegisterAccountViewController*)controller getPOST:(NSMutableDictionary*)dic;

@end
@interface RegisterAccountViewController : UIViewController
//返回按钮
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UIImageView *imageMain;
@property (weak, nonatomic) IBOutlet UIButton *buttonCheckID;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textUNTopNum;

//电话文本框
@property (weak, nonatomic) IBOutlet UITextField *textFieldUN;
//密码文本框
@property (weak, nonatomic) IBOutlet UITextField *textFieldPW;
//验证码文本框
@property (weak, nonatomic) IBOutlet UITextField *textCheckId;
@property (weak, nonatomic) IBOutlet UITextField *labelCheckPWD;

//获取验证码按钮
-(IBAction)checkidButton:(id)sender;

//完成注册按钮
- (IBAction)doneButton:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textPWDHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textCheckIDHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textUNHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonCheckIDHeight;


@property(strong,nonatomic)NSMutableData *receiveData;


@property(nonatomic,weak)id<RegisterAccountViewControllerDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIImageView *imageClose;



//点击背景
-(IBAction)backgroundTap;
//-(void)backGroundClick;
//键盘NEXT；
-(IBAction)usernameNEXT:(id)sender;
-(IBAction)checkidNEXT:(id)sender;

@end
