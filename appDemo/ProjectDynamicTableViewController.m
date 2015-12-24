//
//  ProjectAllMessageTableViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/8.
//  Copyright (c) 2015年 lyc. All rights reserved.




#import "ProjectDynamicTableViewController.h"
#import "ProjectDynamic.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "MJRefresh.h"
#import "ProjectModel.h"
#import "DataModel.h"
#import "ImageSameWidth.h"
#import "TalkViewController.h"
#import "ProjectDetailsViewController.h"
#import "OtherUserInfoViewController.h"
#import "DataModelCellProjectDetailDynamic.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "CreateDynamicNavigationController.h"
#import "CreateDynamicViewController.h"
#import "OneProjectDynamicTableViewController.h"


@interface ProjectDynamicTableViewController ()

@end

@implementation ProjectDynamicTableViewController
@synthesize buttonAddBar;


bool _seleced ;

NSInteger _KeyBoardNum;
NSMutableArray *_arrayCell;
CGFloat _floatLabel;
CGFloat _floatImage;

bool _clickAddBool;
NSMutableArray *_arrayImage;

NSMutableArray *_aryReloadlist;

NSMutableArray *_aryProjectDynamic;

NSMutableArray *_resProjectDynamic;

NSMutableArray *_aryRESDic;

HttpClassSelf *_httpClassProjectDymanicSelf;

ProjectModel *_projectModelProjectDynamic;

NSMutableDictionary *_dic;

NSString *_strToken;

DataModel *_dataModelProjectDynamic;

NSInteger _xibCellNum;

NSString *_iOSSizeWM;

NSArray *_aryImageStrFrist;
NSArray *_aryImageStrSecond;
NSArray *_aryImageStrTEST;

NSString *strTextA;
NSCharacterSet * _subImageStrFrist;
NSCharacterSet * _subImageStrSecond;
NSCharacterSet * _subImageStrTEST;
NSMutableAttributedString * _attributedStringProjectDynamic;

NSInteger _buttonLoveNum;
NSInteger _buttonLoveRuntime;

NSInteger  _imageWidthPD;
NSInteger _imageHeightPD;

NSMutableArray *_artImageTEXT;
NSInteger _loveTimes;

DataModelCellProjectDetailDynamic *_dataModelCellPD;
NSMutableArray *_aryButtonLoves;

NSMutableArray *_aryPayList;

CGSize _iOSDeviceSizeWM;

NSDate *_dateNowHomePageProjectDynamic;

UIView *_viewPayList;
UIView *_viewReloadList;
NSMutableDictionary *_dicReloadList;

UIView *_viewEmpty;
bool _clickReloadBool;
bool _talkKeyBoardBool;
bool _isLove;
bool _isDeleteDynamic;
bool _isHaveDynamicSelf;
bool _isAppearAllProject;
bool _isJoin;

int _topNumPage = 0;
int _topNumNum = 6;
int _downAllProjectNumPage = 1;
int _numMyDynamicListFooder;
int _numProjectFooder;
int _dowmNumNum = 6;

NSInteger _runtimesWM;
NSInteger _numFlashType;
NSInteger _numScrollView;

NSString *_strUserID;
NSDateFormatter *_dateFormartProjectDynamic;
NSMutableParagraphStyle * _paragraphStyleProjectDynamic;

NSString *_strDeleteFeedID;

- (void)viewDidLoad {
    [super viewDidLoad];

    _KeyBoardNum = 0;
    
    //导航栏背景
      [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    

   
    //导航栏整体
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1]}];
    
    
    _viewPayList = [[UIView alloc] init];
    _viewPayList.hidden = YES;
    _clickAddBool = YES;
    
    _viewReloadList = [[UIView alloc] init];
    _viewReloadList.hidden = YES;
    _clickReloadBool = YES;
    
    _dataModelProjectDynamic = [[DataModel alloc]init];
    _iOSSizeWM = _dataModelProjectDynamic.userInfomation.iOSDeviceSize;
    
    if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
        self.imageViewRemid.image = [UIImage imageNamed:@"remind@3x"];
    }else{
        self.imageViewRemid.image = [UIImage imageNamed:@"remind@2x"];
    }
    _iOSDeviceSizeWM = [UIScreen mainScreen].bounds.size;

    [self EmptyViewAppear];
    
    
    self.isRemind = NO;
    
    _paragraphStyleProjectDynamic = [[NSMutableParagraphStyle alloc]init];
    
    [_paragraphStyleProjectDynamic setMinimumLineHeight:18];
    
    _dateFormartProjectDynamic = [[NSDateFormatter alloc] init];
    
    [_dateFormartProjectDynamic setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    _httpClassProjectDymanicSelf  = [[HttpClassSelf alloc]init];
    
    _projectModelProjectDynamic =[[ProjectModel alloc]init];
    
    _arrayImage = [[NSMutableArray alloc] init];
    
    _aryProjectDynamic = [[NSMutableArray alloc]init];
    
    
    _aryPayList = [[NSMutableArray alloc] init];
    
    
    
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _xibCellNum = 0;
    
    //    strTextA = @"http://images.huoban.io/userDynamic/550941080!398*265";
    
    _subImageStrTEST = [NSCharacterSet characterSetWithCharactersInString:@"!*"];
    
    _imageHeightPD = 160;
    
    
    
    _runtimesWM  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
   
    if(_runtimesWM != 1){
        
        self.labelNaLeftTitle.textColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1];
        
        _viewEmpty.hidden = NO;
        self.buttonAddBar.enabled = NO;
        self.buttonRemind.enabled = NO;
        self.tableView.scrollEnabled = NO;
        
        return;
    }else{
        
        
        
        self.labelNaLeftTitle.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
        _viewEmpty.hidden = YES;
        self.buttonAddBar.enabled = YES;
        self.tableView.scrollEnabled = YES;
                self.buttonRemind.enabled = NO;
        _topNumNum = 10;
        //        if(self.isRemind == YES){
        //
        //        [self performSegueWithIdentifier:@"RemindSegue" sender:nil];
        //
        //        }else{
        //
        //        [self setupRefresh];
        
        //        }
        
        [self setupRefresh];
        //        [self performSegueWithIdentifier:@"RemindSegue" sender:nil];
        
    }
}

