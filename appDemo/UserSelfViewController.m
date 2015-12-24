//
//  MineMessageViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "UserSelfViewController.h"


@interface UserSelfViewController ()

@end

@implementation UserSelfViewController
@synthesize topImagePreson,topTextDynamic,topTextPreson,projectModelUser,userInFomacionUser,midAScrollView,midBScrollView,selfID,delegate,buttonSetting,imageSettingUseSelf,imageSetting;

HttpClassSelf *_httpClassUser;

NSMutableArray *_aryFocus;

NSMutableArray *_aryCreator;

NSMutableArray *_aryOrder;

NSMutableDictionary *_resUserSelfDic;

int _countFocus;
int _countCreator;
int _countJoin;
int _countMidAImage;
int _countMidBImage;
int _countDownImage;
int _labelMoenySize;

CGFloat _HeightmidA;
CGFloat _HeightmidB;
CGFloat _HeightDown;

CGSize _sizemidA;
CGSize _sizemidB;
CGSize _sizeDown;

CGSize _labelTitle;

DataModel *_dataModelUserSelf;

NSString *_userid;
NSString *_tokenid;
NSString *_iOSSizeUser;

NSInteger _runtimesUser;
UIView *_topView;

bool isReturnTM;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //
    
    CGSize iOSBound = [UIScreen mainScreen].bounds.size;
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,iOSBound.width,20)];
    _topView.backgroundColor = [UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1];
    [self.tableView addSubview:_topView];
    
