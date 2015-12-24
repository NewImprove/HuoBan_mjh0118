//
//  EditContentTableViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditContentTableViewController;
@protocol editContentDelegate <NSObject>

-(void)editContentControllerClose:(EditContentTableViewController*)controller;
-(void)editContentController:(EditContentTableViewController*)controller retContent:(NSString*)textContent;

@end

@interface EditContentTableViewController : UITableViewController<UITextFieldDelegate>


-(IBAction)buttonClose:(id)sender;
-(IBAction)buttonSave:(id)sender;

@property(nonatomic,weak)IBOutlet UIBarButtonItem *buttonSave;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@property(nonatomic,strong)NSString *strContent;
@property(nonatomic,strong)id<editContentDelegate>delegate;







@end
