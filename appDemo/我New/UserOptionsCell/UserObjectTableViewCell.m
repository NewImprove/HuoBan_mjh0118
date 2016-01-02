//
//  UserObjectTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserObjectTableViewCell.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.f alpha:1.0]

//fill:#33A3DB  RGB:51,163,219
#define objectJoin_group_bgColor  [UIColor colorWithRed:51/255.f green:163/255.f blue:219/255.f alpha:1.0]
//fill:#4FC2B1  RGB:79,194,177
#define objectJoin_support_bgColor [UIColor colorWithRed:79/255.f green:194/255.f blue:177/255.f alpha:1.0]

@interface UserObjectTableViewCell ()

@property (nonatomic,strong) UIButton * objectImage;

@property (nonatomic,strong) UILabel * objectStateDiscribe;

@property (nonatomic,strong) UILabel * objectState;

@property (nonatomic,strong) UIButton * objectJoin;


@end


@implementation UserObjectTableViewCell

- (void)setModel:(HuoBanUserProjectData *)model {
    _model = model;
    
    NSLog(@"%@",model.title);
//    [self.objectStateDiscribe setText:[NSString stringWithFormat:@"%@项目",model.title]];
    

    
}

- (UIButton *)objectImage {
    if (!_objectImage) {
        _objectImage = [[UIButton alloc]initWithFrame:CGRectMake(12, 12, 120, 120)];
        _objectImage.layer.cornerRadius = 6;
        [_objectImage setBackgroundColor:[UIColor grayColor]];
    }
    return _objectImage;
}

-(UILabel *)objectStateDiscribe {
    if (!_objectStateDiscribe) {
        _objectStateDiscribe = [[UILabel alloc]initWithFrame:CGRectMake(140, 22, self.frame.size.width-140, 24)];
        [_objectStateDiscribe setText:@"正在进行的发起的项目"];
        [_objectStateDiscribe setFont:[UIFont systemFontOfSize:16]];
    }
    return _objectStateDiscribe;
}

- (UILabel *)objectState {
    if (!_objectState) {
        _objectState = [[UILabel alloc] initWithFrame:CGRectMake(140, 58, self.frame.size.width-140, 12)];
        [_objectState setText:@"进行中"];
        [_objectState setTextColor:[UIColor grayColor]];
        [_objectState setFont:[UIFont systemFontOfSize:12]];
    }
    return _objectState;
}

- (UIButton *)objectJoin {
    if (!_objectJoin) {
        _objectJoin = [[UIButton alloc]initWithFrame:CGRectMake(140, 82, 72, 36)];
        [_objectJoin setBackgroundColor:objectJoin_group_bgColor];
        _objectJoin.layer.cornerRadius = 6;
    }
    return _objectJoin;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"UserObjectTableViewCell.frame:%@",NSStringFromCGRect(self.frame));
        [self addSubview:self.objectImage];
        [self addSubview:self.objectStateDiscribe];
        [self addSubview:self.objectState];
        [self addSubview:self.objectJoin];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
    NSLog(@"UserObjectTableViewCell.frame:%@",NSStringFromCGRect(self.frame));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
