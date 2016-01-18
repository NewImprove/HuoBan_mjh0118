//
//  UserHeaderView.m
//  huoban
//
//  Created by 马锦航 on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserHeaderView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define TextColorAAA  [UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1]

//字体宏
#define PingFangSC_Light(s)     [UIFont fontWithName:@"PingFangSC-Light" size:s]


@implementation UserHeaderView



//直径为72 居中的一个圆形button距headerView顶部12px
- (UIButton *)userHeaderButton {
    if (!_userHeaderButton) {
        _userHeaderButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-36, 12, 72, 72)];
        _userHeaderButton.layer.masksToBounds = YES;
        _userHeaderButton.layer.cornerRadius = 36;
        
        [_userHeaderButton setBackgroundColor:[UIColor whiteColor]];
        [_userHeaderButton addTarget:self action:@selector(userHeaderButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _userHeaderButton;
}

//UserHeaderUrl的set方法
- (void)setUserHeaderUrl:(NSString *)userHeaderUrl {
    _userHeaderUrl = userHeaderUrl;
    
    NSLog(@"userHeaderUrluserHeaderUrluserHeaderUrluserHeaderUrluserHeaderUrl%@",userHeaderUrl);
    if (userHeaderUrl) {
        [self.userHeaderButton sd_setImageWithURL:[NSURL URLWithString:_userHeaderUrl] forState:UIControlStateNormal];
    }
    
    //    [self.userHeaderButton setBackgroundImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_userHeaderUrl]]] forState:UIControlStateNormal];
    [self addSubview:self.userHeaderButton];
    
}

- (UIImageView *)userLocationImage {
    if (!_userLocationImage) {
        //尺寸22*28
        _userLocationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location"]];
        _userLocationImage.frame = CGRectMake(Main_Screen_Width/2 - 69, self.userHeaderButton.frame.origin.y+self.userHeaderButton.frame.size.height + 12, 11, 14);
    }
    return _userLocationImage;
}

- (UILabel *)userLocationLabel {
    if (!_userLocationLabel) {
        _userLocationLabel = [[UILabel alloc]init];
        _userLocationLabel.frame = CGRectMake(self.userLocationImage.frame.origin.x+self.userLocationImage.frame.size.width+6, self.userLocationImage.frame.origin.y, 50, self.userLocationImage.frame.size.height);
        _userLocationLabel.text = @"城市";
        _userLocationLabel.font = PingFangSC_Light(12);
        _userLocationLabel.textColor = TextColorAAA;
    }
    return _userLocationLabel;
}

- (UIImageView *)userProfessionImage {
    if (!_userProfessionImage) {
        
        //28*28
        _userProfessionImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profession"]];
        _userProfessionImage.frame = CGRectMake(Main_Screen_Width/2, self.userLocationImage.frame.origin.y, 14, 14);
    }
    return _userProfessionImage;
}

- (UILabel *)userProfessionLabel {
    if (!_userProfessionLabel) {
        _userProfessionLabel = [[UILabel alloc]init];
        _userProfessionLabel.frame = CGRectMake(self.userProfessionImage.frame.origin.x+self.userProfessionImage.frame.size.width+6, self.userProfessionImage.frame.origin.y, 100, self.userProfessionImage.frame.size.height);
        _userProfessionLabel.text = @"职业";
        _userProfessionLabel.font = PingFangSC_Light(12);\
        _userProfessionLabel.textColor = TextColorAAA;
    }
    return _userProfessionLabel;
}

- (UILabel *)userDescribe {
    if (!_userDescribe) {
        _userDescribe = [[UILabel alloc]init];
        _userDescribe.frame = CGRectMake(12, self.userLocationLabel.frame.origin.y + self.userLocationLabel.frame.size.height, Main_Screen_Width - 24, 100);
        //        [_userDescribe setBackgroundColor:[UIColor yellowColor]];
        _userDescribe.font = PingFangSC_Light(14.7);
        _userDescribe.text = @"个人描述";
        //        [_userDescribe sizeThatFits:CGSizeMake(Main_Screen_Width - 24, 80)];
        _userDescribe.numberOfLines = 0;
        _userDescribe.textColor = TextColorAAA;
        
        //        [_userDescribe sizeToFit];
        
    }
    return _userDescribe;
}

- (void)setHuobanUserBaseInfoModel:(huobanUserBaseInfoModel *)huobanUserBaseInfoModel {
    _huobanUserBaseInfoModel = huobanUserBaseInfoModel;
    
    if (huobanUserBaseInfoModel.data.city.length > 0) {
        self.userLocationLabel.text = huobanUserBaseInfoModel.data.city;
    }
    if (huobanUserBaseInfoModel.data.desc.length > 0) {
        self.userDescribe.text = huobanUserBaseInfoModel.data.desc;
    }
    NSLog(@"个人信息%@",[huobanUserBaseInfoModel.data toDictionary]);
    if (huobanUserBaseInfoModel.data.desc.length > 0) {
        self.userProfessionLabel.text = huobanUserBaseInfoModel.data.desc;
    }
    
    
}

- (instancetype)initWithHeaderUrl:(NSString *)headerUrl WithUserBaseInfoModel:(huobanUserBaseInfoModel *)model
{
    self = [super init];
    if (self) {
        if (headerUrl.length>0) {
            self.userHeaderUrl = headerUrl;
            
            UIImageView * imageView = [UIImageView new];
            imageView.frame = CGRectMake(self.userHeaderButton.frame.origin.x + self.userHeaderButton.frame.size.width, self.userHeaderButton.frame.origin.y + 45, 24, 24);
            [imageView setImage:[UIImage imageNamed:@"edit personal info"]];
            [self addSubview:imageView];
            [self sizeToFit];
            
        }
        else {
            [self addSubview:self.userProfessionImage];
            [self addSubview:self.userProfessionLabel];
            [self addSubview:self.userLocationImage];
            [self addSubview:self.userLocationLabel];
            [self addSubview:self.userDescribe];
            self.huobanUserBaseInfoModel = model;
            [self sizeToFit];
        }
        
    }
    return self;
}

- (void) userHeaderButtonAction:(UIButton *)sender {
    [self.delegate pushToUserInfoViewController];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


@end
