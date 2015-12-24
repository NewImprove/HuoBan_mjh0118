//
//  ProjectMessageViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.

#import "ProjectDetailsViewController.h"
#import "ProjectDynamicTableViewController.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "ProjectModel.h"
#import "ProjectDynamicSelfTableViewController.h"
#import "ProjectMoreStoryViewController.h"
#import "ProjectDetailsShare.h"
#import "DataModel.h"
#import "JoinProjectTableViewController.h"
#import "ImageSameWidth.h" 
#import "ALMoviePlayerController.h"
#import "MoreDynamicViewController.h"
#import "SuppotPresonViewController.h"
#import "PayForProjectTableViewController.h"
#import "OtherUserInfoViewController.h"

@interface ProjectDetailsViewController ()

@end


NSDate *_DetailsDate;

@implementation ProjectDetailsViewController


ProjectDetailsShare *_shareView;

NSString *_strHTMLContents;

DataModel *_dataModelProjectDyanmic;
NSMutableArray *_aryLoveButtons;

NSMutableArray *_aryChou;


NSInteger  HeightHeight;
bool _seleted;

CGFloat _heightVideo;
CGFloat _widthVideo;

HttpClassSelf *_httpClassProjectDynamic;

NSString *_iOSSizeDetails;

CGFloat _heightTextContents;

NSDateFormatter *_dateFormatterDetails;

NSInteger _imageLineWidth;
NSInteger _viewTimeLineDown;

NSMutableArray *_dicCreateDetail;
NSMutableDictionary *_dicFocusDetail;
NSMutableArray *_aryPayView;
NSInteger _runtimesDetails;

float _floatPercentage;

CGSize _iOSDeviceDetails;

float _floatScorllHeight;

NSInteger _countDownData;

CGSize  _iOSBoundsDetalis;

UIView *_viewProjectDetails;
UIView *_viewButtons;


UIImageView *_CreatorImageView;
UIImageView *_FocusImageView;
UILabel *_labelFocus;
UIView *_viewChou;
UILabel *_labelTitleChouView;
UILabel *_labelContentsChouView;
UILabel *_labelSendTimeChouView;
UILabel *_labelPresonCountChouView;
UIButton *_buttonPay;
NSInteger _viewChouYYY;

NSString *_strShareText;
NSString *_strShareTitle;
NSString *_strShareImage;
NSString *_strProjectID;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.buttonMoreStory.enabled = YES;
//    self.buttonMoreDynamic.enabled = YES;
//    self.buttonCollect.enabled = YES;
    
    [self addNotification];
    
    
    //更改上方导航栏-背景-文字颜色
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1]];
//    
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    _dataModelProjectDyanmic = [[DataModel alloc] init];
    
    _iOSSizeDetails = _dataModelProjectDyanmic.userInfomation.iOSDeviceSize;
    
    _dateFormatterDetails = [[NSDateFormatter alloc] init];
    
    [_dateFormatterDetails setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
        _aryPayView = [[NSMutableArray alloc] initWithCapacity:20];
    
    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
        
        _widthVideo = 414;
        _heightVideo = 233;
        self.titleTOP.constant = 250;
        
        _imageLineWidth = 393.5;
        
        self.imageAdd.image = [UIImage imageNamed:@"tag@3x"];
        self.imageType.image = [UIImage imageNamed:@"add@3x"];
        
//        self.textTitle.font = [UIFont systemFontOfSize:20];
//        self.textSummarize.font = [UIFont systemFontOfSize:15];
//        self.textContents.font = [UIFont systemFontOfSize:15];
//        self.textPercentage.font = [UIFont systemFontOfSize:13];
//        self.textFactMoney.font = [UIFont systemFontOfSize:13];
//        self.textWantedMoney.font = [UIFont systemFontOfSize:13];
//        self.buttonMoreStoryWidth.constant = 65;
//        self.buttonMoryStoryHeight.constant = 80;
////        self.buttonMoreStory.titleLabel.font =[UIFont systemFontOfSize:14];
//        self.buttonMoreDynamicHeight.constant = 80;
//        self.buttonMoreDynamicWidth.constant = 65;
////        self.buttonMoreDynamic.titleLabel.font =[UIFont systemFontOfSize:14];
//        self.progressHeight.constant = 8;
        
    }else if([_iOSSizeDetails isEqualToString:@"iPhone6"]){
        _widthVideo = 375;
        _heightVideo = 211;
        _imageLineWidth = 362.5;
        self.titleTOP.constant = 230;
        self.imageAdd.image = [UIImage imageNamed:@"tag@2x"];
        self.imageType.image = [UIImage imageNamed:@"add@2x"];
        
//        self.textSummarize.font = [UIFont systemFontOfSize:13];
//        self.textContents.font = [UIFont systemFontOfSize:13];
        
//        self.buttonMoreStoryWidth.constant = 65;
//        self.buttonMoryStoryHeight.constant = 75;
////        self.buttonMoreStory.titleLabel.font =[UIFont systemFontOfSize:13];
//        
//        self.buttonMoreDynamicHeight.constant = 75;
//        self.buttonMoreDynamicWidth.constant = 65;
////        self.buttonMoreDynamic.titleLabel.font =[UIFont systemFontOfSize:13];
        
//        self.progressHeight.constant = 7.5;
    }else if([_iOSSizeDetails isEqualToString:@"iPhone5"]){
        
        _widthVideo = 320;
        _heightVideo = 185;
        _imageLineWidth = 307.5;
        self.titleTOP.constant = 200;
        self.imageAdd.image = [UIImage imageNamed:@"tag@2x"];
        self.imageType.image = [UIImage imageNamed:@"add@2x"];
        
//        self.textSummarize.font = [UIFont systemFontOfSize:12];
//        self.textContents.font = [UIFont systemFontOfSize:12];
        
//        self.buttonMoreStoryWidth.constant = 60;
//        self.buttonMoryStoryHeight.constant = 70;
//        self.buttonMoreStory.titleLabel.font =[UIFont systemFontOfSize:11];
        
        
//        self.buttonMoreDynamicHeight.constant = 70;
//        self.buttonMoreDynamicWidth.constant = 60;
//        self.buttonMoreDynamic.titleLabel.font =[UIFont systemFontOfSize:11];
        
//        self.progressHeight.constant = 7;
    }else if([_iOSSizeDetails isEqualToString:@"iPhone4"]){
        _widthVideo = 320;
        _heightVideo = 185;
        _imageLineWidth = 307.5;
        self.imageAdd.image = [UIImage imageNamed:@"tag@2x"];
        self.imageType.image = [UIImage imageNamed:@"add@2x"];
        self.titleTOP.constant = 200;
        
//        
//        self.textTitle.font = [UIFont systemFontOfSize:13];
//        self.textSummarize.font = [UIFont systemFontOfSize:12];
//        self.textContents.font = [UIFont systemFontOfSize:12];
//        self.textPercentage.font = [UIFont systemFontOfSize:10];
//        self.textFactMoney.font = [UIFont systemFontOfSize:10];
//        self.textWantedMoney.font = [UIFont systemFontOfSize:10];
        
//        self.buttonMoreStoryWidth.constant = 60;
//        self.buttonMoryStoryHeight.constant = 70;
////        self.buttonMoreStory.titleLabel.font =[UIFont systemFontOfSize:10];
        
        
//        self.buttonMoreDynamicHeight.constant = 70;
//        self.buttonMoreDynamicWidth.constant = 60;
//        self.buttonMoreDynamic.titleLabel.font =[UIFont systemFontOfSize:10];
        
//        self.progressHeight.constant = 7;
    }
    
  _iOSBoundsDetalis = [UIScreen mainScreen].bounds.size;
    