// [self.buttonMessageSetting setImage:[UIImage imageNamed:@"editMyMessage"] forState:UIControlStateNormal];
    

    
//    if(_runtimesUser != 1){
//        
//        AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
//        [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
//        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
//        return;
//    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
     _topView.frame = CGRectMake(_topView.frame.origin.x, self.tableView.contentOffset.y , _topView.frame.size.width, _topView.frame.size.height);
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"%@",userInFomacionUser);
    
        _runtimesUser  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    

    
    
    if(_runtimesUser != 1){
        
//        AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
//        [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        return;
        
    }else{
    
    _resUserSelfDic = [[NSMutableDictionary alloc] init];
    _aryCreator = [[NSMutableArray alloc] init];
    _aryFocus = [[NSMutableArray alloc] init];
    _aryOrder = [[NSMutableArray alloc] init];
    _dataModelUserSelf = [[DataModel alloc] init];
    _httpClassUser = [[HttpClassSelf alloc]init];
    _iOSSizeUser = _dataModelUserSelf.userInfomation.iOSDeviceSize;
    
    if([_iOSSizeUser isEqualToString:@"iPhone6Plus"]){
        
//        [self.buttonSetting setImage:[[UIImage imageNamed:@"setting@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        imageSetting.image = [UIImage imageNamed:@"setting@3x"];
        
        self.imageSettingUseSelf.image = [UIImage imageNamed:@"user_edit_3x"];
    }else{
        
//        [self.buttonSetting setImage:[[UIImage imageNamed:@"setting@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        imageSetting.image = [UIImage imageNamed:@"setting@2x"];      
        self.imageSettingUseSelf.image = [UIImage imageNamed:@"user_edit_2x"];
    }
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.selfID = YES;
    
    if(self.selfID == YES){
        _userid     = _dataModelUserSelf.userInfomation.UserID;
        _tokenid    = _dataModelUserSelf.userInfomation.tokenID;
    }
    
    self.topImagePreson.clipsToBounds = YES;
    self.topImagePreson.layer.cornerRadius = 36;
    
    //编辑突突突突
    
    [self.buttonMessageSetting setImage:[UIImage imageNamed:@"editMyMessage12@1x"] forState:UIControlStateNormal];
    
    [super viewWillAppear:animated];

    [_httpClassUser CheckUserSelfSetUser:_userid token:_tokenid CallBackYES:^(MKNetworkOperation *operatioin){
        
        _countMidAImage = 0;
        _countMidBImage = 0;
        _countDownImage = 0;
        
        _HeightmidA = 3;
        _HeightmidB = 3;
        _HeightDown = 3;
        
//        _sizemidA = CGSizeMake(0,self.midAScrollView.frame.size.height);
//        
//        self.midAScrollView.contentSize = _sizemidA;
//        
//        _sizemidB = CGSizeMake(0,self.midBScrollView.frame.size.height);
//        
//        self.midBScrollView.contentSize = _sizemidB;
//        
//        _sizeDown = CGSizeMake(0,self.downScrollView.frame.size.height);
//        
//        self.downScrollView.contentSize = _sizeDown;
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *resdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resdic[@"status"] isEqualToString:@"success"]){
            
            _resUserSelfDic = resdic[@"data"];
            
            [self reloadUserSetting:_resUserSelfDic];
            
            //TOP
            NSMutableDictionary *dicTOPUser = _resUserSelfDic[@"feed"];
            
            self.topTextDynamic.text = [NSString stringWithFormat:@"%lu条动态",[dicTOPUser[@"count"] longValue]];
            
            
            //midA
            
            NSMutableDictionary *dicMidFocus = _resUserSelfDic[@"focus"];
            
            NSMutableArray *midAAryImage = [[NSMutableArray alloc] init];
            
            //            for(NSMutableDictionary *dic in dicMidFocus[@"projects"]){
         
            for (UIImageView *imageView in self.midAScrollView.subviews) {
                [imageView removeFromSuperview];
                [midAAryImage removeAllObjects];
            }

            NSLog(@"%lu",[dicMidFocus[@"projects"] count]);
            for(int i = 0;i < [dicMidFocus[@"projects"] count];i++){
                NSMutableDictionary *dicMidA = dicMidFocus[@"projects"][i];
                
                if(i == 0){
                    _countMidAImage = 0;
                }
                
                [midAAryImage removeAllObjects];
                
                 UIImageView *FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_countMidAImage, 6, 144,144)];
                
                //little_image
                for(NSString *strImage in dicMidA[@"images"]){
                    [midAAryImage addObject:strImage];
                }
                if([_iOSSizeUser isEqualToString:@"iPhonePlus"]){
//                    [FocusImageView sd_setImageWithURL:midAAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
                    
                    [FocusImageView sd_setImageWithURL:dicMidA[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
                }else{
//                    [FocusImageView sd_setImageWithURL:midAAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];
                    
                     [FocusImageView sd_setImageWithURL:dicMidA[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];
                }
                
                [self.midAScrollView addSubview:FocusImageView];
                
                
                
                FocusImageView.clipsToBounds = YES;
                FocusImageView.layer.cornerRadius = 5;
                FocusImageView.userInteractionEnabled = YES;
                FocusImageView.tag = i;
                FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(midAImageClick:)];
                
                [FocusImageView addGestureRecognizer:tap];
                
                _countMidAImage += 150;
                
                _HeightmidA += 150;
                
            }
//            
            UIImageView *addProjectImageA = [[UIImageView alloc] initWithFrame:CGRectMake(_countMidAImage,6, 144,144)];
            
            if([_iOSSizeUser isEqualToString:@"iPhone6Plus"]){
                
                addProjectImageA.image = [UIImage imageNamed:@"addProjectICON@3x"];
            }else{
                
                addProjectImageA.image = [UIImage imageNamed:@"addProjectICON@2x"];
            }
            
//            addProjectImageA.layer.borderColor = [UIColor greenColor].CGColor;
//            addProjectImageA.layer.borderWidth = 1;
            
            UITapGestureRecognizer *tapFocus = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(joinAndFocusProjectClick:)];
            [addProjectImageA addGestureRecognizer:tapFocus];
            
            addProjectImageA.clipsToBounds = YES;
            addProjectImageA.layer.cornerRadius = 5;
            addProjectImageA.userInteractionEnabled = YES;
            addProjectImageA.contentMode = UIViewContentModeScaleAspectFill;
            [self.midAScrollView addSubview:addProjectImageA];
            
            _countMidAImage += 150;
            
            _HeightmidA += 150;
            
            //midB
            NSMutableDictionary *dicMidBJoin = _resUserSelfDic[@"orders"];
            NSMutableArray *midBAryImage = [[NSMutableArray alloc] init];
            
            //            for(NSMutableDictionary *dic in dicMidBJoin[@"projects"]){
            
            for (UIImageView *imageView in self.midBScrollView.subviews) {
                [imageView removeFromSuperview];
                [midBAryImage removeAllObjects];
            }

            for(int i =0;i < [dicMidBJoin[@"projects"] count];i++){
                
                NSMutableDictionary *dicMidB = dicMidBJoin[@"projects"][i];
                
                if(i == 0){
                    _countMidBImage = 0;
                    _labelMoenySize = 45;
        
                }
                
                [midBAryImage removeAllObjects];
                
                UIImageView *joinImage = [[UIImageView alloc] initWithFrame:CGRectMake(_countMidBImage,6, 144,144)];
                
                for(NSString *strImage in  dicMidB[@"images"]){
                    
                    [midBAryImage addObject:strImage];
                }
                
//                payMoneyCount += [dicMidB[@"money"] longValue];
                
                if([_iOSSizeUser isEqualToString:@"iPhonePlus"]){
//                    [joinImage sd_setImageWithURL:midBAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
//                    
                    
                     [joinImage sd_setImageWithURL:dicMidB[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
                }else{
//                    [joinImage sd_setImageWithURL:midBAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];
                    
                    [joinImage sd_setImageWithURL:dicMidB[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];

                }
                
                
                [self.midBScrollView addSubview:joinImage];
                
                joinImage.clipsToBounds = YES;
                
                joinImage.layer.cornerRadius = 5;
                
                joinImage.userInteractionEnabled = YES;
                joinImage.tag = i;
                joinImage.contentMode = UIViewContentModeScaleAspectFill;
                
                
                UILabel *labelTitleB = [[UILabel alloc] initWithFrame:CGRectMake(0, joinImage.layer.frame.size.height -19,joinImage.frame.size.width,9)];

                labelTitleB.text = dicMidB[@"title"];
                labelTitleB.font = [UIFont systemFontOfSize:9];
                labelTitleB.textColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
                labelTitleB.textAlignment = NSTextAlignmentCenter;
//                labelTitleB.layer.borderWidth = 1;
//                labelTitleB.layer.borderColor = [UIColor yellowColor].CGColor;
                
                [joinImage addSubview:labelTitleB];
                
                
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(midBImageClick:)];
                
                [joinImage addGestureRecognizer:tap];
                
                UILabel *labelMoney = [[UILabel alloc] initWithFrame:CGRectMake(_countMidBImage,150,144,20)];
                
//                labelMoney.layer.borderWidth = 2;
                
                labelMoney.text = [NSString stringWithFormat:@"已支持 %lu元",[dicMidB[@"money"] longValue]];
                
                labelMoney.font = [UIFont systemFontOfSize:9];
                
                labelMoney.textAlignment = NSTextAlignmentCenter;
                
                labelMoney.textColor = [UIColor colorWithRed:119.0/255 green:119.0/255 blue:119.0/255 alpha:1];
                [self.midBScrollView addSubview:labelMoney];
                
                _countMidBImage += 150;
                
                _HeightmidB += 150;
                
                _labelMoenySize += 150;
                
                
                
            }
//            _countMidBImage ;
//            _HeightmidB += 150;
            
            UIImageView *addProjectImageB = [[UIImageView alloc] initWithFrame:CGRectMake(_countMidBImage,6, 144,144)];
            
            
            if([_iOSSizeUser isEqualToString:@"iPhone6Plus"]){
                
                addProjectImageB.image = [UIImage imageNamed:@"addProjectICON@3x"];
            }else{
                
                addProjectImageB.image = [UIImage imageNamed:@"addProjectICON@2x"];
            }
            
            
            
            UITapGestureRecognizer *tapJoin = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(joinAndFocusProjectClick:)];
            [addProjectImageB addGestureRecognizer:tapJoin];
            
            addProjectImageB.clipsToBounds = YES;
            addProjectImageB.layer.cornerRadius = 5;
            addProjectImageB.userInteractionEnabled = YES;
            addProjectImageB.contentMode = UIViewContentModeScaleAspectFill;
            [self.midBScrollView addSubview:addProjectImageB];
            
//            addProjectImageB.layer.borderColor = [UIColor purpleColor].CGColor;
//            addProjectImageB.layer.borderWidth = 1;
            
            _countMidBImage += 150;
            
            _HeightmidB += 150;
            
            
           
            
            
            //down
            NSMutableDictionary *dicDownCreator = _resUserSelfDic[@"creator"];
            
            NSMutableArray *downAryImage = [[NSMutableArray alloc] init];
            
            
            for (UIImageView *imageView in self.downScrollView.subviews) {
                [imageView removeFromSuperview];
                [downAryImage removeAllObjects];
            }
            
            for(int i = 0;i < [dicDownCreator[@"projects"] count];i++){
             
                
                if(i == 0){
                 _countDownImage = 0;
                }
                
                
                NSMutableDictionary *dicDowm = dicDownCreator[@"projects"][i];
                
                [downAryImage removeAllObjects];
                
                UIImageView *creatorImage = [[UIImageView alloc] initWithFrame:CGRectMake(_countDownImage,6,144,144)];
                
                for(NSString *strImage in dicDowm[@"images"]){
                    [downAryImage addObject:strImage];
                }
                
                if([_iOSSizeUser isEqualToString:@"iPhonePlus"]){
//                    [creatorImage sd_setImageWithURL:downAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
                    
                    [creatorImage sd_setImageWithURL:dicDowm[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@3x"]];
                }else{
//                    [creatorImage sd_setImageWithURL:downAryImage[0] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];
                    [creatorImage sd_setImageWithURL:dicDowm[@"little_image"] placeholderImage:[UIImage imageNamed:@"logo1*1*160@2x"]];
                }
                //                creatorImage.image = [ImageSameWidth imageCompressForWidth:downImage targetWidth:320];
                
                [self.downScrollView addSubview:creatorImage];
                
                creatorImage.clipsToBounds = YES;
                creatorImage.layer.cornerRadius = 5;
                
                creatorImage.userInteractionEnabled = YES;
                creatorImage.tag = i;
                creatorImage.contentMode = UIViewContentModeScaleAspectFill;
                
//                creatorImage.layer.borderColor = [UIColor redColor].CGColor;
//                creatorImage.layer.borderWidth = 1;
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downImageClick:)];
                [creatorImage addGestureRecognizer:tap];
                
                _countDownImage += 150;
                
                _HeightDown += 150;
                
            }
            UIImageView *addProjectImageDown = [[UIImageView alloc] initWithFrame:CGRectMake(_countDownImage,6, 144,144)];
//            addProjectImageDown.image = [UIImage imageNamed:@"addProjectIcon144@2x"];
            
            if([_iOSSizeUser isEqualToString:@"iPhone6Plus"]){
                
                        addProjectImageDown.image = [UIImage imageNamed:@"addProjectICON@3x"];
            }else{
                
             addProjectImageDown.image = [UIImage imageNamed:@"addProjectICON@2x"];
            }
            
            addProjectImageDown.clipsToBounds = YES;
            addProjectImageDown.layer.cornerRadius = 5;
            addProjectImageDown.userInteractionEnabled = YES;
            addProjectImageDown.contentMode = UIViewContentModeScaleAspectFill;
            [self.downScrollView addSubview:addProjectImageDown];
            
//            addProjectImageDown.layer.borderColor = [UIColor yellowColor].CGColor;
//            addProjectImageDown.layer.borderWidth = 1;
            
            UITapGestureRecognizer *tapCreate = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addProjectClick:)];
            [addProjectImageDown addGestureRecognizer:tapCreate];
            _countDownImage += 150;
            
            _HeightDown += 150;
            
            NSLog(@"%i---%i---%i",_countMidBImage,_countMidBImage,_countDownImage);
            _sizemidA = CGSizeMake(_countMidAImage,self.midAScrollView.frame.size.height);
            self.midAScrollView.contentSize = _sizemidA;
            self.midAScrollView.delegate = self;
            
            
            NSLog(@"%f",self.midBScrollView.frame.size.height);
            _sizemidB = CGSizeMake(_countMidBImage,self.midBScrollView.frame.size.height);
            self.midBScrollView.contentSize = _sizemidB;
            self.midBScrollView.delegate = self;
            NSLog(@"%f",self.downScrollView.frame.size.height);
            
            
            _sizeDown = CGSizeMake(_countDownImage,self.downScrollView.frame.size.height);
            self.downScrollView.contentSize = _sizeDown;
        }else{
            
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
    }];

        
    }
}

