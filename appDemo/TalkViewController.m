//
//  TalkViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/23.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "TalkViewController.h"
#import "CommentSubmitBar.h"
#import "YcKeyBoardView.h"
#import "TalkTableViewCell.h"
#import "HttpClassSelf.h"
#import "DataModel.h"
#import "ToolClass.h"
#import "ImageSameWidth.h"
#import "MJRefresh.h"
#import "ProjectDetailsViewController.h"
#import "OtherUserInfoViewController.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "DynamicUpListTableViewController.h"

@interface TalkViewController ()<YFInputBarDelegate>

@end

@implementation TalkViewController

HttpClassSelf *_httpClassTalk;
DataModel *_dataModelTalk;

//CGFloat _heightLabel ;
//CGFloat _hetghtImage ;

CGFloat _heightCell ;

int _numFootPage ;

UIImage *_imageCell;

NSMutableArray *_aryTalkModel;
NSMutableArray *_aryGetTalkList;
NSArray *_aryImageSize;
CGSize _iOSSize;

NSCharacterSet * _subImageTalkStr;
NSString *strTEXTB;
NSString *_iOSSizeTalk;

NSInteger imageTalkHeight;
NSDateFormatter *_dateFormatterTalk;
NSDate *_dateTalk;
NSDate *_dateComment;

CGSize _sizeScorll;
CGSize _iOSDeviceSizeTalk;
NSMutableDictionary *_dicUser;

CGSize _labelTalkContenteSize;
NSInteger viewTalkHeight;

NSInteger _viewFocusPresonYYY;
NSMutableParagraphStyle * _paragraphSummarizeStyleTalk;
NSString *_strSendContents;

NSInteger _floatImageComment;
NSInteger _floatLabelComment;

NSTimeZone *_zoneTalk;
CommentSubmitBar *_inputBar;

UIView *_viewMoreSetting;
bool loveBool;
bool _viewModeSettingAppear;

NSMutableDictionary *_dicListNameList;

NSMutableDictionary *_dicLikePresonNameList;
NSMutableArray *_aryPresonMessageComment;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _floatImageComment = 0;
    _floatLabelComment = 0;
    
    self.imagePreson.clipsToBounds = YES;
    self.imagePreson.layer.cornerRadius = 22;
    
    self.imageContent.clipsToBounds = YES;
    self.imageContent.layer.cornerRadius = 8;
    
    _dateFormatterTalk = [[NSDateFormatter alloc] init];
    
    _aryPresonMessageComment = [[NSMutableArray alloc] init];
    
    [_dateFormatterTalk setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    _paragraphSummarizeStyleTalk =[[NSMutableParagraphStyle alloc]init];
    
    [_paragraphSummarizeStyleTalk setMinimumLineHeight:18];
    
     _zoneTalk = [NSTimeZone systemTimeZone];
    
    _dicListNameList = [[NSMutableDictionary alloc] init];
    
    self.imageContent.contentMode = UIViewContentModeScaleAspectFit;
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardTalkAppear) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardTalkHide) name:UIKeyboardWillHideNotification object:nil];

    _iOSSize = [UIScreen mainScreen].bounds.size;
    
//    _viewMoreSetting = [[UIView alloc] init];
//    _viewMoreSetting .hidden = YES;
    
    _inputBar = [[CommentSubmitBar alloc]initWithFrame:CGRectMake(0,_iOSSize.height - 50,_iOSSize.width,50)];

    _inputBar.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
//    _inputBar.layer.borderWidth = 1;
    _inputBar.delegate = self;
    _inputBar.clearInputWhenSend = YES;
    _inputBar.resignFirstResponderWhenSend = YES;
    
    [self.view addSubview:_inputBar];
    

//    self.buttonDelete.layer.borderWidth = 1;
//    self.buttonLove.layer.borderWidth = 1;
    
    if(self.keyBoardIsAppear == YES){
        
        [_inputBar.textField becomeFirstResponder];
        
        self.keyBoardIsAppear = NO;
        
    }else{
        
        [_inputBar.textField resignFirstResponder];
        
        self.keyBoardIsAppear = YES;
    }
    
     _iOSDeviceSizeTalk = [UIScreen mainScreen].bounds.size;
    