//-(void)sendDynamicPush:(NSString *)strProjectID title:(NSString *)strTitle{
//
//    ProjectModel *projectModelSend = [[ProjectModel alloc] init];
//    
//    projectModelSend.projectTitle = strTitle;
//    projectModelSend.projectID = strProjectID;
//    
//    [self performSegueWithIdentifier:@"SendDynamicSegue" sender:projectModelSend];
//}

- (void)viewWillLayoutSubviews
{
//    [super viewWillLayoutSubviews];
//    CreateDynamicNavigationController *navigationController = (CreateDynamicNavigationController *)self.navigationController;
//    [navigationController.menu setNeedsLayout];
}

-(void)setupRefresh{
    
    [self.tableView addHeaderWithTarget:self action:@selector(redfreshHeader)];
    
    [self.tableView headerBeginRefreshing];
    
    [self.tableView addFooterWithTarget:self action:@selector(redfreshFooder)];
    
}

-(void)redfreshHeader{
    
    _topNumPage = 0;
    _downAllProjectNumPage = 1;
    _numProjectFooder = 1;
    _numMyDynamicListFooder = 1;
    
    
    _dateNowHomePageProjectDynamic = [NSDate date];
    
    DataModel *dataModelHeader = [[DataModel alloc] init];

    

        
        [_viewReloadList removeFromSuperview];
        _clickReloadBool = YES;
        self.buttonAddBar.enabled = YES;
        self.tableView.scrollEnabled = YES;
        //「全部项目」
        _isAppearAllProject = NO;
        //允许删除聊天
        _isDeleteDynamic = NO;
        
        _strUserID = _dataModelProjectDynamic.userInfomation.UserID;
        
        [_httpClassProjectDymanicSelf projectDynamicOurSetUser:dataModelHeader.userInfomation.UserID numPage:0 numNum:10 token:dataModelHeader.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            _dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"我们接口%@",_dic);
            
            if([_dic[@"status"] isEqualToString:@"success"]){
                
                
                [_aryProjectDynamic removeAllObjects];
                for(NSMutableDictionary *getdic in _dic[@"data"]){
                    
                    [_aryProjectDynamic addObject:getdic];
                }
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ProjectDynamicWM"];
                NSData *dataSaveHomePageCell = [NSKeyedArchiver archivedDataWithRootObject:_aryProjectDynamic];
                [[NSUserDefaults standardUserDefaults] setObject:dataSaveHomePageCell forKey:@"ProjectDynamicWM"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                if([_aryProjectDynamic count] == 0){
                    
                    
                    _viewEmpty.hidden = NO;
                    
                    if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
                        

                        
                    }else{
                        

                    }
                    
                    }else{
                        
                    _viewEmpty.hidden = YES;
                   
                    if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
                        
                    }else{
                        
                    }
                }
                [self.tableView reloadData];
                [self.tableView headerEndRefreshing];
                
            }else{
                [self.tableView headerEndRefreshing];
                [[ToolClass sharedInstance] showAlert:@"获取数据失败，服务器错误"];
                [self.tableView headerEndRefreshing];
                
            }
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
            [self.tableView headerEndRefreshing];
        }];
        
    

}