//    self.buttonAllPreson.layer.borderWidth = 1;
    
    //登陆视图
    _viewProjectDetails = [[UIView alloc] initWithFrame:CGRectMake(0 ,self.scrollView.contentOffset.y, _iOSBoundsDetalis.width, _iOSBoundsDetalis.height)];
    _viewProjectDetails.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.95];
    [self.view addSubview:_viewProjectDetails];
    
    UIView *viewLoginBlock = [[UIView alloc] initWithFrame:CGRectMake(0,0,78,162)];
    viewLoginBlock.backgroundColor = [UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1];
    viewLoginBlock.clipsToBounds = YES;
    viewLoginBlock.layer.cornerRadius = 12;
    viewLoginBlock.center = _viewProjectDetails.center;
    [_viewProjectDetails addSubview:viewLoginBlock];
    
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonLogin addTarget:self action:@selector(buttonLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonLogin.backgroundColor = [UIColor colorWithRed:119.0/255 green:134.0/255 blue:146.0/255 alpha:1];
    [buttonLogin setTitleColor:[UIColor colorWithRed:38.0/255 green:55.0/255 blue:70.0/255 alpha:1]forState:UIControlStateNormal];
    [buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    buttonLogin.clipsToBounds = YES;
    buttonLogin.layer.cornerRadius = 27;
    [buttonLogin setFrame:CGRectMake(12,84,54,54)];
    [viewLoginBlock addSubview:buttonLogin];
    
    
    UIImageView *viewClose = [[UIImageView alloc] initWithFrame:CGRectMake(31,24,16,16)];
    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
        viewClose.image = [UIImage imageNamed:@"close_grey_@3x"];
    }else{
        viewClose.image = [UIImage imageNamed:@"close_grey_@2x"];
    }
    [viewLoginBlock addSubview:viewClose];
    
    UIButton *buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonClose addTarget:self action:@selector(buttonLoginCloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonClose setFrame:CGRectMake(17,18,44,44)];
    [viewLoginBlock addSubview:buttonClose];

    _viewProjectDetails.hidden = YES;
    
    _viewButtons = [[UIView alloc] initWithFrame:CGRectMake(0,_iOSBoundsDetalis.height-50, _iOSBoundsDetalis.width, 50)];
    
    _viewButtons.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_viewButtons];
    
    UIButton *buttonCancelDid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonCancelDid addTarget:self
                        action:@selector(buttonCancelWill)
              forControlEvents:UIControlEventTouchUpInside];
    
    [buttonCancelDid setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    buttonCancelDid.frame = CGRectMake(0,0,70,50);
    
    [buttonCancelDid setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
    
    [_viewButtons addSubview:buttonCancelDid];
    
    UIImageView *imageViewCancel = [[UIImageView alloc] initWithFrame:CGRectMake(buttonCancelDid.frame.size.width/2 - 11, 14, 14,22)];
    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
        imageViewCancel.image = [UIImage imageNamed:@"back_grew_3x"];
    }else{
        imageViewCancel.image = [UIImage imageNamed:@"back_grew_2x"];
    }
    
    [buttonCancelDid addSubview:imageViewCancel];
    
    //分享
    UIButton *buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonShare addTarget:self
                    action:@selector(buttonShareWill)
          forControlEvents:UIControlEventTouchUpInside];
    
    [buttonShare setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    buttonShare.frame = CGRectMake(_viewButtons.frame.size.width - 70,0,70,50);
    
    [buttonShare setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]  forState:UIControlStateNormal];
    
    [_viewButtons addSubview:buttonShare];
    
    UIImageView *imageViewShare = [[UIImageView alloc] initWithFrame:CGRectMake(buttonShare.frame.size.width/2 - 8, 12, 18,24)];
    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
        imageViewShare.image = [UIImage imageNamed:@"share_grew@3x"];
    }else{
        imageViewShare.image = [UIImage imageNamed:@"share_grew@2x"];
    }
    
    [buttonShare addSubview:imageViewShare];
    

    UIButton *buttonJoinDid = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonJoinDid addTarget:self
                      action:@selector(buttonJoinWill)
            forControlEvents:UIControlEventTouchUpInside];
    
    [buttonJoinDid setBackgroundColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];
    [buttonJoinDid setTitle:@"加入他们" forState:UIControlStateNormal];
    
    buttonJoinDid.titleLabel.font = [UIFont boldSystemFontOfSize:14.7];
    
    buttonJoinDid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    buttonJoinDid.contentHorizontalAlignment =UIControlContentHorizontalAlignmentCenter;
    
    buttonJoinDid.frame = CGRectMake(70,0,_viewButtons.frame.size.width - 140,50);
    
    [buttonJoinDid setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]  forState:UIControlStateNormal];
    
    [_viewButtons addSubview:buttonJoinDid];
    
    
    
    _viewButtons.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1];
    
    
//    
//       [self.MainImage setFrame:CGRectMake(self.MainImage.frame.origin.x,self.MainImage.frame.origin.y,_widthImage, self.MainImage.frame.size.height)];
    
    
    //大图圆角
    self.buttonMoreStory.layer.masksToBounds = YES;
    self.buttonMoreStory.layer.cornerRadius = 6;
    self.buttonMoreStory.layer.borderColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;

//    self.buttonMoreStory.layer.borderWidth = 1;
//    [self.buttonMoreStory setTitleColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1] forState:UIControlStateNormal];
    
//    [self.buttonMoreStory setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    
    //大图圆角
    self.buttonMoreDynamic.layer.masksToBounds = YES;
    self.buttonMoreDynamic.layer.cornerRadius = 6;
    self.buttonMoreDynamic.layer.borderColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;

    
    //create a player
