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
#import "UserCreateProjectTableViewCell.h"
#import "ProjectDetailsViewController.h"
#import "TalkViewController.h"
#import "UserInfoViewController.h"
#import "UserInfoEditeViewController.h"
#import "OneProjectDynamicTableViewController.h"



// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.f alpha:1.0]

#define PingFangSC(s)     [UIFont fontWithName:@"PingFangSC-Regular" size:s]


#define Navigation_bgColor [UIColor colorWithRed:20/255.0f green:30/255.0f blue:40/255.f alpha:1.0]

//33A3DB  51,163,219
#define SegmentOptionBorderColor_OtherView [UIColor colorWithRed:51/255.0f green:163/255.0f blue:219/255.f alpha:1.0]


#define SegmentOptionBorderColor_SelfView  [UIColor colorWithRed:249.0/255.0f green:237/255.0f blue:49/255.0f alpha:1]

#define Navigation_TextColor [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.f alpha:1.0]


#define HeaderView_bgColor [UIColor colorWithRed:20/255.0f green:30/255.0f blue:40/255.f alpha:1.0]



static NSInteger userHeaderViewHeight = 108;

static NSInteger userOptionViewHeight = 57;
//static NSInteger userOptionViewHeight = 72;

@interface UserSelfMessageViewController ()<UITableViewDelegate,UITableViewDataSource,optionSegmentedControlDelegate,UserFeedTableViewCellDelegate,UserHeaderViewClickDelegate>

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
//@property (nonatomic,strong) DataModel * userBaseInfoModel;


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

//发起项目View是否展开
@property (nonatomic,assign) NSInteger createProjectIsOpen;

//发起项目view详细说明
@property (nonatomic,strong)     UILabel * callTextLabel;



@end

@implementation UserSelfMessageViewController

HttpClassSelf *httpClassUserMessage;


#pragma mark - 初始化方法

- (instancetype)initForOtherUserWithUserID:(NSString *)userID
{
    self = [super init];
    if (self) {
        DataModel * dataModel = [DataModel defaultUserBaseInfo];
        self.userID = userID;
        self.userTokenID = dataModel.userInfomation.tokenID;
        NSLog(@"initForOtherUserWithUserID");
        //        [self userBaseInfoRequestWithUserID:userID];
        
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        DataModel * dataModel = [DataModel defaultUserBaseInfo];
        
        
        self.userID = dataModel.userInfomation.UserID;
        self.userTokenID = dataModel.userInfomation.tokenID;
        
    }
    return self;
}

#pragma mark 重写的set/get方法


//- (NSArray *)segmentItemCount {

//}


- (void)setSegmentIndex:(NSInteger)segmentIndex {
    
    _segmentIndex = segmentIndex;
    if(segmentIndex == 0) {
        [self userFeedListRequest];
    }
}

