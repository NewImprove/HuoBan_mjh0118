//
//  DataModelCellProjectDetailDynamic.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/4.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "DataModelCellProjectDetailDynamic.h"


@implementation DataModelCellProjectDetailDynamic
@synthesize labelContents,createDate,dicComment,dicProject,dicUp,dicUser,imageContent,isCreator;

NSDateFormatter *_dateFormatterDetailsDynamic;

-(DataModelCellProjectDetailDynamic*)initWithResJSON:(id)JSON{
    
    _dateFormatterDetailsDynamic = [[NSDateFormatter alloc] init];
    
    [_dateFormatterDetailsDynamic setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    self = [super init];
    if(self){
        
        NSLog(@"%@",JSON);
        
        NSLog(@"%@",[JSON objectForKey:@"time"]);
        
        self.labelContents = [JSON objectForKey:@"message"];
//        self.createDate = [JSON objectForKey:@"time"];
        self.dicComment = [[NSMutableDictionary alloc] initWithDictionary:[JSON objectForKey:@"comment"]];
        self.dicProject = [[NSMutableDictionary alloc] initWithDictionary:[JSON objectForKey:@"project"]];
        
        self.dicUp = [[NSMutableDictionary alloc] initWithDictionary:[JSON objectForKey:@"up"]];
        self.dicUser = [[NSMutableDictionary alloc] initWithDictionary:[JSON objectForKey:@"user"]];
        self.imageContent = [JSON objectForKey:@"image"];
        self.createDate = [_dateFormatterDetailsDynamic dateFromString:[[JSON objectForKey:@"time"] substringToIndex:19]];
        self.isCreator = [NSString stringWithFormat:@"%lu",[[JSON objectForKey:@"isCreator"] longValue]];
        
        
        
        NSLog(@"%@-----%@",self.createDate,[[JSON objectForKey:@"time"] substringToIndex:19]);
        
        
    }
    return self;
}




@end
