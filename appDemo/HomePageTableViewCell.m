//
//  MainTableViewCell.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/6.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "MCFireworksButton.h"
#import "MCFireworksView.h"
#import "SDCollectionViewCell.h"
#import "SDCycleScrollView.h"
#import "DataModel.h"
#import "DataModelHomeSilder.h"
#import "ImageSameWidth.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "TYMProgressBarView.h"



@implementation HomePageTableViewCell
@synthesize MainImage,buttoncase,buttonPerson,buttonDate,buttonCountry,buttonType,progressView,imageWeightMain,textPercentage,progressViewHeight,labelProgress,textSummarize,HomePageProgressBarView,progressLabel,imageViewRightWeight,labelByTop,imageLove,textBy,textLabel,textSunmarizeDown,textTitle,textButtonDown,imageJoined;

DataModel * _dataModelHomePageImage;
CGFloat _widthImage;
NSString *_striOSSizeHomePageCell;
NSDateFormatter *_dateFormatter;
CGSize  iOSBoundsHomePage;
CGFloat _widthButtons;
float _floatPercentageHome;
NSMutableAttributedString  *_strAttributContents;
NSMutableParagraphStyle * _paragraphStyleHomePage;

bool _buttonTypeBool;
bool _buttonCountryBool;
bool _buttonPresonBool;
bool _buttonDateBool;

NSDate *_dateNowHomePage;

//bool _button

- (void)awakeFromNib {
    // Initialization code
    
    _dataModelHomePageImage  = [[DataModel alloc] init];
    
//    [self.buttonType setBackgroundImage:[UIImage imageNamed:@"homeButtonTouchInSide@2x@2x"] forState:UIControlEventTouchUpInside];
    
    _buttonTypeBool = NO;
    _buttonCountryBool = NO;
    _buttonPresonBool = NO;
    _buttonDateBool = NO;
    
       iOSBoundsHomePage = [UIScreen mainScreen].bounds.size;
    
    self.buttonCountry.enabled = NO;
    self.buttonDate.enabled = NO;
    self.buttonPerson.enabled = NO;
    self.buttonType.enabled = NO;
    
//    [self.buttonType setBackgroundImage:[UIImage imageNamed:@"homeButtonTouchInSide@2x"] forState:UIControlStateHighlighted];
//    [self.buttonCountry setBackgroundImage:[UIImage imageNamed:@"homeButtonTouchInSide@2x"] forState:UIControlStateHighlighted];
//    [self.buttonDate setBackgroundImage:[UIImage imageNamed:@"homeButtonTouchInSide@2x"] forState:UIControlStateHighlighted];
//    [self.buttonPerson setBackgroundImage:[UIImage imageNamed:@"homeButtonTouchInSide@2x"] forState:UIControlStateHighlighted];

    _striOSSizeHomePageCell = _dataModelHomePageImage.userInfomation.iOSDeviceSize;

    self.progressView.clipsToBounds = YES;
    
    if([_striOSSizeHomePageCell isEqualToString:@"iPhone6Plus"]){
        
        self.imageJoined.image = [UIImage imageNamed:@"ProjectJoined@3x"];
    
    }else{
        
        self.imageJoined.image = [UIImage imageNamed:@"ProjectJoined@2x"];
        
    }
    
    self.imageJoined.hidden = YES;
//        labelByTop.constant = 40;
        
        //title到简介
//        textSunmarizeDown.constant = 20;
//        
//        //简介到button
//        textButtonDown.constant = 35;

        
//        imageWeightMain.constant = 190;
//        self.textTitle.font = [UIFont systemFontOfSize:17];
//        self.textBy.font = [UIFont systemFontOfSize:13];
//        self.textSummarize.font = [UIFont systemFontOfSize:13];
//        [self.buttonCountry.titleLabel setFont:[UIFont systemFontOfSize:13]];
//        self.buttonCountry.titleLabel.font = [UIFont systemFontOfSize:13];
//        self.buttonDate.titleLabel.font = [UIFont systemFontOfSize:13];
//        self.buttonPerson.titleLabel.font = [UIFont systemFontOfSize:13];
//        self.buttonType.titleLabel.font = [UIFont systemFontOfSize:13];
//        self.textPercentage.font = [UIFont systemFontOfSize:13];
//        self.progressViewHeight.constant = 18;
//        self.progressView.layer.cornerRadius = 9;
        
        

    
//    self.HomePageProgressBarView = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(180, 69.5,192, 18.0f)];
    self.HomePageProgressBarView = [[TYMProgressBarView alloc] init];
    
    self.HomePageProgressBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    //进度条起始点0.13
    self.HomePageProgressBarView.barBorderWidth = 0.0f;
    
    self.HomePageProgressBarView.barFillColor = [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:1];
    self.HomePageProgressBarView.barInnerPadding = 0.0f;

    self.HomePageProgressBarView.progress = 1;
    
    [self addSubview:self.HomePageProgressBarView];
    
    //百分比起始点6
    
    //IPHONE6 进度条文字位置打满160
//    self.progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(160,1.5,50,15)];
    
    self.progressLabel = [[UILabel alloc] init];
    
//    self.progressLabel.text = @"100%";

    [progressLabel setTextColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]];
    
    progressLabel.font=[UIFont systemFontOfSize:9];
    
    progressLabel.adjustsFontSizeToFitWidth=YES;
    
    [self.HomePageProgressBarView addSubview:progressLabel];
    
    
    //长按时如果移动手指，则认为不是长按时间。
