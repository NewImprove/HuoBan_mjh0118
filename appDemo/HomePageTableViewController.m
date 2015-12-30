//
//  MainTableViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/25.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "HomePageTableViewCell.h"
#import "CellList.h"

#import "ProjectDetailsViewController.h"
#import "HomeDynamicImageTableViewCell.h"
#import "HttpClassSelf.h"
#import "MJRefresh.h"
#import "ToolClass.h"

#import "ProjectModel.h"

#import "ProjectDetailsViewController.h"

#import "DataModel.h"

#import "DataModelHomeSilder.h"
#import "ImageSameWidth.h"
#import "DataModelHomeCard.h"
#import "ArticleHTMLViewController.h"

#define kDEFAULT_DATE_TIME_FORMAT (@"yyyy-MM-dd")

@interface HomePageTableViewController ()

@end

@implementation HomePageTableViewController
bool _selected;

//对象模型
HttpClassSelf *_httpClassHomePage;
NSMutableDictionary *_resHomePageDic;
ProjectModel *_projectModel;


//点赞数组
NSMutableArray *_aryButtonLove;
//首页data对象
NSMutableArray *_cellTopData;

//加载data对象
NSMutableArray *_cellDownData;

//所有celldata对象
NSMutableArray *_cellHomeSlide;

//Image数组
NSMutableArray *_aryImage;

NSMutableArray *_aryloveButton;

DataModel *_dataModelHomePage;

DataModelHomeCard *_dataModelHomeCard;

NSMutableArray *_aryCacheHomePageData;

//数组个数
int _arrayNumTop;

//数组个数
int _arrayNumDown;

//首页页数
int _pageNumTop;


//加载页数
int _pageNumDown;

//每页项目数
int _CountTop;

//每页项目数
int _CountDown;

BOOL isRegNib;

BOOL _isNil;

NSInteger _loveTime;

NSInteger _runtime;

//NSInteger _buttonLoveNum;

//轮播图高度
CGFloat _heightSliderCell;
//图片宽度
CGFloat _widthMainImage;
//Card高度
CGFloat _heightCardCell;

//发送http
NSString *_strKey = @"home";

NSString *_iOSDeviceSize;

UIView *_viewPopLogin;
CGSize _iOSLoginDeviceSize;
UIView *_viewTop;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSLog(@"%@-----%@",self.tabBarItem,self.tabBarController.tabBarItem);

    _dataModelHomePage = [[DataModel alloc] init];
    
    
    _iOSDeviceSize =  _dataModelHomePage.userInfomation.iOSDeviceSize;

    //选择视图
    _iOSLoginDeviceSize = [UIScreen mainScreen].bounds.size;
    
    _viewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0,_iOSLoginDeviceSize.width,20)];
    _viewTop.backgroundColor = [UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1];
    
//    _viewTop.layer.borderColor = [UIColor yellowColor].CGColor;
//    _viewTop.layer.borderWidth = 1;
    
    [self.tableView addSubview:_viewTop];
    _viewTop.hidden = YES;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
        
        if(scrollView.contentOffset.y < -20 || scrollView.contentOffset.y >270){
            _viewTop.hidden = NO;
            
            _viewTop.frame = CGRectMake(0,scrollView.contentOffset.y,_viewTop.frame.size.width, 20);
            
        }else{
            _viewTop.hidden = YES;
        }
        
    }else if([_iOSDeviceSize isEqualToString:@"iPhone6"]){
    
        if(scrollView.contentOffset.y < -20 || scrollView.contentOffset.y >252){
            _viewTop.hidden = NO;
            
            _viewTop.frame = CGRectMake(0,scrollView.contentOffset.y,_viewTop.frame.size.width, 20);
            
        }else{
            _viewTop.hidden = YES;
        }
    }else {
        
        if(scrollView.contentOffset.y < -20 || scrollView.contentOffset.y >216){
            _viewTop.hidden = NO;
            
            _viewTop.frame = CGRectMake(0,scrollView.contentOffset.y,_viewTop.frame.size.width, 20);
            
        }else{
            _viewTop.hidden = YES;
        }
    }
    
}