//重写请求到的用户基本信息model的set方法
- (void)setHuobanUserBaseInfoModel:(huobanUserBaseInfoModel *)huobanUserBaseInfoModel {
    _huobanUserBaseInfoModel = huobanUserBaseInfoModel;
    
    
    //show UserOption
    [self.view addSubview:self.userOptionView];
    
//    self.userHeaderView.huobanUserBaseInfoModel = huobanUserBaseInfoModel;
    
    //仅提示性输出
#if 0
    NSLog(@"项目:%zi",self.huobanUserBaseInfoModel.data.allprojects.count);
    NSLog(@"动态:%zi",self.huobanUserBaseInfoModel.data.feed.count);
    NSLog(@"关注:%zi",self.huobanUserBaseInfoModel.data.followers);
    NSLog(@"被关注:%zi",self.huobanUserBaseInfoModel.data.following);
#endif
    
    self.userHeaderView.userHeaderUrl = huobanUserBaseInfoModel.data.image;
    
    self.userOptionView.dataModel = huobanUserBaseInfoModel.data;
    
    
    
//    [self.view addSubview:self.userHeaderView];
    
    if (huobanUserBaseInfoModel.data.city.length > 0) {
        self.userHeaderView.userLocationLabel.text = huobanUserBaseInfoModel.data.city;
    }
    if (huobanUserBaseInfoModel.data.desc.length > 0) {
        self.userHeaderView.userDescribe.text = huobanUserBaseInfoModel.data.desc;
    }
    NSLog(@"个人信息%@,data.city = %@",[huobanUserBaseInfoModel.data toDictionary],huobanUserBaseInfoModel.data.city);
    if (huobanUserBaseInfoModel.data.desc.length > 0) {
        
        self.userHeaderView.userProfessionLabel.text = huobanUserBaseInfoModel.data.desc;
    }
    
    //    self.userID = huobanUserBaseInfoModel.token;
    
    //    self.userTokenID = huobanUserBaseInfoModel.token;
#warning 不确定
    [self userProjectInfoRequest];
    
    self.segmentItemCount = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%zi",huobanUserBaseInfoModel.data.allprojects.count],[NSString stringWithFormat:@"%zi",huobanUserBaseInfoModel.data.feed.count],[NSString stringWithFormat:@"%zi",huobanUserBaseInfoModel.data.followers],[NSString stringWithFormat:@"%zi",huobanUserBaseInfoModel.data.following], nil];
    [self showUserBaseInfo];
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
        if (![self isSelfOrOtherInfoViewController]) {
            _userHeaderView = [[UserHeaderView alloc]initWithHeaderUrl:nil WithUserBaseInfoModel:self.huobanUserBaseInfoModel];
            userHeaderViewHeight = 208;
        } else {
            _userHeaderView = [[UserHeaderView alloc]initWithHeaderUrl:@"hahah" WithUserBaseInfoModel:self.huobanUserBaseInfoModel];
            userHeaderViewHeight = 108;
        }
        
        [_userHeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, userHeaderViewHeight)];
        [_userHeaderView setBackgroundColor:HeaderView_bgColor];
        _userHeaderView.delegate = self;
        
//        _userHeaderView.huobanUserBaseInfoModel = self.huobanUserBaseInfoModel;
        
        
        
        //        [_userHeaderView setBackgroundColor:[UIColor colorWithRed:21 green:30 blue:40 alpha:1.0]];
    }
    return _userHeaderView;
}



- (UserOption *)userOptionView {
    if (!_userOptionView) {
        
        _userOptionView = [[UserOption alloc]initWithFrame:CGRectMake(0, userHeaderViewHeight, self.view.frame.size.width, userOptionViewHeight) userOptionsArray:nil WithIsSelfViewController:[self isSelfOrOtherInfoViewController]];
        
        _userOptionView.delegate = self;
    }
    return _userOptionView;
}

- (UITableView *)userTableView {
    if (!_userTableView) {
        _userTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44 - 49 + 15) style:UITableViewStyleGrouped];
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

//- (DataModel *)userBaseInfoModel {
//    return [DataModel defaultUserBaseInfo];
//}

//- (NSString *)userTokenID {
//    if (!_userTokenID) {
//        _userTokenID = self.userBaseInfoModel.userInfomation.tokenID;
//    }
//    return _userTokenID;
//}

//- (NSString *)userID {
//    if (!_userID) {
//        _userID = self.userBaseInfoModel.userInfomation.UserID;
//    }
//    return _userID;
//}

