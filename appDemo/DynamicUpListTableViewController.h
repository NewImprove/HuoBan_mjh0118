//
//  DynamicUpListTableViewController.h
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicUpListTableViewController : UITableViewController

@property(nonatomic,strong)NSMutableArray *aryUpList;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
- (IBAction)buttonCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageCancel;

@end