-(void)redfreshFooder{
    

    
        
    [_httpClassProjectDymanicSelf projectDynamicOurSetUser:_dataModelProjectDynamic.userInfomation.UserID numPage:_downAllProjectNumPage numNum:10 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *resDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resDic[@"status"]isEqualToString:@"success"]){
            

            
            NSLog(@"%@",resDic[@"data"]);
            
            if(![resDic[@"data"] count] == 0){
                for(NSMutableDictionary *dic in resDic[@"data"]){
                    [_aryProjectDynamic addObject:dic];
                }
            }
            
            if([_aryProjectDynamic count] == 0){
                
                _viewEmpty.hidden = NO;
                
            }else{
            _viewEmpty.hidden = YES;
            }
            
                _downAllProjectNumPage++;
            [self.tableView reloadData];
            [self.tableView footerEndRefreshing];
        }else{
                 [self.tableView footerEndRefreshing];
            [[ToolClass sharedInstance] showAlert:@"加载数据失败，服务器错误"];
        }

    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [self.tableView footerEndRefreshing];
        [[ToolClass sharedInstance] showAlert:@"加载数据失败，请检查网络"];
    }];
    
        
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    NSLog(@"cell数量%i",(int)[_aryProjectDynamic count]);
    return [_aryProjectDynamic count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    ProjectDynamic *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectDynamic"];

    
    if (cell == nil)
    {
        cell = [[ProjectDynamic alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProjectDynamic"];
    }
    
    NSMutableDictionary *resDic = _aryProjectDynamic[indexPath.row];
    
    
    cell.buttonLove.tag = indexPath.row;
    [cell.buttonLove addTarget:self action:@selector(buttonLoveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonTalk.tag = indexPath.row;
    [cell.buttonTalk addTarget:self action:@selector(buttonTalkProjectClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonPresonMessage.tag = indexPath.row;
    [cell.buttonPresonMessage addTarget:self action:@selector(buttonPresonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.buttonDelete.tag = indexPath.row;
    [cell.buttonDelete addTarget:self action:@selector(buttonDeleteClickProject:) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableDictionary *dicCretor = resDic[@"user"];
    
    cell.textBy.text = dicCretor[@"name"];
    
    if([resDic[@"isCreator"] longValue] == 1){
        cell.labelIsCreator.text = @"发起人";
        [cell.labelIsCreator sizeToFit];
    }else{
        cell.labelIsCreator.text = @"";
        [cell.labelIsCreator sizeToFit];
    }
    
    
    NSMutableDictionary *dicProject = resDic[@"project"];
    cell.textProject.text = [NSString stringWithFormat:@"@ %@",dicProject[@"title"]];
    
    [cell.imagePerson sd_setImageWithURL:[NSURL URLWithString:dicCretor[@"image"]] placeholderImage:nil];

    NSDate *datetime = [_dateFormartProjectDynamic dateFromString:[resDic[@"time"] substringToIndex:19]];
    
    if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/60 == 0 ){
        
        cell.textTime.text = @"刚刚";
        
    }else if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/60 < 60){
        
        cell.textTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/60] componentsSeparatedByString:@"."][0] ];

    }else if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/3600 < 24 && [_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/3600 >= 1){
        
        cell.textTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/3600] componentsSeparatedByString:@"."][0] ];
        
        NSLog(@"%f小时",[_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/3600+ 8);
        
        
    }else if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/86400 == 1){
        
        cell.textTime.text = @"昨天";
        
    }else if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/86400 > 1 && [_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/86400 <= 2){
        
        cell.textTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/86400 ] componentsSeparatedByString:@"."][0]];
        
    }else if([_dateNowHomePageProjectDynamic timeIntervalSinceDate:datetime]/86400 > 2){
        
        cell.textTime.text=[NSString stringWithFormat:@"%@",[[NSString stringWithFormat:@"%@",datetime] substringToIndex:10]];
    }
    
    _attributedStringProjectDynamic =[[NSMutableAttributedString alloc]initWithString:resDic[@"message"]];

    
    [_attributedStringProjectDynamic addAttribute:NSParagraphStyleAttributeName value:_paragraphStyleProjectDynamic range:NSMakeRange(0,[resDic[@"message"] length])];

    cell.textContents.attributedText = _attributedStringProjectDynamic;
    
    [    cell.textContents sizeToFit];
    _floatLabel = cell.textContents.frame.size.height;
    
    if([resDic[@"image"] isEqualToString:@""] || resDic[@"image"] == nil){
    
        cell.imageContents.image = nil;
        _floatImage = 1;
        cell.imageContentsHeight.constant = 1;
    
        }else{
    
        //上线
        _aryImageStrTEST = [resDic[@"image"] componentsSeparatedByCharactersInSet:_subImageStrTEST];
    
            if(160/([_aryImageStrTEST[2] floatValue]/[_aryImageStrTEST[1] floatValue]) > _iOSDeviceSizeWM.width - 74){

                
                NSLog(@"%f--%f",[_aryImageStrTEST[1] floatValue],[_aryImageStrTEST[2] floatValue]);
                NSLog(@"%f----%f",_iOSDeviceSizeWM.width - 74,(_iOSDeviceSizeWM.width - 74)/([_aryImageStrTEST[1] floatValue]/[_aryImageStrTEST[2] floatValue]));
                cell.imageContentsHeight.constant =  (_iOSDeviceSizeWM.width - 74)/([_aryImageStrTEST[1] floatValue]/[_aryImageStrTEST[2] floatValue]);

                

                cell.imageContentsWidth.constant = _iOSDeviceSizeWM.width - 74;
                _floatImage = cell.imageContentsHeight.constant;
            }else{
                cell.imageContentsWidth.constant = 160/([_aryImageStrTEST[2] floatValue]/[_aryImageStrTEST[1] floatValue]);
                cell.imageContentsHeight.constant = 160;
                        _floatImage = 160;
            }
                    NSLog(@"%f",cell.imageContentsHeight.constant);
//            cell.imageContents.layer.borderWidth =1;

        [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:resDic[@"image"]] placeholderImage:nil];
            
        }
    
    
        if(_loveTimes == 0){
    
            if([resDic[@"isUp"] longValue] == 0){
                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
    
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
    
                }else{
    
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_grey_2x"];
    
                }
    
            }else{
                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
    
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_blue_3x"];
    
                }else{

                    cell.imageLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
    
                }
            }
        
        }
    

    
    if([dicCretor[@"_id"] isEqualToString:_dataModelProjectDynamic.userInfomation.UserID]){
    
        cell.imageButtonDelete.hidden = NO;
        cell.buttonDelete.hidden = NO;
        
    }else{
        cell.imageButtonDelete.hidden = YES;
        cell.buttonDelete.hidden = YES;
        
    }
    
    
    NSMutableDictionary *dicUp = resDic[@"up"];
    NSMutableDictionary *dicComment = resDic[@"comment"];
    cell.labelLove.text = [NSString stringWithFormat:@"%lu个喜欢，",[dicUp[@"count"] longValue]];

    cell.labelTalk.text =[NSString stringWithFormat:@"%lu条评论",[dicComment[@"count"] longValue]];

    
    return  cell;
}

-(void)buttonByClick:(UIButton*)sender{
    
    NSMutableDictionary *dic = _aryProjectDynamic[sender.tag];
    
    NSMutableDictionary *dicUser = dic[@"user"];
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:dicUser];

}


