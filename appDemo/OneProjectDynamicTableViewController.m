//
//  OneProjectDynamicTableViewController.m
//  huoban
//
//  Created by Lyc on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "OneProjectDynamicTableViewController.h"
#import "DataModel.h"
#import "HttpClassSelf.h"
#import "MJRefresh.h"
#import "ToolClass.h"
#import "ProjectDynamic.h"
#import "DataModelCellProjectDetailDynamic.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "TalkViewController.h"
#import "CreateDynamicViewController.h"
#import "OtherUserInfoViewController.h"
#import "OneProjectTableViewCell.h"
#import "ProjectModel.h"


@interface OneProjectDynamicTableViewController ()

@end




@implementation OneProjectDynamicTableViewController
@synthesize strProjectID,imageViewAdd,imageViewCancel,projectModelOneProject;

HttpClassSelf *_httpClassOneProject;
int _numFlashPages;
NSMutableArray *_aryProjectMessage;
int _numXibCount;
float _floatScrollImage;
float _floatScrollLabel;
DataModelCellProjectDetailDynamic *_dataModelCell;
NSInteger _numButtonLove;
NSInteger _numLoveTimes;

NSArray *_aryImageWH;
NSCharacterSet *_subImageMessage;
NSString *_iOSOneProjectDynamic;
NSInteger _numImageWidth;
NSInteger _numImageHeight;
NSMutableArray *_aryButtonLovesOneProject;

NSDate *_dateNowOneProject;
NSMutableAttributedString * _attributedStringOneProject;

NSDateFormatter *_dateFormartOneProject;
NSMutableParagraphStyle * _paragraphStyleOneProject;

NSArray *_aryImageSub;
NSMutableDictionary *_dicDynamicUpList;

ProjectModel *_projectModelOneProject;
DataModel *_dataModelAll;

NSString *_strFeedIDDelete;

bool _boolkeyBoardAppear;
UIView *_viewJoinNone;

CGSize _iOSDeviceSizeOneProject;

- (void)viewDidLoad {
    [super viewDidLoad];

    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //导航栏整体
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.7],NSForegroundColorAttributeName : [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1]}];

    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        _aryProjectMessage = [[NSMutableArray alloc] init];
    
    

}

-(void)setupRefresh{

    
    [self.tableView addHeaderWithTarget:self action:@selector(refreshHeader)];
    
    [self.tableView headerBeginRefreshing];
    
    [self.tableView addFooterWithTarget:self action:@selector(refreshFooder)];
    
}

