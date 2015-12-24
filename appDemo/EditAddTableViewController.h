//
//  EditAddTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditAddTableViewController;

@protocol EditAddDelegate <NSObject>

-(void)EditAddControllerClose:(EditAddTableViewController*)controller;
-(void)EditAddController:(EditAddTableViewController *)controller retAdd:(NSString*)text;


@end

@interface EditAddTableViewController : UITableViewController<UITextFieldDelegate>

-(IBAction)buttonClose:(id)sender;
-(IBAction)buttonSave:(id)sender;

@property(nonatomic,weak)IBOutlet UIBarButtonItem *buttonSave;

@property (weak, nonatomic) IBOutlet UITextView *textView;


@property(nonatomic,strong)NSString *strAdd;

@property(nonatomic,strong)id<EditAddDelegate>delegate;






@end