-(void)buttonProjectNameClick:(UIButton*)sender{
    
    NSMutableDictionary *dic = _aryProjectDynamic[sender.tag];
    
    NSMutableDictionary *dicProject = dic[@"project"];
    
    NSLog(@"%@",dic[@"project"]);
    
    [self performSegueWithIdentifier:@"PushProject" sender:dicProject[@"_id"]];
    
    
}
-(void)buttonDeleteClickProject:(UIButton*)sender{
    
    NSMutableDictionary *dicDelete = _aryProjectDynamic[sender.tag];
    
    _strDeleteFeedID = dicDelete[@"_id"];
    
    UIAlertView *alertDelete = [[UIAlertView alloc] initWithTitle:@"确定要删除吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
//    [alertView dismissWithClickedButtonIndex:0 animated:nil];
    
    [alertDelete show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

   if(buttonIndex == 1){
       
       DataModel *dataModelDelete = [[DataModel alloc] init];
       
       [_httpClassProjectDymanicSelf deleteProjectDynamic:_strDeleteFeedID token:dataModelDelete.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
          
           NSData *data = [operatioin responseData];
           
           NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
           
           NSLog(@"%@",dicData);
           
           if([dicData[@"status"] isEqualToString:@"success"]){
               
               [self.tableView headerBeginRefreshing];
               
           }else{
               [[ToolClass sharedInstance] showAlert:@"删除动态失败服务器错误"];
           }
       }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
               [[ToolClass sharedInstance] showAlert:@"删除动态失败服务器错误"];
       }];
    }
    
}


-(void)buttonTalkProjectClick:(UIButton*)sender{
    
    
    _talkKeyBoardBool = YES;
    
    [self performSegueWithIdentifier:@"talkSegue" sender:_aryProjectDynamic[sender.tag][@"_id"]];

}


