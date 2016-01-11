//
//  UserInfoHeader.h
//  huoban
//
//  Created by 马锦航 on 16/1/11.
//  Copyright © 2016年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserHeaderViewClickDelegate <NSObject>

- (void) headerViewClick;

@end


@interface UserInfoHeader : UIView

@property (nonatomic,strong) id<UserHeaderViewClickDelegate>delegate;


@property (nonatomic,strong) UIButton * userHeaderButton;

@property (nonatomic,strong) NSString * userHeaderUrl;

- (instancetype)initWithHeaderUrl:(NSString *)headerUrl;


@end
