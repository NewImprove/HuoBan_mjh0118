//
//  UserInfomation.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/11.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "UserInfomation.h"
#import "ProjectModel.h"

@implementation UserInfomation

-(id)init{
    self = [super init];
    if(self){
        self.aryRemindMessage = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}


//解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self){
        
        self.UserID = [aDecoder decodeObjectForKey:@"UserID"];
        self.tokenID = [aDecoder decodeObjectForKey:@"tokenID"];
        self.userName = [aDecoder decodeObjectForKey:@"UserName"];
        self.passWord = [aDecoder decodeObjectForKey:@"PassWord"];
        self.Name = [aDecoder decodeObjectForKey:@"Name"];
        self.ImagePreson = [aDecoder decodeObjectForKey:@"ImagePreson"];
        self.sex = [aDecoder decodeObjectForKey:@"Sex"];
        self.add = [aDecoder decodeObjectForKey:@"Add"];
        self.sign = [aDecoder decodeObjectForKey:@"Sign"];
        self.contents = [aDecoder decodeObjectForKey:@"Contents"];
        self.aryRemindMessage = [aDecoder decodeObjectForKey:@"aryRemindMessage"];
        self.iOSDeviceSize = [aDecoder decodeObjectForKey:@"iOSDeviceSize"];
        self.payName = [aDecoder decodeObjectForKey:@"payName"];
        self.payMobile = [aDecoder decodeObjectForKey:@"payMobile"];
        self.payPost = [aDecoder decodeObjectForKey:@"payPost"];
        self.deviceToken = [aDecoder decodeObjectForKey:@"deviceToken"];
        
        
//        for(ProjectModel *pro in self.aryPorject){
//                        NSLog(@"%@,%@",pro.projectID,pro.projectTitle);
//        }

//        NSLog(@"%@",iOSDeviceSize);

        
//            NSLog(@"UserID%@,TokenID%@,userName%@,passWord%@,Name%@,ImagePreson%@,Sex%@,Add%@,Sign%@,Contents%@",self.UserID,self.tokenID,self.userName,self.passWord,self.Name,self.ImagePreson,self.sex,self.add,self.sign,self.contents);
    }
    return self;
}

//编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.UserID forKey:@"UserID"];
    [aCoder encodeObject:self.tokenID forKey:@"tokenID"];
    [aCoder encodeObject:self.userName forKey:@"UserName"];
    [aCoder encodeObject:self.passWord forKey:@"PassWord"];
    [aCoder encodeObject:self.Name forKey:@"Name"];
    [aCoder encodeObject:self.ImagePreson forKey:@"ImagePreson"];
    [aCoder encodeObject:self.sex forKey:@"Sex"];
    [aCoder encodeObject:self.add forKey:@"Add"];
    [aCoder encodeObject:self.sign forKey:@"Sign"];
    [aCoder encodeObject:self.contents forKey:@"Contents"];
    [aCoder encodeObject:self.aryRemindMessage forKey:@"aryRemindMessage"];
    [aCoder encodeObject:self.iOSDeviceSize forKey:@"iOSDeviceSize"];
    [aCoder encodeObject:self.payName forKey:@"payName"];
    [aCoder encodeObject:self.payMobile forKey:@"payMobile"];
    [aCoder encodeObject:self.payPost forKey:@"payPost"];
    [aCoder encodeObject:self.deviceToken forKey:@"deviceToken"];
    

//    NSLog(@"%@",self.iOSDeviceSize);
//    for(ProjectModel *pro in self.aryPorject){
//        NSLog(@"%@,%@",pro.projectID,pro.projectTitle);
//    }

    
    
//NSLog(@"UserID%@,TokenID%@,userName%@,passWord%@,Name%@,ImagePreson%@,Sex%@,Add%@,Sign%@,Contents%@",self.UserID,self.tokenID,self.userName,self.passWord,self.Name,self.ImagePreson,self.sex,self.add,self.sign,self.contents);
}





@end
