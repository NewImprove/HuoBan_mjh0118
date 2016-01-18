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

#define OptionLineColor  [UIColor colorWithRed:249.0/255.0f green:237.0/255.0f blue:49.0/255.0f alpha:1]

// 51,163,219
#define OptionLineColor_otherVC [UIColor colorWithRed:51.0/255.0f green:163.0/255.0f blue:219.0/255.0f alpha:1]

//238,238,238
#define OptionItemColor_otherVC [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1]



#define OptionItemColor  [UIColor colorWithRed:38.0/255.0f green:56/255.0f blue:70/255.0f alpha:1]

//字体宏
#define PingFangSC(s)     [UIFont fontWithName:@"PingFangSC-Regular" size:s]



//下划线的高度
static NSInteger optionItemLineHeight = 2;

//选项按钮的高度
static NSInteger optionItemHeight = 55;

//static NSInteger optionItemHeight = 70;

typedef void(^changeOptionSelectedBlock)(NSInteger optionIndex);

//下划线的颜色
// #F9ED31   RGB:249,237,49

//static UIColor * optionLineColor;
//static UIColor * optionBgColor;

@interface UserOption ()


@property (nonatomic,assign) BOOL isSelfViewControler;

@end

@implementation UserOption

- (instancetype)initWithFrame:(CGRect)frame userOptionsArray:(NSArray *)userOptionsArray WithIsSelfViewController:(BOOL)isSelfVC
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //        [UIColor redColor]
#warning 2>>4
        
        self.backgroundColor = isSelfVC?OptionItemColor:OptionItemColor_otherVC;
        
        self.isSelfViewControler = isSelfVC;
        
        self.segmentCount = 2;
        
    }
    return self;
}


-(void)setSegmentCount:(NSInteger)segmentCount {
    _segmentCount = segmentCount;
    if (segmentCount !=4) {
        _segmentCount = 2;
    }
    [self userOptionsWithAmount:self.segmentCount];
}


- (NSMutableArray *)userOptionViewItems {
    if (!_userOptionViewItems) {
        _userOptionViewItems = [NSMutableArray new];
    }
    return _userOptionViewItems;
}
//option  显示文字


- (void)setUserOptionsArray:(NSArray *)userOptionsArray {
    _userOptionsArray = userOptionsArray;
    for (NSString * str in userOptionsArray) {
        NSLog(@"%@",str);
    }
}

- (void)setDataModel:(huobanUserBaseInfoData *)dataModel {
    _dataModel = dataModel;
    [((UIButton *)self.userOptionViewItems[0]) setTitle:[NSString stringWithFormat:@"%zi",dataModel.allprojects.count] forState:UIControlStateNormal];
    [((UIButton *)self.userOptionViewItems[1]) setTitle:[NSString stringWithFormat:@"%zi",dataModel.feed.count] forState:UIControlStateNormal];
    
#warning 0>>1 四个选项
    if (self.segmentCount == 4) {
        [((UIButton *)self.userOptionViewItems[2]) setTitle:[NSString stringWithFormat:@"%zi",dataModel.followers] forState:UIControlStateNormal];
        [((UIButton *)self.userOptionViewItems[3]) setTitle:[NSString stringWithFormat:@"%zi",dataModel.following] forState:UIControlStateNormal];
    }
    
    
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
        
        
        //        [optionView setBackgroundColor:OptionItemColor];
        
        if (i == 0) {
            if (self.isSelfViewControler) {
                [optionView setBackgroundColor:OptionLineColor];
            } else {
                [optionView setBackgroundColor:OptionLineColor_otherVC];
            }
            
            
            self.selectedIndex = 0;
        }
        
        UIButton * buttonTypeName = [[UIButton alloc]init];
        //上下布局
        //                buttonTypeName.frame = CGRectMake(0, optionItemHeight/2, Main_Screen_Width/_amount, optionItemHeight/2);
        //左右布局
        buttonTypeName.frame = CGRectMake(Main_Screen_Width/_amount/2, 0, Main_Screen_Width/_amount/2, optionItemHeight);
        
        
        NSLog(@"%@",NSStringFromCGRect(buttonTypeName.frame));
        
        buttonTypeName.backgroundColor = self.isSelfViewControler?OptionItemColor:OptionItemColor_otherVC;
        buttonTypeName.titleLabel.font = PingFangSC(12);
        buttonTypeName.titleEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
        [buttonTypeName setTitleColor:RGBCOLOR(170, 170, 170) forState:UIControlStateNormal];
        buttonTypeName.tag = i+100;
        
        switch (i) {
            case 0:
            {
                [buttonTypeName setTitle:@"项目" forState:UIControlStateNormal];
            }
                break;
            case 1:
            {
                [buttonTypeName setTitle:@"动态" forState:UIControlStateNormal];
            }
                break;
            case 2:
            {
                [buttonTypeName setTitle:@"关注" forState:UIControlStateNormal];
            }
                break;
            case 3:
            {
                [buttonTypeName setTitle:@"被关注" forState:UIControlStateNormal];
            }
                break;
            default:
                break;
        }
        
        //        [buttonTypeName setTitle:@"项目" forState:UIControlStateNormal];
        [buttonTypeName addTarget:self action:@selector(typeButtonAciton:) forControlEvents:UIControlEventTouchUpInside];
        
        [optionView addSubview:buttonTypeName];
        //设置button
        //上下布局
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/_amount/2, optionItemHeight)];
        
        //左右布局
        //        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/_amount, optionItemHeight/2)];
        
        button.backgroundColor = self.isSelfViewControler?OptionItemColor:OptionItemColor_otherVC;
        
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
        
        //        [button setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0]];
        //        button.alpha = 0.1;
        button.tag = i;
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //        [button addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = PingFangSC(24);
        
        if (self.isSelfViewControler) {
            [button setTitleColor:OptionLineColor forState:UIControlStateNormal];
        } else {
            [button setTitleColor:OptionLineColor_otherVC forState:UIControlStateNormal];
        }
        //        [button setBackgroundColor:[UIColor orangeColor]];
        [optionView addSubview:button];
        
        [self addSubview:optionView];
        
        
        //将button依次添加到属性userOptionViewItmes中
        [self.userOptionViewItems addObject:button];
    }
}


- (void) buttonAction:(UIButton *)sender {
    NSLog(@"UserOptionButtonAction");
    
    for (UIView * view in self.subviews) {
        
        if (view.tag == sender.tag) {
            
            view.backgroundColor = self.isSelfViewControler?OptionLineColor:OptionLineColor_otherVC;
            
            
            
            self.selectedIndex = sender.tag;
        }
        else{
            view.backgroundColor = self.isSelfViewControler?OptionItemColor:OptionItemColor_otherVC;
        }
    }
    [self.delegate segmentedControlSelectAtIndex:self.selectedIndex];
}

- (void) typeButtonAciton:(UIButton *)sender {
    for (UIView * view in self.subviews) {
        
        if (view.tag == sender.tag - 100) {
            
            view.backgroundColor = self.isSelfViewControler?OptionLineColor:OptionLineColor_otherVC;
            self.selectedIndex = sender.tag - 100;
        }
        else{
            view.backgroundColor = self.isSelfViewControler?OptionItemColor:OptionItemColor_otherVC;
        }
    }
    [self.delegate segmentedControlSelectAtIndex:self.selectedIndex];
    
}

- (void) buttonAction2:(UIButton *)sender {
    NSLog(@"buttonAction2");
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
