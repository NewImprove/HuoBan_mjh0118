//
//  UserInfomation.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/11.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfomation : NSObject<NSCoding>

@property (nonatomic,copy) NSString *UserID;
@property (nonatomic,copy) NSString *tokenID;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *passWord;
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *ImagePreson;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *add;
@property(nonatomic,strong)NSString *sign;
@property(nonatomic,strong)NSString *contents;
@property(nonatomic,strong)NSMutableArray *aryRemindMessage;
@property(nonatomic,strong)NSString *iOSDeviceSize;
@property(nonatomic,strong)NSString *payName;
@property(nonatomic,strong)NSString *payMobile;
@property(nonatomic,strong)NSString *payPost;
@property(nonatomic,strong)NSString *deviceToken;







@end
