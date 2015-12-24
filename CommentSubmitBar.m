//
//  YFInputBar.m
//  test
//
//  Created by 杨峰 on 13-11-10.
//  Copyright (c) 2013年 杨峰. All rights reserved.
//

#import "CommentSubmitBar.h"
#import "AppDelegate.h"


@implementation CommentSubmitBar
@synthesize SizeByiOS;

bool _isAnswer;
NSString *_strCommentTEXT;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        


        
        self.frame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));
        
        UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, -0.5, CGRectGetWidth(frame), 0.5)];
        viewLine.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1];
        [self addSubview:viewLine];
        
        
        self.textField.tag = 10000;
        self.sendBtn.tag = 10001;
        self.textField.delegate = self;
        
        //注册键盘通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        
        [self setFrame:frame];
        
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
    self.frame = CGRectMake(0, CGRectGetMinY(originalFrame), CGRectGetWidth(originalFrame), CGRectGetHeight(originalFrame));
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
        
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, _originalFrame.size.width - 70,50)];
        
        _textField.clipsToBounds = YES;
        _textField.font = [UIFont systemFontOfSize:14.7];
        _textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12, 0)];
//        设置显示模式为永远显示(默认不显示)
        _textField.leftViewMode = UITextFieldViewModeAlways;
        [_textField setTextColor:[UIColor colorWithRed:33.0/255 green:33.0/255 blue:33.0/255 alpha:1]];
        
        _textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:_textField];
        _textField.placeholder = @"写评论 ...";
    }
    [_textField setReturnKeyType:UIReturnKeyDone];
    
    return _textField;
}
-(UIButton *)sendBtn
{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendBtn setTitle:@"发布" forState:UIControlStateNormal];
//        [_sendBtn setBackgroundColor:[UIColor whiteColor]];
        NSLog(@"%f",_originalFrame.size.width - 50);
        [_sendBtn setFrame:CGRectMake(_originalFrame.size.width - 70,0,70, 50)];
        [_sendBtn.titleLabel setFont:[UIFont systemFontOfSize:14.7]];
        [_sendBtn addTarget:self action:@selector(sendBtnPress:) forControlEvents:
         UIControlEventTouchUpInside];
        [_sendBtn setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
        [_sendBtn setBackgroundColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1]];
        [self addSubview:_sendBtn];
    }
    
    return _sendBtn;
    
}

#pragma mark selfDelegate method

-(void)sendBtnPress:(UIButton*)sender
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(inputBar:sendBtnPress:withInputString:)]) {
        if(_isAnswer == YES){
            [self.delegate inputBarAnswerComment:self sendBtnPress:sender withInputString:self.textField.text strCommentID:_strCommentTEXT];
        }else{
            
        [self.delegate inputBar:self sendBtnPress:sender withInputString:self.textField.text];
        }
    
    }
    if (self.clearInputWhenSend) {
        self.textField.text = @"";
    }
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
    
    _isAnswer = NO;
    
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

-(void)CommentBecome:(NSString *)subName strCommentID:(NSString *)strCommentID isAns:(BOOL)isAns{
    
    [self.textField becomeFirstResponder];
    if(isAns == YES){
        _isAnswer = YES;
    }
    _strCommentTEXT = strCommentID;
    self.textField.text = [NSString stringWithFormat:@"@%@ ",subName];
}

-(BOOL)resignFirstResponder
{
    [self.textField resignFirstResponder];
    return [super resignFirstResponder];
}
@end
