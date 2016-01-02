//
//  userFeedTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "userFeedTableViewCell.h"

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


@interface userFeedTableViewCell ()

#pragma mark 数据模型

#pragma mark UI控件
//用户头像
@property (nonatomic,strong) UIButton * userHeader;
//用户名称
@property (nonatomic,strong) UILabel * userName;
//发起人描述
@property (nonatomic,strong) UIButton * createrDescribe;
//已经过了的时间
@property (nonatomic,strong) UILabel * timeAlredy;
//文字内容
@property (nonatomic,strong) UITextField * article;
//图片
@property (nonatomic,strong) UIButton * feedImage;
//删除按钮
@property (nonatomic,strong) UIButton * delegateFeed;
//互动信息(*个喜欢，＊个评论)
@property (nonatomic,strong) UIButton * favorite;


@end



@implementation userFeedTableViewCell

#pragma mark settergetter

#pragma mark 懒加载

//用户头像
- (UIButton *)userHeader {
    if (!_userHeader) {
        CGFloat _userHeaderSideLong = 44;
        _userHeader = [[UIButton alloc]init];
        _userHeader.frame = CGRectMake(12, 12, _userHeaderSideLong, _userHeaderSideLong);
        [_userHeader setBackgroundColor:[UIColor grayColor]];

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
        _userName.backgroundColor = [UIColor redColor];
    }
    return _userName;
}

- (UIButton *)createrDescribe {
    if (!_createrDescribe) {
        CGFloat _topToUserName = 2;
        CGFloat _width = 200;
        CGFloat _hight = 20;
        _createrDescribe = [[UIButton alloc]init];
        _createrDescribe.frame = CGRectMake(_userHeader.frame.origin.x, _userHeader.frame.origin.y+_userHeader.frame.size.height+_topToUserName, _width, _hight);
        [_createrDescribe setTitle:@"爱拼才会赢" forState:UIControlStateNormal];
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
//        _timeAlredy.alignmentRectInsets
        _timeAlredy.text = @"25分钟前";
    }
    return _timeAlredy;
}

- (UITextField *)article {
    if (!_article) {
        CGFloat _topToCell = 100;
        CGFloat _leftToScreenLeft = 74;
        CGFloat _width = Main_Screen_Width - _leftToScreenLeft;
        CGFloat _height = 80;
        _article = [[UITextField alloc]init];
        _article.frame = CGRectMake(_topToCell, _leftToScreenLeft, _width, _height);
        _article.text = @"测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容";
    }
    return _article;
}

- (UIButton *)feedImage {
    if (!_feedImage) {
        CGFloat _leftToScreen = 60;
        CGFloat _topToCellTop = 260;
        CGFloat _width = 44;
        CGFloat _height = 44;
        _feedImage = [[UIButton alloc]init];
        _feedImage.frame = CGRectMake(_leftToScreen, _topToCellTop, _width, _height);
        [_feedImage setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _feedImage;
}

- (UIButton *)delegateFeed {
    if (!_delegateFeed) {
        CGFloat _leftToScreen = 60;
        CGFloat _topToCellTop = 360;
        CGFloat _width = 44;
        CGFloat _height = 44;
        _delegateFeed = [[UIButton alloc]init];
        _delegateFeed.frame = CGRectMake(_leftToScreen, _topToCellTop, _width, _height);
        [_delegateFeed setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _delegateFeed;
}

- (UIButton *)favorite {
    if (!_favorite) {
        CGFloat _leftToScreen = 260;
        CGFloat _topToCellTop = 360;
        CGFloat _width = 100;
        CGFloat _height = 44;
        _favorite = [[UIButton alloc]init];
        _favorite.frame = CGRectMake(_leftToScreen, _topToCellTop, _width, _height);
    }
    return _favorite;
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
        [self addSubview:self.userHeader];
        [self addSubview:self.userName];
        [self addSubview:self.createrDescribe];
        [self addSubview:self.timeAlredy];
        [self addSubview:self.article];
        [self addSubview:self.feedImage];
        [self addSubview:self.delegateFeed];
        [self addSubview:self.favorite];
    }
    return self;
}

@end