-(void)buttonLoginCloseClick:(UIButton*)sender{
    
    _viewPopLogin.hidden = YES;
    self.tableView.scrollEnabled = YES;
}

-(void)buttonLoginClick:(UIButton*)sender{
    
    NSLog(@"点击弹出登陆按钮按钮按钮");
    _viewPopLogin.hidden = YES;
    self.tableView.scrollEnabled = YES;
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    
}
//集成刷新控件
- (void)setupRefresh
{
    
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    //下拉刷新开始
    [self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    

    
}

//画面加载前触发
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//  [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"runtimes"];
    
    _runtime  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    
        _viewTop.hidden = NO;

    
    if(_runtime != 1){
        
        DataModel *dataModelUnLogin = [[DataModel alloc] init];
        dataModelUnLogin.userInfomation.tokenID = @"UnLogin";
        dataModelUnLogin.userInfomation.UserID = @"UnLogin";
        [dataModelUnLogin saveUserInfomation];
        
    }
    
    [self loginViewCreate];
    
        _viewPopLogin.hidden = YES;
    
        _projectModel = [[ProjectModel alloc]init];
        
        //本地变量
        _cellDownData = [[NSMutableArray alloc]init];
        _httpClassHomePage = [[HttpClassSelf alloc] init];
        _cellTopData = [[NSMutableArray alloc] init];
        _cellHomeSlide = [[NSMutableArray alloc] init];
        //    _projectID = [[NSString alloc]init];
        
        isRegNib = NO;
        
        _loveTime = 0;
    
        if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
            
            //轮播图高度:
            _heightSliderCell = 270;
            
            //card高度
            _heightCardCell = 216;
        }else if([_iOSDeviceSize isEqualToString:@"iPhone6"]){
            //轮播图高度:
            _heightSliderCell = 252;
            _heightCardCell = 198;
        }else if([_iOSDeviceSize isEqualToString:@"iPhone5"]){
            
            //轮播图高度：
            _heightSliderCell = 216;
            
            //card高度:
            _heightCardCell = 162;
        }else if([_iOSDeviceSize isEqualToString:@"iPhone4"]){
            //轮播图高度:
            _heightSliderCell = 216;
            
            _heightCardCell = 162;
        }
    
        [self setupRefresh];

        [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    _viewPopLogin.hidden = YES;
    self.tableView.scrollEnabled = YES;
    
}
//下拉刷新触发方法
-(void)headerRereshing{

    _CountTop = 6;
    _pageNumTop = 0;
    _CountDown = 6;
    _pageNumDown = 1;
    
    DataModel *dataModelHeader = [[DataModel alloc] init];
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"HomePageCellDataModel"] != nil ){

                    NSData *dataHomePage = [[NSUserDefaults standardUserDefaults] objectForKey:@"HomePageCellDataModel"];
                    _cellTopData = [NSKeyedUnarchiver unarchiveObjectWithData:dataHomePage];
                    NSLog(@"%@",_cellTopData);

                    [self.tableView reloadData];
                }
    //异步回调
    [_httpClassHomePage homePageSetKey:_strKey numPage:_pageNumTop numNum:_CountTop token:dataModelHeader.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        NSData *data = [operatioin responseData];
        NSMutableDictionary *resHomePageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        

        if([resHomePageDic[@"status"] isEqualToString:@"success"]){

            //[@"data"]大数组；
            NSMutableDictionary *dic  =  resHomePageDic[@"data"];
            
            
            
            NSLog(@"主页返回jSON%@",dic);
                [_cellTopData removeAllObjects];
            
            //[@"projects"]项目详情数组；刷新tableView
            for(NSMutableDictionary *dicCell in dic[@"projects"]){
                
                _CountTop = (int)[_cellTopData count];
                _cellTopData[_CountTop] = dicCell;
            }
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"HomePageCellDataModel"];
            NSData *dataSaveHomePageCell = [NSKeyedArchiver archivedDataWithRootObject:_cellTopData];
            [[NSUserDefaults standardUserDefaults] setObject:dataSaveHomePageCell forKey:@"HomePageCellDataModel"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [_cellHomeSlide removeAllObjects];
            //@["slide"]轮播图数组
            for(NSDictionary *dicDymic in dic[@"slide"]){
                DataModelHomeSilder *dataModel = [[DataModelHomeSilder alloc] initWithResJSON:dicDymic];
                [_cellHomeSlide addObject:dataModel];
            }
//            [[NSUserDefaults standardUserDefaults] setValue:_cellHomeSlide forKey:@"HomePageCellSlide"];
            
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"HomePageCellSlider"];
//            [[NSUserDefaults standardUserDefaults] setObject:_cellHomeSlide forKey:@"HomePageCellSlider"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            
//            _aryImage = [[NSMutableArray alloc] init];
//            //@["images"]获取 刷新tableView
//            for(NSMutableDictionary *dicSlider in _cellHomeSlide){
//                [_aryImage addObject:dicSlider[@"images"]];
//            }

            
            
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"HomePageCellSlider"];
//            NSData *dataSaveHomePageSlider = [NSKeyedArchiver archivedDataWithRootObject:_cellHomeSlide];
//            [[NSUserDefaults standardUserDefaults] setObject:dataSaveHomePageSlider forKey:@"HomePageCellSlider"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
            [self.tableView reloadData];
            [self.tableView headerEndRefreshing];
        }else{
            [self.tableView headerEndRefreshing];
            [[ToolClass sharedInstance]showAlert:@"刷新失败，服务器报错"];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance]showAlert:@"刷新失败,请检查网络"];
        [self.tableView headerEndRefreshing];
    }];
}
//下拉刷新
-(void)footerRereshing{
    
    DataModel *dataModelFooter = [[DataModel alloc] init];
    
   _isNil = NO;
    [_httpClassHomePage homePageSetKey:_strKey numPage:_pageNumDown numNum:_CountDown token:dataModelFooter.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        NSData *data = [operatioin responseData];
        NSMutableDictionary *resHomePageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resHomePageDic[@"status"] isEqualToString:@"success"]){
                NSMutableDictionary *dic  =  resHomePageDic[@"data"];
            if(dic != nil){

             NSLog(@"%lu",(unsigned long)[dic count]);
       
                if(![dic count] == 0){
                    for(NSMutableDictionary *dicCell in dic[@"projects"]){
                        _CountTop = (int)[_cellTopData count];
                        _cellTopData[_CountTop] = dicCell;
                        NSLog(@"%i",(int)[_cellTopData count]);
                        
                        _isNil = YES;
                    }

                    _pageNumDown++;
//            if([dic count] >= _CountDown){
//                
//                
//                }
                
                
                
            }
            [self.tableView reloadData];
            }
            [self.tableView footerEndRefreshing];
       
        }else{
            [self.tableView footerEndRefreshing];
            [[ToolClass sharedInstance]showAlert:@"加载失败，服务器报错"];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance]showAlert:@"加载失败,请检查网络"];
        [self.tableView footerEndRefreshing];
    }];
}

