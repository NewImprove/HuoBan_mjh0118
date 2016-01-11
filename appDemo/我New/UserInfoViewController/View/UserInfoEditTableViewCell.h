//
//  UserInfoEditTableViewCell.h
//  huoban
//
//  Created by 马锦航 on 16/1/11.
//  Copyright © 2016年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoEditTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic,copy) NSString * textPlaceTitle;

@property (nonatomic,strong) UITextField * userInfo;

@property (nonatomic,strong) UIView * underLine;


@end
