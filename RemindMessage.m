//
//  RemindMessage.m
//  huoban
//
//  Created by Lyc on 15/12/18.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "RemindMessage.h"

@implementation RemindMessage



//解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self){
        
        self.strBy = [aDecoder decodeObjectForKey:@"strBy"];
        self.strID = [aDecoder decodeObjectForKey:@"strID"];
        self.strImage = [aDecoder decodeObjectForKey:@"strImage"];
        self.strTime = [aDecoder decodeObjectForKey:@"strTime"];
        self.type = [aDecoder decodeIntForKey:@"MessageType"];
        self.strContents = [aDecoder decodeObjectForKey:@"strContents"];

        
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
    
    [aCoder encodeObject:self.strBy forKey:@"strBy"];
    [aCoder encodeObject:self.strID forKey:@"strID"];
    [aCoder encodeObject:self.strImage forKey:@"strImage"];
    [aCoder encodeObject:self.strTime forKey:@"strTime"];
    [aCoder encodeInt:self.type forKey:@"MessageType"];
    [aCoder encodeObject:self.strContents forKey:@"strContents"];
    
    
    //    NSLog(@"%@",self.iOSDeviceSize);
    //    for(ProjectModel *pro in self.aryPorject){
    //        NSLog(@"%@,%@",pro.projectID,pro.projectTitle);
    //    }
    
    
    
    //NSLog(@"UserID%@,TokenID%@,userName%@,passWord%@,Name%@,ImagePreson%@,Sex%@,Add%@,Sign%@,Contents%@",self.UserID,self.tokenID,self.userName,self.passWord,self.Name,self.ImagePreson,self.sex,self.add,self.sign,self.contents);
}
@end