//低内存
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//表视图返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //data数组 + 1 因为第一行是轮播图
    NSLog(@"Cell数量%i",(int)[_cellTopData count]);
    return ([_cellTopData count] + 1);
}


//获取cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        

//    _dateNowHomePage = [NSDate date];
        
        static BOOL nibsRegistered = NO;
        
        if (!nibsRegistered) {
            UINib *nib = [UINib nibWithNibName:@"HomeDynamicImage" bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:@"HomeDymamicImageCell"];
            nibsRegistered = YES;
        }
        
        // 3. 从TableView中获取标识符为paperCell的Cell
        HomeDynamicImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeDymamicImageCell"];
        
        cell.delegate = self;
        
        NSLog(@"%lu",(unsigned long)[_cellHomeSlide count]);
        [cell cleanData];
        for(DataModelHomeSilder *data in _cellHomeSlide){
            NSLog(@"打印%@",data);
            [cell setDataSilder:data];
        }

        return cell;
        
    }else{
      
        if (!isRegNib) {
            [tableView registerNib:[UINib nibWithNibName:@"HomePageCell" bundle:nil] forCellReuseIdentifier:@"HomePageCell"];
            isRegNib = YES;
        }
        
        // 3. 从TableView中获取标识符为paperCell的Cell
        HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomePageCell"];
        
        _dataModelHomeCard = [[DataModelHomeCard alloc] initWithResJSON:_cellTopData[(indexPath.row-1)]];
        
        cell.dataModelCard = _dataModelHomeCard;
        
        [cell.buttoncase addTarget:self action:@selector(loverButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            cell.buttoncase.tag = indexPath.row;

//        NSLog(@"%@",_dataModelHomeCard.title);
        if(_dataModelHomeCard.isJoin == 0){

            cell.imageJoined.hidden = YES;
            cell.buttoncase.hidden = NO;
        
        if(_loveTime == 0){

        if(_dataModelHomeCard.isFocus == 0){
//            _selected = NO;
            if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
            [cell.buttoncase setImage:[UIImage imageNamed:@"loveNO@3x"] forState:UIControlStateNormal];
            }else{
            [cell.buttoncase setImage:[UIImage imageNamed:@"loveNO@2x"] forState:UIControlStateNormal];
            }
//            cell.buttoncase.tag = 0;
//                    _dataModelHomeCard.isFocus = 1;

        }else{
//            _selected = YES;
            if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
                [cell.buttoncase setImage:[UIImage imageNamed:@"loveYES@3x"] forState:UIControlStateNormal];
            }else{
                [cell.buttoncase setImage:[UIImage imageNamed:@"loveYES@2x"] forState:UIControlStateNormal];
            }
//            cell.buttoncase.tag = 1;
//                    _dataModelHomeCard.isFocus = 0;
        }
            
        }
            
        }else{
            
            cell.imageJoined.hidden = NO;
            cell.buttoncase.hidden = YES;
            
        }
        
        
        
      
//
        return cell;
        
//        int cellNum = _NumCell;
//        _resHomePageDic = _cellTopData[(indexPath.row - 1)];
//        //项目ID
////        _projectID = _resHomePageDic[@"_id"];
//        //地区按钮
//        [cell.buttonCountry setTitle:_resHomePageDic[@"address"] forState:UIControlStateNormal];
//        //标题
////        cell.textTitle.text = _resHomePageDic[@"title"];
//        cell.textTitle.text = @"一二三四五六七八九十";
//        //作者
////        cell.textBy.text = _resHomePageDic[@"creator"];
//        cell.textBy.text = @"by lyc";
//        
//        //摘要
//        cell.textSummarize.text = _resHomePageDic[@"desc"];
//        
//        if([_resHomePageDic[@"isFocus"] longValue] == 1){
//            [cell.buttoncase setImage:[UIImage imageNamed:@"HomePageLoveYES"] forState:UIControlStateNormal];
//            _selected = YES;
//        }else{
//            [cell.buttoncase setImage:[UIImage imageNamed:@"HomePageLoveNO"]  forState:UIControlStateNormal];
//            _selected = NO;
//        }
//        
//        //类型按钮
//        [cell.buttonType setTitle:_resHomePageDic[@"type"] forState:UIControlStateNormal];
//
//        
//        NSMutableString *strPeo = [NSMutableString stringWithFormat:@"%ld",[_resHomePageDic[@"fact_person"] longValue]];
//        
//        //人数按钮
//        [cell.buttonPerson setTitle:[strPeo stringByAppendingString:@"个火伴"] forState:UIControlStateNormal];
//
//        
//
//        
//        //根据钱数算出进度条比例
//        float wanted = [_resHomePageDic[@"wanted_money"] floatValue];
//        float fact = [_resHomePageDic[@"fact_money"] floatValue];
//        float proessNum = fact/wanted;
//        
//        cell.progressView.progress = proessNum;
//        
//        //主页图片
//        cell.MainImage.userInteractionEnabled = YES;
//        
//        NSArray *imageArray = _resHomePageDic[@"images"];
//        UIImage *homePageImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageArray[0]]]];
//        //按比例获取图片
//        cell.MainImage.image = [ImageSameWidth imageCompressForWidth:homePageImage targetWidth:_widthMainImage];
//        //手指触发类
////        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHomeImage:)];
////        [cell.MainImage addGestureRecognizer:singleTap];
//
//        
//
//        //添加手指触发方法
////        [cell.MainImage addGestureRecognizer:singleTap];
//        
////        cell.MainImage.tag = (indexPath.row - 1);
//        
////        _projectModel.projectID = _resHomePageDic[@"_id"];
//        
//
        
        
    }

}