#define mark 「下拉」「上拉刷新」
-(void)refreshHeader{
    
    _numFlashPages = 0;
    
    _numLoveTimes = 0;
    

    
    DataModel *dataModelOneProject = [[DataModel alloc] init];
    
    _dateNowOneProject = [NSDate date];
    
    [_httpClassOneProject oneProjectDynamicSetProjectID:self.projectModelOneProject.projectID numPage:0 numNum:10 token:dataModelOneProject.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([dicData[@"status"] isEqualToString:@"success"]){
            
            [_aryProjectMessage removeAllObjects];
            
            for(NSMutableDictionary *getDicData in dicData[@"data"]){
                
                [_aryProjectMessage addObject:getDicData];
            }
            [self.tableView reloadData];
            [self.tableView headerEndRefreshing];

        }else{
            [[ToolClass sharedInstance] showAlert:@"下拉刷新失败，服务器错误"];
            [self.tableView headerEndRefreshing];
        }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"下拉刷新数百，请检查网络"];
        [self.tableView headerEndRefreshing];
        
    }];
}
-(void)refreshFooder{
    
    DataModel *dataModelFooder = [[DataModel alloc] init];
    
    _dateNowOneProject = [NSDate date];
    
    [_httpClassOneProject oneProjectDynamicSetProjectID:self.projectModelOneProject.projectID numPage:_numFlashPages numNum:10 token:dataModelFooder.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([dicData[@"status"] isEqualToString:@"success"]){
            
            if([dicData[@"data"] count] != 0 ){
                
                for(NSMutableDictionary *getDicData in dicData[@"data"]){
                    
                    [_aryProjectMessage addObject:getDicData];
                    
                }
                _numFlashPages++;
            }
            [self.tableView footerEndRefreshing];
            [self.tableView reloadData];
            
        }else{
            [[ToolClass sharedInstance] showAlert:@"上拉刷新失败，服务器错误"];
        }

        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        [[ToolClass sharedInstance] showAlert:@"上拉刷新失败，服务器错误"];
        [self.tableView footerEndRefreshing];
    }];

    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    _httpClassOneProject = [[HttpClassSelf alloc] init];
    
    //    _projectModelOneProject = [[ProjectModel alloc] init];
    
    _iOSOneProjectDynamic = _dataModelAll.userInfomation.iOSDeviceSize;
    
    _iOSDeviceSizeOneProject = [UIScreen mainScreen].bounds.size;
    
    _dataModelAll = [[DataModel alloc] init];
    
    _aryImageSub = [[NSArray alloc] init];
    
    _aryButtonLovesOneProject = [[NSMutableArray alloc] init];
    
    _numXibCount = 0;
    
    _boolkeyBoardAppear = NO;
    
    _subImageMessage = [NSCharacterSet characterSetWithCharactersInString:@"!*"];
    
    _numImageHeight = 160;
    
    self.title = projectModelOneProject.projectTitle;
    
    _paragraphStyleOneProject = [[NSMutableParagraphStyle alloc]init];
    
    [_paragraphStyleOneProject setMinimumLineHeight:18];
    
    _dateFormartOneProject = [[NSDateFormatter alloc] init];
    
    [_dateFormartOneProject setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    if([_iOSOneProjectDynamic isEqualToString:@"iPhone6Plus"]){
        
        self.imageViewCancel.image = [UIImage imageNamed:@"back_blue_3x"];
        if(self.isJoin == YES){
            self.imageViewAdd.image = [UIImage imageNamed:@"addICON_blue_3x"];
        }else{
            self.imageViewAdd.image = [UIImage imageNamed:@"addICON_grey_3x"];
        }
        
        
    }else{
        
        self.imageViewCancel.image = [UIImage imageNamed:@"back_blue_2x"];
        if(self.isJoin == YES){
            self.imageViewAdd.image = [UIImage imageNamed:@"addICON_blue_2x"];
        }else{
            self.imageViewAdd.image = [UIImage imageNamed:@"addICON_grey_2x"];
        }
    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self setupRefresh];
    
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"%lu",[_aryProjectMessage count]);
    return [_aryProjectMessage count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    OneProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OneProject"];

    if (cell == nil)
    {
        cell = [[OneProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OneProject"];
    }
    NSLog(@"%@",_aryProjectMessage);
    
    NSMutableDictionary *resDic = _aryProjectMessage[indexPath.row];
    
    
    cell.buttonLove.tag = indexPath.row;
    [cell.buttonLove addTarget:self action:@selector(buttonLoveClickOneProject:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonTalk.tag = indexPath.row;
    [cell.buttonTalk addTarget:self action:@selector(buttonTalkClickOneProject:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonPresonMessage.tag = indexPath.row;
    [cell.buttonPresonMessage addTarget:self action:@selector(buttonPresonMessageClickOneProject:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonDelete.tag = indexPath.row;
    [cell.buttonDelete addTarget:self action:@selector(buttonDeleteClickOneProject:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableDictionary *dicCretor = resDic[@"user"];
    
    cell.labelBy.text = dicCretor[@"name"];
    
    if([resDic[@"isCreator"] longValue] == 1){
        cell.labelIsCreator.text = @"发起人";
        [cell.labelIsCreator sizeToFit];
    }else{
        cell.labelIsCreator.text = @"";
        [cell.labelIsCreator sizeToFit];
    }
    
    
    NSMutableDictionary *dicProject = resDic[@"project"];
    cell.labelProjectName.text = dicProject[@"title"];
    
    [cell.imageViewPreson sd_setImageWithURL:[NSURL URLWithString:dicCretor[@"image"]] placeholderImage:nil];
    
    NSDate *datetime = [_dateFormartOneProject dateFromString:[resDic[@"time"] substringToIndex:19]];
    
    if([_dateNowOneProject timeIntervalSinceDate:datetime]/60 == 0){
        cell.labelTime.text = @"刚刚";
        
    }else if([_dateNowOneProject timeIntervalSinceDate:datetime]/60 < 60){
        
        cell.labelTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowOneProject timeIntervalSinceDate:datetime]/60] componentsSeparatedByString:@"."][0] ];
        
    }else if([_dateNowOneProject timeIntervalSinceDate:datetime]/3600 < 24 && [_dateNowOneProject timeIntervalSinceDate:datetime]/3600 >= 1){
        
        cell.labelTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[_dateNowOneProject timeIntervalSinceDate:datetime]/3600] componentsSeparatedByString:@"."][0] ];
        
        NSLog(@"%f小时",[_dateNowOneProject timeIntervalSinceDate:datetime]/3600+ 8);
        
        
    }else if([_dateNowOneProject timeIntervalSinceDate:datetime]/86400 == 1){
        
        cell.labelTime.text = @"昨天";
        
    }else if([_dateNowOneProject timeIntervalSinceDate:datetime]/86400 > 1 && [_dateNowOneProject timeIntervalSinceDate:datetime]/86400 <= 2){
        
        cell.labelTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[_dateNowOneProject timeIntervalSinceDate:datetime]/86400 ] componentsSeparatedByString:@"."][0]];
        
    }else if([_dateNowOneProject timeIntervalSinceDate:datetime]/86400 > 2){
        
        cell.labelTime.text=[NSString stringWithFormat:@"%@",[[NSString stringWithFormat:@"%@",datetime] substringToIndex:10]];
    }
    
    _attributedStringOneProject =[[NSMutableAttributedString alloc]initWithString:resDic[@"message"]];
    
    
    [_attributedStringOneProject addAttribute:NSParagraphStyleAttributeName value:_paragraphStyleOneProject range:NSMakeRange(0,[resDic[@"message"] length])];
    
    cell.labelContents.attributedText = _attributedStringOneProject;
    
    [ cell.labelContents sizeToFit];
    _floatScrollLabel = cell.labelContents.frame.size.height;
    
    if([resDic[@"image"] isEqualToString:@""] || resDic[@"image"] == nil){
        
        cell.imageViewContent.image = nil;
        _floatScrollImage = 1;
        cell.imageViewContentHeight.constant = 1;
        
    }else{
        
        //上线
        _aryImageSub = [resDic[@"image"] componentsSeparatedByCharactersInSet:_subImageMessage];
        
        if(160/([_aryImageSub[2] floatValue]/[_aryImageSub[1] floatValue]) > _iOSDeviceSizeOneProject.width - 74){
            
            cell.imageViewContentHeight.constant = (_iOSDeviceSizeOneProject.width - 74)/([_aryImageSub[1] floatValue]/[_aryImageSub[2] floatValue]);
            
            [cell.imageViewContent sd_setImageWithURL:[NSURL URLWithString:resDic[@"image"]] placeholderImage:nil];
            
            cell.imageViewContentWidth.constant = _iOSDeviceSizeOneProject.width - 74;
            _floatScrollImage = cell.imageViewContentHeight.constant;
            
        }else{
            cell.imageViewContentWidth.constant = 160/([_aryImageSub[2] floatValue]/[_aryImageSub[1] floatValue]);
            
            [cell.imageViewContent sd_setImageWithURL:[NSURL URLWithString:resDic[@"image"]] placeholderImage:nil];
            
            cell.imageViewContentHeight.constant = 160;
            _floatScrollImage = 160;
        }
        
//        cell.imageViewContent.layer.borderWidth =1;

        
    }
    
    
    if(_numLoveTimes == 0){
        
        if([resDic[@"isUp"] longValue] == 0){
            if([_iOSOneProjectDynamic isEqualToString:@"iPhone6Plus"]){
                
                cell.imageViewLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                
            }else{
                
                cell.imageViewLove.image = [UIImage imageNamed:@"women_like_grey_2x"];
                
            }
            
        }else{
            if([_iOSOneProjectDynamic isEqualToString:@"iPhone6Plus"]){
                
                cell.imageViewLove.image = [UIImage imageNamed:@"women_like_blue_3x"];
                
            }else{
                
                cell.imageViewLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
                
            }
        }
        
    }
    
    
    
    if([dicCretor[@"_id"] isEqualToString:_dataModelAll.userInfomation.UserID]){
        
        cell.imageViewDelete.hidden = NO;
        cell.buttonDelete.hidden = NO;
        
    }else{
        cell.imageViewDelete.hidden = YES;
        cell.buttonDelete.hidden = YES;
        
    }
    

    NSMutableDictionary *dicComment = resDic[@"comment"];
    cell.labelLove.text = [NSString stringWithFormat:@"%lu个喜欢，",[dicComment[@"count"] longValue]];
    
    _dicDynamicUpList = resDic[@"up"];
    cell.labelComment.text =[NSString stringWithFormat:@"%lu条评论",[_dicDynamicUpList[@"count"] longValue]];
    
    
    return  cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _floatScrollImage + _floatScrollLabel + 133;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    _boolkeyBoardAppear = NO;
    
    [self performSegueWithIdentifier:@"talkSegue" sender:_aryProjectMessage[indexPath.row][@"_id"]];
    
    NSLog(@"%@",_aryProjectMessage[indexPath.row][@"_id"]);
}


