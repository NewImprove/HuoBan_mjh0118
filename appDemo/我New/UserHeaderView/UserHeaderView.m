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

@implementation UserHeaderView



//直径为72 居中的一个圆形button距headerView顶部12px
- (UIButton *)userHeaderButton {
    if (!_userHeaderButton) {
        _userHeaderButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-36, 12, 72, 72)];
        _userHeaderButton.layer.masksToBounds = YES;
        _userHeaderButton.layer.cornerRadius = 36;
        
        [_userHeaderButton setBackgroundColor:[UIColor whiteColor]];
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

- (instancetype)initWithHeaderUrl:(NSString *)headerUrl
{
    self = [super init];
    if (self) {
        self.userHeaderUrl = headerUrl;
//        [self addSubview:self.userHeaderImageView];
        UIImageView * imageView = [UIImageView new];
        imageView.frame = CGRectMake(self.userHeaderButton.frame.origin.x + self.userHeaderButton.frame.size.width, self.userHeaderButton.frame.origin.y + 45, 24, 24);
//        [imageView setBackgroundColor:[UIColor lightGrayColor]];
        [imageView setImage:[UIImage imageNamed:@"edit personal info"]];
        [self addSubview:imageView];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


@end
