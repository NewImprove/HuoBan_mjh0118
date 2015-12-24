//
//  UserSettingTableViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/19.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EditAddTableViewController.h"
#import "EditContentTableViewController.h"
#import "EditNameTableViewController.h"
#import "EditSexTableViewController.h"
#import "EditSignTableViewController.h"

@class UserSettingTableViewController;

@protocol UserSettingDelegate <NSObject>

-(void)UserSettingControllerClose:(UserSettingTableViewController*)controller;
-(void)UserSettingControllerSave:(UserSettingTableViewController*)controller;
-(void)UserSettingControllerCancel:(UserSettingTableViewController *)controller;

@end


@interface UserSettingTableViewController : UITableViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,EditAddDelegate,editContentDelegate,EditNameTableViewControllerDelegate,EditSexDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *UserImage;

@property (weak, nonatomic) IBOutlet UILabel *labelName;


@property (weak, nonatomic) IBOutlet UILabel *labelSex;


@property (weak, nonatomic) IBOutlet UILabel *labelAdd;
@property (weak, nonatomic) IBOutlet UILabel *labelSign;

@property (weak, nonatomic) IBOutlet UILabel *labelContent;

- (IBAction)buttonSave:(id)sender;

- (IBAction)buttonCancel:(id)sender;

@property(nonatomic,weak)id<UserSettingDelegate>delegate;





@end
