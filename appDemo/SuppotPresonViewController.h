
//  SuppotPresonViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/11/3.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocialData.h"
#import "UMSocialControllerService.h"
#import "UMSocialSnsData.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"

@interface SuppotPresonViewController : UIViewController<UMSocialDataDelegate,UMSocialUIDelegate>

@property(nonatomic,strong)NSMutableDictionary *dicChou;

@property(nonatomic,strong)NSMutableArray *dicCreator;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewHuoban;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;

- (IBAction)buttonCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

@property(nonatomic,strong)NSMutableDictionary *dicJoin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewShare;
- (IBAction)buttonShare:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonShare;


@property(nonatomic,strong)NSString *strShareTitle;
@property(nonatomic,strong)NSString *strShareText;
@property(nonatomic,strong)NSString *strProjectID;
@property(nonatomic,strong)NSString *strShareImage;

@end