-(void)HomeDynamicImageCellSegue:(DataModelHomeSilder *)sender{
    
    if([sender.imageType isEqualToString:@"project"]){
        
        [self performSegueWithIdentifier:@"Projectdetails" sender:sender.projectID];
    }else if([sender.imageType isEqualToString:@"article"]){

        [self performSegueWithIdentifier:@"articleSegue" sender:sender.strContents];
    }
    
    
    
    
}

-(void)loverButtonClick:(UIButton*)sender{
    
    DataModel *dataModelLove = [[DataModel alloc] init];
    
    if(_runtime != 1){
        
    
        _viewPopLogin.frame = CGRectMake(0 ,self.tableView.contentOffset.y, _iOSLoginDeviceSize.width, _iOSLoginDeviceSize.height - 44);
        _viewPopLogin.hidden = NO;
        self.tableView.scrollEnabled = NO;
        
//        self.tabBarItem.enabled = NO;
        
        
        return;
    }else{
    
    [_httpClassHomePage homePageSetKey:_strKey numPage:_pageNumTop numNum:_CountTop token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        NSData *data = [operatioin responseData];
        NSMutableDictionary *resHomePageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resHomePageDic[@"status"] isEqualToString:@"success"]){
            
            //[@"data"]大数组；
            
            NSLog(@"打印主页返回返回%@",resHomePageDic);
            NSMutableDictionary *dicData  =  resHomePageDic[@"data"];
            
            _aryButtonLove = [[NSMutableArray alloc] init];
            
            for(NSMutableDictionary *dicCell in dicData[@"projects"]){
                
                [_aryButtonLove addObject:dicCell];
            }
            
            NSMutableDictionary *dicLoveButton = _aryButtonLove[sender.tag - 1];
            
            NSLog(@"%@",dicLoveButton[@"isFocus"]);
            
            if([dicLoveButton[@"isFocus"] longValue] == 0){
                
                [_httpClassHomePage focusProjectselfSetProjectID:dicLoveButton[@"_id"] up:1 token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                                    NSData *data = [operatioin responseData];
                    
                                    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    
                                    NSLog(@"打印点赞返回%@",dic);
                                    if([dic[@"status"] isEqualToString:@"success"]){
                                        [[ToolClass sharedInstance] showAlert:@"关注成功"];
                                        if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
                                            [sender setImage:[UIImage imageNamed:@"loveYES@3x"] forState:UIControlStateNormal];
                                        }else{
                                            [sender setImage:[UIImage imageNamed:@"loveYES@2x"] forState:UIControlStateNormal];
                                        }
                                        _loveTime = 1;
                    
//                                        NSLog(@"%@",dicLoveButton[@"isFocus"]);
//                    //                    dicLoveButton[@"isFocus"] = [NSNumber numberWithInt:1];
//                                        [dicLoveButton setObject:@"测试" forKey:@"isFocus"];
//                                        NSLog(@"%@",dic[@"isFocus"]);
                                    }
                                }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                                    [[ToolClass sharedInstance] showAlert:@"关注失败，请检查网络"];
                                }];
            }else{
                [_httpClassHomePage focusProjectselfSetProjectID:dicLoveButton[@"_id"] up:0 token:dataModelLove.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                    
                                    NSData *data = [operatioin responseData];
                                    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                    NSLog(@"打印点赞返回%@",dic);
                                    if([dic[@"status"] isEqualToString:@"success"]){
                                        [[ToolClass sharedInstance] showAlert:@"取消关注成功"];
                                        if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
                                            [sender setImage:[UIImage imageNamed:@"loveNO@3x"] forState:UIControlStateNormal];
                                        }else{
                                            [sender setImage:[UIImage imageNamed:@"loveNO@2x"] forState:UIControlStateNormal];
                                        }
                                        _loveTime = 1;
                    
  
                                    }
                                }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                                    [[ToolClass sharedInstance] showAlert:@"取消关注失败，请检查网络"];
                                }];
            }
                 }else{
            [[ToolClass sharedInstance]showAlert:@"刷新失败，服务器报错"];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance]showAlert:@"刷新失败,请检查网络"];