//-(void)viewDidAppear:(BOOL)animated{
//    
//    [super viewDidAppear:animated];    
//}

-(void)reloadUserSetting:(NSMutableDictionary*)dicUser{
    
    NSMutableDictionary *dicPOST = dicUser[@"post"];

    _dataModelUserSelf = [[DataModel alloc] init];
    
    //地址
//    _dataModelUserSelf.userInfomation.add = dicUser[@"address"];
    //地址
    _dataModelUserSelf.userInfomation.add = dicPOST[@"address"];
    
    //取消签名
//    _dataModelUserSelf.userInfomation.sign = dicUser[@"sign"];
    
    //简介
    _dataModelUserSelf.userInfomation.contents = dicUser[@"desc"];
    
    //性别
    _dataModelUserSelf.userInfomation.sex = [NSString stringWithFormat:@"%ld",[dicUser[@"sex"] longValue]];

    //姓名
    self.topTextPreson.text = dicUser[@"name"];
    
    _dataModelUserSelf.userInfomation.Name = dicUser[@"name"];
    
    
    _dataModelUserSelf.userInfomation.ImagePreson = dicUser[@"image"];
    //头像
    [self.topImagePreson  sd_setImageWithURL:[NSURL URLWithString:dicUser[@"image"]] placeholderImage:nil];
    
    [_dataModelUserSelf saveUserInfomation];
}

