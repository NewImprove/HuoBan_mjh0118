//
//  userFeedTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "userFeedTableViewCell.h"
#import "HttpTool.h"
#import "UIButton+WebCache.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.f alpha:1.0]

//fill:#33A3DB  RGB:51,163,219
#define objectJoin_group_bgColor  [UIColor colorWithRed:51/255.f green:163/255.f blue:219/255.f alpha:1.0]


// Screen Scale
#define MainScreenScale         [[UIScreen mainScreen] scale]

// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

//字体宏
#define PingFangSC(s)     [UIFont fontWithName:@"PingFangSC-Regular" size:s]


#define UserInfoView_Height 56.0f
#define OptionView_Height 44.0f

@interface userFeedTableViewCell ()

#pragma mark 数据模型

#pragma mark UI控件


#pragma mark 基本信息View
@property (nonatomic,strong) UIView * userInfoView;

//用户头像
@property (nonatomic,strong) UIButton * userHeader;
//用户名称
@property (nonatomic,strong) UILabel * userName;
//发起人描述
@property (nonatomic,strong) UILabel * createrDescribe;
//已经过了的时间
@property (nonatomic,strong) UILabel * timeAlredy;


#pragma mark 内容View
@property (nonatomic,strong) UIView * cellContentView;
//文字内容
@property (nonatomic,strong) UILabel * article;
//图片
@property (nonatomic,strong) UIButton * feedImage;


#pragma mark 操作View
@property (nonatomic,strong) UIView * operationView;
//删除按钮
@property (nonatomic,strong) UIButton * delegateFeed;
//互动信息(*个喜欢，＊个评论)
@property (nonatomic,strong) UIButton * favorite;



@end



@implementation userFeedTableViewCell


//计算cell高度的方法
+(CGFloat)feedTableViewCellWithModel:(huobanUserFeedData *)model {
    
//    NSLog(@"%zi",model);
    
    return [userFeedTableViewCell contentViewHeightWithModel:model] + UserInfoView_Height + OptionView_Height +6;
}

//计算c高度的方法
+(CGFloat)contentViewHeightWithModel:(huobanUserFeedData *)model {
    

    
    return [userFeedTableViewCell articalHeightWithModel:model]+[userFeedTableViewCell imageViewHeightWithModel:model];
}

//返回article控件的高度
+(CGFloat)articalHeightWithModel:(huobanUserFeedData *)model {
    
    //    CGFloat _cellHeight;
    //    CGFloat _userInfoViewHeight = 20;
    
    CGFloat _articalHeight = [self autoSize:model.message].height;
    
    
    return _articalHeight;
}

//返回imageView的高度
+ (CGFloat) imageViewHeightWithModel:(huobanUserFeedData *)model {
    
    if (model.image.length) {
        CGSize imageSize = [userFeedTableViewCell imageSizeWithString:model.image];
        if (imageSize.width/imageSize.height*160 > Main_Screen_Width - 60 - 12) {
            return imageSize.height/imageSize.width * (Main_Screen_Width - 60 - 12);
        }
        return 160;
    }
    return 0;
}

+(CGSize)autoSize:(NSString *)string{
    //定义UIFont
//    UIFont *font=[UIFont systemFontOfSize:24];
    UIFont *font = PingFangSC(18);
    //设置最大的显示范围
    CGSize size=CGSizeMake(Main_Screen_Width - 50 - 10 , 1000);
    //设置文字属性的字典（注意先是字号，再是字体）
    NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    //用于设置文本绘制时占据的大小（也就是最大范围）
    CGSize autoSize=[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading//文本会绘制时的附加选项
                                      attributes:fontDic //文字的属性
                                         context:nil].size;//context上下文。包括一些信息，例如如何调整字间距以及缩放。该队形包含信息将用于文本绘制。该参数可以为nil
    //NSStringDrawingUsesLineFragmentOrigin从文字片段开始的地方开始绘制
    //NSStringDrawingUsesFontLeading计算行高时使用的行距。（字体大小+行间距）
    //NSStringDrawingTruncatesLastVisibleLine 如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号
    //NSStringDrawingUsesDeviceMetrics计算布局时使用的图元字形（而不是印刷体）
    return autoSize;
}



