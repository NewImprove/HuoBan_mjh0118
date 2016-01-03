//
//  UserSelfMessageViewController.m
//  huoban
//
//  Created by 马锦航 on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserSelfMessageViewController.h"
#import "HttpClassSelf.h"
#import "DataModel.h"
#import "ToolClass.h"
#import "UserHeaderView.h"
#import "UIImageView+WebCache.h"
#import "UserOption.h"
#import "MJRefresh.h"
#import "UserObjectTableViewCell.h"
#import "HuoBanUserProjectModel.h"
#import "HttpTool.h"
#import "huobanUserBaseInfoModel.h"
#import "UserMessageViewController.h"

#import "AppSettingViewController.h"
#import "userFeedTableViewCell.h"
#import "huobanUserFeedModel.h"
#import "userFollowerTableViewCell.h"
#import "HuoBanUserFollowModel.h"

static NSInteger userHeaderViewHeight = 108;
static NSInteger userOptionViewHeight = 72;

@interface UserSelfMessageViewController ()<UITableViewDelegate,UITableViewDataSource,optionSegmentedControlDelegate>

#pragma mark 全局参数tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

//segment选项的index
@property (nonatomic,assign) NSInteger segmentIndex;

@property (nonatomic,copy) NSArray * segmentItemCount;

#pragma mark UI控件
/**用户头像View*/
@property (nonatomic,strong) UserHeaderView * userHeaderView;

/**用户选项View （可悬停）*/
@property (nonatomic,strong) UserOption * userOptionView;


#pragma mark 数据model
/**数据模型*/
//用户项目信息的数据模型
@property (nonatomic,strong) HuoBanUserProjectModel * userProjectModel;

/**TableView*/
@property (nonatomic,strong) UITableView * userTableView;

//用户基本信息model  本地沙盒 登录后保存的model
@property (nonatomic,strong) DataModel * userBaseInfoModel;


//用户基本信息model
@property (nonatomic,strong) huobanUserBaseInfoModel * huobanUserBaseInfoModel;

//用户动态信息model
@property (nonatomic,strong) huobanUserFeedModel * huobanUserFeedModel;

//用户关注信息model
@property (nonatomic,strong) HuoBanUserFollowModel * huobanUserFollower;

//用户被关注信息model
@property (nonatomic,strong) HuoBanUserFollowModel * huobanUserFollowing;

@property (nonatomic,strong) NSString * userTokenID;

@property (nonatomic,strong) NSString * userID;



@end

@implementation UserSelfMessageViewController

HttpClassSelf *httpClassUserMessage;


#pragma mark 重写的set/get方法

//重写请求到的用户基本信息model的set方法
- (void)setHuobanUserBaseInfoModel:(huobanUserBaseInfoModel *)huobanUserBaseInfoModel {
    _huobanUserBaseInfoModel = huobanUserBaseInfoModel;
    
    
    //show UserOption
    [self.view addSubview:self.userOptionView];

    //仅提示性输出
#if 0
    NSLog(@"项目:%zi",self.huobanUserBaseInfoModel.data.allprojects.count);
    NSLog(@"动态:%zi",self.huobanUserBaseInfoModel.data.feed.count);
    NSLog(@"关注:%zi",self.huobanUserBaseInfoModel.data.followers);
    NSLog(@"被关注:%zi",self.huobanUserBaseInfoModel.data.following);
#endif
    

    self.userOptionView.dataModel = self.huobanUserBaseInfoModel.data;
    
    self.segmentItemCount = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%zi",self.huobanUserBaseInfoModel.data.allprojects.count],[NSString stringWithFormat:@"%zi",self.huobanUserBaseInfoModel.data.feed.count],[NSString stringWithFormat:@"%zi",self.huobanUserBaseInfoModel.data.followers],[NSString stringWithFormat:@"%zi",self.huobanUserBaseInfoModel.data.following], nil];
}


#pragma  mark model Setter/Getter方法
- (void)setHuobanUserFeedModel:(huobanUserFeedModel *)huobanUserFeedModel {
    _huobanUserFeedModel = huobanUserFeedModel;
    [self.userTableView reloadData];
}

