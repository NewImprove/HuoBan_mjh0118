//
//  RemindTableViewController.m
//  huoban
//
//  Created by Lyc on 15/12/17.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "RemindTableViewController.h"
#import "RemindTableViewCell.h"
#import "DataModel.h"
#import "UIImageView+WebCache.h"



@interface RemindTableViewController ()

@end

@implementation RemindTableViewController

NSString *_striOSRemind;
NSMutableArray *_aryRemindMessage;
DataModel *_dataModelRMCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataModel *dataModelAll = [[DataModel alloc] init];
    
    _striOSRemind = dataModelAll.userInfomation.iOSDeviceSize;
    
    _dataModelRMCell = [[DataModel alloc] init];

    NSLog(@"%lu",[_dataModelRMCell.aryRemindMessage count]);
    
    if([_striOSRemind isEqualToString:@"iPhone6Plus"]){
        self.imageClose.image = [UIImage imageNamed:@"back_blue_3x"];
    }else{
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
    }
//    _aryRemindMessage  = [[NSUserDefaults standardUserDefaults] objectForKey:@"RemindMessage"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
//    return [_dataModelRMCell.aryRemindMessage count];
    return 100;


}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RemindTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"RemindMessage"];
    
    if(cell == nil){
        cell = [[RemindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RemindMessage"];
    }
    
    _dataModelRMCell = _aryRemindMessage[indexPath.row];
    

    cell.labelContents.text = _dataModelRMCell.remindMessage.strContents;
    cell.labelBy.text = _dataModelRMCell.remindMessage.strBy;

    [cell.imagePreson sd_setImageWithURL:[NSURL URLWithString:_dataModelRMCell.remindMessage.strImage] placeholderImage:nil];
    cell.imagePreson.clipsToBounds = YES;
    cell.imagePreson.layer.cornerRadius = 22;
    
    if(_dataModelRMCell.remindMessage.type == 1){
     
        cell.labelBy.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
    cell.imagePreson.layer.cornerRadius = 0;
        
    }else if(_dataModelRMCell.remindMessage.type == 2){
        cell.labelBy.textColor = [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1];
        cell.imagePreson.layer.cornerRadius = 0;
    }else if(_dataModelRMCell.remindMessage.type == 3){
        cell.labelBy.textColor = [UIColor colorWithRed:33.0/255 green:33.0/255 blue:33.0/255 alpha:1];
        cell.imagePreson.layer.cornerRadius = 22;
    }else if (_dataModelRMCell.remindMessage.type == 4){
        cell.labelBy.textColor = [UIColor colorWithRed:33.0/255 green:33.0/255 blue:33.0/255 alpha:1];
        cell.imagePreson.layer.cornerRadius = 22;
    }else if(_dataModelRMCell.remindMessage.type == 5){
        cell.labelBy.textColor = [UIColor colorWithRed:33.0/255 green:33.0/255 blue:33.0/255 alpha:1];
        cell.imagePreson.layer.cornerRadius = 22;
    }
    
    
    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"TalkSegue"]){
        
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"TalkSegue" sender:nil];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 68;
}



- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
