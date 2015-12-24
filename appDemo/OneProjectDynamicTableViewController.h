//
//  OneProjectDynamicTableViewController.h
//  huoban
//
//  Created by Lyc on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModel.h"

@interface OneProjectDynamicTableViewController : UITableViewController<UIAlertViewDelegate>

@property(nonatomic,strong)NSString *strProjectID;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCancel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAdd;
@property(nonatomic,strong)ProjectModel *projectModelOneProject;

- (IBAction)buttonClose:(id)sender;



- (IBAction)buttonSendDynamic:(id)sender;

@property(nonatomic)bool isJoin;

@end