#pragma mark settergetter


- (void)setModel:(huobanUserFeedData *)model {
    _model = model;
    
    
//    NSLog(@"feedTableViewCell:%@",[model toDictionary]);
    
    NSString * _str;
    
    
    //动态图片 固定高度160
    if (model.image.length) {
        self.feedImage.frame = [self feedImageFrameWithModel:model];
        [self.feedImage sd_setImageWithURL:[NSURL URLWithString:model.image] forState:UIControlStateNormal];
        
//        [self.feedImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]]] forState:UIControlStateNormal];
        
    }

    self.article.frame = CGRectMake(self.article.frame.origin.x, self.article.frame.origin.y, self.article.frame.size.width, [userFeedTableViewCell articalHeightWithModel:model]);
    
    self.feedImage.frame = [self feedImageFrameWithModel:model];
    
//    NSLog(@"imageView.frame%@",NSStringFromCGRect(self.feedImage.frame));

    self.cellContentView.frame = CGRectMake(0, UserInfoView_Height, Main_Screen_Width,self.article.frame.size.height+self.feedImage.frame.size.height);
//    NSLog(@"self.cellContentView.frame:%@",NSStringFromCGRect(self.cellContentView.frame));
    
    self.operationView.frame = CGRectMake(0, self.cellContentView.frame.origin.y+self.cellContentView.frame.size.height, Main_Screen_Width, OptionView_Height);
    
    
//    self.feedImage.frame = CGRectMake(self.feedImage.frame.origin.x, self.article.frame.origin.y + self.article.frame.size.height, <#CGFloat width#>, 160)
    
    self.article.text = model.message;
    
    
    self.timeAlredy.text = [self timeShouldShowWithString:model.time];
    
    [self.favorite setTitle:[NSString stringWithFormat:@"%@喜欢,%@评论",[model.up valueForKey:@"count"],[model.comment valueForKey:@"count"] ] forState:UIControlStateNormal];
    
    [self.userHeader sd_setImageWithURL:[NSURL URLWithString:[model.user valueForKey:@"image"]] forState:UIControlStateNormal];
//    [self.userHeader setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[model.user valueForKey:@"image"]]]] forState:UIControlStateNormal];
    
    self.userName.text = [model.user valueForKey:@"name"];
    
    
#if 1
    if (self.model.isCreator) {
        _str = @"发起人";
    }
    else {
        _str = @"";
    }
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[_str stringByAppendingString:[NSString stringWithFormat:@"@ %@",[self.model.project valueForKey:@"title"]]]];
    
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, _str.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(_str.length, str.length-_str.length)];
    self.createrDescribe.attributedText = str;
#endif
}



#pragma mark 懒加载

//用户头像
- (UIButton *)userHeader {
    if (!_userHeader) {
        CGFloat _userHeaderSideLong = 44;
        _userHeader = [[UIButton alloc]init];
        _userHeader.frame = CGRectMake(12, 12, _userHeaderSideLong, _userHeaderSideLong);
        _userHeader.layer.borderColor = [UIColor blackColor].CGColor;
//        _userHeader.layer.borderWidth = 0.1;
        _userHeader.layer.masksToBounds = YES;
        _userHeader.layer.cornerRadius = _userHeaderSideLong/2;
    }
    return _userHeader;
}

