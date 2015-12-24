//
//  ProjectMoreStoryViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/15.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ProjectMoreStoryViewController.h"
#import "DataModel.h"
#import "JoinProjectTableViewController.h"
#import "ToolClass.h"
#import "LoginViewController.h"
#import "UMSocialData.h"
#import "UMSocialControllerService.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"

@interface ProjectMoreStoryViewController ()

@end

@implementation ProjectMoreStoryViewController
@synthesize delegate,webView,strContents,aryChouMoreStory,strProjectID,webViewTopNum,countPayDate,dateEnd,strShareImage,strShareText,strShareTitle,imageViewClose,imageViewShare,buttonClose,buttonShare;
UIButton *_buttonCloseBlue;
DataModel *_dataModelProjectMoreStory;

NSString *_iOSSizeMoreStory;
CGSize  _iOSBoundsMoreStory;
UIView *_viewButtonsMoreStory;
UIView *_viewProjectMoreStory;

NSInteger _runTimesMoreStory;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataModelProjectMoreStory = [[DataModel alloc] init];
    
    _iOSSizeMoreStory = _dataModelProjectMoreStory.userInfomation.iOSDeviceSize;
    
    _runTimesMoreStory  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    
    
    if([_iOSSizeMoreStory isEqualToString:@"iPhone6Plus"]){
        
        
        webViewTopNum.constant = -50;
    }else{
        webViewTopNum.constant = -30;
    }
    
    self.title = @"他们的故事";
 
    
  
//    _buttonCloseBlue = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [_buttonCloseBlue addTarget:self
//                     action:@selector(buttonClose:)
//           forControlEvents:UIControlEventTouchUpInside];
//    
//    if([_iOSSizeMoreStory isEqualToString:@"iPhone6Plus"]){
//        _buttonCloseBlue.frame = CGRectMake(339.0, 5.0, 40.0, 40.0);
//        [_buttonCloseBlue setImage:[[UIImage imageNamed:@"CloseBlue@3x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]forState:UIControlStateNormal];
//    }else if ([_iOSSizeMoreStory isEqualToString:@"iPhone6"]){
//        _buttonCloseBlue.frame = CGRectMake(300.0, 5.0, 40.0, 40.0);
//        [_buttonCloseBlue setImage:[[UIImage imageNamed:@"CloseBlue@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }else{
//        _buttonCloseBlue.frame = CGRectMake(245.0, 5.0, 40.0, 40.0);
//        [_buttonCloseBlue setImage:[[UIImage imageNamed:@"CloseBlue@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    }
//    
//        [self.view addSubview:_buttonCloseBlue];
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1]}];
    
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    _iOSBoundsMoreStory = [UIScreen mainScreen].bounds.size;
    
    //登陆视图
    _viewProjectMoreStory = [[UIView alloc] initWithFrame:CGRectMake(0,0,_iOSBoundsMoreStory.width, _iOSBoundsMoreStory.height)];
    _viewProjectMoreStory.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
    [self.view addSubview:_viewProjectMoreStory];
    
    UIView *viewLoginBlock = [[UIView alloc]initWithFrame:CGRectMake(0,0,78,162)];
    viewLoginBlock.backgroundColor = [UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1];
    viewLoginBlock.clipsToBounds = YES;
    viewLoginBlock.layer.cornerRadius = 12;
    viewLoginBlock.center = _viewProjectMoreStory.center;
    [_viewProjectMoreStory addSubview:viewLoginBlock];

    
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonLogin addTarget:self action:@selector(buttonMoreStoryLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonLogin.backgroundColor = [UIColor colorWithRed:119.0/255 green:134.0/255 blue:146.0/255 alpha:1];
    [buttonLogin setTitleColor:[UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1] forState:UIControlStateNormal];
    [buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    buttonLogin.clipsToBounds = YES;
    buttonLogin.layer.cornerRadius = 27;
    [buttonLogin setFrame:CGRectMake(12,84,54,54)];
    [viewLoginBlock addSubview:buttonLogin];
    
    UIImageView *viewClose = [[UIImageView alloc] initWithFrame:CGRectMake(31,36,16,16)];
    if([_iOSSizeMoreStory isEqualToString:@"iPhone6Plus"]){
        self.imageViewClose.image = [UIImage imageNamed:@"back_grew_3x"];
        viewClose.image = [UIImage imageNamed:@"close_grey_@3x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@3x"];
    }else{
        viewClose.image = [UIImage imageNamed:@"close_grey_@2x"];
        self.imageViewClose.image = [UIImage imageNamed:@"back_grew_2x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@2x"];
    }
    [viewLoginBlock addSubview:viewClose];
    
    
    UIButton *buttonCloseLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonCloseLogin addTarget:self action:@selector(buttonMoreStoryLoginCloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonCloseLogin setFrame:CGRectMake(17,18,44,44)];
    //    buttonClose.layer.borderWidth = 1;
    [viewLoginBlock addSubview:buttonCloseLogin];
    _viewProjectMoreStory.hidden = YES;
    
    
    
    _viewButtonsMoreStory = [[UIView alloc] initWithFrame:CGRectMake(0,_iOSBoundsMoreStory.height-44, _iOSBoundsMoreStory.width, 50)];
    
    _viewButtonsMoreStory.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_viewButtonsMoreStory];
    
    
//    UIButton *buttonCancelDid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonCancelDid addTarget:self
//                        action:@selector(buttonCancelWill)
//              forControlEvents:UIControlEventTouchUpInside];
//    
//    [buttonCancelDid setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
////    [buttonCancelDid setTitle:@"<" forState:UIControlStateNormal];
//    
//    buttonCancelDid.frame = CGRectMake(0,0,70,50);
//    
//    [buttonCancelDid setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
//    
//    [_viewButtonsMoreStory addSubview:buttonCancelDid];
    
//    UIImageView *imageViewCancel = [[UIImageView alloc] initWithFrame:CGRectMake(buttonCancelDid.frame.size.width/2 - 11, 11, 15,22)];
//    if([_iOSSizeMoreStory isEqualToString:@"iPhone6Plus"]){
//        imageViewCancel.image = [UIImage imageNamed:@"back_white_3x"];
//    }else{
//        imageViewCancel.image = [UIImage imageNamed:@"back_white_2x"];
//    }
//    
//    [buttonCancelDid addSubview:imageViewCancel];

    
    
    UIButton *buttonJoinDid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonJoinDid addTarget:self
                      action:@selector(buttonJoinWill)
            forControlEvents:UIControlEventTouchUpInside];
    
    [buttonJoinDid setBackgroundColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];
    [buttonJoinDid setTitle:@"加入他们" forState:UIControlStateNormal];
    [buttonJoinDid.titleLabel setFont:[UIFont boldSystemFontOfSize:14.7]];
    buttonJoinDid.frame = CGRectMake(0,0,_viewButtonsMoreStory.frame.size.width,50);
    [buttonJoinDid setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    buttonJoinDid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    buttonJoinDid.contentHorizontalAlignment =UIControlContentHorizontalAlignmentCenter;
    
    [_viewButtonsMoreStory addSubview:buttonJoinDid];
    _viewButtonsMoreStory.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1];
    
