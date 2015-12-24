//
//  EditContentTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "EditContentTableViewController.h"
#import "ToolClass.h"


@interface EditContentTableViewController ()

@end

@implementation EditContentTableViewController
@synthesize buttonSave,textView,delegate,strContent;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
//    self.textView.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    self.textView.layer.borderWidth = 0.5f;
    
//    self.textView.clipsToBounds = YES;
//    self.textView.layer.cornerRadius = 8;
    
    
    self.textView.text = self.strContent;
    
//    self.buttonSave.enabled = ([self.strContent length]>0);
    
    [self.textView becomeFirstResponder];
    

    
    }

-(IBAction)buttonSave:(id)sender{
    
    
    NSLog(@"%@",self.textView.text);
    if([self.textView.text length] > 140){
        
//        [[ToolClass sharedInstance] showAlert:[NSString stringWithFormat:@"简介不可超过140字，当前字数%i"],[self.textView.text length]];
        
        [[ToolClass sharedInstance] showAlert:[NSString stringWithFormat:@"简介不可超过140字，当前字数%lu",[self.textView.text length]]];
    }else{
        [self.delegate editContentController:self retContent:self.textView.text];
    }
    
    
}

-(IBAction)buttonClose:(id)sender{
    [self.delegate editContentControllerClose:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