//    UILongPressGestureRecognizer *personBT = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(clickLongTime:)];
//    personBT.numberOfTouchesRequired = 1;
//    personBT.minimumPressDuration = 0.5f;  //时间定义为2秒
//    personBT.cancelsTouchesInView = NO;
//    personBT.allowableMovement = 10.0f;//设置长按时允许手指移动10px
//    
//    UILongPressGestureRecognizer *typeBT = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(clickLongTime:)];
//    typeBT.numberOfTouchesRequired = 1;
//    typeBT.minimumPressDuration = 0.5f;  //时间定义为2秒
//    typeBT.cancelsTouchesInView = NO;
//    typeBT.allowableMovement = 10.0f;//设置长按时允许手指移动10px
//    
//    UILongPressGestureRecognizer *countryBT = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(clickLongTime:)];
//    countryBT.numberOfTouchesRequired = 1;
//    countryBT.minimumPressDuration = 0.5f;  //时间定义为2秒
//    countryBT.cancelsTouchesInView = NO;
//    countryBT.allowableMovement = 10.0f;//设置长按时允许手指移动10px
//    
//    UILongPressGestureRecognizer *dateBT = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(clickLongTime:)];
//    dateBT.numberOfTouchesRequired = 1;
//    dateBT.minimumPressDuration = 0.5f;  //时间定义为2秒
//    dateBT.cancelsTouchesInView = NO;
//    dateBT.allowableMovement = 10.0f;//设置长按时允许手指移动10px
//
//    [self.buttonCountry addGestureRecognizer:countryBT];
//        [self.buttonDate addGestureRecognizer:dateBT];
//        [self.buttonPerson addGestureRecognizer:personBT];
//        [self.buttonType addGestureRecognizer:typeBT];
            
//    [self.MainImage setFrame:CGRectMake(self.MainImage.frame.origin.x,self.MainImage.frame.origin.y,_widthImage, self.MainImage.frame.size.height)];
    
    //大图圆角
    self.MainImage.layer.masksToBounds = YES;
    self.MainImage.layer.cornerRadius = 8;
    
    self.buttonCountry.layer.masksToBounds = YES;
    self.buttonCountry.layer.cornerRadius = 8;
    
    self.buttonDate.clipsToBounds = YES;
    self.buttonDate.layer.cornerRadius = 8;
    
    self.buttonType.clipsToBounds = YES;
    self.buttonType.layer.cornerRadius = 8;
    
    self.buttonPerson.clipsToBounds = YES;
    self.buttonPerson.layer.cornerRadius = 8;
    
    
    
    /*
     UIViewContentModeScaleToFill
     UIViewContentModeScaleAspectFit
     UIViewContentModeScaleAspectFill
     UIViewContentModeRedraw
     UIViewContentModeCenter
     UIViewContentModeTop
     UIViewContentModeBottom
     UIViewContentModeLeft
     UIViewContentModeRight
     UIViewContentModeTopLeft
     UIViewContentModeTopRight
     UIViewContentModeBottomLeft
     UIViewContentModeBottomRight
     */
    
    self.MainImage.clipsToBounds = YES;
    self.MainImage.contentMode = UIViewContentModeScaleAspectFill;