- (void)setUserProjectModel:(HuoBanUserProjectModel *)userProjectModel {
    _userProjectModel = userProjectModel;
//    [self.view addSubview:self.userTableView];
    [self.userTableView reloadData];
}

- (void)setHuobanUserFollower:(HuoBanUserFollowModel *)huobanUserFollower {
    _huobanUserFollower = huobanUserFollower;
    [self.userTableView reloadData];
}

- (void)setHuobanUserFollowing:(HuoBanUserFollowModel *)huobanUserFollowing {
    _huobanUserFollowing = huobanUserFollowing;
    [self.userTableView reloadData];
}


#pragma mark - 懒加载



- (UserHeaderView *)userHeaderView {
    if (!_userHeaderView) {
#warning 需要传数据
        _userHeaderView = [[UserHeaderView alloc]initWithHeaderUrl:nil];
        [_userHeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, userHeaderViewHeight)];
//        [_userHeaderView setBackgroundColor:[UIColor colorWithRed:21 green:30 blue:40 alpha:1.0]];
    }
    return _userHeaderView;
}

- (UserOption *)userOptionView {
    if (!_userOptionView) {
        _userOptionView = [[UserOption alloc]initWithFrame:CGRectMake(0, userHeaderViewHeight, self.view.frame.size.width, userOptionViewHeight) userOptionsArray:nil];
        _userOptionView.delegate = self;
    }
    return _userOptionView;
}

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _userTableView.delegate = self;
        _userTableView.dataSource = self;
//        _userTableView.bounces = NO;
        _userTableView.contentInset = UIEdgeInsetsMake(userOptionViewHeight+userHeaderViewHeight, 0, 0, 0);
//        _userTableView.backgroundColor = [UIColor blackColor];
        [_userTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        _userTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
//        [_userTableView dequeueReusableCellWithIdentifier:@""];
        [_userTableView addHeaderWithTarget:self action:@selector(tableViewReload)];
    }
    return _userTableView;
}

- (DataModel *)userBaseInfoModel {
    return [DataModel defaultUserBaseInfo];
}

- (NSString *)userTokenID {
    if (!_userTokenID) {
        _userTokenID = self.userBaseInfoModel.userInfomation.tokenID;
    }
    return _userTokenID;
}

- (NSString *)userID {
    if (!_userID) {
        _userID = self.userBaseInfoModel.userInfomation.UserID;
    }
    return _userID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //网络请求
//    [self httpRequest];

    
    //对navigaitonController进行设置
    [self setNavigationController];

    //showTableView
    [self.view addSubview:self.userTableView];

    //加载headerView
    [self.view addSubview:self.userHeaderView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 对navigation中包括左右按钮title显示的设置
- (void) setNavigationController {
    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    //图片保持原有颜色不改变，不做处理的话，图片会被强制渲染成蓝色
    
//    UIBarButtonItem * leftBarButton = [UIBarButtonItem alloc]initWithImage:<#(nullable UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(nullable id)#> action:<#(nullable SEL)#>
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"系统设置"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"我_私信"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonAction)];
    
    self.navigationItem.title = @"金霖";
    //设置navigationItem.title的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:170 green:170 blue:170 alpha:1.0] forKey:UITextAttributeTextColor];
}

#pragma mark - tableViewDelegate/DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.segmentIndex) {
        case 0:
            return [self.segmentItemCount[0] integerValue];
        case 1:
            return [self.segmentItemCount[1] integerValue];
        case 2:
//            return [self.segmentItemCount[2] integerValue];
            return 1;
        case 3:
