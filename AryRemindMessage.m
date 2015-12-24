//
//  AryRemindMessage.m
//  huoban
//
//  Created by Lyc on 15/12/19.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "AryRemindMessage.h"

@implementation AryRemindMessage


//解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if(self){
        
        self.aryRemindMessage = [aDecoder decodeObjectForKey:@"aryRemindMessage"];
    
    }
    return self;
}

//编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.aryRemindMessage forKey:@"aryRemindMessage"];
  

}


@end
