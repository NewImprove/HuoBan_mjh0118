//
//  CellList.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/25.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellList : NSObject{
    float progressBar;
}

@property(nonatomic,strong)NSString *peopleTxt;
@property(nonatomic,strong)NSString *dateTxt;
@property(nonatomic,strong)NSString *countryTxt;
@property(nonatomic,strong)NSString *typeTxt;
@property(nonatomic,strong)NSString *titleTxt;
@property(nonatomic,strong)NSString *imageViewTxt;
@property(nonatomic,assign)float progressBarNum;


@end