-(void)buttonLoveClick:(UIButton*)sender{

    NSLog(@"%li",sender.tag);

    NSIndexPath *indexPathLove = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    ProjectDynamic *cell = [self.tableView cellForRowAtIndexPath:indexPathLove];
    
//    NSLog(@"%@",cell.textLove.text);
 
    _aryButtonLoves = [[NSMutableArray alloc] init];

    [_httpClassProjectDymanicSelf projectDynamicOurSetUser:_dataModelProjectDynamic.userInfomation.UserID numPage:_topNumPage numNum:1000 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        

        
        NSMutableDictionary *resDicLove = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([resDicLove[@"status"] isEqualToString:@"success"]){
        
        for(NSMutableDictionary *dicCell in resDicLove[@"data"]){
            
            [_aryButtonLoves addObject:dicCell];
        
        }
            
            NSLog(@"%@",_aryButtonLoves[sender.tag]);
            
            NSLog(@"%lu",(unsigned long)[_aryButtonLoves count]);
        
            NSMutableDictionary *dicLoveButtons = _aryButtonLoves[sender.tag];
        
            NSLog(@"lovelovelove%@",dicLoveButtons[@"isUp"]);
            
            if([dicLoveButtons[@"isUp"] longValue] == 0){
                
                NSLog(@"%@-----%@",dicLoveButtons[@"isUp"],dicLoveButtons[@"_id"]);
                
                [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dicLoveButtons[@"_id"] up:1 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                NSData *data = [operatioin responseData];
                    
                NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
                if([dicData[@"status"] isEqualToString:@"success"]){
                    
                    
                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//[sender setImage:[UIImage imageNamed:@"loveYES15blue@3x"] forState:UIControlStateNormal];
                    
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_blue_3x"];

                    }else{
//[sender setImage:[UIImage imageNamed:@"loveYES15blue@2x"] forState:UIControlStateNormal];

                    cell.imageLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
//[cell.imageLoveIM setImage:[UIImage imageNamed:@"loveYES15Blue@2x"]];
                    }
                                        
                    _isLove = YES;
                                        
                    cell.labelLove.text = [NSString stringWithFormat:@"%lld个喜欢，",[[cell.labelLove.text substringToIndex:[cell.labelLove.text length]-3] longLongValue] + 1];
                    
                }else{
                    [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，服务器错误"];
                    }
                }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                    [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，请检查网络"];
                }];
 
            }else{
             
                
                [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dicLoveButtons[@"_id"] up:0 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                    NSData *data = [operatioin responseData];
                    
                    NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
                    if([dicData[@"status"] isEqualToString:@"success"]){
                        
                        if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//                                [sender setImage:[UIImage imageNamed:@"loveYES15@3x"] forState:UIControlStateNormal];
                            
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                        }else{
//                [sender setImage:[UIImage imageNamed:@"loveYES15@2x"] forState:UIControlStateNormal];
                  
                        
                    cell.imageLove.image = [UIImage imageNamed:@"women_like_grey_2x"];
                        
                        }
                        
                    cell.labelLove.text = [NSString stringWithFormat:@"%lld个喜欢，",[[cell.labelLove.text substringToIndex:[cell.labelLove.text length]-3] longLongValue] - 1];
                        
                    _isLove = YES;
                        
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
    

    
//
//        NSMutableDictionary *dic =  _aryProjectDynamic[sender.tag];
//
//    if(_buttonLoveRuntime == 0){
//        
//        _seleced = NO;
//    _seleced = !_seleced;
//    
//    if(_seleced){
//
//    
//            [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dic[@"_id"] up:1 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//    
//                NSData *data = [operatioin responseData];
//    
//                NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    
//                if([dicData[@"status"] isEqualToString:@"success"]){
//    
//                    if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//                        [sender setImage:[UIImage imageNamed:@"loveYES15@3x"] forState:UIControlStateNormal];
//                    }else{
//                        [sender setImage:[UIImage imageNamed:@"loveYES15@2x"] forState:UIControlStateNormal];
//                    }
//                    _buttonLoveRuntime = 1;
//                }else{
//                    [[ToolClass sharedInstance]showAlert:@"点赞失败，服务器错误"];
//                }
//            }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//                    [[ToolClass sharedInstance]showAlert:@"点赞失败，请检查网络"];
//            }];
//    }else{
//        
//        [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dic[@"_id"] up:0 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//            
//            NSData *data = [operatioin responseData];
//            
//            NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            
//            if([dicData[@"status"] isEqualToString:@"success"]){
//                
//                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@3x"] forState:UIControlStateNormal];
//                }else{
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@2x"] forState:UIControlStateNormal];
//                }
//                
//                _buttonLoveRuntime = 2;
//                
//            }else{
//                [[ToolClass sharedInstance]showAlert:@"点赞失败，服务器错误"];
//            }
//        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//            [[ToolClass sharedInstance]showAlert:@"点赞失败，请检查网络"];
//        }];
//
//    }
//    }else if (_buttonLoveRuntime == 1){
//        [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dic[@"_id"] up:0 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//            
//            NSData *data = [operatioin responseData];
//            
//            NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            
//            if([dicData[@"status"] isEqualToString:@"success"]){
//                
//                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@3x"] forState:UIControlStateNormal];
//                }else{
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@2x"] forState:UIControlStateNormal];
//                }
//                _buttonLoveRuntime = 2;
//            }else{
//                [[ToolClass sharedInstance]showAlert:@"点赞失败，服务器错误"];
//            }
//        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//            [[ToolClass sharedInstance]showAlert:@"点赞失败，请检查网络"];
//        }];
//        
//        
//    }else if(_buttonLoveRuntime == 2){
//        [_httpClassProjectDymanicSelf loveProjectselfSetFeed:dic[@"_id"] up:0 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//            
//            NSData *data = [operatioin responseData];
//            
//            NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            
//            if([dicData[@"status"] isEqualToString:@"success"]){
//                
//                if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@3x"] forState:UIControlStateNormal];
//                }else{
//                    [sender setImage:[UIImage imageNamed:@"loveYES15@2x"] forState:UIControlStateNormal];
//                }
//                _buttonLoveRuntime = 2;
//            }else{
//                [[ToolClass sharedInstance]showAlert:@"点赞失败，服务器错误"];
//            }
//        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//            [[ToolClass sharedInstance]showAlert:@"点赞失败，请检查网络"];
//        }];
//    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return _floatImage + _floatLabel + 133;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    _talkKeyBoardBool = NO;
    

    [self performSegueWithIdentifier:@"talkSegue" sender:_aryProjectDynamic[indexPath.row][@"_id"]];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"talkSegue"]){

        TalkViewController *controller = segue.destinationViewController;

        controller.keyBoardIsAppear = _talkKeyBoardBool;
        
        controller.delegate = self;

        controller.strfeedID = sender;
        
    }else if([segue.identifier isEqualToString:@"PushProject"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        ProjectDetailsViewController *controller = (ProjectDetailsViewController*)naVC.topViewController;
        
        NSLog(@"%@",sender);
        
        controller.strProjectID = sender;
        
    }else if([segue.identifier isEqualToString:@"OtherUserSegue"]){
        
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        NSLog(@"打印打印他人信息%@",sender);
        
        controller.dicOtherUser = sender;
        
    }else if([segue.identifier isEqualToString:@"OneProjectSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OneProjectDynamicTableViewController *controller = (OneProjectDynamicTableViewController*)naVC.topViewController;
        
        controller.isJoin = _isJoin;
        controller.projectModelOneProject = sender;

    }else if([segue.identifier isEqualToString:@"RemindMessageSegue"]){
       
        
    }
}

-(void)createDynamicDone:(CreateDynamicViewController *)controller{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView headerBeginRefreshing];
    
}

-(void)createDynamicClose:(CreateDynamicViewController *)controller{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)buttonChoseProjectList:(UIButton*)sender{
    
    NSMutableDictionary *dicProjectMessage = _aryPayList[sender.tag];
    
    ProjectModel *projectModelSend = [[ProjectModel alloc] init];

    projectModelSend.projectTitle = dicProjectMessage[@"title"];
    projectModelSend.projectID = dicProjectMessage[@"_id"];
    
    _viewPayList.hidden = YES;
    _clickAddBool = YES;
    self.tableView.scrollEnabled = YES;
    
    [self performSegueWithIdentifier:@"OneProjectSegue" sender:projectModelSend];    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    

    self.buttonAddBar.enabled = YES;


//    _viewPayList.hidden = YES;
    [_viewPayList removeFromSuperview];
    
    _clickAddBool = YES;
    
//    _viewReloadList.hidden = YES;
//    [_viewReloadList removeFromSuperview];
    
    _clickReloadBool = YES;
    self.tableView.scrollEnabled = YES;
    
    _viewEmpty.hidden = YES;
    
    _isDeleteDynamic = NO;

}

//- (IBAction)buttonReloadTableView:(id)sender {
//
//    self.tableView.scrollEnabled = NO;
//    
//    if(  _clickReloadBool ==YES){
//        NSLog(@"显示显示显示");
////        _viewReloadList.hidden = NO;
//        
//        _clickReloadBool = NO;
//        
//        self.buttonAddBar.enabled = NO;
//    
////        _viewPayList.hidden = YES;
//        [_viewPayList removeFromSuperview];
//        
//        _clickAddBool = YES;
//
//        self.tableView.scrollEnabled = NO;
//        
//        self.imageAdd.alpha = 0.4;
//        
//        [self.buttonReloadTableView setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
//
//        
//    }else{
//        NSLog(@"隐藏隐藏隐藏");
//        
////        _viewReloadList.hidden = YES;
//        [_viewReloadList removeFromSuperview];
//        _clickReloadBool = YES;
//        self.tableView.scrollEnabled = YES;
//        self.buttonAddBar.enabled = YES;
//        
//        self.imageAdd.alpha = 1;
//        
//        
//        return;
//    }
//    _isDeleteDynamic = NO;
//    
//    //选择视图
//    CGSize iOSDeviceSize = [UIScreen mainScreen].bounds.size;
//    
//    
//    //    _viewPayList = [[UIView alloc] initWithFrame:];
//    
//    _viewReloadList  = [[UIView alloc] initWithFrame:CGRectMake(0 ,self.tableView.contentOffset.y, iOSDeviceSize.width, iOSDeviceSize.height - 88)];
//
//    
//    _viewReloadList.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
//    
//    //    _viewPayList.layer.borderWidth = 2;
//    //    _viewPayList.layer.borderColor = [UIColor redColor].CGColor;
//    
//    [self.view addSubview:_viewReloadList];
//    
//    DataModel *dataModelReload = [[DataModel alloc] init];
//    
//    
//    [_httpClassProjectDymanicSelf CheckUserSelfSetUser:dataModelReload.userInfomation.UserID token:dataModelReload.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *resdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        if([resdic[@"status"] isEqualToString:@"success"]){
//            
//            NSInteger buttonPayYYY = 12;
//        
//          NSMutableDictionary *dicData  = resdic[@"data"];
//            
//            NSMutableDictionary *dicMidFocus = dicData[@"focus"];
//            
//            NSLog(@"%@",dicMidFocus);
//            
//            for(int i = 0 ;i < [dicMidFocus[@"projects"] count];i++){
//                
//                NSMutableDictionary *dicList  =  dicMidFocus[@"projects"][i];
//                
//                if(![dicList[@"title"] isEqualToString:self.buttonReloadTableView.titleLabel.text]){
//                    
//
//                [_aryReloadlist addObject:dicList];
//                
//                UIButton *buttonReloadBT = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//                [buttonReloadBT addTarget:self
//                                   action:@selector(buttonReloadList:)
//                         forControlEvents:UIControlEventTouchUpInside];
//                
//                buttonReloadBT.tag = i;
//                
//                
//                [buttonReloadBT setTitle:[NSString stringWithFormat:@"%@",dicList[@"title"]] forState:UIControlStateNormal];
//                
//                buttonReloadBT.frame = CGRectMake(0,buttonPayYYY,_viewReloadList.frame.size.width,50);
//                
////                buttonReloadBT.center = _viewReloadList.center;
//                
//                
//                [buttonReloadBT.titleLabel setFont:[UIFont systemFontOfSize:14]];
//                
////                [buttonReloadBT sizeToFit];
//                
//                [buttonReloadBT setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
//                
//                buttonPayYYY +=44;
//            
////              buttonReloadBT.layer.borderWidth = 1;
////            buttonReloadBT.layer.borderColor = [UIColor yellowColor].CGColor;
//            
//                
//                [_viewReloadList addSubview:buttonReloadBT];
//                    
//                    
//                    
//                }
//
//            }
//            
//            if(_isHaveDynamicSelf == YES){
//            
//            UIButton *buttonReloadMyList = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//            [buttonReloadMyList addTarget:self
//                               action:@selector(buttonReloadMyList)
//                     forControlEvents:UIControlEventTouchUpInside];
//            
//            [buttonReloadMyList setTitle:@"我的所有动态" forState:UIControlStateNormal];
//            
//            buttonReloadMyList.frame = CGRectMake(0,buttonPayYYY,_viewReloadList.frame.size.width,44);
//            
//            //                buttonReloadBT.center = _viewReloadList.center;
//        
//            [buttonReloadMyList.titleLabel setFont:[UIFont systemFontOfSize:14]];
//            
//            //                [buttonReloadBT sizeToFit];
//            
//            [buttonReloadMyList setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
//            
////            buttonReloadMyList.layer.borderWidth = 2;
//            
//            [_viewReloadList addSubview:buttonReloadMyList];
//            
//            buttonPayYYY +=44;
//                
//            }
//            
//            if(_isAppearAllProject == YES){
//                
//                UIButton *buttonReloadAllList = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//                [buttonReloadAllList addTarget:self
//                                       action:@selector(buttonReloadAllList)
//                             forControlEvents:UIControlEventTouchUpInside];
//                
//                [buttonReloadAllList setTitle:@"全部项目" forState:UIControlStateNormal];
//                
//                buttonReloadAllList.frame = CGRectMake(0,buttonPayYYY,_viewReloadList.frame.size.width,44);
//                
//                //                buttonReloadBT.center = _viewReloadList.center;
//                
//                [buttonReloadAllList.titleLabel setFont:[UIFont systemFontOfSize:14]];
//                
//                //                [buttonReloadBT sizeToFit];
//                
//                [buttonReloadAllList setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
//                
//                //            buttonReloadMyList.layer.borderWidth = 2;
//                
//                [_viewReloadList addSubview:buttonReloadAllList];
//                
//                buttonPayYYY +=44;
//                
//            }
//            
//            UIButton *buttonCancelReloadList = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//            [buttonCancelReloadList addTarget:self
//                                    action:@selector(buttonCancelReloadListClick:)
//                          forControlEvents:UIControlEventTouchUpInside];
//            
//            buttonCancelReloadList.frame = CGRectMake(0,buttonPayYYY,_viewReloadList.frame.size.width,_viewReloadList.frame.size.height - buttonPayYYY);
//            
//
//            
//            
//            [_viewReloadList addSubview:buttonCancelReloadList];
//            
//        }
//        
//        
//        
//             }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//        
//    }];
//    
//}

-(void)buttonReloadList:(UIButton*)sender{
  
    
//    NSMutableDictionary *dicReloadList = _aryReloadlist[sender.tag];
//    
//    [_httpClassProjectDymanicSelf projectSelfDynamicSetProjectID:dicReloadList[@"_id"] numPage:0 numNum:500 token:_dataModelProjectDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *dicResReload =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        
//        if([dicResReload[@"status"] isEqualToString:@"success"]){
//            
//        [self.buttonReloadTableView setTitle:dicReloadList[@"title"] forState:UIControlStateNormal];
//            
//   
//            
//            [_aryProjectDynamic removeAllObjects];
//            
//            self.imageAdd.alpha = 1;
//            _viewReloadList.hidden = YES;
//            _clickReloadBool = YES;
//            self.tableView.scrollEnabled = YES;
//            self.buttonAddBar.enabled = YES;
//
//            _isDeleteDynamic = NO;
//            
//            for(NSMutableDictionary *getdic in dicResReload[@"data"]){
//                
//                [_aryProjectDynamic addObject:getdic];
//            }
//            
//            if([_aryProjectDynamic count] == 0){
//                
//                _viewEmpty.hidden = NO;
//            }else{
//                _viewEmpty.hidden = YES;
//            }
//            
//                _isDeleteDynamic = NO;
//            
//        }
//        [self.tableView reloadData];
//        
//    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *error){
//        [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
//        
//    }];
    
    _dicReloadList = _aryReloadlist[sender.tag];
    _numFlashType = 1;
    [self setupRefresh];
    
}
- (IBAction)buttonAddBar:(id)sender {
    
    self.tableView.scrollEnabled = NO;
    
    _isDeleteDynamic = NO;
    
    if(  _clickAddBool ==YES){
        self.tableView.scrollEnabled = NO;
        NSLog(@"显示显示显示");
        _viewPayList.hidden = NO;
        _clickAddBool = NO;

        

        [_viewReloadList removeFromSuperview];
        _clickReloadBool = YES;
        


        
    }else{
        NSLog(@"隐藏隐藏隐藏");
        
//        _viewPayList.hidden = YES;
        [_viewPayList removeFromSuperview];
        
        _clickAddBool = YES;
        self.tableView.scrollEnabled = YES;

        return;
    }
    
    //选择视图
    CGSize iOSDeviceSize = [UIScreen mainScreen].bounds.size;
    
    _viewPayList = [[UIView alloc] initWithFrame:CGRectMake(0 , self.tableView.contentOffset.y, iOSDeviceSize.width, iOSDeviceSize.height - 88)];
//    _viewPayList.frame = CGRectMake(0 , self.tableView.contentOffset.y, iOSDeviceSize.width, iOSDeviceSize.height - 88);
    
//    _viewPayList.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
    
    //    _viewPayList.layer.borderWidth = 2;
    //    _viewPayList.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addSubview:_viewPayList];
    
    DataModel *dataModelAdd = [[DataModel alloc] init];
    
    
    [_httpClassProjectDymanicSelf UpAndJoinProjectList:dataModelAdd.userInfomation.UserID token:dataModelAdd.userInfomation.tokenID page:0 num:1000 CallBackYES:^(MKNetworkOperation *operatioin){
        
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([dic[@"status"] isEqualToString:@"success"]){
            
            NSInteger buttonPayYYY = 0;
            
            for(int i = 0 ;i <[dic[@"data"] count];i++){
                
                NSMutableDictionary *dicList  =  dic[@"data"][i];
                
                [_aryPayList addObject:dicList];
                
                UIButton *buttonPayBT = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [buttonPayBT addTarget:self
                                action:@selector(buttonChoseProjectList:)
                      forControlEvents:UIControlEventTouchUpInside];
                
                buttonPayBT.tag = i;
                
                buttonPayBT.frame = CGRectMake(0,buttonPayYYY,_viewPayList.frame.size.width,44);
                
                buttonPayBT.frame = CGRectMake(buttonPayBT.frame.origin.x,buttonPayYYY,buttonPayBT.frame.size.width,44);
                
                //                buttonPayBT.layer.borderWidth = 1;
                //                buttonPayBT.layer.borderColor = [UIColor yellowColor].CGColor;
                
                buttonPayBT.backgroundColor = [UIColor colorWithRed:38.0/255 green:56.0/255 blue:70.0/255 alpha:1];
                
                buttonPayYYY += 44;
                
                UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0,43, _viewPayList.frame.size.width, 1)];
                viewLine.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1];
                
                UILabel *labelProjectTitle = [[UILabel alloc] initWithFrame:CGRectMake(12, 14.5,0,0)];
                
                
                labelProjectTitle.text = [NSString stringWithFormat:@"@ %@",dicList[@"title"]];
                
                if([dicList[@"type"] isEqualToString:@"order"]){
                    
                labelProjectTitle.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
                    _isJoin = YES;
                    
                }else if([dicList[@"type"] isEqualToString:@"focus"]){
                    
                labelProjectTitle.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
                    _isJoin = NO;
                }
                

                labelProjectTitle.font = [UIFont systemFontOfSize:14.7];
                
                //               labelProjectTitle.layer.borderWidth = 1;
                
                
                
                
                [buttonPayBT addSubview:labelProjectTitle];
                [buttonPayBT addSubview:viewLine];
                [_viewPayList addSubview:buttonPayBT];
                [labelProjectTitle sizeToFit];
                
            }
            
            UIButton *buttonCancelPayList = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [buttonCancelPayList addTarget:self
                                    action:@selector(buttonCancelPayListClick:)
                          forControlEvents:UIControlEventTouchUpInside];
            
            buttonCancelPayList.frame = CGRectMake(0,buttonPayYYY,_viewPayList.frame.size.width,_viewPayList.frame.size.height - buttonPayYYY);
            
            [_viewPayList addSubview:buttonCancelPayList];
        }else{
            [[ToolClass sharedInstance] showAlert:@"刷新列表失败，服务器错误"];
        }

        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"刷新列表失败，服务器错误"];
        
    }];

}

