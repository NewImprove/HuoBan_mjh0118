//
//  UpdateNameTableViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/19.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditNameTableViewController;

@protocol EditNameTableViewControllerDelegate <NSObject,UITextFieldDelegate>

-(void)EditNameControllerSave:(EditNameTableViewController*)controller retName:(NSString*)textFieldname;
-(void)EditNameControllerClose:(EditNameTableViewController*)controller;

@end
@interface EditNameTableViewController : UITableViewController

- (IBAction)cancel:(id)sender;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonSave;

@property (weak, nonatomic) IBOutlet UITextField *textfieldName;
- (IBAction)buttonSave:(id)sender;


@property(nonatomic,strong)NSString *strName;


@property(nonatomic,strong)id<EditNameTableViewControllerDelegate>delegate;
@end
