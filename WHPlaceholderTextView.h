//
//  WHPlaceholderTextView.h
//  KeyBoardAndTextView
//
//  Created by 王欢 on 14-10-22.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHPlaceholderTextView : UITextView

@property(nonatomic, strong) NSString *placeholder;     //占位符

-(void)addObserver;//添加通知
-(void)removeobserver;//移除通知

@end
