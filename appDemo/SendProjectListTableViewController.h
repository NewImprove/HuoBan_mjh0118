//
//  SendProjectListTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/11/5.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SendProjectListTableViewController;


@protocol SendProjectListDelegate <NSObject>

-(void)SendProjectListController:(SendProjectListTableViewController*)controller resDis:(NSMutableDictionary*)resDic;

@end

@interface SendProjectListTableViewController : UITableViewController



@property(nonatomic,strong)NSString *strToken;
@property(nonatomic,strong)NSString *strUserID;

@property(nonatomic,strong)id<SendProjectListDelegate>delegate;

@end
