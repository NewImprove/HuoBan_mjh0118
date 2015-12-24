//
//  CellList.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/25.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "CellList.h"

@implementation CellList

-(id)init{
    
    self = [super init];
    if(self){
        self.peopleTxt = @"";
        self.dateTxt = @"";
        self.imageViewTxt = @"";
        self.titleTxt = @"";
        self.typeTxt = @"";
        self.countryTxt = @"";
        self.progressBarNum = 0.0;
    }
    return self;
    
}


@end
