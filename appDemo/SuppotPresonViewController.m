//
//  SuppotPresonViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/11/3.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "SuppotPresonViewController.h"
#import "DataModel.h"
#import "OtherUserInfoViewController.h"
#import "UIImageView+WebCache.h"




@interface SuppotPresonViewController ()

@end

@implementation SuppotPresonViewController
@synthesize dicChou,dicCreator,scrollViewHuoban,imageClose,imageViewShare,buttonShare,strProjectID,strShareText,strShareTitle,strShareImage;

DataModel *_dataModelHuoban;
NSString *_iOSHuoban;
NSInteger focusYYY;
NSMutableArray *_aryChouList;
NSMutableArray *_aryCreatorList;
UIView *_viewJoin;
CGSize _iOSAllPresonBound;
UIView *_viewProjectAllPreson;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    
    //    导航栏左侧Item
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName :[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]} forState:UIControlStateNormal];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];

    self.scrollViewHuoban.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
    _dataModelHuoban = [[DataModel alloc] init];
    
    _iOSHuoban = _dataModelHuoban.userInfomation.iOSDeviceSize;
    
    _iOSAllPresonBound = [UIScreen mainScreen].bounds.size;

    if([_iOSHuoban isEqualToString:@"iPhone6Plus"]){
        
        self.imageClose.image = [UIImage imageNamed:@"back_white_3x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@3x"];
        
    }else{
        self.imageClose.image = [UIImage imageNamed:@"back_white_2x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@2x"];
    }
    
    
    _aryCreatorList = [[NSMutableArray alloc] init];
    _aryChouList = [[NSMutableArray alloc] init];
    
    //登陆视图
//    _viewProjectAllPreson = [[UIView alloc] initWithFrame:CGRectMake(0 ,self.scrollViewHuoban.contentOffset.y, _iOSAllPresonBound.width, _iOSAllPresonBound.height)];
//    _viewProjectAllPreson.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
//    [self.view addSubview:_viewProjectAllPreson];
    
//    UIView *viewLoginBlock = [[UIView alloc] initWithFrame:CGRectMake(0,0,78,162)];
//    viewLoginBlock.backgroundColor = [UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1];
//    viewLoginBlock.clipsToBounds = YES;
//    viewLoginBlock.layer.cornerRadius = 12;
//    viewLoginBlock.center = _viewProjectAllPreson.center;
//    [_viewProjectAllPreson addSubview:viewLoginBlock];
    
//    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonLogin addTarget:self action:@selector(buttonAllPreosnDynamicClick:) forControlEvents:UIControlEventTouchUpInside];
//    buttonLogin.backgroundColor = [UIColor colorWithRed:119.0/255 green:134.0/255 blue:146.0/255 alpha:1];
//    [buttonLogin setTitleColor:[UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1]forState:UIControlStateNormal];
//    [buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
//    buttonLogin.clipsToBounds = YES;
//    buttonLogin.layer.cornerRadius = 27;
//    [buttonLogin setFrame:CGRectMake(12,84,54,54)];
//    [viewLoginBlock addSubview:buttonLogin];
//    
//    UIImageView *viewClose = [[UIImageView alloc] initWithFrame:CGRectMake(31,36,16,16)];
//
//    

//    [viewLoginBlock addSubview:viewClose];
//    
//    
//    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonClose addTarget:self action:@selector(buttonMoreDynmaicLoginCloseClick:) forControlEvents:UIControlEventTouchUpInside];
//    [buttonClose setFrame:CGRectMake(17,18,44,44)];
//    //    buttonClose.layer.borderWidth = 1;
//    [viewLoginBlock addSubview:buttonClose];
//    
//    _viewProjectAllPreson.hidden = YES;
    

    //低栏「加入他们」
    _viewJoin = [[UIView alloc] initWithFrame:CGRectMake(0,_iOSAllPresonBound.height - 50,_iOSAllPresonBound.width, 50)];
    [self.view addSubview:_viewJoin];
    
    UIButton *buttonJoin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonJoin addTarget:self action:@selector(buttonJoinWillAllPreson) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonJoin setBackgroundColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];

    [buttonJoin setTitle:@"加入他们" forState:UIControlStateNormal];
    
    buttonJoin.titleLabel.font = [UIFont boldSystemFontOfSize:14.7];
    
    buttonJoin.frame = CGRectMake(0, 0,_viewJoin.frame.size.width,50);
 
    [buttonJoin setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]  forState:UIControlStateNormal];
    
    [_viewJoin addSubview:buttonJoin];
    
