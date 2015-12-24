//
//  MainPageTableViewCell.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/7.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "HomeDynamicImageTableViewCell.h"
#import "SDCycleScrollView.h"
#import "HttpClassSelf.h"
#import "DataModel.h"
#import "DataModelHomeSilder.h"
#import "HomePageCarouselImageData.h"

@implementation HomeDynamicImageTableViewCell
@synthesize sdCycleView,aryImage,aryProjectID,delegate,dataSilder,DataModelImage;

DataModel *_dataModelSider;
CGFloat widthSlider;
CGFloat heightSlider;
CGSize  iOSBoundsHomeSlider;

- (void)awakeFromNib {

    self.aryImage = [[NSMutableArray alloc] init];
    self.aryProjectID = [[NSMutableArray alloc] init];
    self.DataModelImage = [[NSMutableArray alloc] init];
    
    _dataModelSider = [[DataModel alloc] init];
    
    NSString *iPhoneSize = _dataModelSider.userInfomation.iOSDeviceSize;
    
           iOSBoundsHomeSlider = [UIScreen mainScreen].bounds.size;
    
    if([iPhoneSize isEqualToString:@"iPhone6Plus"]){
        widthSlider = iOSBoundsHomeSlider.width;
        heightSlider = 261;
    }else if([iPhoneSize isEqualToString:@"iPhone6"]){
        widthSlider = iOSBoundsHomeSlider.width;
        heightSlider = 243;
    }else if([iPhoneSize isEqualToString:@"iPhone5"]){
        widthSlider = iOSBoundsHomeSlider.width;
        heightSlider = 207;
    }else if([iPhoneSize isEqualToString:@"iPhone4"]){
        widthSlider = iOSBoundsHomeSlider.width;
        heightSlider = 207;
    }
    
}

#pragma mark - SDCycleScrollViewDelegate
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)cleanData{
    
    [self.aryImage removeAllObjects];
    [self.aryProjectID removeAllObjects];
    [self.DataModelImage removeAllObjects];
}


-(void)setDataSilder:(DataModelHomeSilder *)sender{
    
    DataModelHomeSilder *dataModelImageType = [[DataModelHomeSilder alloc]init];
    
    dataModelImageType.projectID = sender.projectID;
    dataModelImageType.imageType = sender.imageType;
    dataModelImageType.strContents = sender.strContents;
    
    NSLog(@"%@----%@----%@",dataModelImageType.projectID,dataModelImageType.imageType,dataModelImageType.strContents);
    
//    NSLog(@"打印轮播图%@",sender.arySilderImage[0]);
    [self.aryImage addObject:sender.arySilderImage[0]];
//        [self.aryProjectID addObject:sender.projectID];
    
    [self.DataModelImage addObject:dataModelImageType];
    
        NSLog(@"pID%@,Image%@",self.aryProjectID,self.aryImage);
    
        //网络加载 --- 创建带标题的图片轮播器
        self.sdCycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,widthSlider,heightSlider) imageURLStringsGroup:self.aryImage]; //
        self.sdCycleView.autoScrollTimeInterval = 3;
        self.sdCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        self.sdCycleView.delegate = self;
        [self addSubview:self.sdCycleView];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    DataModelHomeSilder *dataModelImageTypeIndex = [[DataModelHomeSilder alloc] init];
    
    dataModelImageTypeIndex = self.DataModelImage[index];
    
    [self.delegate HomeDynamicImageCellSegue:dataModelImageTypeIndex];
    
}

@end