- (NSInteger)createProjectIsOpen {
    if (!_createProjectIsOpen) {
        _createProjectIsOpen = 0;
    }
    return _createProjectIsOpen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //对navigaitonController进行设置
    [self setNavigationController];
    [self.userTableView headerBeginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 对navigation中包括左右按钮title显示的设置
- (void) setNavigationController {
    
    
    //去除导航栏底部标识线
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    
    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    //图片保持原有颜色不改变，不做处理的话，图片会被强制渲染成蓝色
    
    //    UIBarButtonItem * leftBarButton = [UIBarButtonItem alloc]initWithImage:<#(nullable UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(nullable id)#> action:<#(nullable SEL)#>
    
    
    self.navigationItem.title = @"马锦航";
    //    self.tabBarItem.title = @"我";
    //设置navigationItem.title的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:Navigation_TextColor forKey:UITextAttributeTextColor];
    
    
    
    if (self.userTokenID == self.userID) {
        NSLog(@"userid = usertokenid");
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"系统设置"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonAction)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"我_私信"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction)];
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
    }
    
    
    
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
            //            NSLog(@"%zi",[self.segmentItemCount[1] integerValue]);
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
            [cell.objectJoin addTarget:self action:@selector(joinPushAction:) forControlEvents:UIControlEventTouchUpInside];
            cell.objectJoin.tag = indexPath.row;
            
            return cell;
        }
            break;
        case 1:
        {
            NSLog(@"%zi",indexPath.row);
            static NSString * UserFeedTableViewCellDequeueIdentifier = @"UserFeedTableViewCellcellID";
            userFeedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UserFeedTableViewCellDequeueIdentifier];
            cell.feeddelegate = self;
            //取消cell的选中效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (!cell) {
                cell = [[userFeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserFeedTableViewCellDequeueIdentifier];
            }
            cell.feeddelegate = self;
            cell.model = self.huobanUserFeedModel.data[indexPath.row];
            cell.indexpath = indexPath;
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

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.segmentIndex == 0 && [self isSelfOrOtherInfoViewController]) {
        
        return [self createProjectHeaderView];
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.segmentIndex == 0 && [self isSelfOrOtherInfoViewController]) {
        if (self.createProjectIsOpen ) {
            return 88;
        }
        else {
            return 44;
        }
    }
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (self.segmentIndex) {
        case 0:
            return 132;
            break;
        case 1:
            
            //需要自适应高度
            return [userFeedTableViewCell feedTableViewCellWithModel:self.huobanUserFeedModel.data[indexPath.row]];
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

#pragma make tableViewSelected
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.segmentIndex) {
        case 1:
        {
            HuoBanUserProjectData * model = self.huobanUserFeedModel.data[indexPath.row];
            
            
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            //
            //            AppSettingViewController * appSettingVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"AppSettingViewController"];
            
            
            TalkViewController * talkViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"TalkViewController"];
            NSLog(@"%@",model.idField);
            talkViewController.strfeedID = model.idField;
            
            [self presentViewController:talkViewController animated:YES completion:nil];
            
        }
            break;
            
        default:
            break;
    }
    //    [self performSegueWithIdentifier:@"Projectdetails" sender:dic[@"_id"]];
    
}

- (void) tableViewReload {
    NSLog(@"tableViewReload");
    //    [self httpRequest];
    
    switch (self.segmentIndex) {
        case 0:
            [self userProjectInfoRequest];
            break;
        case 1:
            [self userFeedListRequest];
            break;
        case 2:
            [self userFollowerInfoRequest];
            break;
        case 3:
            [self userFollowingInfoRequest];
            break;
        default:
            break;
    }
    
}


#pragma mark - KVO 回调
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
    //    [self userProjectInfoRequest];
    //    [self userBaseInfoRequest];
    
}

#pragma mark 用户基本信息网络请求
- (void) userBaseInfoRequestWithUserID:(NSString *)userID {
    
#warning 自己的信息不全，测试用给定tokenID的来测试
    //    NSString * path =[NSString stringWithFormat: @"user/profile/user-%@/%@",[DataModel defaultUserBaseInfo].userInfomation.UserID,[DataModel defaultUserBaseInfo].userInfomation.tokenID];
    
    
    
    NSString * path =[NSString stringWithFormat: @"user/profile/user-%@/%@",self.userID,self.userTokenID];
    
    
    [HttpTool getWithPath:path params:nil success:^(id JSON) {
        
        NSLog(@"\n%@",JSON);
        NSLog(@"以上是用户基本信息");
        self.huobanUserBaseInfoModel = [[huobanUserBaseInfoModel alloc]initWithDictionary:JSON];
        
    } failure:^(NSError *error) {
        NSLog(@"failure%@",error.localizedDescription);
    }];
}

