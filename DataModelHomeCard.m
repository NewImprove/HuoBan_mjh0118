//
//  DataModelHomeCard.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/4.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "DataModelHomeCard.h"

@implementation DataModelHomeCard
@synthesize factMoney,factPreson,createData,dicCreate,endData,title,type,iD,wantedMoney,isFocus,address,images,desc,isJoin;

NSDateFormatter *_dateFormatterHomeCard;


-(DataModelHomeCard*)initWithResJSON:(id)JSON{
    
    self = [super init];
    
    if(self){
        

        
        
        _dateFormatterHomeCard = [[NSDateFormatter alloc] init];

        [_dateFormatterHomeCard setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

        NSLog(@"打印JSON时间时间%@-----打印程序JSON时间时间%@",[JSON objectForKey:@"end_date"],[_dateFormatterHomeCard dateFromString:[[JSON objectForKey:@"end_date"] substringToIndex:10]]);
        
    


        
        
        self.factPreson = [[JSON objectForKey:@"fact_person"] longValue];
//        self.creator = [JSON objectForKey:@"creator"];
        
        
        //主页名称改成数组数组
//
        
//        self.dicCreate = [[NSMutableDictionary alloc] initWithDictionary:[JSON objectForKey:@"creator"]];
        
//        for(NSMutableDictionary *dicCreatorXXX in [JSON objectForKey:@"creator"]){
//            
//            [self.dicCreate addObject:dicCreatorXXX];
//            
//        }
        
        NSLog(@"%@",[JSON objectForKey:@"creator"]);
        
        self.dicCreate = [[NSMutableArray alloc] initWithArray:[JSON objectForKey:@"creator"]];
        
        NSLog(@"打印打印%@",self.dicCreate);
        
        self.createData = [_dateFormatterHomeCard dateFromString:[[JSON objectForKey:@"create_date"] substringToIndex:10]];
        
//        NSDate *date = [NSDate date];
//        
//        NSTimeZone *zone = [NSTimeZone systemTimeZone];
//        
//        NSInteger interval = [zone secondsFromGMTForDate: date];
//        
//        NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
        
//        self.endData = [_dateFormatterHomeCard dateFromString:[[JSON objectForKey:@"end_date"] substringTIndex:10]];
        NSLog(@"%@",[JSON objectForKey:@"end_date"]);
        
        self.endData = [_dateFormatterHomeCard dateFromString:[JSON objectForKey:@"end_date"]];
//
        NSLog(@"%@",self.endData);
        
        NSDate *Datettt = self.endData;
        
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        
        NSInteger interval = [zone secondsFromGMTForDate:Datettt];
        
        NSDate *localeDate = [Datettt dateByAddingTimeInterval: interval];

        
        NSLog(@"%@",localeDate);

        self.endData = localeDate;
        
        NSLog(@"%@",self.endData);
        
        
        
        self.factMoney = [[JSON objectForKey:@"fact_money"] floatValue];
        self.wantedMoney = [[JSON objectForKey:@"wanted_money"] floatValue];
        self.title = [JSON objectForKey:@"title"];
        self.isFocus = [[JSON objectForKey:@"isFocus"] longValue];
        self.address = [JSON objectForKey:@"address"];
        self.images = [[NSMutableArray alloc] initWithArray:[JSON objectForKey:@"images"]];
        self.iD = [JSON objectForKey:@"_id"];
        self.type = [JSON objectForKey:@"type"];
        self.desc = [JSON objectForKey:@"desc"];
        self.isJoin = [[JSON objectForKey:@"isorder"] longValue];
//        self.isJoin = 1;
        

    }
    
    
    return self;

}



@end
