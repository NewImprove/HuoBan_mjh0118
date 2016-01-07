//
//  userFollowerTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 15/12/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "userFollowerTableViewCell.h"


// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width


@interface userFollowerTableViewCell ()

@property (nonatomic,strong) UIButton * headerImage;

@property (nonatomic,strong) UILabel * userName;

@property (nonatomic,strong) UIButton * describe;

@property (nonatomic,strong) UIButton * chectWithUser;

@end




@implementation userFollowerTableViewCell

- (UIButton *)headerImage {
    if (!_headerImage) {
        _headerImage = [[UIButton alloc]init];
        _headerImage.frame = CGRectMake(12, 12, 44, 44);
        _headerImage.layer.cornerRadius = _headerImage.frame.size.width/2;
        [_headerImage setBackgroundColor:[UIColor grayColor]];
    }
    return _headerImage;
}

- (UILabel *)userName {
    if (!_userName) {
        _userName = [[UILabel alloc]init];
        _userName.frame = CGRectMake(62, 12, 100, 20);
        _userName.text = @"马锦航";
    }
    return _userName;
}

- (UIButton *)describe {
    if (!_describe) {
        _describe = [[UIButton alloc]init];
        _describe.frame = CGRectMake(62, 34, 100, 20);
        [_describe setTitle:@"发起人" forState:UIControlStateNormal];
        [_describe setBackgroundColor:[UIColor blueColor]];
    }
    return _describe;
}

- (UIButton *)chectWithUser {
    if (!_chectWithUser) {
        CGFloat _width = 24;
        CGFloat _height = 14;
        _chectWithUser = [[UIButton alloc]init];
        _chectWithUser.frame = CGRectMake(Main_Screen_Width - 24 - 12, 30, _width, _height);
        [_chectWithUser setBackgroundColor:[UIColor orangeColor]];
    }
    return _chectWithUser;
}

- (void)setModel:(HuoBanUserFollowData *)model {
    _model = model;
    //传入数据后所做的操作

//    self.headerIm
    [self.headerImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]]] forState:UIControlStateNormal];
    self.userName.text = model.name;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"userFollowerTableViewCell");
        [self addSubview:self.headerImage];
        [self addSubview:self.userName];
        [self addSubview:self.describe];
        [self addSubview:self.chectWithUser];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