-(void)buttonCancelPayListClick:(UIButton*)sender{
    
//    _viewPayList.hidden = YES;1
    [_viewPayList removeFromSuperview];
    
    self.buttonAddBar.enabled = YES;
    _clickAddBool = YES;
    _clickReloadBool = YES;
    self.tableView.scrollEnabled = YES;

    
}

-(void)buttonCancelReloadListClick:(UIButton*)sender{
    
//    _viewReloadList.hidden = YES;
    [_viewReloadList removeFromSuperview];
    
    self.buttonAddBar.enabled = YES;
    _clickAddBool = YES;
    _clickReloadBool = YES;
    self.tableView.scrollEnabled = YES;
    
}



-(void)EmptyViewAppear{
    //底层view
    _viewEmpty = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tableView.frame.size.width , self.tableView.frame.size.height - 108)];
    
    _viewEmpty.backgroundColor = [UIColor whiteColor];
    
    UILabel *labelAAA = [[UILabel alloc] initWithFrame:CGRectMake(0,_viewEmpty.frame.size.height/2 - 18,_viewEmpty.frame.size.width,15)];
    labelAAA.text = @"你还没有加入任何社群。";
    labelAAA.textColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:1];
    labelAAA.font = [UIFont systemFontOfSize:14.7];
    labelAAA.textAlignment = NSTextAlignmentCenter;
    [_viewEmpty addSubview:labelAAA];
    
    UILabel *labelBBB = [[UILabel alloc] initWithFrame:CGRectMake(0,_viewEmpty.frame.size.height/2 + 3,_viewEmpty.frame.size.width,15)];
    labelBBB.text = @"支持或关注项目，就可以加入社群。";
    labelBBB.textColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:1];
    labelBBB.font = [UIFont systemFontOfSize:14.7];
    labelBBB.textAlignment = NSTextAlignmentCenter;
    [_viewEmpty addSubview:labelBBB];
    
    [self.tableView addSubview:_viewEmpty];
    