//    self.moviePlay = [[ALMoviePlayerController alloc] initWithFrame:CGRectMake(0, 0,_widthVideo, _heightVideo)];
    
    
//    self.moviePlay = [[ALMoviePlayerController alloc] initWithFrame:CGRectMake(0, 0,375, 281)];
//    self.moviePlay.view.alpha = 1;
//    self.moviePlay.delegate = self; //IMPORTANT!
//    
//    //create the controls
//    ALMoviePlayerControls *movieControls = [[ALMoviePlayerControls alloc] initWithMoviePlayer:self.moviePlay style:ALMoviePlayerControlsStyleDefault];
//    //[movieControls setAdjustsFullscreenImage:NO];
//    [movieControls setBarColor:[UIColor colorWithRed:195.0/255.0 green:29.0/255.0 blue:29.0/255.0 alpha:1]];
//    [movieControls setTimeRemainingDecrements:YES];

    //是否全屏显示
    //    self.moviePlayer.fullscreen = NO;
    
    _iOSDeviceDetails = [UIScreen mainScreen].bounds.size;
    
    self.moviePlayer = [[MPMoviePlayerController alloc]init];
    //面板风格;
    self.moviePlayer.controlStyle = MPMovieControlStyleDefault;
 
    [self.moviePlayer.view setFrame:CGRectMake(0, 0,_iOSDeviceDetails.width + 10, _heightVideo)];
    
    
    NSLog(@"%f",_iOSBoundsDetalis.width + 5);
    //是否重复播放
    self.moviePlayer.repeatMode = MPMovieRepeatModeNone;
    
    //播放视频比例
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    self.moviePlayer.scalingMode = MPMovieControlStyleFullscreen;
    
    [self.moviePlayer setShouldAutoplay:NO];
    
    [self.scrollView addSubview:self.moviePlayer.view];
    
    
    _aryChou = [[NSMutableArray alloc] init];
    
    _httpClassProjectDynamic = [[HttpClassSelf alloc] init];
    
    [_httpClassProjectDynamic projectDetailsSetProjectID:self.strProjectID token:_dataModelProjectDyanmic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        NSMutableDictionary *resHomePageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resHomePageDic[@"status"] isEqualToString:@"success"]){
            
            NSLog(@"打印项目详情返回对象%@",resHomePageDic);
            
            NSMutableArray *aryVideos = [[NSMutableArray alloc]init];
            
            NSDictionary *dic  =  resHomePageDic[@"data"];
            
            _strProjectID = dic[@"_id"];
            
            for(NSString *strVideo in dic[@"videos"]){
                [aryVideos addObject:strVideo];
                
            }
            NSMutableAttributedString  *strTextContents =[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",dic[@"lastfeed"]]];
            NSMutableParagraphStyle * paragraphStyle=[[NSMutableParagraphStyle alloc]init];
            
            NSLog(@"%@",dic[@"focus"]);
            
            _dicFocusDetail = dic[@"focus"];
            
            [paragraphStyle setMinimumLineHeight:18];
            
            [strTextContents addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[NSString stringWithFormat:@"%@",dic[@"lastfeed"]] length])];
            
            
            //播放器加载视频
            self.moviePlayer.contentURL = [NSURL URLWithString:aryVideos[0]];
            
            
            
            _dicCreateDetail = dic[@"creator"];
            
            _viewTimeLineDown = 40;
            //1200 330
            if([dic[@"images"] count] > 1){
                self.imagesTimeLines.image  =  [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dic[@"images"][1]]]];
                
                //时间线
                self.imagesTimeLines.clipsToBounds = YES;
                self.imagesTimeLines.contentMode = UIViewContentModeScaleAspectFit;
                [self.imagesTimeLines sizeToFit];
                self.imagelineHeight.constant = _imageLineWidth/(1200/330);
            }else{
                self.imagelineHeight.constant = 1;
                _viewTimeLineDown = 18;
            }
            
            for(NSMutableDictionary *dicChou in dic[@"chou"]){
                [_aryChou addObject:dicChou];
            }
            
            NSDateFormatter *_dateFormatterDetails = [[NSDateFormatter alloc] init];
            
            [_dateFormatterDetails setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            
            NSDate  * _dateDetals = [NSDate date];
            
            NSTimeZone *zone = [NSTimeZone systemTimeZone];
            
            NSInteger interval = [zone secondsFromGMTForDate:_dateDetals];
            
            NSDate *_dateNowNowNow = [_dateDetals dateByAddingTimeInterval: interval];
            
            NSLog(@"%@",_dateNowNowNow);
            
            NSDate *_dateEnd_Date = [_dateFormatterDetails dateFromString:dic[@"end_date"]];
            
            NSTimeZone *zoneEnd = [NSTimeZone systemTimeZone];
            
            NSInteger intervalEnd = [zoneEnd secondsFromGMTForDate:_dateEnd_Date];
            
            NSDate *_dateEndEndEnd = [_dateEnd_Date dateByAddingTimeInterval: intervalEnd];
            NSLog(@"%@",dic[@"end_date"]);
            NSLog(@"%@",_dateEndEndEnd);
            
            _DetailsDate = _dateEndEndEnd;
            
//            NSLog(@"今天--%@------结束日期%@",_dateNowNowNow,_dateEndEndEnd);
            
            NSLog(@"%lu",[dic[@"isorder"] longValue]);
            
            
            if([dic[@"isorder"] longValue ] == 0){
                //            if(/* DISABLES CODE */ (NO)){
                
                
                self.imageViewJoin.hidden = YES;
                self.imageViewLove.hidden = NO;
                self.buttonLove.enabled = YES;
                
                if([dic[@"isFocus"] longValue] == 0){
                    _seleted = NO;
                    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                        //                    [self.buttonLove setImage:[UIImage imageNamed:@"details_UnLove@3x"] forState:UIControlStateNormal];
                        self.imageViewLove.image = [UIImage imageNamed:@"details_UnLove@3x"];
                    }else{
                        //                    [self.buttonLove setImage:[UIImage imageNamed:@"details_UnLove@2x"] forState:UIControlStateNormal];
                        self.imageViewLove.image = [UIImage imageNamed:@"details_UnLove@2x"];
                    }
                }else{
                    _seleted = YES;
                    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                        
                        
                        self.imageViewLove.image = [UIImage imageNamed:@"details_Love@3x"];
                    }else{

                        
                        self.imageViewLove.image = [UIImage imageNamed:@"details_Love@3x"];
                    }
                    
                }
            }else{
                
                self.imageViewJoin.hidden = NO;
                self.imageViewLove.hidden = YES;
                self.buttonLove.enabled = NO;
                
                if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                    self.imageViewJoin.image = [UIImage imageNamed:@"ProjectJoined@3x"];
                }else{
                    self.imageViewJoin.image = [UIImage imageNamed:@"ProjectJoined@2x"];
                }
            }

            self.textFactMoney.text = [NSString stringWithFormat:@"￥%ld/%ld",[dic[@"fact_money"] longValue],[dic[@"wanted_money"] longValue]];
            
            self.labelFactMoney.text = [NSString stringWithFormat:@"￥%ld/%ld",[dic[@"fact_money"] longValue],[dic[@"wanted_money"] longValue]];
            
            _floatPercentage = [dic[@"fact_money"] floatValue]/ [dic[@"wanted_money"] floatValue];
            
            
            
            //未被覆盖的颜色
            self.progressView.trackTintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
            
            self.progressView.progressTintColor = [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1];
            //进度条进度
            self.progressView.progress = _floatPercentage;
            
            self.progressView.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
            
            //进度条百分比文字
            
            if(_floatPercentage * 100 < 10 ){
                
                self.textPercentage.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:1]];
                
                self.labelProgress.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:1]];
                
            }else if(_floatPercentage * 100 >= 10 && _floatPercentage * 100 < 100){
                
                self.textPercentage.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:2]];
                
                self.labelProgress.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:2]];
                
            }else if(_floatPercentage * 100 >= 100){
                
                //百分比文字
                self.textPercentage.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:3]];
                
                self.labelProgress.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentage * 100)] substringToIndex:3]];

            }
            
            
            if((int)[_dateEndEndEnd timeIntervalSinceDate:_dateNowNowNow]/86400 <= 0 && _floatPercentage * 100 >= 100){

                self.textWantedMoney.text = @"已成功";
                self.viewSuccess.hidden = NO;
                self.viewCreatorTopHeight.constant = 30.5;
                
            }else if((int)[_dateEndEndEnd timeIntervalSinceDate:_dateNowNowNow]/86400 <= 0 && _floatPercentage * 100 < 100){
                
                self.textWantedMoney.text = @"已结束";
                self.viewSuccess.hidden = YES;
               self.viewCreatorTopHeight.constant = 24;
            }else{
                
                self.textWantedMoney.text = [NSString stringWithFormat:@" 剩余%i天 ",((int)[_dateEndEndEnd timeIntervalSinceDate:_dateNowNowNow]/86400)];
                self.viewSuccess.hidden = YES;
                self.viewCreatorTopHeight.constant = 24;
            }

            _countDownData = [_dateEndEndEnd timeIntervalSinceDate:_dateNowNowNow]/86400;
            
            self.textCountry.text = dic[@"address"];
            self.textTitle.text = dic[@"title"];
            self.textType.text = dic[@"type"];
            
            _strShareTitle = dic[@"title"];
            _strShareImage = dic[@"images"][0];
            
            
            
            NSMutableAttributedString  *strtextSummarize =[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",dic[@"desc"]]];
            
            [strtextSummarize addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[NSString stringWithFormat:@"%@",dic[@"desc"]] length])];
            
            self.textSummarize.attributedText = strtextSummarize;
            _strHTMLContents = dic[@"desc_all"];
            
            _strShareText = dic[@"desc"];
            
            [self.textSummarize sizeToFit];
            [self.labelCreator sizeToFit];
        
            //「发起者」头像
            NSInteger creatorImageViewX = self.labelCreator.frame.origin.x + self.labelCreator.frame.size.width + 9;
            
            for(int i = 0;i <[_dicCreateDetail count];i++){
                
                NSMutableDictionary *dicCreatorItems = _dicCreateDetail[i];
                
                _CreatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake( creatorImageViewX,0, 44,44)];
                
                _CreatorImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicCreatorItems[@"image"]]]];
                
                _CreatorImageView.clipsToBounds = YES;
                _CreatorImageView.layer.cornerRadius = 22;
                _CreatorImageView.userInteractionEnabled = YES;
                _CreatorImageView.contentMode = UIViewContentModeScaleAspectFill;
                [self.viewCreatorBlock addSubview:_CreatorImageView];
                
                creatorImageViewX += 53;
                
                UITapGestureRecognizer *imageFocusTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonCreatorImageClick:)];
                [_CreatorImageView addGestureRecognizer:imageFocusTap];
                _CreatorImageView.tag = i;
            }
            NSInteger endFocusXXX  = 0;
            NSInteger endFocusYYY  = 0;
            
            if([_dicFocusDetail[@"users"] count] < 6 && [_dicFocusDetail[@"users"] count] >0){
            
                //「火伴」头像
                NSInteger imageFocuePresonX = self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                
                if([_iOSSizeDetails isEqualToString:@"iPhone6"] ||[_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                    
                    self.viewFocusHeight.constant = 44;
                    
                    for(int i = 0;i < [_dicFocusDetail[@"users"] count] ;i++){
                        
                        if(i <= 4){
                            
                        NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                        
                        NSLog(@"%@",dicFocusItem);
                        
                        _FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y - 14.65, 44,44)];
                        
                        _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                        
                        _FocusImageView.clipsToBounds = YES;
                        _FocusImageView.layer.cornerRadius = 22;
                        _FocusImageView.userInteractionEnabled = YES;
                        _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                        [self.viewFocusBlock addSubview:_FocusImageView];
                        if(i == 0){
                            imageFocuePresonX = self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                        }else{
                            imageFocuePresonX = ( self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9) + (i * 53);
                        }
                        endFocusXXX = imageFocuePresonX;
                        endFocusYYY =  self.labelHuoban.frame.origin.y - 14.65;
                        }
                    }
                    
                }else{
                    
                    self.viewFocusHeight.constant = 97;
                    
                    for(int i = 0; i < [_dicFocusDetail[@"users"] count] ;i++){
                        
                        if(i < 4){
                            
                        NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                        
                        _FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y - 14.65,44,44)];
                        
                        _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                        
                        _FocusImageView.clipsToBounds = YES;
                        _FocusImageView.layer.cornerRadius = 22;
                        _FocusImageView.userInteractionEnabled = YES;
                        _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                        [self.viewFocusBlock addSubview:_FocusImageView];
                        
                        if(i == 0 ){
                            imageFocuePresonX =  self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                        }else{
                            imageFocuePresonX = ( self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9) + (i * 53);
                        }
                        
                        
                        endFocusXXX = self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                        endFocusYYY =  self.labelHuoban.frame.origin.y + 38.25;
                            
                        }
                        
                    }
                }
                
                
                UIView *viewMore = [[UIView alloc] initWithFrame:CGRectMake(endFocusXXX,endFocusYYY,44,44)];
                viewMore.clipsToBounds = YES;
                viewMore.layer.cornerRadius = 22;
                viewMore.layer.borderWidth = 1;
                viewMore.layer.borderColor = [UIColor redColor].CGColor;
                [self.viewFocusBlock addSubview:viewMore];
                
                UIImageView *imageViewMore = [[UIImageView alloc]initWithFrame:CGRectMake(12,20,20,4)];
                if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                    imageViewMore.image = [UIImage imageNamed:@"morePreson@3x"];
                }else{
                    imageViewMore.image = [UIImage imageNamed:@"morePreson@2x"];
                }
                imageViewMore.center = viewMore.center;
                [viewMore addSubview:imageViewMore];
                
