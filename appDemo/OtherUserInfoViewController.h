//
//  OtherUserInfoViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/29.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherUserInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagePreson;
//@property (weak, nonatomic) IBOutlet UILabel *labelDynamicNum;

//@property (weak, nonatomic) IBOutlet UILabel *labelSign;

@property (weak, nonatomic) IBOutlet UILabel *labelContents;

@property(nonatomic,strong)NSMutableDictionary *dicOtherUser;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelBy;
@property (weak, nonatomic) IBOutlet UILabel *labelJoin;
@property (weak, nonatomic) IBOutlet UILabel *labelLove;
//@property (weak, nonatomic) IBOutlet UIImageView *imageViewMain;
@property (weak, nonatomic) IBOutlet UILabel *labelCreate;

@end
