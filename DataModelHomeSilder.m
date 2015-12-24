//
//  DataModelHomeSilder.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "DataModelHomeSilder.h"

@implementation DataModelHomeSilder
@synthesize arySilderImage,projectID,strContents,imageType;

-(DataModelHomeSilder*)initWithResJSON:(id)JSON{
    
    self = [super init];
    if(self){
     
        NSLog(@"%@,%@",[JSON objectForKey:@"images"],[JSON objectForKey:@"_id"]);
        self.arySilderImage = [[NSMutableArray alloc] initWithArray:[JSON objectForKey:@"images"]];
        self.projectID = [JSON objectForKey:@"_id"];
        
        NSLog(@"%@,%@",self.arySilderImage,self.projectID);
        
        self.strContents = [JSON objectForKey:@"content"];
        
        self.imageType = [JSON objectForKey:@"slide_type"];
        
        
        
        
        
    }
    return self;
}
@end
