//
//  EditSignTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "EditSignTableViewController.h"

@interface EditSignTableViewController ()

@end

@implementation EditSignTableViewController
@synthesize buttonSave,textfield,delegate,strSign;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    self.textfield.text = self.strSign;
//    
//    self.textfield.layer.borderWidth = 0.5f;
//    self.textfield.layer.borderColor = [UIColor darkGrayColor].CGColor;
//    
//    self.textfield.clipsToBounds = YES;
//    self.textfield.layer.cornerRadius = 8;
    
//    self.buttonSave.enabled = ([self.strSign length]>0);
    
    [self.textfield becomeFirstResponder];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonClose:(id)sender{
    [self.delegate editSignControllerClose:self];
    
}

-(IBAction)buttonSave:(id)sender{
    
    [self.delegate editSignController:self retSign:self.strSign];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    self.strSign = [self.textfield.text stringByReplacingCharactersInRange:range withString:string];
    
    self.buttonSave.enabled = ([self.strSign length]>0 );
    return  YES;
}
@end
