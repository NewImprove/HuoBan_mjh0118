//
//  MoreDynamicViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/20.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "MoreDynamicViewController.h"
#import "HttpClassSelf.h"
#import "MJRefresh.h"
#import "HomeDynamicImageTableViewCell.h"
#import "ProjectDynamicSelf.h"
#import "ToolClass.h"
#import "DataModel.h"
#import "ImageSameWidth.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "DataModelCellProjectDetailDynamic.h"
#import "JoinProjectTableViewController.h"
#import "LoginViewController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"


@interface MoreDynamicViewController ()

@end

@implementation MoreDynamicViewController
@synthesize tableViewMoreDynamic,buttonCancel,aryChouMordDynameic,strCreatorUserID,countPayDate,dateEnd,strProjectID,strShareText,strShareTitle,strShareImage;
DataModel *_dataMoreDynamicDataModel;
NSString *_iOSMoreDynamic;
HttpClassSelf *_httpClassMoreDynamic;
NSCharacterSet *_subImageMoreDynamic;
CGFloat _floatCellLabelContent;
CGFloat _floatCellImageContent;
NSMutableArray *_aryCellImageHeight;
NSInteger _xibCloseNum;
NSInteger _xibNum;
NSInteger _imageViewWidth;
UIButton *_buttonClose;
NSString *_iOSSizeMoreDynamic;
NSUserDefaults *_userDefaultsImage;
NSMutableArray *_cellData;
NSMutableArray *_resProjectDynamicself;
NSMutableArray *_arrProjectImage;
DataModelCellProjectDetailDynamic *_dataModelCellProjectDynamic;
NSArray *_aryImageMoreDynamic;
CGSize _iOSBoundsDetalisDynamic;
UIView *_viewProjectDetailsDynamic;
UIView *_viewButtonsMoreDynamic;
NSInteger _runTimesMoreDynamic;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataMoreDynamicDataModel = [[DataModel alloc] init];
    
    _iOSMoreDynamic = _dataMoreDynamicDataModel.userInfomation.iOSDeviceSize;
    
//    _aryChouMordDynameic = [[NSMutableArray alloc] init];
    
    self.tableViewMoreDynamic.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _iOSBoundsDetalisDynamic = [UIScreen mainScreen].bounds.size;
    
    _runTimesMoreDynamic  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    
    self.title = @"社群动态";
    
    //登陆视图
    _viewProjectDetailsDynamic = [[UIView alloc] initWithFrame:CGRectMake(0 ,self.tableViewMoreDynamic.contentOffset.y, _iOSBoundsDetalisDynamic.width, _iOSBoundsDetalisDynamic.height)];
    _viewProjectDetailsDynamic.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
    [self.view addSubview:_viewProjectDetailsDynamic];
    
    UIView *viewLoginBlock = [[UIView alloc] initWithFrame:CGRectMake(0,0,78,162)];
    viewLoginBlock.backgroundColor = [UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1];
    viewLoginBlock.clipsToBounds = YES;
    viewLoginBlock.layer.cornerRadius = 12;
    viewLoginBlock.center = _viewProjectDetailsDynamic.center;
    [_viewProjectDetailsDynamic addSubview:viewLoginBlock];
    
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonLogin addTarget:self action:@selector(buttonMoreDynamicLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonLogin.backgroundColor = [UIColor colorWithRed:119.0/255 green:134.0/255 blue:146.0/255 alpha:1];
    [buttonLogin setTitleColor:[UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1]forState:UIControlStateNormal];
    [buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    buttonLogin.clipsToBounds = YES;
    buttonLogin.layer.cornerRadius = 27;
    [buttonLogin setFrame:CGRectMake(12,84,54,54)];
    [viewLoginBlock addSubview:buttonLogin];
    
    UIImageView *viewClose = [[UIImageView alloc] initWithFrame:CGRectMake(31,36,16,16)];
    if([_iOSSizeMoreDynamic isEqualToString:@"iPhone6Plus"]){
        viewClose.image = [UIImage imageNamed:@"close_grey_@3x"];
        self.imageViewClose.image = [UIImage imageNamed:@"back_grew_3x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@3x"];
    }else{
        viewClose.image = [UIImage imageNamed:@"close_grey_@2x"];
        self.imageViewClose.image = [UIImage imageNamed:@"back_grew_2x"];
        self.imageViewShare.image = [UIImage imageNamed:@"share_grew@2x"];
    }
    [viewLoginBlock addSubview:viewClose];
    
    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonClose addTarget:self action:@selector(buttonMoreDynmaicLoginCloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonClose setFrame:CGRectMake(17,18,44,44)];
    //    buttonClose.layer.borderWidth = 1;
    [viewLoginBlock addSubview:buttonClose];
    
    _viewProjectDetailsDynamic.hidden = YES;

    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.7],NSForegroundColorAttributeName : [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1]}];
    
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    NSArray *buttonList = [NSArray arrayWithObjects:@"<",@"加入他们",@"火伴众筹",nil];
    
