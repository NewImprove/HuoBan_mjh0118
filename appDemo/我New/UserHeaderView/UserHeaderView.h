//
//  UserHeaderView.h
//  huoban
//
//  Created by 马锦航 on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "huobanUserBaseInfoModel.h"

@protocol UserHeaderViewClickDelegate <NSObject>

- (void) pushToUserInfoViewController;

@end


@interface UserHeaderView : UIView


@property (nonatomic,strong) id<UserHeaderViewClickDelegate>delegate;

@property (nonatomic,strong) UIButton * userHeaderButton;

@property (nonatomic,strong) NSString * userHeaderUrl;

@property (nonatomic,strong) UIImageView * userLocationImage;

@property (nonatomic,strong) UILabel * userLocationLabel;

@property (nonatomic,strong) UIImageView * userProfessionImage;

@property (nonatomic,strong) UILabel * userProfessionLabel;

@property (nonatomic,strong) UILabel * userDescribe;

@property (nonatomic,strong) huobanUserBaseInfoModel * huobanUserBaseInfoModel;

- (instancetype)initWithHeaderUrl:(NSString *)headerUrl WithUserBaseInfoModel:(huobanUserBaseInfoModel *)model;


@end