//    //分享
//    UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonShare addTarget:self action:@selector(buttonShareWillMoreStory) forControlEvents:UIControlEventTouchUpInside];
//    [buttonShare setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
//    buttonShare.frame = CGRectMake(_viewButtonsMoreStory.frame.size.width -70,0, 70,50);
//    [buttonShare setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]  forState:UIControlStateNormal];
//    [_viewButtonsMoreStory addSubview:buttonShare];
//    
//    UIImageView *imageViewShare = [[UIImageView alloc] initWithFrame:CGRectMake(buttonShare.frame.size.width/2 - 22, 0, 44,44)];
//    if([_iOSSizeMoreStory isEqualToString:@"iPhone6Plus"]){
//                imageViewShare.image = [UIImage imageNamed:@"share_3x"];
//            }else{
//                imageViewShare.image = [UIImage imageNamed:@"share_2x"];
//            }
//    [buttonShare addSubview:imageViewShare];
//    

    
    
    
    [self.webView loadHTMLString:[NSString stringWithFormat:@"%@",self.strContents] baseURL:nil];
}

//-(void)buttonLoginClick:(UIButton*)sender{
//    
//    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
//}
//
//-(void)buttonLoginCloseClick:(UIButton*)sender{
//    
//    
//}
-(void)buttonMoreStoryLoginClick:(UIButton*)sender{
    
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
}
-(void)buttonMoreStoryLoginCloseClick:(UIButton*)sender{
    
    _viewProjectMoreStory.hidden = YES;
    _viewButtonsMoreStory.hidden = NO;
    
}

-(void)segmentedClick:(id)sender{
    UISegmentedControl *control = (UISegmentedControl*)sender;
    
    
    if(control.selectedSegmentIndex == 0){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if(control.selectedSegmentIndex == 1){
        
        [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMoreStory];
        
    }else if(control.selectedSegmentIndex == 2){
        
        
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"JoinSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        JoinProjectTableViewController *controller = (JoinProjectTableViewController*)naVC.topViewController;
        
        controller.aryDataChou = sender;
        controller.projectID = self.strProjectID;
        controller.countDownJoinDate = self.countPayDate;
        controller.dataDate = self.dateEnd;
    }else if([segue.identifier isEqualToString:@"loginSegue"]){
    
        LoginViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(void)buttonCancelWill{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)buttonJoinWill{
    if(_runTimesMoreStory != 1){
        
        _viewProjectMoreStory.hidden = NO;
//        self.scrollView.scrollEnabled = NO;
        _viewButtonsMoreStory.hidden = YES;
    }else{
    
    [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMoreStory];
        
    }
}

//-(void)buttonShareWillMoreStory{
//    
//
//}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)buttonShare:(id)sender {
    
    //        [[ToolClass sharedInstance] showAlert:@"「分享」功能正在开发，稍后上线~"];
    [UMSocialData defaultData].extConfig.wechatSessionData.title = self.strShareTitle;
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5629c5de67e58e4ea8002490"
                                      shareText:self.strShareText
                                     shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.strShareImage]]]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"http://www.huoban.io/project_detail.html?p_id=%@",self.strProjectID];
}

- (IBAction)buttonClose:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
