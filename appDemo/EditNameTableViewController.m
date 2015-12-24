//
//  UpdateNameTableViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/19.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "EditNameTableViewController.h"

@interface EditNameTableViewController ()

@end

@implementation EditNameTableViewController
@synthesize delegate,buttonSave,strName;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textfieldName.text = self.strName;
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    if([self.strName isEqualToString:@""]){
        self.buttonSave.enabled = NO;
    }

    self.textfieldName.layer.borderWidth = 0;
[self.textfieldName becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (IBAction)buttonSave:(id)sender {

    [self.delegate EditNameControllerSave:self retName:strName];
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    self.strName = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    self.buttonSave.enabled = ([self.strName length] > 0);
    return YES;
    
}
- (IBAction)cancel:(id)sender {
    [self.delegate EditNameControllerClose:self];
}
@end
