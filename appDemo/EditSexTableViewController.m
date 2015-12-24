//
//  EditSexTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "EditSexTableViewController.h"

@interface EditSexTableViewController ()

@end

@implementation EditSexTableViewController
@synthesize buttonSave,textField,strSex,delegate;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.text = self.strSex;
    
//    UITableViewCell *cellman = [self.tableView dequeueReusableCellWithIdentifier:@"cellSexMan"];
//    UITableViewCell *cellWoman = [self.tableView dequeueReusableCellWithIdentifier:@"cellSexWoman"];
//    
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(IBAction)buttonSave:(id)sender{
//    [self.delegate editSexController:self retSex:self.strSex];
//}
-(IBAction)buttonClose:(id)sender{
    [self.delegate editSexControllerClose:self];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if(indexPath.row == 0){
        
        [self.delegate editSexController:self retSex:@"男"];
     
        
        
    }else if(indexPath.row == 1){
        
        
        [self.delegate editSexController:self retSex:@"女"];
}

}










@end