//            return [self.segmentItemCount[3] integerValue];
            return 0;
        default:
            break;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.segmentIndex) {
        case 0:
        {
            static NSString * UserObjectTableViewCellDequeueIdentifier = @"UserObjectTableViewCellcellID";
            UserObjectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UserObjectTableViewCellDequeueIdentifier];
            //取消cell的选中效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[UserObjectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserObjectTableViewCellDequeueIdentifier];
            }
            cell.model = self.userProjectModel.data[indexPath.row];
            return cell;
        }
            break;
        case 1:
        {
            NSLog(@"%zi",indexPath.row);
            static NSString * UserFeedTableViewCellDequeueIdentifier = @"UserFeedTableViewCellcellID";
            userFeedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UserFeedTableViewCellDequeueIdentifier];
            //取消cell的选中效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[userFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserFeedTableViewCellDequeueIdentifier];
            }
            cell.model = self.huobanUserFeedModel.data[indexPath.row];
            return cell;
        }
            break;
        case 2:
        {
            static NSString * UserFollowerTableViewCellDequeueIdentifier = @"UserFollowerTableViewCell";
            userFollowerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UserFollowerTableViewCellDequeueIdentifier];
            //取消cell的选中效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[userFollowerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserFollowerTableViewCellDequeueIdentifier];
            }
            cell.model = self.huobanUserFollower.data[indexPath.row];
            return cell;
        }
            break;
        case 3:
        {
            static NSString * UserFollowingTableViewCellDequeueIdentifier = @"UserFollowingTableViewCellDequeueIdentifier";
            userFollowerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UserFollowingTableViewCellDequeueIdentifier];
            //取消cell的选中效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[userFollowerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserFollowingTableViewCellDequeueIdentifier];
            }
            cell.model = self.huobanUserFollowing.data[indexPath.row];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.segmentIndex) {
        case 0:
            return 132;
            break;
        case 1:
            //需要自适应高度
            return 232;
            break;
        case 2:
            return 56;
            break;
        case 3:
            return 56;
            break;
        default:
            break;
    }
    return 420;
}

- (void) tableViewReload {
    NSLog(@"tableViewReload");
    [self httpRequest];
}

#pragma mark - KVC 回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        
        if (offset.y > -userOptionViewHeight-userHeaderViewHeight && offset.y < userHeaderViewHeight+userOptionViewHeight && -offset.y > userOptionViewHeight) {
            CGRect userOptionViewFrame = CGRectMake(0, -offset.y-userOptionViewHeight, self.userOptionView.frame.size.width, userOptionViewHeight);
            self.userOptionView.frame = userOptionViewFrame;
            CGRect userHeaderViewFrame = CGRectMake(0, -offset.y-userOptionViewHeight-userHeaderViewHeight, self.userHeaderView.frame.size.width, userHeaderViewHeight);
            self.userHeaderView.frame = userHeaderViewFrame;
//            self.userTableView.frame = CGRectMake(0, userHeaderViewHeight+offset.y, self.view.frame.size.width, self.view.frame.size.height);
            self.userTableView.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
        }
        else if (-offset.y < userOptionViewHeight) {
            self.userOptionView.frame = CGRectMake(0, 0, self.view.frame.size.width, userOptionViewHeight);
        }
    }
}

#pragma mark - 网络请求
#pragma mark 进行网络请求
- (void) httpRequest {
    
    //获取项目信息的数据
    [self userProjectInfoRequest];
    [self userBaseInfoRequest];
    
}

