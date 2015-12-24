//
//  MainTableViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/25.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDCycleScrollView.h"
#import "HomeDynamicImageTableViewCell.h"
#import "UserSettingTableViewController.h"
#import "LoginViewController.h"

@interface HomePageTableViewController : UITableViewController<UISearchBarDelegate,HomeDynamicImageCellDelegate,LoginViewControllerDelegate>




@end
