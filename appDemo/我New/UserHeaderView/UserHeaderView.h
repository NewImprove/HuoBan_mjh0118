//
//  UserHeaderView.h
//  huoban
//
//  Created by 马锦航 on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserHeaderView : UIView

@property (nonatomic,strong) UIButton * userHeaderButton;

@property (nonatomic,strong) NSString * userHeaderUrl;

- (instancetype)initWithHeaderUrl:(NSString *)headerUrl;


@end