//                _labelFocus = [[UILabel alloc] initWithFrame:CGRectMake(endFocusXXX,endFocusYYY,44,44)];
                
//                _labelFocus.text = [NSString stringWithFormat:@"+%lu",[_dicFocusDetail[@"count"] longValue]];
//                _labelFocus.font = [UIFont fontWithName:@"Arial" size:12];
//                _labelFocus.textColor = [UIColor redColor];
//                _labelFocus.clipsToBounds = YES;
//                _labelFocus.layer.cornerRadius = 22;
//                _labelFocus.layer.borderWidth = 1;
//                _labelFocus.layer.borderColor = [UIColor redColor].CGColor;
//                _labelFocus.textAlignment = NSTextAlignmentCenter;
//                [self.viewFocusBlock addSubview:_labelFocus];
                
                
                
            }else{
                
                //「火伴」头像
                NSInteger imageFocuePresonX = self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                
                self.viewFocusHeight.constant = 97;
                
                if([_iOSSizeDetails isEqualToString:@"iPhone6"] ||[_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                    
                    for(int i = 0;i < [_dicFocusDetail[@"users"] count] ;i++){

                        
                        if(i <= 5){
                            
                            NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                            
                            _FocusImageView= [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y - 14.65, 44,44)];
                            
                            _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                            
                            _FocusImageView.clipsToBounds = YES;
                            _FocusImageView.layer.cornerRadius = 22;
                            _FocusImageView.userInteractionEnabled = YES;
                            _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                            [self.viewFocusBlock addSubview:_FocusImageView];
                            
                            imageFocuePresonX += 53;
                            
                            endFocusXXX = imageFocuePresonX;
                            endFocusYYY =  self.labelHuoban.frame.origin.y - 14.65;
                            
                            
                        }else if(i > 5 && i <= 10){
                            
                            imageFocuePresonX = ( self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9) + ((i-6) * 53);
                            
                            NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                            
                            _FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y + 38.25, 44,44)];
                            
                            _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                            
                            _FocusImageView.clipsToBounds = YES;
                            _FocusImageView.layer.cornerRadius = 22;
                            _FocusImageView.userInteractionEnabled = YES;
                            _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                            [self.viewFocusBlock addSubview:_FocusImageView];
                            
                            endFocusXXX =  imageFocuePresonX + 53;
                            endFocusYYY =  self.labelHuoban.frame.origin.y + 38.25;
                            
                        }
                    }
                }else{
                    
                    //「火伴」头像
                    NSInteger imageFocuePresonX = self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9;
                    
                    for(int i = 0;i < [_dicFocusDetail[@"users"] count] ;i++){
                        if(i <= 4){
                            
                            NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                            
                            _FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y - 14.65, 44,44)];
                            
                            _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                            
                            _FocusImageView.clipsToBounds = YES;
                            _FocusImageView.layer.cornerRadius = 22;
                            _FocusImageView.userInteractionEnabled = YES;
                            _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                            [self.viewFocusBlock addSubview:_FocusImageView];
                            
                            imageFocuePresonX += 53;
                            
                            endFocusXXX = imageFocuePresonX;
                            endFocusYYY =  self.labelHuoban.frame.origin.y - 14.65;
                            
                        }else if(i > 4 && i <= 8){
                            
                            imageFocuePresonX  = ( self.labelHuoban.frame.origin.x + self.labelHuoban.frame.size.width + 9) + ((i-5) * 53);
                            
                            NSMutableDictionary *dicFocusItem = _dicFocusDetail[@"users"][i];
                            
                            _FocusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageFocuePresonX, self.labelHuoban.frame.origin.y + 38.25, 44,44)];
                            
                            _FocusImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicFocusItem[@"image"]]]];
                            
                            _FocusImageView.clipsToBounds = YES;
                            _FocusImageView.layer.cornerRadius = 22;
                            _FocusImageView.userInteractionEnabled = YES;
                            _FocusImageView.contentMode = UIViewContentModeScaleAspectFill;
                            [self.viewFocusBlock addSubview:_FocusImageView];
                            
                            endFocusXXX =  imageFocuePresonX + 53;
                            endFocusYYY =  self.labelHuoban.frame.origin.y + 38.25;
                            
                        }
                        
                    }
                    
                }
             
                
                UIView *viewMore = [[UIView alloc] initWithFrame:CGRectMake(endFocusXXX,endFocusYYY,44,44)];
                viewMore.clipsToBounds = YES;
                viewMore.layer.cornerRadius = 22;
                viewMore.layer.borderWidth = 1;
                viewMore.layer.borderColor = [UIColor redColor].CGColor;
                [self.viewFocusBlock addSubview:viewMore];
                
                UIImageView *imageViewMore = [[UIImageView alloc]initWithFrame:CGRectMake(12,20,20,4)];
                if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                    imageViewMore.image = [UIImage imageNamed:@"morePreson@3x"];
                }else{
                    imageViewMore.image = [UIImage imageNamed:@"morePreson@2x"];
                }
