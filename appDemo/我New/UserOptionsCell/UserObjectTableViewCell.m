//
//  UserObjectTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 15/12/16.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserObjectTableViewCell.h"

#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.f alpha:1.0]

//fill:#33A3DB  RGB:51,163,219  去社群
#define objectJoin_group_bgColor  [UIColor colorWithRed:51/255.f green:163/255.f blue:219/255.f alpha:1.0]

//fill:#4FC2B1  RGB:79,194,177  支持更多
#define objectJoin_support_bgColor [UIColor colorWithRed:79/255.f green:194/255.f blue:177/255.f alpha:1.0]


//字体宏
#define PingFangSC(s)     [UIFont fontWithName:@"PingFangSC-Regular" size:s]


@interface UserObjectTableViewCell ()

@property (nonatomic,strong) UIImageView * objectImage;

@property (nonatomic,strong) UILabel * objectStateDiscribe;

@property (nonatomic,strong) UILabel * objectState;



@end


@implementation UserObjectTableViewCell

- (void)setModel:(HuoBanUserProjectData *)model {
    _model = model;
    
    NSLog(@"%@",model.title);
//    self.objectImage setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#>
    //    self.customView.layer.contents = (id)[UIImage imageNamed:@"header_001"].CGImage;
    
//    self.objectImage.layer.contents = (id)[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.images[0]]]].CGImage ;
    
    [self.objectImage sd_setImageWithURL:[NSURL URLWithString:model.images[0]]];
    [self.objectStateDiscribe setText:[NSString stringWithFormat:@"%@",model.title]];
    [self.objectStateDiscribe sizeToFit];
    
    [self objectStateStringWithModel:model];
    
    
    [self.objectState sizeToFit];
    
//    [self compareNowWithDate:[model.endDate dataUsingEncoding:[NSStringEncodingDetectionAllowLossyKey]]];
//    self compareNowWithDate:[model.endDate ]
    
}

//项目图片
- (UIImageView *)objectImage {
    if (!_objectImage) {
        _objectImage = [[UIImageView alloc]initWithFrame:CGRectMake(12, 12, 120, 120)];
//setCornerRadius:YES
//        _objectImage.layer setcor
        [_objectImage.layer setMasksToBounds:YES];
        _objectImage.layer.cornerRadius = 6;

//        [_objectImage setBackgroundColor:[UIColor grayColor]];
    }
    return _objectImage;
}

//项目描述
-(UILabel *)objectStateDiscribe {
    if (!_objectStateDiscribe) {
        _objectStateDiscribe = [[UILabel alloc]initWithFrame:CGRectMake(140, 22, self.frame.size.width-140, 24)];
        [_objectStateDiscribe setText:@"正在进行的发起的项目"];
        [_objectStateDiscribe setFont:[UIFont systemFontOfSize:16]];
    }
    return _objectStateDiscribe;
}

//项目状态
- (UILabel *)objectState {
    if (!_objectState) {
        _objectState = [[UILabel alloc] initWithFrame:CGRectMake(148, 58, self.frame.size.width-140, 12)];
        [_objectState setText:@"进行中"];
        [_objectState setTextColor:[UIColor grayColor]];
        [_objectState setFont:[UIFont systemFontOfSize:10]];
    }
    return _objectState;
}

//加入按钮
- (UIButton *)objectJoin {
    if (!_objectJoin) {
        _objectJoin = [[UIButton alloc]initWithFrame:CGRectMake(140, 82, 72, 36)];
        [_objectJoin setBackgroundColor:objectJoin_group_bgColor];
        _objectJoin.layer.cornerRadius = 6;
        _objectJoin.titleLabel.font = PingFangSC(12);
        
        
//        [_objectJoin addTarget:self action:@selector(joinButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _objectJoin;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        NSLog(@"UserObjectTableViewCell.frame:%@",NSStringFromCGRect(self.frame));
        [self addSubview:self.objectImage];
        [self addSubview:self.objectStateDiscribe];
        [self addSubview:self.objectState];
        [self addSubview:self.objectJoin];
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    return self;
}


//对不同状态下项目进行判断
- (void)objectStateStringWithModel:(HuoBanUserProjectData *)model {
    
    
    NSLog(@"%@",[model toDictionary]);
    //注：type : create(创建的项目),order(加入的项目),focus(关注的项目),end(结束的项目)
    
    if ([model.type isEqualToString:@"end"]) {      //判断是否是已经结束
        self.objectState.text = @"成功！";
        [self.objectJoin setTitle:@"去群组" forState:UIControlStateNormal];
        if (model.factMoney < model.wantedMoney) {        //判断是否是失败项目
            self.objectState.text = @"失败";
        }
        
    } else {                                                //正在进行的项目
//        model
        if ([model.type isEqualToString:@"create"]) {
            self.objectState.text = @"进行中";
            [self.objectJoin setTitle:@"去群组" forState:UIControlStateNormal];

        }
        if ([model.type isEqualToString:@"focus"]) {
            self.objectState.text = @"已关注";
            [self.objectJoin setTitle:@"加入他们" forState:UIControlStateNormal];
        }
        if ([model.type isEqualToString:@"order"]) {
            self.objectState.text = [NSString stringWithFormat:@"已支持%zi元",model.money];
            [self.objectJoin setTitle:@"支持更多" forState:UIControlStateNormal];
        }
        
    }
    
    
    
//    if ([model.type isEqualToString:@"end"]) {
//        //项目结束处理
//        if (model.factMoney >= model.wantedMoney) {
//            NSLog(@"成功项目");
//            self.objectState.text = @"成功!";
//            [self.objectJoin setTitle:@"去群组" forState:UIControlStateNormal];
//            
//        }
//        else {
//            NSLog(@"失败项目");
//            self.objectState.text = @"已结束";
//            [self.objectJoin setTitle:@"去群组" forState:UIControlStateNormal];
//        }
//    }
//    else if ([model.type isEqualToString:@"create"]) {
//        //创建的项目
//        self.objectState.text = @"进行中";
//    }
//    else if ([model.type isEqualToString:@"focus"]) {
//        //关注的项目
//        self.objectState.text = @"已关注";
//        [self.objectJoin setTitle:@"加入他们" forState:UIControlStateNormal];
//    }
//    else if ([model.type isEqualToString:@"order"]) {
//        //加入的项目
//        self.objectState.text = [NSString stringWithFormat:@"已支持%zi元",model.money];
//        [self.objectJoin setTitle:@"支持更多" forState:UIControlStateNormal];
//    }
    
}

- (void) compareNowWithDate:(NSDate *)date  {
    NSDate * _now = [[NSDate alloc]init];
    [_now compare:date];
}


- (void)awakeFromNib {
    // Initialization code
    
//    NSLog(@"UserObjectTableViewCell.frame:%@",NSStringFromCGRect(self.frame));
}

//- (void)



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