//    UILabel *labelJoin = [[UILabel alloc] init];
//    labelJoin.textColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
//    labelJoin.text = @"加入他们";
//    [buttonJoin addSubview:labelJoin];
//    
    
    NSInteger focusXXX  = 18;
    focusYYY = -50;
    
    self.title = [NSString stringWithFormat:@"本项目的火伴 %lu",[self.dicChou[@"users"] count]];
    
    //用户头像
    NSMutableArray *dicChouItem = self.dicChou[@"users"];
    
    NSLog(@"%lu",[self.dicChou[@"users"] count]);
    
        for(int i =0;i < [self.dicChou[@"users"] count];i++){
        
            if([_iOSHuoban isEqualToString:@"iPhone6Plus"] || [_iOSHuoban isEqualToString:@"iPhone6"]){
                if(i != 0 && i%5 == 0 ){
                    focusXXX = 18;
                    focusYYY += 98;
                }
            }else{
                if( i != 0 && i%4 == 0 ){
                    focusXXX = 18;
                    focusYYY += 98;
                }
            }
            [_aryChouList addObject:dicChouItem[i]];
            
            UIImageView *focusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(focusXXX, focusYYY, 65,65)];
            
            //网络加载
//            focusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicChouItem[i][@"image"]]]];
            [focusImageView sd_setImageWithURL:dicChouItem[i][@"image"] placeholderImage:nil];
            focusImageView.clipsToBounds = YES;
            focusImageView.layer.cornerRadius = 32.5;
            focusImageView.userInteractionEnabled = YES;
            focusImageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.scrollViewHuoban addSubview:focusImageView];
            
            UITapGestureRecognizer *imageFocusTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonImagePresonClick:)];
            [focusImageView addGestureRecognizer:imageFocusTap];
            focusImageView.tag = i;
            
            UILabel *labelFocusName = [[UILabel alloc] initWithFrame:CGRectMake(focusXXX, focusYYY + 71,65,12)];
            labelFocusName.text = dicChouItem[i][@"name"];
            labelFocusName.font = [UIFont systemFontOfSize:12];
            labelFocusName.textColor = [UIColor colorWithRed:47.0/255 green:47.0/255 blue:47.0/255 alpha:1];
            labelFocusName.clipsToBounds = YES;
            labelFocusName.textAlignment = NSTextAlignmentCenter;
            [self.scrollViewHuoban addSubview:labelFocusName];
            
            if([_iOSHuoban isEqualToString:@"iPhone6Plus"] ){
                focusXXX  += 71;
            }else if([_iOSHuoban isEqualToString:@"iPhone6"]){
                focusXXX  += 71;
            }else{
                focusXXX  += 75;
            }
        }
    
    
}

-(void)buttonJoinWillAllPreson{
    
    
//    if(_runTimesMoreDynamic != 1){
//        
//        _viewProjectDetailsDynamic.hidden = NO;
//        self.tableViewMoreDynamic.scrollEnabled = NO;
//        _viewButtonsMoreDynamic.hidden = YES;
//        
//        
//    }else{
//        
//        [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMordDynameic];
//        
//    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.scrollViewHuoban.contentSize = CGSizeMake(self.scrollViewHuoban.frame.size.width,focusYYY + 130);
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"OtherUserSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        NSLog(@"打印打印他人信息%@",sender);
        
        controller.dicOtherUser = sender;
        
    }
    
}

- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)buttonImagePresonClick:(UITapGestureRecognizer*)sender{
    
//    N%dSLog(@"点击了头像Image--弹出「他人信息」界面%lu",sender.view.tag);
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:_aryChouList[sender.view.tag]];
}

-(void)buttonCreatorImagePresonClick:(UITapGestureRecognizer*)sender{
    
    //    N%dSLog(@"点击了头像Image--弹出「他人信息」界面%lu",sender.view.tag);
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:_aryCreatorList[sender.view.tag]];
}

- (IBAction)buttonShare:(id)sender {
    
    [UMSocialData defaultData].extConfig.wechatSessionData.title = self.strShareTitle;
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5629c5de67e58e4ea8002490"
                                      shareText:self.strShareText
                                     shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.strShareImage]]]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"http://www.huoban.io/project_detail.html?p_id=%@",self.strProjectID];
}
@end