//    if(self.isDelete == YES){
//        
//        self.buttonMoreSetting.enabled = YES;
//        
//    }else{
//        
//        self.buttonMoreSetting.enabled = NO;
//        
//    }
    
//    _viewMoreSetting.hidden = YES;
//    
//    _viewMoreSetting.frame = CGRectMake(_iOSDeviceSizeTalk.width - 100,44,100,44);
//    
//    
//    _viewMoreSetting.backgroundColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1];
//    
//    [self.view addSubview:_viewMoreSetting];
//    
//    
//    UIButton * buttonDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [buttonDelete addTarget:self
//                     action:@selector(buttonDeleteClick:)
//           forControlEvents:UIControlEventTouchUpInside];
//    
//    [buttonDelete setTitle:@"删除" forState:UIControlStateNormal];
//    
//    buttonDelete.frame = CGRectMake(0,0,100,44);
//    
//    [buttonDelete.titleLabel setFont:[UIFont systemFontOfSize:14]];
//    
//    [buttonDelete setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
//
//    [_viewMoreSetting addSubview:buttonDelete];
    

    
    _httpClassTalk = [[HttpClassSelf alloc] init];
    
    _dataModelTalk = [[DataModel alloc] init];
    
    _aryTalkModel = [[NSMutableArray alloc] init];
    
    _subImageTalkStr = [NSCharacterSet characterSetWithCharactersInString:@"!*"];
    
    _iOSSizeTalk = _dataModelTalk.userInfomation.iOSDeviceSize;
    
    if([_iOSSizeTalk isEqualToString:@"iPhone6Plus"]){
        
        self.imageClose.image = [UIImage imageNamed:@"back_blue_3x"];
        self.imageDelete.image = [UIImage imageNamed:@"DeleteDynamic@3x"];
        
        
        imageTalkHeight = 398;
        
    }else if ([_iOSSizeTalk isEqualToString:@"iPhone6"]){
        
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
        self.imageDelete.image = [UIImage imageNamed:@"DeleteDynamic@2x"];
        
        imageTalkHeight = 359;
        
    }else{
        
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
        
        imageTalkHeight = 302;
    }
    
    //单个动态接口
    [_httpClassTalk getOneDynamic:self.strfeedID token:_dataModelTalk.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dicDynamicMessage = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([dicDynamicMessage[@"status"] isEqualToString:@"success"]){
            
        self.dicTalk = dicDynamicMessage[@"data"];
        
        if([self.dicTalk[@"image"] isEqualToString:@""]){
        
            self.imageContent.image = nil;
            
            _floatImageComment = 1;
            
            self.imageViewContentHeight.constant = 1;
            
            }else{
        
            _aryImageSize = [self.dicTalk[@"image"] componentsSeparatedByCharactersInSet:_subImageTalkStr];

            [self.imageContent sd_setImageWithURL:[NSURL URLWithString:self.dicTalk[@"image"] ] placeholderImage:nil];
                
            self.imageViewContentWidth.constant = 160/([_aryImageSize[2] floatValue]/[_aryImageSize[1] floatValue]);
            
                self.imageViewContentHeight.constant = 160;
                
                [self.imageContent sizeToFit];
                
                _floatImageComment = 160;

            }
            
            _dicLikePresonNameList = self.dicTalk[@"up"];
            
            if([_dicLikePresonNameList[@"count"] longValue] >= 1){
                
                _dicListNameList = _dicLikePresonNameList[@"users"][0];
                
                self.labelFocusPreson.text = [NSString stringWithFormat:@"%@ 等%li个伙伴喜欢",_dicListNameList[@"name"],[_dicLikePresonNameList[@"count"] longValue]];
                
            }
            
        
                    if([self.dicTalk[@"isUp"] longValue] == 1){
        
                                if([_iOSSizeTalk isEqualToString:@"iPhone6Plus"])
                                {
                                    self.imageLove.image = [UIImage imageNamed:@"women_like_blue_3x"];
                                }else{
        
                                    self.imageLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
                                }
                                loveBool = YES;
                            }else{
        
                                if([_iOSSizeTalk isEqualToString:@"iPhone6Plus"])
                                {
                                    self.imageLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                                }else{
        
                                    self.imageLove.image = [UIImage imageNamed:@"women_like_grey_2x"];
                                }
        
                                loveBool = NO;
        
                            }

                            _dateTalk = [_dateFormatterTalk dateFromString:[self.dicTalk[@"time"] substringToIndex:19]];

        NSInteger interval = [_zoneTalk secondsFromGMTForDate:_dateTalk];
        
        NSDate *dateTalk = [_dateTalk dateByAddingTimeInterval: interval];
        
        NSLog(@"%@",dateTalk);
        
        NSDate *dataNow = [NSDate date];
        
    NSInteger intervalNow = [_zoneTalk secondsFromGMTForDate:dataNow];
        
        NSDate *dateNow = [dataNow dateByAddingTimeInterval: intervalNow];
        
        if([dateNow timeIntervalSinceDate:dateTalk]/60 < 60){
        
        self.labelTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[dateNow timeIntervalSinceDate:dateTalk]/60] componentsSeparatedByString:@"."][0] ];
                                NSLog(@"%f天",[dateNow timeIntervalSinceDate:dateTalk]/86400);
        }else if([dateNow timeIntervalSinceDate:dateTalk]/3600 < 24 && [dateNow timeIntervalSinceDate:dateTalk]/3600 >= 1){
        
            self.labelTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[dateNow timeIntervalSinceDate:dateTalk]/3600] componentsSeparatedByString:@"."][0] ];
        
                                NSLog(@"%f小时",[dateNow timeIntervalSinceDate:dateTalk]/3600+ 8);
        
            }else if([dateNow timeIntervalSinceDate:dateTalk]/86400 < 30 && [dateNow timeIntervalSinceDate:dateTalk]/86400 >= 1){
                                self.labelTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[dateNow timeIntervalSinceDate:dateTalk]/86400 ] componentsSeparatedByString:@"."][0]];
        }else if([dateNow timeIntervalSinceDate:dateTalk]/2592000 >=1){
                                self.labelTime.text =[NSString stringWithFormat:@"%@个月前",[[NSString stringWithFormat:@"%f",[dateNow timeIntervalSinceDate:dateTalk]/2592000 ] componentsSeparatedByString:@"."][0]];
        }
        
        if([self.dicTalk[@"isCreator"] longValue] == 1){
                                self.isCreator.text = @"发起人";
                                [self.isCreator sizeToFit];
        }else{
                                self.isCreator.text = @"";
                                [self.isCreator sizeToFit];
            }
        
                            //contents
            NSMutableAttributedString  *strContents =[[NSMutableAttributedString alloc]initWithString: self.dicTalk[@"message"]];
        
        [strContents addAttribute:NSParagraphStyleAttributeName value:_paragraphSummarizeStyleTalk range:NSMakeRange(0, [ self.dicTalk[@"message"] length])];
        
            self.labelContent.attributedText = strContents;
                            [self.labelContent sizeToFit];
        
                _floatLabelComment = self.labelContent.frame.size.height;
        
                _dicUser = self.dicTalk[@"user"];
        
                self.labelBy.text = _dicUser[@"name"];
        
                [self.imagePreson sd_setImageWithURL:[NSURL URLWithString:_dicUser[@"image"]] placeholderImage:nil];
            
            if([_dicUser[@"_id"] isEqualToString:_dataModelTalk.userInfomation.UserID]){
                
                self.buttonDelete.hidden = NO;
                self.imageDelete.hidden = NO;
                
                self.buttonLoveRight.constant = 26;
                
            }else{
                self.buttonDelete.hidden = YES;
                self.imageDelete.hidden = YES;
                
                self.buttonLoveRight.constant = -18;
                
            }
            
                            
                NSMutableDictionary *dicProject = self.dicTalk[@"project"];
                            
                self.labelProjectName.text = [NSString stringWithFormat:@"@ %@",dicProject[@"title"]];
                            
                NSMutableDictionary *dicComment = self.dicTalk[@"comment"];
                            
                self.labelTalk.text = [NSString stringWithFormat:@"%lu个评论",[dicComment[@"count"] longValue]];
            
            [_httpClassTalk projectTalkSetFeed:self.dicTalk[@"_id"] numPage:0 numNum:500 token:_dataModelTalk.userInfomation.tokenID CallBackyes:^(MKNetworkOperation *operatioin){
                
                NSData *data = [operatioin responseData];
                NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                if([dic[@"status"]isEqualToString:@"success"]){
                    
                    _viewFocusPresonYYY = 12;
                    
                    //评论部分
                    for(int i = 0 ;i < [dic[@"data"] count];i++){
                        
                        NSMutableDictionary  *dicTalkData = dic[@"data"][[dic[@"data"] count] - (i + 1)];
                        
                        UIView *viewTalk = [[UIView alloc] initWithFrame:CGRectMake(12, _viewFocusPresonYYY,_iOSDeviceSizeTalk.width - 24,200)];
                        
                        [_aryPresonMessageComment addObject:dicTalkData];
                        //用户数据，User字段
                        NSMutableDictionary *dicUser = dicTalkData[@"user"];
                        
                        
                        //头像
                        UIImageView *imageViewPreson = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 44,44)];
                        [imageViewPreson sd_setImageWithURL:dicUser[@"image"] placeholderImage:nil];
                        imageViewPreson.clipsToBounds = YES;
                        imageViewPreson.layer.cornerRadius = 22;
                        imageViewPreson.contentMode = UIViewContentModeScaleAspectFit;
                        [viewTalk addSubview:imageViewPreson];
                        
                        
                        UIButton *buttonPresonComment = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                        
                        buttonPresonComment.frame = CGRectMake(-3,-3, 50, 50);
                        
                        [buttonPresonComment addTarget:self action:@selector(buttonPresonMessageOneProject:) forControlEvents:UIControlEventTouchUpInside];
                        buttonPresonComment.tag = i;
                        
                        [viewTalk addSubview:buttonPresonComment];
                        //人名
                        UILabel *labelPresonName = [[UILabel alloc] initWithFrame:CGRectMake(50,3,150,12)];
                        labelPresonName.text = dicUser[@"name"];
                        labelPresonName.font = [UIFont boldSystemFontOfSize:14.7];
                        labelPresonName.textColor = [UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1];
                        
                        [viewTalk addSubview:labelPresonName];
                        
                        
                        
                                    _dateComment = [_dateFormatterTalk dateFromString:[dicTalkData[@"time"] substringToIndex:19]];
                        
                                    NSInteger intervalTalk = [_zoneTalk secondsFromGMTForDate:_dateComment];
                        
                                    NSDate *dateTalkTime = [_dateComment dateByAddingTimeInterval: intervalTalk];
                        
                        UILabel *labelTalkTime = [[UILabel alloc] initWithFrame:CGRectMake(viewTalk.frame.size.width - 150, 3,150,12)];
                        labelTalkTime.font = [UIFont systemFontOfSize:12];
                        labelTalkTime.textColor = [UIColor colorWithRed:154.0/255 green:154.0/255 blue:154.0/255 alpha:1];
                        
                        labelTalkTime.textAlignment = NSTextAlignmentRight;
//                        labelTalkTime.text = @"回复";
                                    labelTalkTime.text = [NSString stringWithFormat:@"%@ %@",                                [[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:5] substringToIndex:5],[[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:11] substringToIndex:5]];
                        [viewTalk addSubview:labelTalkTime];
                        
//                        UIButton *buttonAnswer = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//                        buttonAnswer.frame = CGRectMake(viewTalk.frame.size.width - 150, 3,150,12);
//                        buttonAnswer.tag = i;
//                        [buttonAnswer addTarget:self action:@selector(buttonAnswerClick:) forControlEvents:UIControlEventTouchUpInside];
//                        [viewTalk addSubview:buttonAnswer];
//     
                        
                        //contents
                        NSMutableAttributedString  *strContents =[[NSMutableAttributedString alloc]initWithString:dicTalkData[@"message"]];
                        
                        [strContents addAttribute:NSParagraphStyleAttributeName value:_paragraphSummarizeStyleTalk range:NSMakeRange(0, [dicTalkData[@"message"]length])];
                        
                        
                        UILabel *labeTalkContent = [[UILabel alloc] initWithFrame:CGRectMake(50,21,viewTalk.frame.size.width - 39, 1)];
                        
                        labeTalkContent.attributedText = strContents;
                        labeTalkContent.textColor = [UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1];
                        
                        
                        labeTalkContent.textAlignment = NSTextAlignmentNatural;
                        [labeTalkContent setNumberOfLines:0];
                        
                        _labelTalkContenteSize=  [ImageSameWidth getSizeWithStr:[NSString stringWithFormat:@"%@",strContents] width:viewTalk.frame.size.width - 45 font:14.7];
                        
                        labeTalkContent.font = [UIFont systemFontOfSize:14.7];
                        
                        labeTalkContent.textColor = [UIColor colorWithRed:33.0/255 green:33.0/255 blue:33.0/255 alpha:1];
                        
                        labeTalkContent.frame =CGRectMake(50,24,viewTalk.frame.size.width - 45,_labelTalkContenteSize.height);
                        
                        [labeTalkContent sizeToFit];
                        
                        [viewTalk addSubview:labeTalkContent];
                        
                        viewTalk.frame = CGRectMake(12, _viewFocusPresonYYY,_iOSDeviceSizeTalk.width - 24,labeTalkContent.frame.size.height + labelPresonName.frame.size.height + 6);
                        
                        
                        [self.viewComment addSubview:viewTalk];
                        
                        _viewFocusPresonYYY += viewTalk.frame.size.height +  24;
                        
                        if( i == [dic[@"data"] count] - 1){
                            
                            viewTalkHeight = viewTalk.frame.size.height;
                            
                        }
                        _sizeScorll = CGSizeMake(_iOSDeviceSizeTalk.width, _viewFocusPresonYYY + _floatImageComment + _floatLabelComment + viewTalkHeight + 133);
                        
                        
                    }
                    
                    //没有评论时
                    if([dic[@"data"] count] == 0){
                        _sizeScorll = CGSizeMake(_iOSDeviceSizeTalk.width,_floatImageComment + _floatLabelComment + 133);
                        
                    }
                    
                    self.scrollViewTalk.contentSize = _sizeScorll;
                    
                }else{
                    
                    [[ToolClass sharedInstance] showAlert:@"获取评论数据失败,服务器错误"];
                    
                }
                
            }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                
                [[ToolClass sharedInstance] showAlert:@"获取评论数据失败,请检查网络"];
                
            }];
            
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        [[ToolClass sharedInstance] showAlert:@"获取数据失败,请检查网络"];
        
    }];
   }

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.scrollViewTalk.contentSize = _sizeScorll;
    
    _viewModeSettingAppear = NO;
    
