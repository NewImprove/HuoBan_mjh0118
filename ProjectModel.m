//
//  ProjectModel.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/13.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ProjectModel.h"

@implementation ProjectModel
@synthesize projectID,projectTitle;




-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if(self){
        
        projectID = [aDecoder decodeObjectForKey:@"ProejctID"];
        projectTitle = [aDecoder decodeObjectForKey:@"ProjectTitle"];
        
        
    }
    return self;
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:projectID forKey:@"ProejctID"];
    [aCoder encodeObject:projectTitle forKey:@"ProjectTitle"];
    
}



@end