//    self.MainImage.contentMode = UIViewContentModeScaleToFill;
    
    
}

//-(void)clickLongTime:(UILongPressGestureRecognizer *)longPress{
//
//    if (longPress.state == UIGestureRecognizerStateEnded)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                        message:@"长按按钮"
//                                                       delegate:self
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil, nil];
//        [alert show];
//        
//    }
//    
//}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

-(void)setDataModelCard:(DataModelHomeCard *)dataModelCard{
    
    _dateNowHomePage = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate:_dateNowHomePage];
    
    NSDate *_dateNowNowNow = [_dateNowHomePage dateByAddingTimeInterval: interval];

//    self.imageViewRightWeight.constant = 300;
    //主页名称改成数组数组
    //    self.textBy.text = [NSString stringWithFormat:@"%@",dataModelCard.dicCreate[@"name"]];
    NSString *addName = @"";
    
    for(NSMutableDictionary  *dicCreatorName in dataModelCard.dicCreate){
        
        addName =   [addName stringByAppendingString:[NSString stringWithFormat:@"%@ ",dicCreatorName[@"name"]]];
    }
    
    NSLog(@"%@",addName);
    
    self.textBy.text = [NSString stringWithFormat:@"by %@",addName];
    
    _strAttributContents =[[NSMutableAttributedString alloc]initWithString:dataModelCard.desc];
    _paragraphStyleHomePage =[[NSMutableParagraphStyle alloc]init];
    
    [_paragraphStyleHomePage setMinimumLineHeight:12];
    
    
    [_strAttributContents addAttribute:NSParagraphStyleAttributeName value:_paragraphStyleHomePage range:NSMakeRange(0, [dataModelCard.desc length])];
    
    
    [self.buttonCountry setTitle:[NSString stringWithFormat:@" %@ ",dataModelCard.address] forState:UIControlStateNormal];
    
    self.textTitle.text = dataModelCard.title;
    
//    NSLog(@"先打印今天今天%@-----打印结束日期%@------打印相差天数%i",_dateNowNowNow,dataModelCard.endData,(int)[dataModelCard.endData timeIntervalSinceDate:_dateNowHomePage]/86400);
    
    self.textSummarize.attributedText = _strAttributContents;
    
    [self.buttonPerson setTitle:[NSString stringWithFormat:@"  %lu个火伴  ",dataModelCard.factPreson] forState:UIControlStateNormal];
    [self.buttonType setTitle:[NSString stringWithFormat:@" %@ ",dataModelCard.type] forState:UIControlStateNormal];
    
    _widthButtons = self.buttonCountry.frame.size.width + self.buttonDate.frame.size.width + self.buttonPerson.frame.size.width + self.buttonType.frame.size.width + 11;
    
    self.imageViewRightWeight.constant = _widthButtons;
    
    _floatPercentageHome = dataModelCard.factMoney/dataModelCard.wantedMoney;
    
//    NSLog(@"%f---%f",dataModelCard.factMoney,dataModelCard.wantedMoney);
//    
//    NSLog(@"%f",_widthButtons);

    

    
    if([_striOSSizeHomePageCell isEqualToString:@"iPhone6"]){
        
        self.HomePageProgressBarView.frame = CGRectMake(iOSBoundsHomePage.width - _widthButtons - 5 , 117, _widthButtons, 15.0f);
    
    }else if([_striOSSizeHomePageCell isEqualToString:@"iPhone6Plus"] ){
        
        
        self.HomePageProgressBarView.frame = CGRectMake(iOSBoundsHomePage.width - _widthButtons - 5 , 135, _widthButtons, 15.0f);
        
    }else if([_striOSSizeHomePageCell isEqualToString:@"iPhone5"] ){
           self.HomePageProgressBarView.frame = CGRectMake(iOSBoundsHomePage.width - _widthButtons - 5 , 81, _widthButtons, 15.0f);
    }else if([_striOSSizeHomePageCell isEqualToString:@"iPhone4"] ){
        
        self.HomePageProgressBarView.frame = CGRectMake(iOSBoundsHomePage.width - _widthButtons - 5 , 81, _widthButtons, 15.0f);
    }
    

    
