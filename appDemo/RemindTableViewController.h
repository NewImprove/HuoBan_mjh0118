//
//  RemindTableViewController.h
//  huoban
//
//  Created by Lyc on 15/12/17.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemindTableViewController : UITableViewController

@property(nonatomic,strong)NSMutableDictionary *dicMessage;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;
- (IBAction)buttonCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
@end
