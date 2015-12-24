//
//  ProjectMoreStoryViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/15.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "UMSocialData.h"
#import "UMSocialControllerService.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
@class ProjectMoreStoryViewController;

@protocol ProjectMoreStoryDelegate <NSObject>

-(void)ProjectMoreStoryViewControllerButtonClose:(ProjectMoreStoryViewController*)controller;

@end

@interface ProjectMoreStoryViewController : UIViewController<LoginViewControllerDelegate,UMSocialDataDelegate,UMSocialUIDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webViewTopNum;

@property(nonatomic,strong)id<ProjectMoreStoryDelegate>delegate;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic,strong)NSString *strContents;

@property(nonatomic,strong)NSMutableArray *aryChouMoreStory;

@property(nonatomic,strong)NSString *strProjectID;

- (IBAction)buttonCancel:(id)sender;

@property(nonatomic,assign)NSInteger countPayDate;

@property(nonatomic,strong)NSDate *dateEnd;

@property(nonatomic,strong)NSString *strShareTitle;
@property(nonatomic,strong)NSString *strShareText;
@property(nonatomic,strong)NSString *strShareImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewShare;
@property (weak, nonatomic) IBOutlet UIButton *buttonShare;
- (IBAction)buttonShare:(id)sender;
- (IBAction)buttonClose:(id)sender;

@end
