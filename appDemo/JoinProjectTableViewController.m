//
//  JoinProjectTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "JoinProjectTableViewController.h"

#import "PayForProjectTableViewController.h"
#import "ToolClass.h"
#import "DataModel.h"

@interface JoinProjectTableViewController ()

@end

@implementation JoinProjectTableViewController
@synthesize aryDataChou,projectID,imageClose,countDownJoinDate,dataDate,buttonClose;

CGFloat _heightLabelContent;
NSDateFormatter *_dateFormatterJoinIn;
NSDate  *_dateJoinInNow;
CGSize  _iOSBoundsJoin;
CGRect _viewLineSize;
NSDate *_createDate;

NSMutableParagraphStyle * _paragraphSummarizeStyleJoin;
NSMutableAttributedString  *_strContentsJoin;

NSString *_iOSJoinProject;
DataModel *_dataModelJoinProject;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"众筹众筹%@",self.aryDataChou);
    self.navigationController.navigationBar.translucent = NO;
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _iOSBoundsJoin = [UIScreen mainScreen].bounds.size;
    _dataModelJoinProject = [[DataModel alloc] init];

    _iOSJoinProject = _dataModelJoinProject.userInfomation.iOSDeviceSize;
    
    if([_iOSJoinProject isEqualToString:@"iPhone6Plus"]){
        
        imageClose.image = [UIImage imageNamed:@"back_white_3x"];
        
    }else{
        imageClose.image = [UIImage imageNamed:@"back_white_2x"];
    }
    
    