#pragma mark 用户项目的信息
- (void) userProjectInfoRequest {
    
    NSString * userID = self.userID;
    NSString * tokenID = self.userTokenID;
    //    self.huobanUserBaseInfoModel.token
    //金霖
    //    userID = @"5620a7bbb5a2a7a8fe41b83f";
    
    [[HttpClassSelf new] getUserSelfInfoByUserID:userID page:0 num:100 token:tokenID CallBackYES:^(MKNetworkOperation *operatioin) {
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *resdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.userProjectModel = [[HuoBanUserProjectModel alloc]initWithDictionary:resdic];
        [self.userTableView headerEndRefreshing];
        NSLog(@"用户项目信息%@",resdic);
    } CallBackNO:^(MKNetworkOperation *errorOp, NSError *err) {
        ;
    }];
}


#pragma mark 用户动态网络请求
- (void) userFeedListRequest {
    NSString * userFeedListPath =[NSString stringWithFormat:@"feed/u-%@/page-0/num-20/%@",self.userID,self.userTokenID];
    
    
    NSLog(@"%@",userFeedListPath);
    
    [HttpTool getWithPath:userFeedListPath params:nil success:^(id JSON) {
        //        NSLog(@"用户动态%@",JSON);
        self.huobanUserFeedModel = [[huobanUserFeedModel alloc]initWithDictionary:JSON];
        if (self.huobanUserFeedModel.data.count == 0) {
            //            [[ToolClass sharedInstance] showAlert:@"没有数据，请检查网络"];
            
        }
        [self.userTableView headerEndRefreshing];
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error.localizedDescription);
        ;
    }];
}
#pragma mark 关注网络请求
- (void) userFollowerInfoRequest {
    
    
    [HttpTool getWithPath:[NSString stringWithFormat:@"/user/%@/follower/page-0/num-0/%@",self.userID,self.userTokenID] params:nil success:^(id JSON) {
        
        self.huobanUserFollower = [[HuoBanUserFollowModel alloc]initWithDictionary:JSON];
        
        [self.userTableView headerEndRefreshing];
        //        NSLog(@"关注网络请求%@",JSON);
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        [self.userTableView headerEndRefreshing];
    }];
    
    
}

