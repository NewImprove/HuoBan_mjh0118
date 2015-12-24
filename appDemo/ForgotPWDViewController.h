//
//  FindPWViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
@class ForgotPWDViewController;

//@protocol ForgotPWDViewControllerDelegate <NSObject>
//
//-(void)ForgotPWDViewController:(ForgotPWDViewController*)controller getPOST:(NSMutableDictionary*)returnDic;
//
//@end

//@protocol ForgotPWDViewControllerDelegate <NSObject>
//
//-(void)ForgotPWDViewController:(ForgotPWDViewController*)controller getPOST:(NSMutableDictionary*)returenDic;
//
//@end

@protocol ForgotPWDDelegate <NSObject>

-(void)forgotPWDViewController:(ForgotPWDViewController*)controller getDic:(NSMutableDictionary*)dic;

@end


@interface ForgotPWDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageMain;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;


- (IBAction)cancel:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *buttonCheckID;

@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUN;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPW;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCheckID;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textUNTopNum;

- (IBAction)Done:(id)sender;

-(IBAction)textfieldUNNEXT:(id)sender;
-(IBAction)textfieldCheckIDNEXT:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *labelCheckPWD;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textCheckID;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textPWD;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textUM;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonCheckIDHeight;

- (IBAction)checkidButton:(id)sender;

-(IBAction)backgroundTap:(id)sender;

@property(nonatomic,strong)id<ForgotPWDDelegate>delegate;

@end