//    NSLog(@"%f--------%f",_floatPercentageHome,round(_floatPercentageHome * 100));
    
    if(_floatPercentageHome * 100 >= 0 && _floatPercentageHome * 100 < 10){
        

        
        //百分比文字位置
        self.progressLabel.frame = CGRectMake(6,2.5,50,15);
        
        //百分比文字内容
        self.progressLabel.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentageHome * 100)] substringToIndex:1]];
        

        
        [self.progressLabel sizeToFit];
        //进度条位置
         self.HomePageProgressBarView.progress = 0.16;
        

    }else if(_floatPercentageHome * 100 >= 10 && _floatPercentageHome * 100 < 21){
        
        //百分比文字位置
        self.progressLabel.frame = CGRectMake(6,2.5,50,15);
        
        //百分比文字内容
        self.progressLabel.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentageHome * 100)] substringToIndex:2]];

        
        
        [self.progressLabel sizeToFit];
        //进度条位置
        self.HomePageProgressBarView.progress = 0.18;
        
    }else if(_floatPercentageHome * 100 >= 21 && _floatPercentageHome * 100 < 90){
        
        //百分比文字
        self.progressLabel.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentageHome * 100)] substringToIndex:2]];
        
        //百分比文字位置
        self.progressLabel.frame = CGRectMake(self.HomePageProgressBarView.frame.size.width * _floatPercentageHome - 26,2.5,50,15);

            [self.progressLabel sizeToFit];
//        self.progressLabel.frame = CGRectMake(3,1.5 ,50,15);
        //进度条进度
        self.HomePageProgressBarView.progress = _floatPercentageHome ;
        
//                self.HomePageProgressBarView.progress = 0;
        
    }else if(_floatPercentageHome * 100 >= 90 && _floatPercentageHome * 100 <100){
        
        
        NSLog(@"%f",_floatPercentageHome * 100);
        
        //百分比文字
        self.progressLabel.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentageHome * 100)] substringToIndex:3]];

        
        //百分比文字位置
        self.progressLabel.frame = CGRectMake(self.HomePageProgressBarView.frame.size.width * _floatPercentageHome - 30,2.5,50,15);
        
        [self.progressLabel sizeToFit];

        //进度条进度
//        self.HomePageProgressBarView.progress = _floatPercentageHome;

        
        //百分比文字
//        self.progressLabel.text = @"100%";
//        self.progressLabel.frame = CGRectMake(_floatPercentageHome - 6,0,50,15);
        self.HomePageProgressBarView.progress = _floatPercentageHome;
        
    }else if(_floatPercentageHome * 100 >= 100){
        
        
        NSLog(@"%f",_floatPercentageHome * 100);
        
        //百分比文字
        self.progressLabel.text = [NSString stringWithFormat:@"%@%%",[[NSString stringWithFormat:@"%f",round(_floatPercentageHome * 100)] substringToIndex:3]];

        
        //百分比文字位置
        [self.progressLabel sizeToFit];
        self.progressLabel.frame = CGRectMake(self.HomePageProgressBarView.frame.size.width - self.progressLabel.frame.size.width - 6 ,2.5,self.progressLabel.frame.size.width,self.progressLabel.frame.size.height);

        self.HomePageProgressBarView.progress = 1;
        
    }
    
    if((int)[dataModelCard.endData timeIntervalSinceDate:_dateNowNowNow]/86400 <= 0 && _floatPercentageHome * 100 >= 100){
        
        [self.buttonDate setTitle:@" 已成功 " forState:UIControlStateNormal];
        
    }else if((int)[dataModelCard.endData timeIntervalSinceDate:_dateNowNowNow]/86400 <= 0 && _floatPercentageHome * 100 < 100){
        
        [self.buttonDate setTitle:@" 已结束 " forState:UIControlStateNormal];
    }else{
        
        [self.buttonDate setTitle:[NSString stringWithFormat:@"  剩余%i天  ",((int)[dataModelCard.endData timeIntervalSinceDate:_dateNowNowNow]/86400)] forState:UIControlStateNormal];
    }


