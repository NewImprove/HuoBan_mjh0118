//
//  EditAddTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "EditAddTableViewController.h"

@interface EditAddTableViewController ()

@end

@implementation EditAddTableViewController
@synthesize buttonSave,textView,delegate,strAdd;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.textView.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    self.textView.layer.borderWidth = 0.5f;
//    
//    self.textView.clipsToBounds = YES;
//    self.textView.layer.cornerRadius = 8;
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    self.textView.text = self.strAdd;
    
//    self.buttonSave.enabled = ([self.strAdd length]>0);
    
    [self.textView becomeFirstResponder];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonSave:(id)sender{
    NSLog(@"%@",self.textView.text);
    [self.delegate EditAddController:self retAdd:self.textView.text];
}
-(IBAction)buttonClose:(id)sender{
    
    [self.delegate EditAddControllerClose:self];
}



@end