- (UILabel *)userName {
    if (!_userName) {
        //left距用户头像距离
        CGFloat _leftToUserHeader = 5;
        //topToCellTop
        CGFloat _topToCellTop = 15;
        CGFloat _width = 200;
        CGFloat _hight = 20;
        _userName = [[UILabel alloc]init];
        _userName.frame = CGRectMake(self.userHeader.frame.origin.x+self.userHeader.frame.size.width + _leftToUserHeader, _topToCellTop, _width, _hight);
        _userName.text = @"马锦航";
        _userName.font = PingFangSC(14.7);
        _userName.textColor = RGB(33, 33, 33);
//        _userName.backgroundColor = [UIColor redColor];
    }
    return _userName;
}

- (UILabel *)createrDescribe {
    if (!_createrDescribe) {
        CGFloat _topToUserName = 2;
        CGFloat _width = 200;
        CGFloat _hight = 20;
        NSString * _str;
        _createrDescribe = [[UILabel alloc]init];
        
        _createrDescribe.frame = CGRectMake(_userName.frame.origin.x, _userName.frame.origin.y+_userName.frame.size.height+_topToUserName, _width, _hight);
        
//        NSLog(@"%@\n%@",NSStringFromCGRect(self.userName.frame),NSStringFromCGRect(_createrDescribe.frame));
        
//        _createrDescribe.text = @"发起人@众筹遇见真正的伙伴";
        
        /**多字体文本
         self.title = @"For iOS 6 & later";
         NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Using NSAttributed String"];
         [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,5)];
         [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6,12)];
         [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(19,6)];
         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30.0] range:NSMakeRange(0, 5)];
         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(6, 12)];
         [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
         attrLabel.attributedText = str;
         */
        
//        [_createrDescribe setTitle:@"发起人@众筹遇见真正的伙伴" forState:UIControlStateNormal];
//        [_createrDescribe setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
//        _createrDescribe.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        _createrDescribe.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

        _createrDescribe.font = PingFangSC(12);
    }
    return _createrDescribe;
}

- (UILabel *)timeAlredy {
    if (!_timeAlredy) {
        CGFloat _topToCell = 12;
        CGFloat _topToRightScreen = 12;
        CGFloat _width = 100;
        CGFloat _height = 20;
        _timeAlredy = [[UILabel alloc]init];
        _timeAlredy.frame = CGRectMake(Main_Screen_Width - 12 - _width, _topToCell, _width, _height);
        _timeAlredy.textColor = RGB(170, 170, 170);
        _timeAlredy.font = PingFangSC(12);
        _timeAlredy.textAlignment = 2;
//        _timeAlredy.alignmentRectInsets
        _timeAlredy.text = @"25分钟前";
    }
    return _timeAlredy;
}

- (UIView *)userInfoView {
    if (!_userInfoView ) {
        _userInfoView = [[UIView alloc]init];
        [_userInfoView setFrame:CGRectMake(0, 0, Main_Screen_Width, UserInfoView_Height)];
        [_userInfoView addSubview:self.userHeader];
        [_userInfoView addSubview:self.userName];
        [_userInfoView addSubview:self.createrDescribe];
        [_userInfoView addSubview:self.timeAlredy];
        [_userInfoView setBackgroundColor:[UIColor whiteColor]];
    }
    return _userInfoView;
}

- (UIView *)cellContentView {
    if (!_cellContentView) {
        _cellContentView = [[UIView alloc]init];
//        NSLog(@"%@",NSStringFromCGRect(_cellContentView.frame));
        [_cellContentView addSubview:self.article];
        [_cellContentView addSubview:self.feedImage];
        [_cellContentView setBackgroundColor:[UIColor whiteColor]];
        _cellContentView.frame = CGRectMake(0, UserInfoView_Height, Main_Screen_Width,self.article.frame.size.height+self.feedImage.frame.size.height);
    }
    
    return _cellContentView;
}
- (UILabel *)article {
    if (!_article) {
        CGFloat _topToCell = 100;
        CGFloat _leftToScreenLeft = 50;
        CGFloat _width = Main_Screen_Width - _leftToScreenLeft - 10;
        CGFloat _height = 80;
        _article = [[UILabel alloc]init];
        _article.frame = CGRectMake(_leftToScreenLeft,0, _width, 0);
        _article.numberOfLines = 0;
        _article.font = PingFangSC(14.7);
        //33,33,33
        _article.textColor = RGB(33, 33, 33);
        
//        [_article setBackgroundColor:[UIColor yellowColor]];
        _article.text = @"测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容";
        [_article sizeToFit];
    }
//    if (_cellContentView) {
//        _cellContentView.frame = CGRectMake(0, UserInfoView_Height, Main_Screen_Width,self.article.frame.size.height+self.feedImage.frame.size.height);
//    }
    return _article;
}