//    self.MainImage.image = [ImageSameWidth imageCompressForWidth:[UIImage imageWithData:[NSData
//dataWithContentsOfURL:[NSURL URLWithString:dataModelCard.images[0]]]] targetWidth:_widthImage];
//    NSString *iOSSize = _dataModelHomePageImage.userInfomation.iOSDeviceSize;
    
    [self.MainImage sd_setImageWithURL:[NSURL URLWithString:dataModelCard.images[0]]];
    
//    
    if(dataModelCard.isJoin == 1){
        
        self.buttoncase.hidden = YES;
        self.imageJoined.hidden = NO;
        
    }else{
        self.buttoncase.hidden = NO;
        self.imageJoined.hidden = YES;
        
    }
    
//    self.MainImage.image = [ImageSameWidth imageCompressForWidth:uiIM targetWidth:self.MainImage.frame.size.width];

//    if(dataModelCard.isFocus == 0){
//        if([iOSSize isEqualToString:@"iPhonePlus"]){
//            [self.buttoncase setImage:[UIImage imageNamed:@"loveNO@3x"] forState:UIControlStateNormal];
//        }else{
//            [self.buttoncase setImage:[UIImage imageNamed:@"loveNO@2x"] forState:UIControlStateNormal];
//        }
//    }else if(dataModelCard.isFocus == 1){
//        if([iOSSize isEqualToString:@"iPhonePlus"]){
//            [self.buttoncase setImage:[UIImage imageNamed:@"loveYES@3x"] forState:UIControlStateNormal];
//        }else{
//            [self.buttoncase setImage:[UIImage imageNamed:@"loveYES@2x"] forState:UIControlStateNormal];
//        }
//    }
    
}

- (void)tDate

{
    
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSLog(@"%@", localeDate);
    
}
- (IBAction)buttonType:(id)sender {
    
    _buttonTypeBool = !_buttonTypeBool;
    
    
    
//    if(_buttonTypeBool == YES){
//        
//        //100 115 27 
//        [self.buttonType setBackgroundColor:[UIColor colorWithRed:100.0/255 green:115.0/255 blue:127.0/255 alpha:1]];
//        _buttonTypeBool =YES;
//    }else{
//        [self.buttonType setBackgroundColor:[UIColor colorWithRed:29.0/255 green:41.0/255 blue:54.0/255 alpha:1]];
//        _buttonTypeBool =NO;
//    }
//    
    
    
}

- (IBAction)buttonPreson:(id)sender {
    
    _buttonPresonBool = !_buttonPresonBool;
    
    
//    
//    if(_buttonPresonBool == YES){
//        
//        [self.buttonPerson setBackgroundColor:[UIColor colorWithRed:100.0/255 green:115.0/255 blue:127.0/255 alpha:1]];
//        _buttonTypeBool =YES;
//    }else{
//        [self.buttonPerson setBackgroundColor:[UIColor colorWithRed:29.0/255 green:41.0/255 blue:54.0/255 alpha:1]];
//        _buttonTypeBool =NO;
//    }
}

- (IBAction)buttonDate:(id)sender {
    
    _buttonDateBool = !_buttonDateBool;
    
//    
//    
//    if(_buttonDateBool == YES){
//        
//        [self.buttonDate setBackgroundColor:[UIColor colorWithRed:100.0/255 green:115.0/255 blue:127.0/255 alpha:1]];
//        _buttonTypeBool =YES;
//    }else{
//        [self.buttonDate setBackgroundColor:[UIColor colorWithRed:29.0/255 green:41.0/255 blue:54.0/255 alpha:1]];
//        _buttonTypeBool =NO;
//    }
}

- (IBAction)buttonCountry:(id)sender {
    
    _buttonCountryBool = !_buttonCountryBool;
//    
//    if(_buttonCountryBool == YES){
//        
//        [self.buttonCountry setBackgroundColor:[UIColor colorWithRed:100.0/255 green:115.0/255 blue:127.0/255 alpha:1]];
//        _buttonTypeBool =YES;
//    }else{
//        [self.buttonCountry setBackgroundColor:[UIColor colorWithRed:29.0/255 green:41.0/255 blue:54.0/255 alpha:1]];
//    }
}
@end