//    self.scrollViewTalk.layer.borderWidth = 2;
//    self.scrollViewTalk.layer.borderColor = [UIColor redColor].CGColor;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)inputBar:(CommentSubmitBar *)inputBar sendBtnPress:(UIButton *)sendBtn withInputString:(NSString *)str
{
    
    if(![str isEqualToString:@""]){
    
    [_httpClassTalk commentProjectselDynamicSetFeed:self.dicTalk[@"_id"] strToken:_dataModelTalk.userInfomation.tokenID message:str CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
       
        if([dic[@"status"] isEqualToString:@"success"]){
            
            _strSendContents = str;
            
            [[ToolClass sharedInstance] showAlert:@"发布评论成功"];
            
            [self addTalkList];
        }else{
            [[ToolClass sharedInstance] showAlert:@"发布评论失败,服务器错误"];
        }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"发布评论失败,请检查网络"];
    }];
    }else{
        
        [[ToolClass sharedInstance] showAlert:@"评论不可为空~"];
        
    }
    
}

-(void)inputBarAnswerComment:(CommentSubmitBar *)inputBar sendBtnPress:(UIButton *)sendBtn withInputString:(NSString *)str strCommentID:(NSString *)strCommentID{
    
    if(![str isEqualToString:@""]){
        
        DataModel *dataComment = [[DataModel alloc] init];
        
        [_httpClassTalk answerComment:strCommentID token:dataComment.userInfomation.tokenID message:str CallBackYES:^(MKNetworkOperation *operatioin){
            NSData *data = [operatioin responseData];
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            if([dic[@"status"] isEqualToString:@"success"]){
                
                NSLog(@"回复评论成功");
                [self addTalkList];
            }else{
                [[ToolClass sharedInstance] showAlert:@"发布评论失败,服务器错误"];
            }

            
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            
            
        }];
    }
    
    
}


