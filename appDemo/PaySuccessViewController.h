//
//  PaySuccessViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/11/3.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaySuccessViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagePagSuccess;

@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
- (IBAction)buttonCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

@end