-(void)midAImageClick:(UITapGestureRecognizer *)sender{
//    NSLog(@"midA图片触发%li",sender.view.tag );
    
    NSMutableDictionary *dicFocus = _resUserSelfDic[@"focus"];
    NSMutableDictionary *dicFocusProjects = dicFocus[@"projects"][sender.view.tag];
    
    NSLog(@"%@",dicFocusProjects[@"_id"]);
    
    [self performSegueWithIdentifier:@"PushProject" sender:dicFocusProjects[@"_id"]];
    
    
}
-(void)midBImageClick:(UITapGestureRecognizer*)sender{
//    NSLog(@"midB图片触发%ld",sender.view.tag);
    
    NSMutableDictionary *dicJoin = _resUserSelfDic[@"orders"];
    
    NSMutableDictionary *dicJoinProjects = dicJoin[@"projects"][sender.view.tag];
    
    [self performSegueWithIdentifier:@"PushProject" sender:dicJoinProjects[@"_id"]];
}
-(void)downImageClick:(UITapGestureRecognizer*)sender{
//    NSLog(@"down图片触发%ld",sender.view.tag);
    
      NSMutableDictionary *dicCreator = _resUserSelfDic[@"creator"];
    
    NSMutableDictionary *dicCreatorProjects = dicCreator[@"projects"][sender.view.tag];
    
    [self performSegueWithIdentifier:@"PushProject" sender:dicCreatorProjects[@"_id"]];
    
}
//
-(void)joinAndFocusProjectClick:(UITapGestureRecognizer*)sender{
    
    AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
    [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
    
}

-(void)addProjectClick:(UITapGestureRecognizer*)sender{
    //    NSLog(@"down图片触发%ld",sender.view.tag);
    
    [self performSegueWithIdentifier:@"NewProjectSegue" sender:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"PushProject"]){
        
        ProjectDetailsViewController *controller = (ProjectDetailsViewController*)segue.destinationViewController;

        NSLog(@"打印传递projectID%@",sender);

        
        controller.strProjectID = sender;
    }else if([segue.identifier isEqualToString:@"MessageSettingSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        UserMessageViewController *controller = (UserMessageViewController*)naVC.topViewController;
        
        controller.dicUserMessage = sender;
        
    }else if([segue.identifier isEqualToString:@"loginSegue"]){
        
        LoginViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        
    }else if([segue.identifier isEqualToString:@"appSettingSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        
        
        AppSettingViewController *controller = (AppSettingViewController*)naVC.topViewController;
        
        controller.delegate = self;
        
    }
}


- (IBAction)buttonSetting:(id)sender {
    [self performSegueWithIdentifier:@"appSettingSegue" sender:nil];
}


- (IBAction)buttonMessageSetting:(id)sender {
        [self performSegueWithIdentifier:@"MessageSettingSegue" sender:_resUserSelfDic];
}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
    [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
    
}

-(void)appSettingViewControllerCancelLogin:(AppSettingViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
    [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:0];
    
}

@end