#pragma mark 被关注网络请求
- (void) userFollowingInfoRequest {
    
    [HttpTool getWithPath:[NSString stringWithFormat:@"/user/%@/following/page-0/num-0/%@",self.userID,self.userTokenID] params:nil success:^(id JSON) {
        self.huobanUserFollowing = [[HuoBanUserFollowModel alloc]initWithDictionary:JSON];
        //        NSLog(@"被关注网络请求%@",JSON);
        [self.userTableView headerEndRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
        [self.userTableView headerEndRefreshing];
    }];
}

#pragma mark 删除动态网络请求
- (void) deleteFeedRequestWithFeedID:(NSString *)feedID {
    
    [HttpTool deleteWithPath:[NSString stringWithFormat:@"/project/feed/%@/%@",feedID,self.userTokenID] params:nil success:^(id JSON) {
        
        NSLog(@"删除成功");
        [[ToolClass sharedInstance] showAlert:@"删除成功"];
        
        NSLog(@"删除成功后的操作");
        [self userBaseInfoRequestWithUserID:nil];
        //        [self userFeedListRequest];
        //        [self.userTableView reloadData];
        ;
    } failure:^(NSError *error) {
        [[ToolClass sharedInstance] showAlert:@"删除失败"];
        ;
    }];
}


- (void)viewWillDisappear:(BOOL)animated {
    animated = YES;
    
    [self setNavigationController];
    self.tabBarController.tabBar.hidden = NO;
    self.hidesBottomBarWhenPushed = NO;
    [self showTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    if ([self isSelfOrOtherInfoViewController]) {
        userHeaderViewHeight = 108;
        self.tabBarController.tabBar.hidden = NO;
        self.hidesBottomBarWhenPushed = NO;
        [self showTabBar];
        
        [_userHeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, userHeaderViewHeight)];
    } else {
        userHeaderViewHeight = 208;
        self.tabBarController.tabBar.hidden = YES;
        self.hidesBottomBarWhenPushed = YES;
        [self hideTabBar];
        [_userHeaderView setFrame:CGRectMake(0, 0, self.view.frame.size.width, userHeaderViewHeight)];
        
    }
    
    
    
    //showTableView
    
    
//    if (![self isSelfOrOtherInfoViewController]) {
//        
//        CGRect userTableNewFrame = self.userTableView.frame;
//        userTableNewFrame.size.height = Main_Screen_Height - userTableNewFrame.origin.y;
//        self.userTableView.frame = userTableNewFrame;
//    }
    
    [self.view addSubview:self.userTableView];
    
    //加载headerView
    [self.view addSubview:self.userHeaderView];
    
    [self setNavigationController];
    
    //基本信息网络请求
    [self userBaseInfoRequestWithUserID:nil];
    
    //项目信息网络请求
    //    [self userProjectInfoRequest];
    //关注信息网络请求
    //    [self userFollowerInfoRequest];
    //被关注信息网络请求
    //    [self userFollowingInfoRequest];
    
    
    //    NSLog(@"%@",self.userBaseInfoModel.userInfomation.Name);
    
}
#pragma mark 对用户基本信息进行显示  包括用户名和用户头像
- (void) showUserBaseInfo {
    self.navigationItem.title = self.huobanUserBaseInfoModel.data.name;
    self.userHeaderView.userHeaderUrl = self.huobanUserBaseInfoModel.data.image;
    self.userHeaderView.huobanUserBaseInfoModel = self.huobanUserBaseInfoModel;
    
}

- (void) leftBarButtonAction {
    
}

- (void) rightBarButtonAction {
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    AppSettingViewController * appSettingVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"AppSettingViewController"];
    
    [self.navigationController pushViewController:appSettingVC animated:YES];
}


#pragma mark - UserHeaderViewDelegate

- (void)pushToUserInfoViewController {
    
    
    if([self isSelfOrOtherInfoViewController]) {
        UserInfoViewController * userInfoViewController = [[UserInfoViewController alloc]init];
        userInfoViewController.userBaseModel = self.huobanUserBaseInfoModel;
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userInfoViewController animated:YES];
    }
    
    
}

#pragma mark - segmented代理方法