//    self.buttonClose.layer.borderWidth = 1;
//
//    _dateFormatterJoinIn = [[NSDateFormatter alloc] init];
//    
//    [_dateFormatterJoinIn setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.tableView reloadData];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    NSLog(@"打印数组数量%lu",(unsigned long)[self.aryDataChou count]);
    return [self.aryDataChou count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    _dateJoinInNow = [NSDate date];
    
    static NSString *joinProjectCellIdentifier = @"JoinProjectCell";
    
    NSMutableDictionary *dic = self.aryDataChou[indexPath.row];
    
    joinProjectTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:joinProjectCellIdentifier];

    cell.viewLine.backgroundColor = [UIColor whiteColor];
    cell.textMoney.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    cell.textTitle.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    cell.textContents.textColor =[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    cell.textPreson.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    cell.textTime.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    
    cell.textTitle.text = dic[@"title"];
    cell.textMoney.text = [NSString stringWithFormat:@"支持%ld元", [dic[@"money"]longValue]];
    
//    [cell.buttonJoin addTarget:self action:@selector(buttonJoinClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    cell.buttonJoin.tag = indexPath.row;
    
    
    
 _strContentsJoin =[[NSMutableAttributedString alloc]initWithString:dic[@"desc"]];
    
   _paragraphSummarizeStyleJoin =[[NSMutableParagraphStyle alloc]init];
    
    [_paragraphSummarizeStyleJoin setMinimumLineHeight:18];
    
    [_strContentsJoin addAttribute:NSParagraphStyleAttributeName value:_paragraphSummarizeStyleJoin range:NSMakeRange(0, [dic[@"desc"] length])];
    
    cell.textContents.attributedText = _strContentsJoin;
    [cell.textContents sizeToFit];
    _heightLabelContent = cell.textContents.frame.size.height;
    
//    if([[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]] timeIntervalSinceDate:_dateJoinInNow]/60 < 60){
//        
//        cell.textTime.text =[NSString stringWithFormat:@"%@分钟",[[NSString stringWithFormat:@"%f",[[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]  timeIntervalSinceDate:_dateJoinInNow]/60] componentsSeparatedByString:@"."][0]];
//        
//    }else if([[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]  timeIntervalSinceDate:_dateJoinInNow]/3600+ 8 < 24 && [[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]  timeIntervalSinceDate:_dateJoinInNow]/3600+ 8 >= 1) {
//        
//        cell.textTime.text =[NSString stringWithFormat:@"%@小时",[[NSString stringWithFormat:@"%f",[[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]   timeIntervalSinceDate:_dateJoinInNow]/3600+ 8] componentsSeparatedByString:@"."][0]];
//        
//    }else if([[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]   timeIntervalSinceDate:_dateJoinInNow]/86400 < 30 && [_dateJoinInNow timeIntervalSinceDate:[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]]/86400 >= 1){
//        
//        cell.textTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]    timeIntervalSinceDate:_dateJoinInNow]/86400] componentsSeparatedByString:@"."][0]];
//        
//    
//    }else if([[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]    timeIntervalSinceDate:_dateJoinInNow]/2592000 >=1  ){
//        
//        cell.textTime.text =[NSString stringWithFormat:@"%@月前",[[NSString stringWithFormat:@"%f",[[_dateFormatterJoinIn dateFromString:[dic[@"send_date"] substringToIndex:19]]   timeIntervalSinceDate:_dateJoinInNow]/2592000] componentsSeparatedByString:@"."][0]];
//        
//    }
//    NSLog(@"预计发货时间%@",cell.textTime.text);

    
    
//    NSLog(@"%f小时",[_dateJoinInNow timeIntervalSinceDate:sender.createDate]/3600+ 8);
//    if([_dateJoinInNow timeIntervalSinceDate:sender.createDate]/60 < 60){
//        
//        self.textTime.text = [NSString stringWithFormat:@"@%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/60] componentsSeparatedByString:@"."][0] ];
//        NSLog(@"%f天",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400);
//    }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8 < 24 && [_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8 >= 1){
//        
//        self.textTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8] componentsSeparatedByString:@"."][0] ];
//        
//        NSLog(@"%f小时",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8);
//    }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 < 30 && [_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 >= 1){
//        self.textTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 ] componentsSeparatedByString:@"."][0]];
//    }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/2592000 >=1){
//        self.textTime.text =[NSString stringWithFormat:@"%@个月前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/2592000 ] componentsSeparatedByString:@"."][0]];
//    }
    
    cell.textTime.text = [NSString stringWithFormat:@"众筹结束后%lu天内发送",[dic[@"send_number"] longValue]];
    
    if([dic[@"want"] longValue] >= 10000){
     
        cell.textPreson.text = [NSString stringWithFormat:@"已支持%ld人",[dic[@"fact"] longValue]];

    }else{
           cell.textPreson.text = [NSString stringWithFormat:@"已支持%ld人/%ld个名额",[dic[@"fact"] longValue],[dic[@"want"] longValue]];
    }

//    [cell.textMoney sizeToFit];
//    [cell.textPreson sizeToFit];
//    [cell.textTime sizeToFit];
//    [cell.textTitle sizeToFit];
//
//    
//    cell.viewLine.frame = CGRectMake(cell.viewLine.frame.origin.x,cell.viewLine.frame.origin.y,cell.viewLine.frame.size.width, cell.textContents.frame.size.height + cell.textPreson.frame.size.height + cell.textTitle.frame.size.height + 72);
//    
//    
//    
//    [cell.viewLine sizeToFit];
//    
//    
//    _heightLabelContent = cell.viewLine.frame.size.height + 18;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  _heightLabelContent + 132 ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    joinProjectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if( self.countDownJoinDate <= 0){
        [[ToolClass sharedInstance] showAlert:@"此项目众筹期已结束，你仍可以「关注」来加入项目社群喔"];
        return;
    }
//
    NSMutableDictionary *dic = self.aryDataChou[indexPath.row];
//
//    
    if([dic[@"fact"] longValue] - [dic[@"want"] longValue] == 0 ){
        
        [[ToolClass sharedInstance] showAlert:@"此档位已满，请选择其他档位支持"];
        return;
    }
    
    cell.viewLine.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    cell.textMoney.textColor = [UIColor whiteColor];
    cell.textTitle.textColor = [UIColor whiteColor];
    cell.textContents.textColor = [UIColor whiteColor];
    cell.textPreson.textColor = [UIColor whiteColor];
    cell.textTime.textColor = [UIColor whiteColor];
    
    
    
    NSLog(@"%@",dic);
    
    [self performSegueWithIdentifier:@"PayProjectSegue" sender:dic];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"PayProjectSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        PayForProjectTableViewController *controller = (PayForProjectTableViewController*)naVC.topViewController;
        
        NSLog(@"%@",sender);
        controller.dicPayDataModel = sender;
        
        controller.projectEndDate = self.dataDate;
        
        
        NSLog(@"带你传递Model%@",self.projectID);
        
        controller.projectID = self.projectID;
        
        
    }
}

-(void)buttonJoinClick:(UIButton*)sender{
    
    NSLog(@"出发了我要支持");
}


- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
