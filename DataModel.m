//
//  DataModel.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/20.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel



+ (instancetype) defaultUserBaseInfo {
    static DataModel * _defaultUserInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultUserInfo = [[self alloc] init];
    });
    return _defaultUserInfo;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInfomation = [[UserInfomation alloc] init];
        self.remindMessage = [[RemindMessage alloc] init];
        
        [self loadUserInfomation];
    }
    return self;
}




#pragma mark 获取沙盒地址
-(NSString*)dataFilePath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:@"huoban.plist"];
//        return [documentsDirectory stringByAppendingPathComponent:@"火伴.plist"];
}

-(void)saveUserInfomation{
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:self.userInfomation forKey:@"UserInfomation"];
    [archiver encodeObject:self.remindMessage forKey:@"RemindMessage"];
        [archiver encodeObject:self.aryRemindMessage forKey:@"aryRemindMessage"];
    [archiver finishEncoding];
    
    [data writeToFile:[self dataFilePath] atomically:YES];
    
    
}


//加载，解码
-(void)loadUserInfomation{
    
    NSString *path = [self dataFilePath];
    
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        self.userInfomation = [unarchiver decodeObjectForKey:@"UserInfomation"];
       

        self.remindMessage = [unarchiver decodeObjectForKey:@"RemindMessage"];
        
        self.aryRemindMessage= [unarchiver decodeObjectForKey:@"aryRemindMessage"];
        if(self.aryRemindMessage == nil){
        self.aryRemindMessage  = [[NSMutableArray alloc] initWithCapacity:20];            
        }
        
//        NSLog(@"%@",self.userInfomation);
        [unarchiver finishDecoding];
    }else{
        
        self.userInfomation = [[UserInfomation alloc] init];
        self.remindMessage = [[RemindMessage alloc] init];
        self.aryRemindMessage  = [[NSMutableArray alloc] initWithCapacity:20];
    }
    
}


@end
