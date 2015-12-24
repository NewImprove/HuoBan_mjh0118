//
//  ProjectDetailsShare.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/19.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ProjectDetailsShare.h"

@implementation ProjectDetailsShare
@synthesize buttonWeChat,buttonWeChatS;



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 8;
        
        self.buttonWeChat  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [self.buttonWeChat setTitle:@"微信" forState:UIControlStateNormal];
        self.buttonWeChat.titleLabel.font = [UIFont systemFontOfSize:14];
        self.buttonWeChat.frame = CGRectMake(35, 17, 46, 46);
        self.buttonWeChat.layer.borderWidth = 2;
        self.buttonWeChat.layer.borderColor = [UIColor whiteColor].CGColor;
        self.buttonWeChat.clipsToBounds = YES;

        self.buttonWeChat.layer.cornerRadius = self.buttonWeChat.frame.size.width/2;
        [self addSubview:self.buttonWeChat ];
        
        self.buttonWeChatS = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.buttonWeChatS setTitle:@"朋友圈" forState:UIControlStateNormal];
        self.buttonWeChatS.titleLabel.font = [UIFont systemFontOfSize:14];
        self.buttonWeChatS.layer.borderWidth = 2;
        self.buttonWeChatS.layer.borderColor = [UIColor whiteColor].CGColor;
        self.buttonWeChatS.clipsToBounds = YES;
        self.buttonWeChatS.frame = CGRectMake(125,17,46,46);
        self.buttonWeChatS.layer.cornerRadius = self.buttonWeChatS.frame.size.width/2;
        [self addSubview:self.buttonWeChatS];
        
        self.buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.buttonClose.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.buttonClose setTitle:@"关闭" forState:UIControlStateNormal];
        self.buttonClose.layer.borderWidth = 2;
        self.buttonClose.layer.borderColor = [UIColor whiteColor].CGColor;
        self.buttonClose.clipsToBounds = YES;
        self.buttonClose.frame = CGRectMake(85, 55,35,35);
        self.buttonClose.layer.cornerRadius = self.buttonClose.frame.size.width/2;
        [self addSubview:self.buttonClose];
        
    }
    return self;
}

-(void)hidden{
    [self.window removeFromSuperview];
}
@end
