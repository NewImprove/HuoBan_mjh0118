//
//  ProjectMoreStoryTableViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/6.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProjectModel.h"
@class ProjectDynamicSelfTableViewController;

@protocol ProjectDynamicSelfDelegate <NSObject>

-(void)CloseProjectDynamicSelfController:(ProjectDynamicSelfTableViewController*)conttoller;

@end

@interface ProjectDynamicSelfTableViewController : UITableViewController

@property(nonatomic,strong)ProjectModel *projectModelDynamicSelf;

@property(nonatomic,strong)id<ProjectDynamicSelfDelegate>delegate;

@property(nonatomic,strong)NSString *strProjectID;

@property(nonatomic,strong)NSMutableArray *aryChouMordDynameic;



@end