//    UISegmentedControl *buttonSegmented =[[UISegmentedControl alloc] initWithItems:buttonList];
//    
//    [buttonSegmented setFrame:CGRectMake(0,iOSBounds.height-45, iOSBounds.width, 45)];
//    
//    [buttonSegmented setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
//    buttonSegmented.layer.borderColor =[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1].CGColor;
//    
//    buttonSegmented.clipsToBounds = YES;
//    
//    buttonSegmented.layer.borderWidth = 0;
//    
//    [buttonSegmented setTintColor:[UIColor whiteColor]];
//    
//    //    [[buttonSegmented.subviews objectAtIndex:0] setTintColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1]];
//    
//    [[buttonSegmented.subviews objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1]];
//    
//    buttonSegmented.apportionsSegmentWidthsByContent = NO;
//    
//    //分段按钮控件
//    buttonSegmented.momentary = YES;
//    
//    
//    //分段按钮
//    [buttonSegmented addTarget:self action:@selector(segmentedClick:) forControlEvents:UIControlEventValueChanged];
    
//    [self.view addSubview:buttonSegmented];
    
    
    _viewButtonsMoreDynamic = [[UIView alloc] initWithFrame:CGRectMake(0,_iOSBoundsDetalisDynamic.height-44, _iOSBoundsDetalisDynamic.width, 50)];
    
    _viewButtonsMoreDynamic.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_viewButtonsMoreDynamic];
    
    
//       UIButton *buttonCancelDid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [buttonCancelDid addTarget:self
//                         action:@selector(buttonCancelWill)
//               forControlEvents:UIControlEventTouchUpInside];
//    
//    [buttonCancelDid setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
//    
//    buttonCancelDid.frame = CGRectMake(0,0,70,50);
//    
//    [buttonCancelDid setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    [_viewButtonsMoreDynamic addSubview:buttonCancelDid];
//    
//    UIImageView *imageViewCancel = [[UIImageView alloc] initWithFrame:CGRectMake(buttonCancelDid.frame.size.width/2 - 11, 11, 15,22)];
//    if([_iOSSizeMoreDynamic isEqualToString:@"iPhone6Plus"]){
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
    
    buttonJoinDid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    buttonJoinDid.contentHorizontalAlignment =UIControlContentHorizontalAlignmentCenter;

    
    buttonJoinDid.frame = CGRectMake(0,0,_viewButtonsMoreDynamic.frame.size.width,50);
    
    [buttonJoinDid setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]forState:UIControlStateNormal];
    
    [_viewButtonsMoreDynamic addSubview:buttonJoinDid];
    

//    UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonShare addTarget:self
//                      action:@selector(buttonShareWill)
//            forControlEvents:UIControlEventTouchUpInside];
//    
//    [buttonShare setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
//
//    
//    
//    buttonShare.frame = CGRectMake(_viewButtonsMoreDynamic.frame.size.width - 70,0,70,50);
//    
//    [buttonShare setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
//    
//    [_viewButtonsMoreDynamic addSubview:buttonShare];
//    
//    UIImageView *imageViewShare = [[UIImageView alloc] initWithFrame:CGRectMake(buttonShare.frame.size.width/2 - 22, 0, 44,44)];
//    
//    if([_iOSSizeMoreDynamic isEqualToString:@"iPhone6Plus"]){
//        imageViewShare.image = [UIImage imageNamed:@"share_3x"];
//    }else{
//        imageViewShare.image = [UIImage imageNamed:@"share_2x"];
//    }
//    
//    [buttonShare addSubview:imageViewShare];

    _viewButtonsMoreDynamic.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1];
    
    
    
}

-(void)buttonMoreDynamicLoginClick:(UIButton*)sender{
    
    NSLog(@"点击弹出登陆按钮按钮按钮");
    _viewProjectDetailsDynamic.hidden = YES;
    self.tableViewMoreDynamic.scrollEnabled = YES;
    _viewButtonsMoreDynamic.hidden = NO;
    
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    
}