//                imageViewMore.center = viewMore.center;
                [viewMore addSubview:imageViewMore];
                
//                _labelFocus = [[UILabel alloc] initWithFrame:CGRectMake(endFocusXXX,endFocusYYY,44,44)];
//                _labelFocus.text = [NSString stringWithFormat:@"+%lu",[_dicFocusDetail[@"count"] longValue]];
//                _labelFocus.font = [UIFont fontWithName:@"Arial" size:12];
//                _labelFocus.textColor = [UIColor redColor];
//                _labelFocus.clipsToBounds = YES;
//                _labelFocus.layer.cornerRadius = 22;
//                _labelFocus.layer.borderWidth = 1;
//                _labelFocus.layer.borderColor = [UIColor redColor].CGColor;
//                _labelFocus.textAlignment = NSTextAlignmentCenter;
//                [self.viewFocusBlock addSubview:_labelFocus];
                
            }
            
            NSInteger viewHeightLastAryChou = 0;
            NSInteger labelTitleYYY = 0;
            NSInteger labelTitleWidth = 0;
            NSInteger viewChouWWWW = 16;
            NSInteger labelContentWWW = 23;
            NSInteger labelMoneyWidth = 0;
            NSInteger labelRightCount = 0;
            NSInteger labelPresonWidth = 0;
            
            
            _viewChouYYY = self.imagesTimeLines.frame.origin.y + self.imagelineHeight.constant  + _viewTimeLineDown;
            labelTitleYYY = 120;
            
            //众筹框
            if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){

                viewChouWWWW = 23;
                labelContentWWW = 28;
                labelMoneyWidth = 150;
                labelTitleWidth = 180;
                labelRightCount = 36;
                labelPresonWidth = 130;
                
            }else if([_iOSSizeDetails isEqualToString:@"iPhone6"]){
                
                viewChouWWWW = 16;
                labelContentWWW = 23;
                labelMoneyWidth = 150;
                labelTitleWidth = 180;
                labelRightCount = 24;
                labelPresonWidth = 130;
                
            }else if([_iOSSizeDetails isEqualToString:@"iPhone5"]){
                

                viewChouWWWW = 16;
                labelContentWWW = 23;
                labelMoneyWidth = 130;
                labelTitleWidth = 150;
                labelRightCount = 24;
                labelPresonWidth = 130;
                
            }else if([_iOSSizeDetails isEqualToString:@"iPhone4"]){
                
                viewChouWWWW = 16;
                labelContentWWW = 23;
                labelMoneyWidth = 130;
                labelTitleWidth = 150;
                labelRightCount = 24;
                labelPresonWidth = 130;
                
            }
            
            for(int i =0;i < [_aryChou count];i++){
                
                NSMutableDictionary *dicChouItems = _aryChou[i];
                NSLog(@"%@",dicChouItems);
                
                _viewChou = [[UIView alloc] initWithFrame:CGRectMake(12,_viewChouYYY + i,self.view.frame.size.width,100)];
                _viewChou.layer.borderColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;
                _viewChou.layer.borderWidth = 1;
                _viewChou.clipsToBounds = YES;
                _viewChou.layer.cornerRadius = 6;
                
                [self.scrollView addSubview:_viewChou];
                [_aryPayView addObject:_viewChou];
                
                //支持100元
                UILabel *labelMoney = [[UILabel alloc] initWithFrame:CGRectMake(12,12,labelMoneyWidth,14.7)];
                labelMoney.text = [NSString stringWithFormat:@"支持%ld元",[dicChouItems[@"money"]longValue]];
//                labelMoney.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.7];
                labelMoney.font = [UIFont boldSystemFontOfSize:14.7];
                labelMoney.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];

                [_viewChou addSubview:labelMoney];
                
                
                //title
                _labelTitleChouView = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - labelTitleWidth - labelRightCount,12,labelTitleWidth,14.7)];
                _labelTitleChouView.text = [NSString stringWithFormat:@"%@",dicChouItems[@"title"]];
                _labelTitleChouView.font = [UIFont boldSystemFontOfSize:14.7];
                _labelTitleChouView.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];

                
                _labelTitleChouView.textAlignment = NSTextAlignmentRight;
                [_viewChou addSubview:_labelTitleChouView];
                
                
                //contents
                NSMutableAttributedString  *strContents =[[NSMutableAttributedString alloc]initWithString:dicChouItems[@"desc"]];
                
                NSMutableParagraphStyle * paragraphSummarizeStyle=[[NSMutableParagraphStyle alloc]init];
                
                [paragraphSummarizeStyle setMinimumLineHeight:18];
                
                NSLog(@"%@",dicChouItems[@"desc"]);
                
                [strContents addAttribute:NSParagraphStyleAttributeName value:paragraphSummarizeStyle range:NSMakeRange(0, [dicChouItems[@"desc"] length])];
                
                _labelContentsChouView= [[UILabel alloc] initWithFrame:CGRectMake(12,labelMoney.frame.origin.y + 12,0,0)];
                _labelContentsChouView.attributedText = strContents;
                //                    labelContents.font = ;
                _labelContentsChouView.textColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1];
                //                    labelContents.clipsToBounds = YES;
                //                    labelContents.layer.borderWidth = 1.5;
                //        labelContents.layer.borderColor = [UIColor colorWithRed:64.0/255 green:171.0/255 blue:169.0/255 alpha:1].CGColor;
                _labelContentsChouView.textAlignment = NSTextAlignmentNatural;
                [_labelContentsChouView setNumberOfLines:0];
                
                CGSize labelContenteSize =  [ImageSameWidth getSizeWithStr:[NSString stringWithFormat:@"%@",strContents] width:_viewChou.frame.size.width - 38 font:14.7];
                
                _labelContentsChouView.font = [UIFont fontWithName:@"PingFang SC" size:14.7];
                
                _labelContentsChouView.frame =CGRectMake(12,labelMoney.frame.origin.y + 24,self.view.frame.size.width - 36,labelContenteSize.height);
            
                [_labelContentsChouView sizeToFit];
                
                NSLog(@"%f",_labelContentsChouView.frame.size.height);
                
                [_viewChou addSubview:_labelContentsChouView];
                
                //预计发货时间
                _labelSendTimeChouView = [[UILabel alloc] initWithFrame:CGRectMake(12,_labelContentsChouView.frame.origin.y + _labelContentsChouView.frame.size.height + 12,150,12)];
                
                _labelSendTimeChouView.text =[NSString stringWithFormat:@"众筹结束后%lu天发送",[dicChouItems[@"send_number"] longValue]];
                _labelSendTimeChouView.font = [UIFont systemFontOfSize:12];
                _labelSendTimeChouView.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
                //                labelSendTime.layer.borderColor = [UIColor colorWithRed:64.0/255 green:171.0/255 blue:169.0/255 alpha:1].CGColor;
                //                    labelSendTime.textAlignment = NSTextAlignmentRight;
                [_viewChou addSubview:_labelSendTimeChouView];
                
                //剩余人数
                _labelPresonCountChouView = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - labelRightCount - labelPresonWidth,_labelContentsChouView.frame.origin.y + _labelContentsChouView.frame.size.height + 12,labelPresonWidth,12)];
                
                if([dicChouItems[@"want"]longValue] >10000 ){
                    _labelPresonCountChouView.text = [NSString stringWithFormat:@"已支持%ld人",[dicChouItems[@"fact"] longValue]];
                }else{
                    _labelPresonCountChouView.text = [NSString stringWithFormat:@"已支持%ld人/%ld个名额",[dicChouItems[@"fact"] longValue],[dicChouItems[@"want"] longValue]];
                    
                }
                
                _labelPresonCountChouView.font = [UIFont systemFontOfSize:12];
                _labelPresonCountChouView.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
                _labelPresonCountChouView.layer.borderColor = [UIColor colorWithRed:64.0/255 green:171.0/255 blue:169.0/255 alpha:1].CGColor;
                _labelPresonCountChouView.textAlignment = NSTextAlignmentRight;
                [_viewChou addSubview:_labelPresonCountChouView];
                
                _viewChou.frame = CGRectMake(12,_viewChouYYY,_iOSDeviceDetails.width - viewChouWWWW,
                                             _labelTitleChouView.frame.size.height + _labelContentsChouView.frame.size.height + _labelSendTimeChouView.frame.size.height + 40);
                
                _buttonPay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [_buttonPay addTarget:self
                               action:@selector(buttonPaySegue:)
                     forControlEvents:UIControlEventTouchUpInside];
                
                _buttonPay.frame = CGRectMake(0,0,_viewChou.frame.size.width,_viewChou.frame.size.height);
                
                _buttonPay.tag = i;
                [_viewChou addSubview:_buttonPay];
                
                _viewChouYYY += _viewChou.frame.size.height + 18;
                
                if(i == [_aryChou count] - 1){
                    viewHeightLastAryChou = _viewChou.frame.size.height;
                }
                
                NSLog(@"%f-----%f",_viewChou.frame.origin.x,_viewChou.frame.origin.y);
            }
            

            
            if([_aryChou count] != 0 ){
                
                
                //                if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                //                    _floatScorllHeight =  viewChouYYY + 44 ;
                //                }else{
                //                    _floatScorllHeight =  viewChouYYY + 44 ;
                //                }
                
                NSLog(@"滚动高度滚动高度%f",_floatScorllHeight);
                
            }else{
                _floatScorllHeight = self.viewImagePresonBlock.frame.origin.y + 118;
            }
            [self.textContents sizeToFit];
            [self.textTitle sizeToFit];
            [self.labelCreator sizeToFit];
            NSLog(@"记录记录记录-----%f--%f",self.labelCreator.frame.origin.x,self.labelCreator.frame.origin.y);
            
            
            [self.moviePlayer prepareToPlay];

        }else{
            [[ToolClass sharedInstance]showAlert:@"刷新失败，服务器报错"];
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance]showAlert:@"刷新失败,请检查网络"];
    }];
   }
