//
//  YFInputBar.m
//  test
//
//  Created by 杨峰 on 13-11-10.
//  Copyright (c) 2013年 杨峰. All rights reserved.
//

#import "SendDynamicBar.h"
#import "AppDelegate.h"
#import "DataModel.h"
@implementation SendDynamicBar
@synthesize imageBtn,imageViewBtn,imageViewImage;
DataModel *_dataModelSendDynamic;

NSString *_iOSSizeSendDynamic;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _iOSSizeSendDynamic =   _dataModelSendDynamic.userInfomation.iOSDeviceSize;
        
        
        self.frame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));
        
        self.textField.tag = 10000;
        self.sendBtn.tag = 10001;
        self.imageBtn.tag = 10002;
        
        
        
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, CGRectGetWidth(frame), 0.5)];
        viewLine.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1];
        [self addSubview:viewLine];
        
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        
        
        //
        self.imageBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
    
        
        UIEdgeInsets imageInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.imageBtn.imageEdgeInsets = imageInset;
        //        _imageBtm.imageEdgeInsets = UIEdgeins;
        
        [self.imageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.imageBtn setFrame:CGRectMake(12, 0, 50, 50)];
        
        //        [self.imageBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
        
        //        [self.imageBtn setImage:[[UIImage imageNamed:@"imageICON@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        
        
        
        //        [self.imageBtn setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
        
        //        self.imageBtn.layer.borderWidth = 1.0f;
        //        [_imageBtm addTarget:self action:@selector(choseImageBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.imageBtn];
        
        self.imageViewImage = [[UIImageView alloc] initWithFrame:CGRectMake(12,12,30,20)];
        
        if( [_iOSSizeSendDynamic isEqualToString:@"iPhone6Plus"]){
            self.imageViewImage.image = [UIImage imageNamed:@"choosefrom album@3x"];
        }else{
            self.imageViewImage.image = [UIImage imageNamed:@"choosefrom album@2x"];
        }
        
        [self addSubview:self.imageViewImage];
        
               //注册键盘通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _originalFrame = frame;
}
//_originalFrame的set方法  因为会调用setFrame  所以就不在此做赋值；
-(void)setOriginalFrame:(CGRect)originalFrame
{
    self.frame = CGRectMake(0, CGRectGetMinY(originalFrame),CGRectGetWidth(originalFrame),CGRectGetHeight(originalFrame));
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark get方法实例化输入框／btn
-(UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        //        _textField.backgroundColor = [UIColor whiteColor];
        //        [self addSubview:_textField];
        
    }
    return _textField;
}
-(UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendBtn setTitle:@"发布" forState:UIControlStateNormal];

        [_sendBtn setFrame:CGRectMake(_originalFrame.size.width - 70, 0, 70, 50)];
        [_sendBtn setTitleColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1] forState:UIControlStateNormal];
        [_sendBtn.titleLabel setFont:[UIFont systemFontOfSize:14.7]];
        [_sendBtn addTarget:self action:@selector(sendBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendBtn];
    }
    return _sendBtn;
}


//-(UIButton *)_imageBtm{
//
//    if(_imageBtm){
//
//        _imageBtm = [UIButton buttonWithType:UIButtonTypeCustom];
//
//        [_imageBtm setTitle:@"图片" forState:UIControlStateNormal];
//
//        [_imageBtm setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//
//        [_imageBtm setFrame:CGRectMake(10, 10, 40, 24)];
//
//        [_imageBtm addTarget:self action:@selector(choseImageBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_imageBtm];
//
//    }
//
//    return _imageBtm;
//
//}
#pragma mark selfDelegate method


-(void)choseImageBtn:(UIButton*)sender{
    
    NSLog(@"点击选择照片");
}

-(void)sendBtnPress:(UIButton*)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(inputBar:sendBtnPress:withInputString:)]) {
        [self.delegate inputBar:self sendBtnPress:sender withInputString:@""];
    }
    //    if (self.clearInputWhenSend) {
    //        self.textField.text = @"";
    //    }
    if (self.resignFirstResponderWhenSend) {
        [self resignFirstResponder];
    }
}

#pragma mark keyboardNotification

- (void)keyboardWillShow:(NSNotification*)notification{
    CGRect _keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"%f-%f-%f-%f",_keyboardRect.origin.y,_keyboardRect.size.height,[self getHeighOfWindow]-CGRectGetMaxY(self.frame),CGRectGetMinY(self.frame));
    //如果self在键盘之下 才做偏移
    if ([self convertYToWindow:CGRectGetMaxY(self.originalFrame)]>=_keyboardRect.origin.y)
    {
        //没有偏移 就说明键盘没出来，使用动画
        if (self.frame.origin.y== self.originalFrame.origin.y) {
            
            [UIView animateWithDuration:0.3
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.transform = CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height+[self getHeighOfWindow]-CGRectGetMaxY(self.originalFrame));
                             } completion:nil];
        }
        else
        {
            self.transform = CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height+[self getHeighOfWindow]-CGRectGetMaxY(self.originalFrame));
        }
        
    }
    else
    {
        
    }
    
}

- (void)keyboardWillHide:(NSNotification*)notification{
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.transform = CGAffineTransformMakeTranslation(0, 0);
                     } completion:nil];
    
}
#pragma  mark ConvertPoint
//将坐标点y 在window和superview转化  方便和键盘的坐标比对
-(float)convertYFromWindow:(float)Y
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGPoint o = [appDelegate.window convertPoint:CGPointMake(0, Y) toView:self.superview];
    return o.y;
    
}
-(float)convertYToWindow:(float)Y
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGPoint o = [self.superview convertPoint:CGPointMake(0, Y) toView:appDelegate.window];
    return o.y;
    
}
-(float)getHeighOfWindow
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    return appDelegate.window.frame.size.height;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
    
}

-(BOOL)resignFirstResponder
{
    [self.textField resignFirstResponder];
    return [super resignFirstResponder];
}
@end
