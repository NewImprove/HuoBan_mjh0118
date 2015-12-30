//
//  DataModel.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/20.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfomation.h"
#import "RemindMessage.h"


@interface DataModel : NSObject

@property(nonatomic,strong)UserInfomation *userInfomation;
@property(nonatomic,strong)RemindMessage *remindMessage;
@property(nonatomic,strong)NSMutableArray *aryRemindMessage;


-(void)saveUserInfomation;
-(void)loadUserInfomation;
+ (instancetype) defaultUserBaseInfo;

@end
