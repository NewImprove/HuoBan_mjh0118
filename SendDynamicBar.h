//
//  YFInputBar.h
//  test
//
//  Created by 杨峰 on 13-11-10.
//  Copyright (c) 2013年 杨峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SendDynamicBar;
@protocol SendDynamicDelegate <NSObject>

-(void)inputBar:(SendDynamicBar*)inputBar sendBtnPress:(UIButton*)sendBtn withInputString:(NSString*)str;

@end
@interface SendDynamicBar : UIView

//代理 用于传递btn事件
@property(assign,nonatomic)id<SendDynamicDelegate> delegate;
//这两个可以自己付值
@property(strong,nonatomic)UITextField *textField;
@property(strong,nonatomic)UIButton *sendBtn;
@property(strong,nonatomic)UIImageView *imageViewBtn;
@property(strong,nonatomic)UIButton *imageBtn;
@property(strong,nonatomic)UIImageView *imageViewImage;
@property(strong,nonatomic)UIButton *poundBtn;

//点击btn时候 清空textfield  默认NO
@property(assign,nonatomic)BOOL clearInputWhenSend;
//点击btn时候 隐藏键盘  默认NO
@property(assign,nonatomic)BOOL resignFirstResponderWhenSend;

//初始frame
@property(assign,nonatomic)CGRect originalFrame;

//隐藏键盘
-(BOOL)resignFirstResponder;
@end