-(void)buttonAnswerClick:(UIButton*)sender{
    
    NSMutableDictionary *dicAnswer = _aryPresonMessageComment[sender.tag];
    
    NSMutableDictionary *dicUser = dicAnswer[@"user"];
    
    [_inputBar CommentBecome:dicUser[@"name"] strCommentID:dicAnswer[@"_id"] isAns:YES];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"PushProject"]){
        

    }else if([segue.identifier isEqualToString:@"ShowUpPresonListSegue"]){
        
        UINavigationController *naVC =segue.destinationViewController;
        
        DynamicUpListTableViewController *controller = (DynamicUpListTableViewController*)naVC.topViewController;
        
        controller.aryUpList = sender;
        
    }else if([segue.identifier isEqualToString:@"otherUserSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        OtherUserInfoViewController *controller = (OtherUserInfoViewController*)naVC.topViewController;
        
        NSLog(@"%@",sender);
        
        controller.dicOtherUser = sender;
        
    }
}

- (IBAction)buttonTopUp:(id)sender {
        [_inputBar.textField resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((UIView*)obj) resignFirstResponder];
    }];
}

-(void)imagePresonClick:(UITapGestureRecognizer *)sender{
    
    NSMutableDictionary *dicUser = self.dicTalk[@"user"];
    
    [self performSegueWithIdentifier:@"otherUserSegue" sender:dicUser];
}

