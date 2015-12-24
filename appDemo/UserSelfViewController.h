//
//  MineMessageViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModel.h"
#import "UserInfomation.h"
#import "UserSettingTableViewController.h"
#import "MKNetworkKit.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "DataModel.h"
#import "ImageSameWidth.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "ProjectDetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "UserMessageViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "AppSettingViewController.h"


@class UserSelfViewController;
@protocol UserSelfDelegate <NSObject>

-(void)userSelfViewControllerClose:(UserSelfViewController*)controller;

@end

@interface UserSelfViewController : UITableViewController<UserSettingDelegate,LoginViewControllerDelegate,AppSettingViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageSettingUseSelf;

- (IBAction)buttonSetting:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonSetting;
@property(nonatomic,strong)ProjectModel *projectModelUser;
@property(nonatomic,strong)UserInfomation *userInFomacionUser;
@property (weak, nonatomic) IBOutlet UIImageView *topImagePreson;
@property (weak, nonatomic) IBOutlet UILabel *topTextPreson;
@property (weak, nonatomic) IBOutlet UIButton *buttonMessageSetting;

@property (weak, nonatomic) IBOutlet UIImageView *imageSetting;
- (IBAction)buttonMessageSetting:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *topTextDynamic;
@property (weak, nonatomic) IBOutlet UIScrollView *midAScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *midBScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *downScrollView;
@property(nonatomic,strong)id<UserSelfDelegate>delegate;

@property BOOL selfID;
@end