-(void)buttonCreatorImageClick:(UITapGestureRecognizer*)sender{
    
    [self performSegueWithIdentifier:@"OtherUserSegue" sender:_dicCreateDetail[sender.view.tag]];
    
}


-(void)buttonLoginClick:(UIButton*)sender{
    
    NSLog(@"点击弹出登陆按钮按钮按钮");
    _viewProjectDetails.hidden = YES;
    self.scrollView.scrollEnabled = YES;
    _viewButtons.hidden = NO;
    
    [self performSegueWithIdentifier:@"loginSegue" sender:nil];
    
}

-(void)buttonLoginCloseClick:(UIButton*)sender{
    
    _viewProjectDetails.hidden = YES;
    self.scrollView.scrollEnabled = YES;
    _viewButtons.hidden = NO;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    _runtimesDetails  = [[NSUserDefaults standardUserDefaults] integerForKey:@"runtimes"];
    
    _viewProjectDetails.hidden = YES;
    
    self.viewSuccess.hidden = YES;
//    //绿线 白背景
//    [self.buttonMoreStory setTitleColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1] forState:UIControlStateNormal];
//    [self.buttonMoreStory setBackgroundColor:[UIColor whiteColor]];
//    
//    //大图圆角
//    [self.buttonMoreDynamic setTitleColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1] forState:UIControlStateNormal];
//    [self.buttonMoreDynamic setBackgroundColor:[UIColor whiteColor]];

    
    
  
    //发起人头像--11.03只有一个发起人，多个发起人需改代码
    for(int i = 0;i <[_aryPayView count];i++){

        UIView *viewPayList = _aryPayView[i];
        
        viewPayList.backgroundColor = [UIColor whiteColor];
        
        UILabel *labelMoney = viewPayList.subviews[0];
        labelMoney.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
        
        UILabel *labelTitle = viewPayList.subviews[1];
        labelTitle.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];

        
        UILabel *labelContents = viewPayList.subviews[2];
        labelContents.textColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1];
        
        UILabel *labelSendTime = viewPayList.subviews[3];
        labelSendTime.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];

        
        UILabel *labelPresonCount = viewPayList.subviews[4];
        labelPresonCount.textColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];

        
    }
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
        [self setNeedsStatusBarAppearanceUpdate];
    
//    self.imagesTimeLines.layer.borderWidth = 1;
    
    _viewChouYYY = self.imagesTimeLines.frame.origin.y + self.imagelineHeight.constant  ;
    
    for(int i = 0;i <[_aryPayView count];i++){
        
        UIView *viewPayList = _aryPayView[i];
        
        viewPayList.frame = CGRectMake(viewPayList.frame.origin.x, _viewChouYYY,viewPayList.frame.size.width,viewPayList.frame.size.height);
    
        
        _viewChouYYY += viewPayList.frame.size.height + 18;
    }
    
//    NSLog(@"记录记录记录-----%f--%f",self.labelCreator.frame.origin.x,self.labelCreator.frame.origin.y);
    
    self.scrollView.clipsToBounds = YES;

    NSLog(@"%f",_floatScorllHeight);
    CGSize scrollViewHeight =  CGSizeMake (self.scrollView.frame.size.width,_viewChouYYY + 44);
    self.scrollView.contentSize  = scrollViewHeight;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
        [self.moviePlayer pause];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentedClick:(id)sender{
    UISegmentedControl *control = (UISegmentedControl*)sender;
    
    
    if(control.selectedSegmentIndex == 0){
            [self dismissViewControllerAnimated:YES completion:nil];
    }else if(control.selectedSegmentIndex == 1){
        
        [self performSegueWithIdentifier:@"JoinProjectSegue" sender:_aryChou];
        
        NSLog(@"%@",_aryChou);
        
    }else if(control.selectedSegmentIndex == 2){
        
//       _shareView = [[ProjectDetailsShare alloc] initWithFrame:CGRectMake(80, 497,200,100)];
//    
//        
//        [_shareView.buttonWeChat addTarget:self action:@selector(buttonWeChatClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        [_shareView.buttonWeChatS addTarget:self action:@selector(buttonWeChatsClick:)forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        [_shareView.buttonClose addTarget:self action:@selector(buttonCloseClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:_shareView];
        
        [[ToolClass sharedInstance] showAlert:@"「分享」功能正在开发，稍后上线~"];
    }
}
//-(void)buttonWeChatClick:(UIButton*)sender{
//    
//    NSLog(@"弹出微信分享框");
//}
//-(void)buttonWeChatsClick:(UIButton*)sender{
//    NSLog(@"弹出朋友圈分享框");
//}

