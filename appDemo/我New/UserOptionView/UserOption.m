//
//  UserOption.m
//  huoban
//
//  Created by 马锦航 on 15/12/15.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserOption.h"

// Screen Scale
#define MainScreenScale         [[UIScreen mainScreen] scale]

// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define OptionLineColor  [UIColor colorWithRed:249.0/255.0f green:237/255.0f blue:49/255.0f alpha:1]
#define OptionItemColor  [UIColor colorWithRed:38.0/255.0f green:56/255.0f blue:70/255.0f alpha:1]
//下划线的高度
static NSInteger optionItemLineHeight = 2;

//选项按钮的高度
static NSInteger optionItemHeight = 55;


//下划线的颜色 
// #F9ED31   RGB:249,237,49

@implementation UserOption


- (instancetype)initWithFrame:(CGRect)frame userOptionsArray:(NSArray *)userOptionsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        [self userOptionsWithAmount:0];
    }
    return self;
}


/**
  用户选项视图的View
 Amount:总个数
 */
- (void)userOptionsWithAmount:(NSInteger)amount {
    NSInteger _amount;
    if (amount == 0) {
        _amount = 2;
    }
    else {
        _amount = amount;
    }
    for (int i = 0; i < _amount; i ++) {
        //设置optionView背景色为下划线的颜色
        UIView * optionView = [[UIView alloc]initWithFrame:CGRectMake(i * Main_Screen_Width/_amount, 0, Main_Screen_Width/_amount, optionItemHeight+optionItemLineHeight)];
        optionView.tag = i;
        [optionView setBackgroundColor:OptionItemColor];
        if (i == 0) {
            [optionView setBackgroundColor:OptionLineColor];
        }
        //设置button
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/_amount, optionItemHeight)];
        button.tag = i;
        [button setBackgroundColor:RGBCOLOR(38, 56, 70)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [optionView addSubview:button];
        [self addSubview:optionView];
    }
}


- (void) buttonAction:(UIButton *)sender {
    NSLog(@"UserOptionButtonAction");

    for (UIView * view in self.subviews) {
        
        if (view.tag == sender.tag) {
            view.backgroundColor = OptionLineColor;
        }
        else{
            view.backgroundColor = OptionItemColor;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
