//
//  ArticleHTMLViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/24.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleHTMLViewController : UIViewController

@property(nonatomic,strong)NSString *strContents;

@property (weak, nonatomic) IBOutlet UIWebView *webViewContents;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webViewTopNum;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

- (IBAction)buttonCancel:(id)sender;
@end
