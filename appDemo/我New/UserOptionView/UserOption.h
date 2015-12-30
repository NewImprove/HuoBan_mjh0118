//
//  UserOption.h
//  huoban
//
//  Created by 马锦航 on 15/12/15.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserOption : UIView

@property (nonatomic,strong) NSArray * userOptionsArray;

- (instancetype)initWithFrame:(CGRect)frame userOptionsArray:(NSArray *)userOptionsArray;


@end
