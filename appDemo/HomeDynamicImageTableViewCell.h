//
//  MainPageTableViewCell.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/7.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

#import "DataModelHomeSilder.h"


@protocol HomeDynamicImageCellDelegate <NSObject>

-(void)HomeDynamicImageCellSegue:(DataModelHomeSilder*)sender;

@end


@interface HomeDynamicImageTableViewCell : UITableViewCell<UIScrollViewDelegate,SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *sdCycleView;

@property(nonatomic)NSMutableArray *aryImage;


@property(nonatomic)NSMutableArray *aryProjectID;

@property(nonatomic)DataModelHomeSilder *dataSilder;

@property(nonatomic,strong)id<HomeDynamicImageCellDelegate>delegate;

@property(nonatomic,strong)NSMutableArray *DataModelImage;
-(void)cleanData;

@end
