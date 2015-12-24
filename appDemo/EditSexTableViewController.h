//
//  EditSexTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditSexTableViewController;

@protocol EditSexDelegate <NSObject>

-(void)editSexControllerClose:(EditSexTableViewController*)controller;
-(void)editSexController:(EditSexTableViewController *)controller retSex:(NSString*)textSex;

@end

@interface EditSexTableViewController : UITableViewController<UITextFieldDelegate>


@property(nonatomic,strong)NSString *strSex;

//-(IBAction)buttonSave:(id)sender;
-(IBAction)buttonClose:(id)sender;

@property(nonatomic,weak)IBOutlet UIBarButtonItem *buttonSave;
@property(nonatomic,weak)IBOutlet UITextField *textField;

@property(nonatomic,strong)id<EditSexDelegate>delegate;


@end
