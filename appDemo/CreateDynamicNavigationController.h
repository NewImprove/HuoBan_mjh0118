//
//  CreateDynamicNavigationController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "REMenu.h"
@class CreateDynamicNavigationController;

@protocol DynamicMenuDelegate <NSObject>

-(void)dynamucNoMenuController:(CreateDynamicNavigationController*)controller;

@end


@interface CreateDynamicNavigationController : UINavigationController


@property(strong,readonly,nonatomic)REMenu *menu;


//@property(strong)id<DynamicMenuDelegate>delegate;

-(void)toggleMenu;


@end
