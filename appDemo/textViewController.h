//
//  textViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/16.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFInputBar.h"

@interface textViewController : UIViewController<YFInputBarDelegate,UITextFieldDelegate>
- (IBAction)button1:(id)sender;

- (IBAction)button2:(id)sender;



@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UILabel *labelText;



@end
