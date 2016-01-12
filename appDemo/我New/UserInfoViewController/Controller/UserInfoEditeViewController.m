//
//  UserInfoEditeViewController.m
//  huoban
//
//  Created by 马锦航 on 16/1/11.
//  Copyright © 2016年 lyc. All rights reserved.
//

#import "UserInfoEditeViewController.h"
#import "UserInfoHeader.h"
#import "UserInfoItem.h"
#import "UserInfoEditTableViewCell.h"


// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

//字体宏
#define PingFangSC(s)     [UIFont fontWithName:@"PingFangSC-Regular" size:s]

#define Navigation_TextColor [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.f alpha:1.0]


@interface UserInfoEditeViewController ()<UserHeaderViewClickDelegate>


@property (nonatomic,strong) UIView * moveView;                             //上面包括头像个人信息能移动的view
@property (nonatomic,strong) UserInfoHeader * userHeaderView;               //用户头像View
@property (nonatomic,strong) UIView * userInfoTableView;                    //用户基本信息列表
@property (nonatomic,strong) UIView * userFootView;                         //底部View


@property (nonatomic,strong) UITextField * userName;
@property (nonatomic,strong) UITextField * userSex;
@property (nonatomic,strong) UITextField * userProfession;
@property (nonatomic,strong) UITextField * userAdress;
@property (nonatomic,strong) UITextView * userDescribe;

@end




@implementation UserInfoEditeViewController

- (void)setUserBaseModel:(huobanUserBaseInfoModel *)userBaseModel {
    _userBaseModel = userBaseModel;
    self.userHeaderView.userHeaderUrl = userBaseModel.data.image;
}


#pragma mark - 懒加载
- (UIView *)moveView {
    if (!_moveView) {
        _moveView = [UIView new];
        _moveView.frame = CGRectMake(0, 64, Main_Screen_Width, self.userHeaderView.frame.size.height + self.userInfoTableView.frame.size.height);
        [_moveView addSubview:self.userInfoTableView];
        [_moveView addSubview:self.userHeaderView];
    }
    return _moveView;
}

- (UserInfoHeader *)userHeaderView {
    if (!_userHeaderView) {
        _userHeaderView = [[UserInfoHeader alloc]init];
        [_userHeaderView setFrame:CGRectMake(0, 0, Main_Screen_Width, 90)];
        [_userHeaderView setBackgroundColor:[UIColor whiteColor]];
        _userHeaderView.delegate = self;
        
    }
    return _userHeaderView;
}

- (UIView *)userInfoTableView {
    if (!_userInfoTableView) {
        _userInfoTableView = [UIView new];
        _userInfoTableView.frame = CGRectMake(12, self.userHeaderView.frame.size.height, Main_Screen_Width - 12*2, 61*4);
        [_userInfoTableView addSubview:self.userName];
        [_userInfoTableView addSubview:self.userSex];
        [_userInfoTableView addSubview:self.userProfession];
        [_userInfoTableView addSubview:self.userAdress];
        [_userInfoTableView addSubview:self.userDescribe];
    }
    return _userInfoTableView;
}

- (UITextField *)userName {
    if (!_userName) {
        _userName = [UITextField new];
//        _userName.textPlaceTitle = @"姓名";
    }
    return _userName;
}

- (UITextField *)userSex {
    if (!_userSex) {
        _userSex = [UITextField new];
//        _userSex.textPlaceTitle = @"性别";
    }
    return _userSex;
}
- (UITextField *)userProfession {
    if (!_userProfession) {
        _userProfession = [UITextField new];
//        _userProfession.textPlaceTitle = @"职业";
    }
    return _userProfession;
}
- (UITextField *)userAdress {
    if (!_userAdress) {
        _userAdress = [UITextField new];
//        _userAdress.textPlaceTitle = @"所在地";
    }
    return _userAdress;
}


- (void)viewWillAppear:(BOOL)animated {
    animated = YES;
    [self hideTabBar];
    [self setNavigationController];
    [self.view addSubview:self.userInfoTableView];
    [self.view addSubview:self.userHeaderView];
    [self.view addSubview:self.userFootView];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
    
    
}


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




#pragma mark 对navigation中包括左右按钮title显示的设置
- (void) setNavigationController {
    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    //图片保持原有颜色不改变，不做处理的话，图片会被强制渲染成蓝色
    
    //    UIBarButtonItem * leftBarButton = [UIBarButtonItem alloc]initWithImage:<#(nullable UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(nullable id)#> action:<#(nullable SEL)#>
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"系统设置"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonAction)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"我_back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonAction)];
    
    self.navigationItem.title = @"马锦航";
    //    self.tabBarItem.title = @"我";
    //设置navigationItem.title的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:Navigation_TextColor forKey:UITextAttributeTextColor];
}



- (void) leftBarButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) rightBarButtonAction {
    
    NSLog(@"rightAction");
//    UpdateUserSettingSetUser
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 代理方法
- (void)headerViewClick {
    
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