//        [self.tableView headerEndRefreshing];
    }];

    
    }
    
   
}
////手指动作触发方法
//-(void)clickHomeImage:(UIImageView*)sender{
//    
//    NSLog(@"%ld",sendertag);
//    
//    NSMutableDictionary *dic = _cellTopData[sender.tag];
//
//    [self performSegueWithIdentifier:@"Projectdetails" sender:dic[@"_id"]];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        NSMutableDictionary *dic = _cellTopData[(indexPath.row - 1)];
    
    [self performSegueWithIdentifier:@"Projectdetails" sender:dic[@"_id"]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"Projectdetails"]){

        ProjectDetailsViewController *controller = (ProjectDetailsViewController*)segue.destinationViewController;
        
        NSLog(@"ProjectID%@",sender);
        
        controller.strProjectID = sender;

    }else if([segue.identifier isEqualToString:@"articleSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        ArticleHTMLViewController *controller = (ArticleHTMLViewController*)naVC.topViewController;
        
        NSLog(@"HTML内容%@",sender);
        
        controller.strContents = sender;
    }else if([segue.identifier isEqualToString:@"loginSegue"]){
        
        LoginViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return _heightSliderCell;
    }else{
        return _heightCardCell;
    }
    
}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)loginViewCreate{
    
    
    //    _viewPayList = [[UIView alloc] initWithFrame:];
    _viewPopLogin = [[UIView alloc] initWithFrame:CGRectMake(0 ,self.tableView.contentOffset.y, _iOSLoginDeviceSize.width, _iOSLoginDeviceSize.height - 44)];
    _viewPopLogin.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
    [self.view addSubview:_viewPopLogin];
    
    UIView *viewLoginBlock = [[UIView alloc] initWithFrame:CGRectMake(0,0,78,162)];
    viewLoginBlock.backgroundColor = [UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1];
    viewLoginBlock.clipsToBounds = YES;
    viewLoginBlock.layer.cornerRadius = 12;
    viewLoginBlock.center = _viewPopLogin.center;
    [_viewPopLogin addSubview:viewLoginBlock];
    
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonLogin addTarget:self action:@selector(buttonLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonLogin.backgroundColor = [UIColor colorWithRed:119.0/255 green:134.0/255 blue:146.0/255 alpha:1];
    [buttonLogin setTitleColor:[UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1]forState:UIControlStateNormal];
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    buttonLogin.clipsToBounds = YES;
    buttonLogin.layer.cornerRadius = 27;
    [buttonLogin setFrame:CGRectMake(12,84,54,54)];
    [viewLoginBlock addSubview:buttonLogin];
    
    
    UIImageView *viewClose = [[UIImageView alloc] initWithFrame:CGRectMake(31,24,16,16)];
    if([_iOSDeviceSize isEqualToString:@"iPhone6Plus"]){
        viewClose.image = [UIImage imageNamed:@"close_grey_@3x"];
    }else{
        viewClose.image = [UIImage imageNamed:@"close_grey_@2x"];
    }
    [viewLoginBlock addSubview:viewClose];
    
    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonClose addTarget:self action:@selector(buttonLoginCloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonClose setFrame:CGRectMake(17,28,44,44)];
    //    buttonClose.layer.borderWidth = 1;
    [viewLoginBlock addSubview:buttonClose];

}

@end