#pragma mark 用户基本信息网络请求
- (void) userBaseInfoRequest {

#warning 自己的信息不全，测试用给定tokenID的来测试
    NSString * path =[NSString stringWithFormat: @"user/profile/user-%@/%@",[DataModel defaultUserBaseInfo].userInfomation.UserID,[DataModel defaultUserBaseInfo].userInfomation.tokenID];
    
//    NSString * path =[NSString stringWithFormat: @"user/profile/user-5620a7bbb5a2a7a8fe41b83f/5620a7bbb5a2a7a8fe41b83f"];
    
//    NSString * path =[NSString stringWithFormat: @"user/profile/user-5620a7b7b5a2a7a8fe41b7eb/5620a7b7b5a2a7a8fe41b7eb"];


    [HttpTool getWithPath:path params:nil success:^(id JSON) {
        
//        NSLog(@"\n%@",JSON);
//        NSLog(@"以上是用户基本信息");
        self.huobanUserBaseInfoModel = [[huobanUserBaseInfoModel alloc]initWithDictionary:JSON];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

#pragma mark 用户项目的信息
- (void) userProjectInfoRequest {
    
    
    
    DataModel *dataModelUnLogin = [DataModel defaultUserBaseInfo];
    
//    [[HttpClassSelf new] getUserSelfInfoByUserID:dataModelUnLogin.userInfomation.UserID page:0 num:0 token:dataModelUnLogin.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin) {
    
    NSLog(@"userID%@,tokenID%@",dataModelUnLogin.userInfomation.UserID,dataModelUnLogin.userInfomation.tokenID );
    
    [[HttpClassSelf new] getUserSelfInfoByUserID:dataModelUnLogin.userInfomation.UserID page:0 num:0 token:dataModelUnLogin.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin) {
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *resdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.userProjectModel = [[HuoBanUserProjectModel alloc]initWithDictionary:resdic];
//        NSLog(@"用户项目信息%@",resdic);
    } CallBackNO:^(MKNetworkOperation *errorOp, NSError *err) {
        ;
    }];
}


#pragma mark 用户动态网络请求
- (void) userFeedListRequest {
    NSString * userFeedListPath =[NSString stringWithFormat:@"/feed/u-%@/page-0/num-5/%@",self.userID,self.userTokenID];
    NSLog(@"path:\napi.huoban.io:8877/%@",userFeedListPath);
    [HttpTool getWithPath:userFeedListPath params:nil success:^(id JSON) {
//        NSLog(@"用户动态%@",JSON);
        
        self.huobanUserFeedModel = [[huobanUserFeedModel alloc]initWithDictionary:JSON];
        
        NSLog(@"用户动态%@",self.huobanUserFeedModel.data);
        
    } failure:^(NSError *error) {
        ;
    }];
}
#pragma mark 关注网络请求
- (void) userFollowerInfoRequest {
    
    
    [HttpTool getWithPath:[NSString stringWithFormat:@"/user/%@/follower/page-0/num-0/%@",self.userID,self.userTokenID] params:nil success:^(id JSON) {
        
        self.huobanUserFollower = [[HuoBanUserFollowModel alloc]initWithDictionary:JSON];
        
//        NSLog(@"关注网络请求%@",JSON);
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

#pragma mark 被关注网络请求
- (void) userFollowingInfoRequest {
    
    [HttpTool getWithPath:[NSString stringWithFormat:@"/user/%@/following/page-0/num-0/%@",self.userID,self.userTokenID] params:nil success:^(id JSON) {
        self.huobanUserFollowing = [[HuoBanUserFollowModel alloc]initWithDictionary:JSON];
//        NSLog(@"被关注网络请求%@",JSON);
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    
    [self showUserBaseInfo];
    
    //基本信息网络请求
    [self userBaseInfoRequest];
    
    //项目信息网络请求
    [self userProjectInfoRequest];
    
    //关注信息网络请求
//    [self userFollowerInfoRequest];
    //被关注信息网络请求
//    [self userFollowingInfoRequest];
    
    
    NSLog(@"%@",self.userBaseInfoModel.userInfomation.Name);
    
}
#pragma mark 对用户基本信息进行显示  包括用户名和用户头像
- (void) showUserBaseInfo {
    self.title = self.userBaseInfoModel.userInfomation.Name;
    self.userHeaderView.userHeaderUrl = self.userBaseInfoModel.userInfomation.ImagePreson;
}

- (void) leftBarButtonAction {
}

- (void) rightBarButtonAction {
    AppSettingViewController *  appSettingVC = [[AppSettingViewController alloc]init];
    [self.navigationController pushViewController:appSettingVC animated:YES];
}


#pragma mark - segmented代理方法
/**segmented代理方法*/
- (void)segmentedControlSelectAtIndex:(NSInteger)index {
    NSLog(@"%zi",index);
    self.segmentIndex = index;
    switch (index) {
        case 0:
        {
            if (!self.userProjectModel) {
                [self userProjectInfoRequest];
            }
            [self.userTableView reloadData];
        }
            break;
        case 1:
        {
            if (!self.huobanUserFeedModel) {
                //动态信息网络请求
                [self userFeedListRequest];
                break;
            }
            [self.userTableView reloadData];
        }
            break;
        case 2:
        {
            if (!self.huobanUserFollower) {
                //
                [self userFollowerInfoRequest];
            }
            [self.userTableView reloadData];
        }
            break;
        case 3:
        {
            if (!self.huobanUserFollowing) {
                [self userFollowerInfoRequest];
            }
            [self.userTableView reloadData];
        }
            break;
        default:
            break;
    }
//    [self.userTableView reloadData];
    
}


        /*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