-(void)buttonMoreDynmaicLoginCloseClick:(UIButton*)sender{
    
    _viewProjectDetailsDynamic.hidden = YES;
    self.tableViewMoreDynamic.scrollEnabled = YES;
    _viewButtonsMoreDynamic.hidden = NO;
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //    _subImageStr = [NSCharacterSet characterSetWithCharactersInString:@"!x"];
    
    _subImageMoreDynamic = [NSCharacterSet characterSetWithCharactersInString:@"!*"];
    
    _httpClassMoreDynamic = [[HttpClassSelf alloc] init];
    
    _arrProjectImage = [[NSMutableArray alloc] init];
    
    
    
    _aryCellImageHeight = [[NSMutableArray alloc] init];
    
    _xibNum = 0;
    _xibCloseNum = 0;
    
    int _numPage = 0;
    int _numNum = 500;
    
    [_httpClassMoreDynamic projectDetailsDynamic:self.strProjectID numPage:_numPage numNum:_numNum token:_dataMoreDynamicDataModel.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        _resProjectDynamicself = [[NSMutableArray alloc] init];
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"打印小动态返回数据%@",dic);
        
        if ([dic[@"status"] isEqualToString:@"success"]) {
            
            for(NSMutableDictionary *resDic in dic[@"data"]){
                [_resProjectDynamicself addObject:resDic];
            }
            
            NSLog(@"%@",_resProjectDynamicself);
            
            [self.tableViewMoreDynamic reloadData];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *error){
       
    [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
        
    }];

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


//-(void)segmentedClick:(id)sender{
//    UISegmentedControl *control = (UISegmentedControl*)sender;
//    
//    if(control.selectedSegmentIndex == 0){
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//        
//    }else if(control.selectedSegmentIndex == 1){
//        
//        [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMordDynameic];
//        
//    }else if(control.selectedSegmentIndex == 2){
//        
//        
//    }
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"打印cell数量%i",(int)[_resProjectDynamicself count]);
    return [_resProjectDynamicself count];
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"打印测试数据%@---打印indexPath%@",_resProjectDynamicself,indexPath);
    NSMutableDictionary *dicCell = _resProjectDynamicself[indexPath.row];
//
//    
//    if (_xibNum == 0) {
//        UINib *nib = [UINib nibWithNibName:@"ProjectDynamicSelf" bundle:nil];
//        [tableView registerNib:nib forCellReuseIdentifier:@"ProjectDynamicSelf"];
//
//        _xibNum = 1;
//        
//    }
    // 3. 从TableView中获取标识符为paperCell的Cell
    ProjectDynamicSelf *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreDynamic"];
    
    //        cell.buttonClose.hidden = YES;
    
    _dataModelCellProjectDynamic = [[DataModelCellProjectDetailDynamic alloc] initWithResJSON:dicCell];
    cell.dataModelDynamic  = _dataModelCellProjectDynamic;
    
    [cell.textContents sizeToFit];
    _floatCellLabelContent = cell.textContents.frame.size.height;
    NSLog(@"文字高度%f",_floatCellLabelContent);
    
    


    if([dicCell[@"image"] isEqualToString:@""] || dicCell[@"image"] == nil){
        
        //    if([strText isEqualToString:@""]){
        
        cell.imageContents.image = nil;
//        [cell.imageContents setFrame:CGRectMake(cell.imageContents.frame.origin.x,cell.imageContents.frame.origin.y,cell.imageContents.frame.size.width,1)];
        _floatCellImageContent = 1;

        cell.imageHeight.constant = 1;
    }else{
        
        NSLog(@"%@",dicCell[@"image"]);
        
        _aryImageMoreDynamic = [dicCell[@"image"] componentsSeparatedByCharactersInSet:_subImageMoreDynamic];
        
//        _aryImageMoreDynamic = [dicCell[@"image"] componentsSeparatedByCharactersInSet:_subImageMoreDynamic];
      
        NSLog(@"%@---%@",_aryImageMoreDynamic[1],_aryImageMoreDynamic[2]);
        
        NSLog(@"%f------%f",[_aryImageMoreDynamic[1] floatValue],[_aryImageMoreDynamic[2] floatValue]);

        [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:dicCell[@"image"]]];

        
        _floatCellImageContent = cell.imageContents.frame.size.width/([_aryImageMoreDynamic[1] floatValue]/[_aryImageMoreDynamic[2] floatValue]);
        
        NSLog(@"--%f",_floatCellImageContent);
        
//        cell.imageContents.bounds = CGRectMake(0, 0, [_aryImageMoreDynamic[1] floatValue], [_aryImageMoreDynamic[2] floatValue]);;
        cell.imageHeight.constant = _floatCellImageContent;

        
    }
    return  cell;
}


//调整界面
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

//        NSLog(@"%f--%f",_floatCellLabelContent,_floatCellImageContent);
//    
//    NSLog(@"Cell高%f",_floatCellLabelContent + _floatCellImageContent + 87);
    
//    if(_floatCellImageContent == 1 ){
    return _floatCellLabelContent + _floatCellImageContent + 100;//120
    
//    }else{
//
//    return _floatCellLabelContent + _floatCellImageContent + 150;//120
//    }
    

    

    //    return 500;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)buttonCancel:(id)sender {
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

//-(void)buttonCancelWill{
//    
//   
//}

-(void)buttonJoinWill{
    
    if(_runTimesMoreDynamic != 1){
        
        _viewProjectDetailsDynamic.hidden = NO;
        self.tableViewMoreDynamic.scrollEnabled = NO;
        _viewButtonsMoreDynamic.hidden = YES;
        
        
    }else{
    
    [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMordDynameic];
        
    }
    
}

-(void)buttonShareWill{
    


    
}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonClose:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
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