- (IBAction)buttonKeyBoardCancel:(id)sender {
    [_inputBar.textField resignFirstResponder];
}

-(void)keyboardTalkAppear{
    
    // 键盘的frame
//    CGSize iOSDeviceSize = [UIScreen mainScreen].bounds.size;

    //textField 54
    
        _sizeScorll = CGSizeMake(_iOSDeviceSizeTalk.width, self.scrollViewTalk.contentSize.height + 200);
        self.scrollViewTalk.contentSize = _sizeScorll;
}

-(void)keyboardTalkHide{
    _sizeScorll = CGSizeMake(_iOSDeviceSizeTalk.width, self.scrollViewTalk.contentSize.height - 200);
    self.scrollViewTalk.contentSize = _sizeScorll;
}

- (IBAction)buttonCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonLove:(id)sender {
    
//    NSLog(@"点击了「喜欢」按钮");
    
    loveBool = !loveBool;
    
    if(loveBool == YES){
        
        [_httpClassTalk loveProjectselfSetFeed:self.dicTalk[@"_id"] up:1 token:_dataModelTalk.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            if([dicData[@"status"] isEqualToString:@"success"]){
                
                if([_iOSSizeTalk isEqualToString:@"iPhone6Plus"]){
                    
                    self.imageLove.image = [UIImage imageNamed:@"women_like_blue_3x"];
                    
                }else{
                    
                    self.imageLove.image = [UIImage imageNamed:@"women_like_blue_2x"];
                    
                }
                
           
                
            }else{
                [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，服务器错误"];
            }
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance]showAlert:@"'喜欢'失败，请检查网络"];
        }];
        

    }else{
        [_httpClassTalk loveProjectselfSetFeed:self.dicTalk[@"_id"] up:0 token:_dataModelTalk.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            if([dicData[@"status"] isEqualToString:@"success"]){
                
                if([_iOSSizeTalk isEqualToString:@"iPhone6Plus"])
                {
                    self.imageLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                }else{
                    
                    self.imageLove.image = [UIImage imageNamed:@"women_like_grey_3x"];
                }
                
//                self.labelLove.text = [NSString stringWithFormat:@"%lld个喜欢",[[self.labelLove.text substringToIndex:[self.labelLove.text length]-3] longLongValue] - 1];
                
                
            }else{
                [[ToolClass sharedInstance]showAlert:@"取消'喜欢'失败，服务器错误"];
            }
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance]showAlert:@"取消'喜欢'失败，请检查网络"];
        }];
    }
}