/**segmented代理方法*/
- (void)segmentedControlSelectAtIndex:(NSInteger)index {
    NSLog(@"%zi",index);
    
    
    if ([self isSelfOrOtherInfoViewController]) {
        
    } else {
        
    }
    
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


#pragma mark 删除按钮响应事件
- (void)deleteFeedTableViewCellWithIndexPaht:(NSIndexPath *)indexpath {
    
#warning 删除动态条目
    
    [self showOkayCancelAlertWithIndexPath:indexpath];
    
    
    
    
    NSLog(@"deleteFeedTableViewCell");
}

#pragma mark 删除动态前的提示
- (void)showOkayCancelAlertWithIndexPath:(NSIndexPath *)indexPath {
    NSString *title = NSLocalizedString(@"提示", nil);
    NSString *message = NSLocalizedString(@"您确定要删除吗", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"确定", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
        [self deleteFeedRequestWithFeedID:[self.huobanUserFeedModel.data[indexPath.row] valueForKey:@"idField"]];
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 显示／隐藏 TabBar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    self.tabBarController.tabBar.hidden = YES;
}

- (void)showTabBar {
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark 返回“创建项目”的View
- (UIView *) createProjectHeaderView {
    
    UIView * createProjectHeaderVeiw = [[UIView alloc]init];
    createProjectHeaderVeiw.frame = CGRectMake(0, 0, Main_Screen_Width, 88);
    createProjectHeaderVeiw.backgroundColor = RGB(238, 238, 238);
    //    createProjectHeaderVeiw.backgroundColor = RGB(249, 237, 49);
    
    UILabel * label = [UILabel new];
    label.frame = CGRectMake(12, 4, 100, 40);
    label.font = PingFangSC(14.7);
    label.text = @"发起项目";
    //  21,30,40
    label.textColor = RGB(21, 30, 40);
    
    UIButton * button = [UIButton new];
    button.frame = CGRectMake(Main_Screen_Width - 44, 0, 44, 44);
    //    [button setBackgroundColor:[UIColor redColor]];
    [button setImage:[UIImage imageNamed:@"展开提醒"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openCreateProjectView) forControlEvents:UIControlEventTouchUpInside];
    [createProjectHeaderVeiw addSubview:label];
    [createProjectHeaderVeiw addSubview:button];
    
    
    self.callTextLabel = [[UILabel alloc]init];;
    self.callTextLabel.frame = CGRectMake(12, 44, Main_Screen_Width - 12, 44);
    self.callTextLabel.text = @"请将提案发至idea@huoban.io,或拨打电话010-84243856,我们期待和你一起把想法变成现实。";
    self.callTextLabel.font = PingFangSC(12);
    self.callTextLabel.numberOfLines = 0;
    if (self.createProjectIsOpen) {
        self.callTextLabel.hidden = NO;
    }
    else {
        self.callTextLabel.hidden = YES;
    }
    [createProjectHeaderVeiw addSubview:self.callTextLabel];
    return createProjectHeaderVeiw;
    
}


#pragma mark 加入群组按钮跳转
- (void) joinPushAction:(UIButton *)sender {
    
    
    
    NSLog(@"joinPushAction.title=%@",sender.titleLabel.text);
    
    if ([sender.titleLabel.text isEqualToString:@"去群组"]) {
        
        
        ProjectModel *projectModelSend = [[ProjectModel alloc] init];
        
        projectModelSend.projectTitle = ((HuoBanUserProjectData *)self.userProjectModel.data[sender.tag]).title;
        projectModelSend.projectID = ((HuoBanUserProjectData *)self.userProjectModel.data[sender.tag]).idField;


//        OneProjectDynamicTableViewController * oneProjectVC = [[OneProjectDynamicTableViewController alloc]init];
        
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        OneProjectDynamicTableViewController * oneProjectVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"OneProjectDynamicTableViewController"];
        oneProjectVC.projectModelOneProject = projectModelSend;
        
        [self.navigationController pushViewController:oneProjectVC animated:YES];

        
//        [self performSegueWithIdentifier:@"OneProjectSegue" sender:projectModelSend];

        
//        OneProjectDynamicTableViewController *controller = (OneProjectDynamicTableViewController*)naVC.topViewController;
//
//        controller.isJoin = _isJoin;
//        controller.projectModelOneProject = sender;

        //跳转到群组页面
        
    }else if ([sender.titleLabel.text isEqualToString:@"加入他们"]||[sender.titleLabel.text isEqualToString:@"支持更多"]) {
//        跳转到支付页面
        
    }
    
    
    
    
    //    if (sender.titleLabel) {
    
    //    }
    
#warning test
    //    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    //    AppSettingViewController * appSettingVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"AppSettingViewController"];
    
    
    //    [self.navigationController pushViewController:appSettingVC animated:YES];
    
    
}

#pragma mark 判断是个人信息页面还是他人信息页面
- (BOOL) isSelfOrOtherInfoViewController {
    
    
    NSLog(@"%@\n%@",self.userID,self.userTokenID);
    
    if (self.userID == self.userTokenID) {
        return YES;
    }
    return NO;
}

#pragma mark 是否展开创建项目的页面（联系我们）
- (void) openCreateProjectView {
    NSLog(@"openCreateProjectView");
    self.createProjectIsOpen = !self.createProjectIsOpen;
    [self.userTableView reloadData];
}

- (void) popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
//    [super dealloc];
    
    [self removeObserver:self forKeyPath:@"contentOffset"];
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
