//
//  SendProjectListTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/11/5.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "SendProjectListTableViewController.h"
#import "DataModel.h"
#import "ToolClass.h"
#import "HttpClassSelf.h"
#import "SendProjectListTableViewCell.h"

@interface SendProjectListTableViewController ()

@end

@implementation SendProjectListTableViewController
@synthesize strToken,strUserID,delegate;


DataModel *_dataModelSendProject;
HttpClassSelf *_httpClassSendProject;
NSMutableArray *_aryDataList;
//NSInteger _sendListCellNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _dataModelSendProject = [[DataModel alloc] init];
    _httpClassSendProject = [[HttpClassSelf alloc] init];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
   

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"打印打印支持项目数量%lu",(unsigned long)[_aryDataList count]);
    
    return [_aryDataList count];
    
//    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


//    SendProjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payList"];
    
    

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SendListCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"payList"];
    
    
    
    
    NSMutableDictionary *dicSendProject =  _aryDataList[indexPath.row];
    
    
    UILabel *labelProjectName = (UILabel*)[cell viewWithTag:1000];
    
    labelProjectName.text = [NSString stringWithFormat:@"@ %@",dicSendProject[@"title"]];

    
//        cell.labelProjectList.text = dicSendProject[@"title"];

    
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.delegate SendProjectListController:self resDis:_aryDataList[indexPath.row]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
}



@end