//    NSLog(@"%f-=--%f",_iOSDeviceSizeWM.height/2 - 9,_iOSDeviceSizeWM.height/2 + 9);
//    //或支持项目
//    UILabel *labelBBB = [[UILabel alloc] initWithFrame:CGRectMake(0,_viewEmpty.frame.size.height/2 - 24 ,_viewEmpty.frame.size.width, 15)];
//    labelBBB.text = @"或支持项目";
//    labelBBB.font = [UIFont systemFontOfSize:14];
//    labelBBB.textColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1];
//    labelBBB.textAlignment = NSTextAlignmentCenter;
////    labelBBB.center = viewEmpty.center;
//    [_viewEmpty addSubview:labelBBB];
//    
//    NSLog(@"%f------%f",_iOSDeviceSizeWM.height/2,_iOSDeviceSizeWM.height/2 );
//    //「加入他们」
//    UIImageView *imageViewjoin = [[UIImageView alloc] initWithFrame:CGRectMake(_viewEmpty.frame.size.width/2 - 36,_viewEmpty.frame.size.height/2 + 9,72,27)];
//    [_viewEmpty addSubview:imageViewjoin];
//
//    
//    //「红心」
//    UIImageView *imageViewLove = [[UIImageView alloc] initWithFrame:CGRectMake(_viewEmpty.frame.size.width/2 - 13.5,labelBBB.frame.origin.y - 38,27,27)];
//    
////    imageViewLove.layer.borderWidth = 2;
//    imageViewLove.contentMode =UIViewContentModeScaleAspectFill;
//    [_viewEmpty addSubview:imageViewLove];
//    
//    //「去关注项目」
//    UILabel *labelAAA = [[UILabel alloc] initWithFrame:CGRectMake(0,imageViewLove.frame.origin.y - 26,_viewEmpty.frame.size.width, 15)];
//    labelAAA.text = @"去关注项目";
//    labelAAA.font = [UIFont systemFontOfSize:14];
//    labelAAA.textColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1];
//    labelAAA.textAlignment = NSTextAlignmentCenter;
//    [_viewEmpty addSubview:labelAAA];
//    
//    //「这里才会有内容哦」
//    UILabel *labelCCC = [[UILabel alloc] initWithFrame:CGRectMake(5,imageViewjoin.frame.origin.y + 45,_viewEmpty.frame.size.width, 15)];
//    labelCCC.text = @"这里才会有内容哦！";
//    labelCCC.font = [UIFont systemFontOfSize:14];
//    labelCCC.textColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1];
//    labelCCC.textAlignment = NSTextAlignmentCenter;
//    [_viewEmpty addSubview:labelCCC];
//    
//    //「指向箭头」
//    UIImageView *imageViewHere = [[UIImageView alloc] initWithFrame:CGRectMake(_viewEmpty.frame.size.width * 0.12,_viewEmpty.frame.size.height - 45,27,27)];
//
//    NSLog(@"%f------%f",(_iOSDeviceSizeWM.height/6) * 2,_iOSDeviceSizeWM.height - 99);
//    [_viewEmpty addSubview:imageViewHere];
//
//    if([_iOSSizeWM isEqualToString:@"iPhone6Plus"]){
//        imageViewLove.image = [UIImage imageNamed:@"womenlike@3x"];
//        imageViewjoin.image = [UIImage imageNamed:@"womenJoin@3x"];
//        imageViewHere.image = [UIImage imageNamed:@"women_arrow_3x"];
//    }else{
//        imageViewLove.image = [UIImage imageNamed:@"womenlike@2x"];
//        imageViewjoin.image = [UIImage imageNamed:@"womenJoin@2x"];
//        imageViewHere.image = [UIImage imageNamed:@"women_arrow_2x"];
//    }
    

    
    _viewEmpty.hidden = YES;
    
}
-(void)talkViewControllerDeleteDynamic:(TalkViewController *)controller{
    
    [self.tableView headerBeginRefreshing];
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)buttonPresonClick:(UIButton*)sender{
 
    
    
    NSLog(@"%lu",sender.tag);
    NSMutableDictionary *dic = _aryProjectDynamic[sender.tag];
    
    NSMutableDictionary *dicUserMessage = dic[@"user"];
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:dicUserMessage];
    
}

- (IBAction)buttonPresonMessageClick:(UIButton *)sender {
    
    
    NSLog(@"%lu",sender.tag);
    NSMutableDictionary *dic = _aryProjectDynamic[sender.tag];
    
    NSMutableDictionary *dicUserMessage = dic[@"user"];
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:dicUserMessage];
}

- (IBAction)buttonRemind:(id)sender {
        [self performSegueWithIdentifier:@"RemindMessageSegue" sender:nil];
}


@end
