//
//  UserOption.h
//  huoban
//
//  Created by 马锦航 on 15/12/15.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "huobanUserBaseInfoData.h"

@protocol optionSegmentedControlDelegate <NSObject>

//代理方法 获取当前下标
- (void) segmentedControlSelectAtIndex:(NSInteger)index;

@end

@interface UserOption : UIView

@property (assign , nonatomic) id<optionSegmentedControlDelegate>delegate;

@property (nonatomic,strong) NSArray * userOptionsArray;

//当前选中的按钮的index
@property (nonatomic,assign) NSInteger selectedIndex;

//存放所有按钮的数组
@property (nonatomic,strong) NSMutableArray * userOptionViewItems;

@property (nonatomic,strong) huobanUserBaseInfoData * dataModel;

//项的个数
@property (nonatomic,assign) NSInteger segmentCount;
- (instancetype)initWithFrame:(CGRect)frame userOptionsArray:(NSArray *)userOptionsArray WithIsSelfViewController:(BOOL)isSelfVC;

@end
