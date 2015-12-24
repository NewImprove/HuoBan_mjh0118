//
//  DynamicUpListTableViewController.m
//  huoban
//
//  Created by Lyc on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "DynamicUpListTableViewController.h"
#import "DynamicUpListTableViewCell.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "DataModel.h"
#import "OtherUserInfoViewController.h"

@interface DynamicUpListTableViewController ()

@end

@implementation DynamicUpListTableViewController

DataModel *_dataModelUpList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    


    _dataModelUpList = [[DataModel alloc] init];
    
    NSString *striOS = _dataModelUpList.userInfomation.iOSDeviceSize;
    
    
    if([striOS isEqualToString:@"iPhone6Plus"]){
        
        self.imageCancel.image = [UIImage imageNamed:@"back_blue_3x"];
        
    }else{
        self.imageCancel.image = [UIImage imageNamed:@"back_blue_2x"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.aryUpList count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DynamicUpListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DynamicUpListCell"];
    
    if(cell == nil){
        
        cell = [[DynamicUpListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DynamicUpListCell"];
    }
    
    [cell.buttonPresonMessage addTarget:self action:@selector(buttonProsonClickUpList:) forControlEvents:UIControlEventTouchUpInside];
    cell.buttonPresonMessage.tag = indexPath.row;
    
    NSMutableDictionary *dicData = self.aryUpList[indexPath.row];
    
    [cell.imageViewPreson sd_setImageWithURL:[NSURL URLWithString:dicData[@"image"]] placeholderImage:nil];
    
    cell.labelPresonName.text = dicData[@"name"];
    
    return cell;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"OtherMessageSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        controller.dicOtherUser = sender;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 68;
    
}

-(void)buttonProsonClickUpList:(UIButton*)sender{
    
    NSMutableDictionary *dicPresonMessage = self.aryUpList[sender.tag];
    
    [self performSegueWithIdentifier:@"OtherMessageSegue" sender:dicPresonMessage];
    
}


- (IBAction)buttonCancel:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