-(void)buttonCloseClick:(UIButton*)sender{
    
    [_shareView removeFromSuperview];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"JoinProjectSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        JoinProjectTableViewController *controller = (JoinProjectTableViewController*)naVC.topViewController;
        
        controller.aryDataChou = _aryChou;
        controller.countDownJoinDate = _countDownData;
        controller.dataDate = _DetailsDate;
        
        controller.projectID = self.strProjectID;
    }else if([segue.identifier isEqualToString:@"MoreStorySegue"]){
        
        
        UINavigationController *naVC = segue.destinationViewController;
        
        ProjectMoreStoryViewController *controller = (ProjectMoreStoryViewController*)naVC.topViewController;
        
        controller.strContents = _strHTMLContents;
        controller.aryChouMoreStory = _aryChou;
        controller.strProjectID = self.strProjectID;
        controller.countPayDate = _countDownData;
        controller.dateEnd = _DetailsDate;
        controller.strShareImage = _strShareImage;
        controller.strShareText = _strShareText;
        controller.strShareTitle = _strShareTitle;
        
    }else if([segue.identifier isEqualToString:@"MoreDynamicSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        MoreDynamicViewController *controller = (MoreDynamicViewController*)naVC.topViewController;
        
        controller.strProjectID = self.strProjectID;
        controller.aryChouMordDynameic = _aryChou;
        controller.countPayDate = _countDownData;
        controller.dateEnd = _DetailsDate;
        controller.strShareImage = _strShareImage;
        controller.strShareText = _strShareText;
        controller.strShareTitle = _strShareTitle;
        
    }else if([segue.identifier isEqualToString:@"showHuobanPresonSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        SuppotPresonViewController *controller = (SuppotPresonViewController*)naVC.topViewController;
        
        controller.dicCreator = _dicCreateDetail;
        controller.dicChou = _dicFocusDetail;
        controller.strShareImage = _strShareImage;
        controller.strShareText = _strShareText;
        controller.strShareTitle = _strShareTitle;
        
    }else if([segue.identifier isEqualToString:@"PaySegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        PayForProjectTableViewController *controller = (PayForProjectTableViewController*)naVC.topViewController;
        
        controller.dicPayDataModel = sender;
        controller.projectID = self.strProjectID;
        controller.projectEndDate = _DetailsDate;
        
    }else if([segue.identifier isEqualToString:@"loginSegue"]){
        
        LoginViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        
    }else if([segue.identifier isEqualToString:@"OtherUserSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        controller.dicOtherUser = sender;
        
        
    }
    
    
    
//    if([segue.identifier isEqualToString:@"OtherUserSegue"]){
//        
//        UINavigationController *naVC = segue.destinationViewController;
//        
//        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
//        
//        NSLog(@"打印打印他人信息%@",sender);
//        
//        controller.dicOtherUser = sender;
//        
//    }
}
- (IBAction)buttonMoreStory:(id)sender {
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ProjectMoreStoryViewController  *controller =[storyboard instantiateViewControllerWithIdentifier:@"PorjectMoreStoryController"];
//    
//    controller.strContents = _strHTMLContents;
//    controller.delegate = self;
////    controller.view.frame = CGRectMake(15, 150, 350, 500);
//
//    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
//        controller.view.frame = CGRectMake(15, 110, 384, 556);
//    }else if([_iOSSizeDetails isEqualToString:@"iPhone6"]){
//        controller.view.frame = CGRectMake(15, 110,345,507);
//    }else if([_iOSSizeDetails isEqualToString:@"iPhone5"]){
//        controller.view.frame = CGRectMake(15, 80,290,450);
//    }else{
//        controller.view.frame = CGRectMake(15, 80,290,390);
//    }
//    controller.view.layer.cornerRadius = 5;
//    
//    
//    [self addChildViewController:controller];
//    self.scrollView.viewForBaselineLayout.backgroundColor = [UIColor darkGrayColor];
//    self.scrollView.alpha = 0.9;
//    self.progressView.alpha = 0.3;
////    [self.moviePlayer pause];
//
//    self.scrollView.viewForBaselineLayout.backgroundColor = [UIColor darkGrayColor];
//    self.scrollView.alpha = 0.9;
//    self.progressView.alpha = 0.3;
//    [self.moviePlayer pause];
//    
//    [controller didMoveToParentViewController:self];
//    
//    [self.view addSubview:controller.view];
    
//    self.buttonMoreStory.backgroundColor = [UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1];
//    [self.buttonMoreStory setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.moviePlayer pause];
    
    [self performSegueWithIdentifier:@"MoreStorySegue" sender:nil];
}

- (IBAction)buttonMoreDynamic:(id)sender {
    
//    ProjectDynamicSelfTableViewController *projectDynamic = [[ProjectDynamicSelfTableViewController alloc]init];
//    
//    projectDynamic.strProjectID = self.strProjectID;
//    projectDynamic.delegate = self;
//    
//    [self addChildViewController:projectDynamic];
////    [self presentViewController:projectDynamic animated:YES completion:nil];
//    
//    
//    if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
//        projectDynamic.view.frame = CGRectMake(15, 110, 384, 556);
//    }else if([_iOSSizeDetails isEqualToString:@"iPhone6"]){
//        projectDynamic.view.frame = CGRectMake(15, 110,345,507);
//    }else if([_iOSSizeDetails isEqualToString:@"iPhone5"]){
//        projectDynamic.view.frame = CGRectMake(15, 180,290,450);
//    }else{
//        projectDynamic.view.frame = CGRectMake(15, 60,290,390);
//    }
//    projectDynamic.view.layer.cornerRadius = 5;
//
//
////    self.buttonMoreMessage.alpha = 2;
////    self.buttonMoreStory.alpha = 2;
//    [self.view addSubview:projectDynamic.view];
//    
//    [projectDynamic didMoveToParentViewController:self];
//    
//    self.scrollView.viewForBaselineLayout.backgroundColor = [UIColor darkGrayColor];
//    self.scrollView.alpha = 0.9;
//    self.progressView.alpha = 0.3;
    
//    self.buttonMoreDynamic.backgroundColor = [UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1];
//    [self.buttonMoreDynamic setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.moviePlayer pause];
    
    [self performSegueWithIdentifier:@"MoreDynamicSegue" sender:nil];
    
}
//-(void)CloseProjectDynamicSelfController:(ProjectDynamicSelfTableViewController *)conttoller{
//    [conttoller.view removeFromSuperview];
//    
//    self.scrollView.viewForBaselineLayout.backgroundColor = [UIColor whiteColor];
//    self.scrollView.alpha = 1.0;
//    self.progressView.alpha = 1.0;
//}
//-(void)ProjectMoreStoryViewControllerButtonClose:(ProjectMoreStoryViewController *)controller{
//    [controller.view removeFromSuperview];
//    
//    self.scrollView.viewForBaselineLayout.backgroundColor = [UIColor whiteColor];
//    self.scrollView.alpha = 1.0;
//    self.progressView.alpha = 1.0;
//    
//}
- (IBAction)buttonLove:(id)sender {

    if(_runtimesDetails != 1){
        
        _viewProjectDetails.hidden = NO;
        self.scrollView.scrollEnabled = NO;
        _viewButtons.hidden = YES;
        
        
    }else{
    
    
    [_httpClassProjectDynamic projectDetailsSetProjectID:self.strProjectID token:_dataModelProjectDyanmic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        NSData *data = [operatioin responseData];
        NSMutableDictionary *resHomePageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([resHomePageDic[@"status"] isEqualToString:@"success"]){
            
            NSLog(@"打印项目详情返回对象%@",resHomePageDic);
    
            
            NSDictionary *dicLoveButtons  =  resHomePageDic[@"data"];
       
            
     
                _aryLoveButtons = [[NSMutableArray alloc] init];
                
                if([dicLoveButtons[@"isFocus"] longValue] == 0){
                    

                    [_httpClassProjectDynamic focusProjectselfSetProjectID:self.strProjectID up:1 token:_dataModelProjectDyanmic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                        
                        NSData *data = [operatioin responseData];
                        
                        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                        
                        //            NSLog(@"打印点赞返回%@",dic);
                        if([dic[@"status"] isEqualToString:@"success"]){
                            
                            [[ToolClass sharedInstance] showAlert:@"关注成功"];
                            if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                                [sender setImage:[UIImage imageNamed:@"details_Love@3x"] forState:UIControlStateNormal];
                            }else{
                                [sender setImage:[UIImage imageNamed:@"details_Love@2x"] forState:UIControlStateNormal];
                            }
                        }
                    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                        [[ToolClass sharedInstance] showAlert:@"关注失败，请检查网络"];
                    }];

                    
                }else{
                    
                    
                    [_httpClassProjectDynamic focusProjectselfSetProjectID:self.strProjectID up:0 token:_dataModelProjectDyanmic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
                        
                        NSData *data = [operatioin responseData];
                        
                        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                        
                        NSLog(@"打印点赞返回%@",dic);
                        if([dic[@"status"] isEqualToString:@"success"]){
                            
                            [[ToolClass sharedInstance] showAlert:@"取消关注成功"];
                            if([_iOSSizeDetails isEqualToString:@"iPhone6Plus"]){
                                [sender setImage:[UIImage imageNamed:@"details_UnLove@3x"] forState:UIControlStateNormal];
                            }else{
                                [sender setImage:[UIImage imageNamed:@"details_UnLove@2x"] forState:UIControlStateNormal];
                            }
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
    }];
    }
}

-(void)mediaPlayerGetInFull:(NSNotification *)notification{

    //保持比例
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    

    
//    CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation(M_PI / 2);
//    self.moviePlayer.view.transform = landscapeTransform;

//    [self.moviePlayer.view setFrame:CGRectMake(0, 0,_iOSDeviceDetails.height,_iOSDeviceDetails.width)];
    
//   [self.moviePlayer.view setFrame:CGRectMake(0, 0,160,90)];
    
//    //  旋转
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = YES;
    
    [self.moviePlayer play];
    
    
    
    
}



-(void)mediaPlayerGetInCloseFull:(NSNotification*)notification{
    
//    [self.moviePlayer.view setFrame:CGRectMake(0, 0,_iOSDeviceDetails.width + 10, _heightVideo)];
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;

//    CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation(M_PI / 4);
//    self.moviePlayer.view.transform = landscapeTransform;
    
//    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//    appDelegate.isRotation = NO;

    [self.moviePlayer play];
}

-(void)addNotification{
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(mediaPlayerGetInFull:) name:MPMoviePlayerDidEnterFullscreenNotification object:self.moviePlayer];

    NSNotificationCenter *notificationCenterClose=[NSNotificationCenter defaultCenter];
    [notificationCenterClose addObserver:self selector:@selector(mediaPlayerGetInCloseFull:) name:MPMoviePlayerDidExitFullscreenNotification object:self.moviePlayer];
}

-(void)buttonCancelWill{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)buttonJoinWill{
    
    if(_runtimesDetails != 1){
        
        _viewProjectDetails.hidden = NO;
        self.scrollView.scrollEnabled = NO;
        _viewButtons.hidden = YES;
        
    }else{
    
    [self performSegueWithIdentifier:@"JoinProjectSegue" sender:_aryChou];
        
    }
}

-(void)buttonShareWill{
    
    
    /*
    //微信个人分享
   // 注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [UMSocialData defaultData].extConfig.wechatSessionData.title = _strShareTitle;
//    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"http://www.huoban.io/project_detail.html?p_id=%@",];
    [[UMSocialControllerService defaultControllerService] setShareText:_strShareText shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_strShareImage]]] socialUIDelegate:self];
    
    //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
     */


    
    
    
    
    /*
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [[UMSocialControllerService defaultControllerService] setShareText:_strShareText shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_strShareImage]]] socialUIDelegate:self];
    
    //    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialYXMessageTypeImage;
    //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatTimeline].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://huoban.io";
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"测试title";
    */
    
    
    
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    [UMSocialData defaultData].extConfig.wechatSessionData.title = _strShareTitle;
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5629c5de67e58e4ea8002490"
                                      shareText:_strShareText
                                     shareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_strShareImage]]]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [NSString stringWithFormat:@"http://www.huoban.io/project_detail.html?p_id=%@",_strProjectID];
    
    
    
}
//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}