- (UIButton *)feedImage {
    if (!_feedImage) {
        CGFloat _leftToScreen = 60;
        CGFloat _width = 160;
        CGFloat _height = 80;
        _feedImage = [[UIButton alloc]init];
//        [_feedImage setBackgroundColor:[UIColor greenColor]];
        _feedImage.frame = CGRectMake(_leftToScreen, self.article.frame.origin.y + self.article.frame.size.height, 0, 0);
        [_feedImage setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _feedImage;
}


- (UIView *)operationView {
    if (!_operationView) {
        _operationView = [[UIView alloc]init];
        _operationView.frame = CGRectMake(0, self.cellContentView.frame.origin.y+self.cellContentView.frame.size.height, Main_Screen_Width, OptionView_Height);
        [_operationView setBackgroundColor:[UIColor whiteColor]];
        [_operationView addSubview:self.delegateFeed];
        [_operationView addSubview:self.favorite];
    }
    return _operationView;
}
- (UIButton *)delegateFeed {
    if (!_delegateFeed) {
        CGFloat _leftToScreen = 50;
        CGFloat _topToCellTop = 360;
        CGFloat _width = 44;
        CGFloat _height = 44;
        _delegateFeed = [[UIButton alloc]init];
        _delegateFeed.frame = CGRectMake(_leftToScreen, 0, _width, _height);
        [_delegateFeed setImage:[UIImage imageNamed:@"DeleteDynamic"] forState:UIControlStateNormal];
        [_delegateFeed setImageEdgeInsets:UIEdgeInsetsMake(11, 11, 11, 11)];
        [_delegateFeed addTarget:self action:@selector(deleteThisCell) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delegateFeed;
}

- (UIButton *)favorite {
    if (!_favorite) {
        CGFloat _rightToScreen = 12;
        CGFloat _topToCellTop = 160;
        CGFloat _width = 100;
        CGFloat _height = 44;
        _favorite = [[UIButton alloc]init];
        _favorite.frame = CGRectMake(Main_Screen_Width - _rightToScreen - _width, 0, _width, _height);
        [_favorite setTitleColor:RGB(170, 170, 170) forState:UIControlStateNormal];
//        [_favorite setBackgroundColor:[UIColor orangeColor]];
//        [_favorite setFont:[UIFont systemFontOfSize:10]];
        _favorite.titleLabel.font = PingFangSC(12);
    }
    return _favorite;
}

- (NSString *) timeShouldShowWithString:(NSString *)timeStr {
    
    
    NSDateFormatter * _dateFormatterDetailsDynamic = [[NSDateFormatter alloc] init];
    
    [_dateFormatterDetailsDynamic setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
 
    NSDate * createDate = [_dateFormatterDetailsDynamic dateFromString:[timeStr substringToIndex:19]];

    
    NSDate * nowDate = [NSDate date];
    
    if([nowDate timeIntervalSinceDate:createDate]/60 < 60){
        
//        self.textTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/60] componentsSeparatedByString:@"."][0] ];
//        NSLog(@"%f天",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400);
    }else if([nowDate timeIntervalSinceDate:createDate]/3600 < 24 && [nowDate timeIntervalSinceDate:createDate]/3600 >= 1){
        
    return [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[nowDate timeIntervalSinceDate:createDate]/3600] componentsSeparatedByString:@"."][0] ];
        
//        NSLog(@"%f小时",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8);
        
        
    }else if([nowDate timeIntervalSinceDate:createDate]/86400 == 1){
        
        return @"昨天";
        
    }else if([nowDate timeIntervalSinceDate:createDate]/86400 > 1 && [nowDate timeIntervalSinceDate:createDate]/86400 <= 2){
        
        return [NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[nowDate timeIntervalSinceDate:createDate]/86400 ] componentsSeparatedByString:@"."][0]];
        
    }else if([nowDate timeIntervalSinceDate:createDate]/86400 > 2){
        
    return [NSString stringWithFormat:@"%@",[[NSString stringWithFormat:@"%@",createDate] substringToIndex:10]];
    }
    
    
//    NSDate * date = [NSDate new];
//    NSString * nowDateString = [NSString stringWithFormat:@"%@",date];
//    NSArray * nowDateArray = [nowDateString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":- "]];
//    
//    NSArray * endDateArray = [timeStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":- "]];
////    NSLog(@"%@",endDateArray);
////    NSLog(@"%@",nowDateString);
//    
//    
//    for (NSInteger i = 0; i <= 2; i++) {
//        if (![nowDateArray[i] isEqualToString:endDateArray[i]]) {
//            NSLog(@"%@",[NSString stringWithFormat:@"%@月%@日",endDateArray[1],endDateArray[2]]);
//            return [NSString stringWithFormat:@"%@月%@日",endDateArray[1],endDateArray[2]];
//        }
//        else if(i == 2) {
//            NSLog(@"%@",[NSString stringWithFormat:@"%@:%@",endDateArray[3],endDateArray[4]]);
//            return [NSString stringWithFormat:@"%@:%@",endDateArray[3],endDateArray[4]];
//        }
//    }
    
    
    return NULL;
}

- (CGRect) feedImageFrameWithModel:(huobanUserFeedData *)model {
    CGRect _rect;
    
    if (!model.image.length) {
        _rect = CGRectMake(self.feedImage.frame.origin.x, self.article.frame.origin.y + self.article.frame.size.height, 0, 0);
        return _rect;
    }
    
    CGSize imageSize = [userFeedTableViewCell imageSizeWithString:model.image];
    
    
    _rect = CGRectMake(self.feedImage.frame.origin.x, self.article.frame.origin.y + self.article.frame.size.height, imageSize.width/imageSize.height*160, 160);

    if (_rect.size.width > Main_Screen_Width - 60 - 12) {
        _rect = CGRectMake(self.feedImage.frame.origin.x, self.article.frame.origin.y + self.article.frame.size.height,Main_Screen_Width - 60 - 12, imageSize.height/imageSize.width * (Main_Screen_Width - 60 - 12));
    }
    return _rect;
}

+ (CGSize) imageSizeWithString:(NSString *)imageUrlStr {
    
    
    //http://images.huoban.io/userDynamic/ptYSAdAntRBLeJyTICSnXn398ERgq81J_NnMynEd:N4y7_ETHmXsqdSM-1qw0qBwDILc=:eyJzY29wZSI6Imh1b2JhbiIsImRlYWRsaW5lIjoxNDUwNjg2NzU3fQ==823984036!397*530
    
    NSArray * sizeArray = [imageUrlStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"!*"]];
    
    
    return CGSizeMake([sizeArray[1] floatValue], [sizeArray[2] floatValue]);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.userInfoView];
        [self addSubview:self.cellContentView];
        [self addSubview:self.operationView];
        
//        [UIColor whiteColor]
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView * backgroundView = [[UIImageView alloc]init];
        
        self.backgroundView = backgroundView;
        [self setBackgroundView:backgroundView];
        
        
        
        
        self.backgroundColor = RGB(238, 238, 238);
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}




- (void) deleteThisCell {
    
    NSLog(@"删除按钮");
    [self.feeddelegate deleteFeedTableViewCellWithIndexPaht:self.indexpath];
}



@end
