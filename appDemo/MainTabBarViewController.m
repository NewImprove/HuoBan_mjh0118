//
//  MainTabBarViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/31.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "ProjectDynamicTableViewController.h"
#import "HomePageTableViewController.h"
#import "UserSelfViewController.h"
#import "ImageSameWidth.h"
#import "DataModel.h"


@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

NSInteger runtime;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataModel *dataModelMainTab = [[DataModel alloc] init];
    NSString *iOSSize =   dataModelMainTab.userInfomation.iOSDeviceSize;
    
    HomePageTableViewController *controllerHomePage = self.childViewControllers[0];
    ProjectDynamicTableViewController *controllerProjectDynamic = self.childViewControllers[1];
    UserSelfViewController *controllerUserSelf = self.childViewControllers[2];
    
//    ProjectDynamicTableViewController *controllerPD = [[ProjectDynamicTableViewController alloc] init];
//    if(self.indexSelect == 1){
//        controllerPD.isRemind = YES;
//        self.selectedIndex = 1;
//    }else{
//        controllerPD.isRemind = NO;
//        self.selectedIndex = 0;
//    }
    
//    self.selectedIndex = 1;


    NSLog(@"%@",iOSSize);
    if([iOSSize isEqualToString:@"iPhone6Plus"]){
        

        [controllerHomePage.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1] }
                                                     forState:UIControlStateNormal];
        
        //
        
        [controllerProjectDynamic.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName :[UIColor colorWithRed:61.0/255 green:163.0/255 blue:219.0/255 alpha:1] }
                                                           forState:UIControlStateNormal];
        [controllerUserSelf.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor yellowColor] }
                                                     forState:UIControlStateNormal];
        
        
        [controllerHomePage.tabBarItem setImage:[[UIImage imageNamed:@"tamenNO@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        
        [controllerHomePage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tamenYES@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        
        [controllerProjectDynamic.tabBarItem setImage:[[UIImage imageNamed:@"womenNO@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        [controllerProjectDynamic.tabBarItem setSelectedImage:[[UIImage imageNamed:@"womenYES@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        [controllerUserSelf.tabBarItem setImage:[[UIImage imageNamed:@"woNO@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
        
        [controllerUserSelf.tabBarItem setSelectedImage:[[UIImage imageNamed:@"woYES@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
    }else{
        [controllerHomePage.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1] }
                                                     forState:UIControlStateNormal];
        //[UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1]
        [controllerProjectDynamic.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName :[UIColor colorWithRed:61.0/255 green:163.0/255 blue:219.0/255 alpha:1] }
                                                           forState:UIControlStateNormal];
        [controllerUserSelf.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor yellowColor] }
                                                     forState:UIControlStateNormal];

        
        
        [controllerHomePage.tabBarItem setImage:[[UIImage imageNamed:@"tamenNO@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        
        [controllerHomePage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tamenYES@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        
        [controllerProjectDynamic.tabBarItem setImage:[[UIImage imageNamed:@"womenNO@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        [controllerProjectDynamic.tabBarItem setSelectedImage:[[UIImage imageNamed:@"womenYES@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        [controllerUserSelf.tabBarItem setImage:[[UIImage imageNamed:@"woNO@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
        
        
        [controllerUserSelf.tabBarItem setSelectedImage:[[UIImage imageNamed:@"woYES@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    

   
    //tabBar底部导航栏
    [self.tabBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //上放导航栏
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.tabBar setTranslucent:NO];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