- (IBAction)buttonAllPreson:(id)sender {
    
    [self performSegueWithIdentifier:@"showHuobanPresonSegue" sender:nil];
}

-(void)buttonPaySegue:(UIButton*)sender{
    
    if(_runtimesDetails != 1){
        
        _viewProjectDetails.hidden = NO;
        self.scrollView.scrollEnabled = NO;
        _viewButtons.hidden = YES;
        
        
    }else{
    
    
//    if(_countDownData <= 0 ){
//        
//        [[ToolClass sharedInstance] showAlert:@"此项目众筹期已结束，你仍可以「关注」来加入项目社群喔"];
//        return;
//    }
    

    NSMutableDictionary *dicItem = _aryChou[sender.tag];
    
//    labelPresonCount.text = [NSString stringWithFormat:@"已支持%ld/%ld个名额",[dicChouItems[@"fact"] longValue],[dicChouItems[@"want"] longValue]];
    
    if([dicItem[@"fact"] longValue] - [dicItem[@"want"] longValue] == 0){
        
        [[ToolClass sharedInstance] showAlert:@"此档位已满，请选择其他档位支持"];
        return;
    }
    
    UIView *viewPayList = _aryPayView[sender.tag];
    viewPayList.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    
    UILabel *labelMoney = viewPayList.subviews[0];
    labelMoney.textColor = [UIColor whiteColor];
    
    UILabel *labelTitle = viewPayList.subviews[1];
    labelTitle.textColor =  [UIColor whiteColor];
    
    UILabel *labelContents = viewPayList.subviews[2];
    labelContents.textColor =[UIColor whiteColor];
    
    UILabel *labelSendTime = viewPayList.subviews[3];
    labelSendTime.textColor =[UIColor whiteColor];
    
    UILabel *labelPresonCount = viewPayList.subviews[4];
    labelPresonCount.textColor =[UIColor whiteColor];
    
    

    NSLog(@"%@",_aryChou[sender.tag]);
    [self performSegueWithIdentifier:@"PaySegue" sender:_aryChou[sender.tag]];
    NSLog(@"触发支付页");
        
    }
}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}


//
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;//隐藏为YES，显示为NO
//}
//
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

@end
