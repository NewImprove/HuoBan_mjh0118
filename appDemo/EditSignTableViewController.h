//
//  EditSignTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditSignTableViewController;

@protocol EditSignDelegat <NSObject>

-(void)editSignControllerClose:(EditSignTableViewController*)controller;
-(void)editSignController:(EditSignTableViewController *)controller retSign:(NSString*)textSign;


@end

@interface EditSignTableViewController : UITableViewController<UITextFieldDelegate>


-(IBAction)buttonClose:(id)sender;
-(IBAction)buttonSave:(id)sender;


@property(nonatomic,weak)IBOutlet UIBarButtonItem *buttonSave;
@property(nonatomic,weak)IBOutlet UITextField *textfield;

@property(nonatomic,strong)id<EditSignDelegat>delegate;
@property(nonatomic,strong)NSString *strSign;

@end