#define mark Segue跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"SendDynamicSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        CreateDynamicViewController *controller = (CreateDynamicViewController*)naVC.topViewController;
        
        controller.projectModelSendData = sender;
        
    }else if([segue.identifier isEqualToString:@"OtherUserSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        controller.dicOtherUser = sender;
        
        
    }else if([segue.identifier isEqualToString:@"talkSegue"]){
     
        TalkViewController *controller = segue.destinationViewController;
        
        controller.keyBoardIsAppear = _boolkeyBoardAppear;
        
        controller.strfeedID = sender;
        
    }
}


#define mark CELL按钮方法


-(void)buttonLoveClickOneProject:(UIButton*)sender{
    
    NSIndexPath *indexPathLove = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    OneProjectTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPathLove];
    
    _aryButtonLovesOneProject = [[NSMutableArray alloc] init];
    
    DataModel *dataModelLove = [[DataModel alloc] init];
    
    [_httpClassOneProject projectDynamicOurSetUser:dataModelLove.userInfomation.UserID numPage:0 numNum:1000 token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        
        
        NSMutableDictionary *resDicLove = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([resDicLove[@"status"] isEqualToString:@"success"]){
            
            [_aryButtonLovesOneProject removeAllObjects];
            
            for(NSMutableDictionary *dicCell in resDicLove[@"data"]){
                
                [_aryButtonLovesOneProject addObject:dicCell];
                
            }
            
            NSMutableDictionary *dicLoveButtons = _aryButtonLovesOneProject[sender.tag];
            
            NSLog(@"%@",dicLoveButtons);
            
            if([dicLoveButtons[@"isUp"] longValue] == 0){
                
                
                [_httpClassOneProject loveProjectselfSetFeed:dicLoveButtons[@"_id"] up:1 token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                    NSData *data = [operatioin responseData];
                    
                    NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
                    if([dicData[@"status"] isEqualToString:@"success"]){
                        
                        
                        if([_iOSOneProjectDynamic isEqualToString:@"iPhone6Plus"]){
                            
                            
                            cell.imageViewLove.image = [UIImage imageNamed:@"women_like_blue_3x"];
                            
                        }else{
                            
                            cell.imageViewLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
                            
                        }
                        
                        _numLoveTimes = 1;
                        cell.labelLove.text = [NSString stringWithFormat:@"%lld个喜欢，",[[cell.labelLove.text substringToIndex:[cell.labelLove.text length]-3] longLongValue] + 1];
                        
                    }else{
                        [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，服务器错误"];
                    }
                }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                    [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，请检查网络"];
                }];
                
            }else{
                
                
                NSLog(@"%@",dicLoveButtons);
                
                [_httpClassOneProject loveProjectselfSetFeed:dicLoveButtons[@"_id"] up:0 token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                    NSData *data = [operatioin responseData];
                    
                    NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
                    if([dicData[@"status"] isEqualToString:@"success"]){
                        
                        if([_iOSOneProjectDynamic isEqualToString:@"iPhone6Plus"]){
                            
                            cell.imageViewLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                        }else{
                            
                            cell.imageViewLove.image = [UIImage imageNamed:@"women_like_grey_2x"];
                            
                        }
                        
                        _numLoveTimes = 1;
                        
                        cell.labelLove.text = [NSString stringWithFormat:@"%lld个喜欢，",[[cell.labelLove.text substringToIndex:[cell.labelLove.text length]-3] longLongValue] - 1];
                    }else{
                        [[ToolClass sharedInstance]showAlert:@"取消'喜欢'失败，服务器错误"];
                    }
                }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                    [[ToolClass sharedInstance]showAlert:@"取消'喜欢'失败，请检查网络"];
                }];
            }
        }else{
            
            [[ToolClass sharedInstance]showAlert:@"刷新失败，服务器报错"];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
        //        [self.tableView headerEndRefreshing];
        
    }];
    
    
    
}
-(void)buttonTalkClickOneProject:(UIButton*)sender{
    
    _boolkeyBoardAppear = YES;
    
    NSLog(@"%lu",sender.tag);
    
    [self performSegueWithIdentifier:@"talkSegue" sender:_aryProjectMessage[sender.tag][@"_id"]];
    
}
-(void)buttonDeleteClickOneProject:(UIButton*)sender{
    
//    [self performSegueWithIdentifier:@"talkSegue" sender:_aryProjectMessage[sender.tag][@"_id"]];
    _strFeedIDDelete = _aryProjectMessage[sender.tag][@"_id"];
    
    UIAlertView *alertDelete = [[UIAlertView alloc] initWithTitle:@"你确定要删除吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

    [alertDelete show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 1){
        
        DataModel *dataModelDelete = [[DataModel alloc]init];
        
        [_httpClassOneProject deleteProjectDynamic:_strFeedIDDelete token:dataModelDelete.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            if([dic[@"status"] isEqualToString:@"success"]){
                
                [self.tableView headerBeginRefreshing];
                
            }else{
                
                [[ToolClass sharedInstance] showAlert:@"删除失败服务器错误"];
            }
            
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                [[ToolClass sharedInstance] showAlert:@"删除失败服务器错误"];
        }];
    }
}

-(void)buttonPresonMessageClickOneProject:(UIButton*)sender{


    
    NSMutableDictionary *dic = _aryProjectMessage[sender.tag];
    
    NSMutableDictionary *dicUser = dic[@"user"];
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:dicUser];
    
}

- (IBAction)buttonClose:(id)sender {
    
    
    //加上这么一句
    [self.navigationController popViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#define mark 「+」发动态按钮
- (IBAction)buttonSendDynamic:(id)sender {
    
    if(self.isJoin == YES){
        
     [self performSegueWithIdentifier:@"SendDynamicSegue" sender:self.projectModelOneProject];
        
    }else if(self.isJoin == NO){
        
    [[ToolClass sharedInstance] showAlert:@"加入即可发布动态"];
        
    }
    
}

-(void)viewNoneJoin{
    
//    UIView *view = [[UIView alloc] initWithFrame:<#(CGRect)#>]
    
    
    
}
@end