- (IBAction)buttonTalk:(id)sender {
    
//    NSLog(@"点击了「评论」按钮");
    self.keyBoardIsAppear = !self.keyBoardIsAppear;
    
    if(self.keyBoardIsAppear == YES){
        
        [_inputBar.textField becomeFirstResponder];
        

        
    }else{
        
        [_inputBar.textField resignFirstResponder];
        
//        self.keyBoardIsAppear = YES;
    }
}

- (IBAction)buttonUpList:(id)sender {
    
    NSMutableArray *aryupList = [[NSMutableArray alloc] init];
    
    for(NSMutableDictionary *dic in _dicLikePresonNameList[@"users"]){
        
        
        [aryupList addObject:dic];
    }
    
    
    [self performSegueWithIdentifier:@"ShowUpPresonListSegue" sender:aryupList];
}

-(void)buttonPresonMessageOneProject:(UIButton*)sender{
    
    NSMutableDictionary *dicPresonMessage = _aryPresonMessageComment[sender.tag];
    
    NSMutableDictionary *dicAnswer = dicPresonMessage[@"user"];
    
    NSLog(@"%@",dicPresonMessage);
    
    [self performSegueWithIdentifier:@"otherUserSegue" sender:dicAnswer];
}

-(IBAction)buttonBy:(id)sender{
    
    [self performSegueWithIdentifier:@"otherUserSegue" sender:_dicUser];
    
}
- (IBAction)keyBoardCancel:(id)sender {
    
    self.keyBoardIsAppear = NO;
    [_inputBar.textField resignFirstResponder];
    self.scrollViewTalk.contentSize = _sizeScorll;
    
}
-(void)addTalkList{
    DataModel *dataModelSendTalk = [[DataModel alloc] init];
    
    
    
    UIView *viewTalk = [[UIView alloc] initWithFrame:CGRectMake(12, _viewFocusPresonYYY,_iOSDeviceSizeTalk.width - 24,200)];

    
    //头像
    UIImageView *imageViewPreson = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 36,36)];
    [imageViewPreson sd_setImageWithURL:[NSURL URLWithString:dataModelSendTalk.userInfomation.ImagePreson] placeholderImage:nil];
    imageViewPreson.clipsToBounds = YES;
    imageViewPreson.layer.cornerRadius = 18;
    imageViewPreson.contentMode = UIViewContentModeScaleAspectFill;
    [viewTalk addSubview:imageViewPreson];
    
    //人名
    UILabel *labelPresonName = [[UILabel alloc] initWithFrame:CGRectMake(39,3,150,12)];
    labelPresonName.text = dataModelSendTalk.userInfomation.Name;
    labelPresonName.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
    labelPresonName.textColor = [UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1];
    
    //            labelPresonName.layer.borderWidth = 1;
    
    [viewTalk addSubview:labelPresonName];
    
    //contents
    NSMutableAttributedString  *strContents =[[NSMutableAttributedString alloc]initWithString:_strSendContents];
    
    [strContents addAttribute:NSParagraphStyleAttributeName value:_paragraphSummarizeStyleTalk range:NSMakeRange(0, [_strSendContents length])];
    
    
    NSDate *dateTalkNewComment = [NSDate date];
    
    NSInteger intervalTalk = [_zoneTalk secondsFromGMTForDate:dateTalkNewComment];
    
    NSDate *dateTalkTime = [dateTalkNewComment dateByAddingTimeInterval: intervalTalk];
    
    UILabel *labelTalkTime = [[UILabel alloc] initWithFrame:CGRectMake(viewTalk.frame.size.width - 150, 3,150,9)];
    labelTalkTime.font = [UIFont systemFontOfSize:9];
    labelTalkTime.textColor = [UIColor colorWithRed:154.0/255 green:154.0/255 blue:154.0/255 alpha:1];
    //                                labelTalkTime.layer.borderWidth = 0.5;
    
    labelTalkTime.textAlignment = NSTextAlignmentRight;
    //                                NSLog(@"%@----%@",[[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:5] substringToIndex:5],                                [[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:11] substringToIndex:5]);
    
    labelTalkTime.text = [NSString stringWithFormat:@"%@ %@",                                [[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:5] substringToIndex:5],[[[NSString stringWithFormat:@"%@",dateTalkTime] substringFromIndex:11] substringToIndex:5]];
    [viewTalk addSubview:labelTalkTime];
    
    
    

    UILabel *labeTalkContent = [[UILabel alloc] initWithFrame:CGRectMake(39,6,viewTalk.frame.size.width - 39, 1)];
    
    labeTalkContent.attributedText = strContents;
    labeTalkContent.textColor = [UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1];
    
    //            labeTalkContent.layer.borderWidth = 2;
    labeTalkContent.textAlignment = NSTextAlignmentNatural;
    [labeTalkContent setNumberOfLines:0];
    
    _labelTalkContenteSize=  [ImageSameWidth getSizeWithStr:[NSString stringWithFormat:@"%@",strContents] width:viewTalk.frame.size.width - 39 font:12];
    
    labeTalkContent.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    
    labeTalkContent.frame =CGRectMake(39,15,viewTalk.frame.size.width - 39,_labelTalkContenteSize.height);
    
    [labeTalkContent sizeToFit];
    
    [viewTalk addSubview:labeTalkContent];
    
    viewTalk.frame = CGRectMake(12, _viewFocusPresonYYY,_iOSDeviceSizeTalk.width - 24,labeTalkContent.frame.size.height + labelPresonName.frame.size.height + 6);
    
    
    [self.scrollViewTalk addSubview:viewTalk];
    
    _viewFocusPresonYYY += viewTalk.frame.size.height +  18;

}
-(void)buttonDeleteClick:(UIButton*)sender{
    
        DataModel *dataModelDeleteDynamic = [[DataModel alloc] init];
    
        [_httpClassTalk deleteProjectDynamic:self.strfeedID token:dataModelDeleteDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
    
            NSData *data = [operatioin responseData];
    
            NSMutableDictionary *dicDelete = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
            if([dicDelete[@"status"] isEqualToString:@"success"]){
    
                [[ToolClass sharedInstance] showAlert:@"删除动态成功"];
    
//                [self.delegate talkViewControllerDeleteDynamic:self];
                
            }else{
    
            [[ToolClass sharedInstance] showAlert:@"删除动态失败，服务器错误"];
    
            }
    
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
    
            [[ToolClass sharedInstance] showAlert:@"删除动态失败，请检查网络"];
        }];
    //
    
    
}
- (IBAction)buttonDelete:(id)sender {
}
@end
