//
//  HomePageCarouselImageData.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/24.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "HomePageCarouselImageData.h"

@implementation HomePageCarouselImageData
@synthesize projectID,imageType,strContents;


-(id)init{
    
    self =  [super init];
    
    if(self){
                
        self.projectID = @"";
        self.imageType = @"";
        self.strContents = @"";

    }
    return self;
}


@end
