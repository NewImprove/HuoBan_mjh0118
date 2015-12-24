//
//  MoreDynamicViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/20.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModel.h"
#import "LoginViewController.h"
#import "UMSocial.h"

@interface MoreDynamicViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,LoginViewControllerDelegate,UMSocialDataDelegate,UMSocialUIDelegate>

@property(nonatomic,strong)ProjectModel *projectModelDynamicSelf;

@property(nonatomic,strong)NSString *strProjectID;
@property(nonatomic,strong)NSString *strCreatorUserID;

@property(nonatomic,strong)NSMutableArray *aryChouMordDynameic;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;

- (IBAction)buttonCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMoreDynamic;

@property(nonatomic,assign)NSInteger countPayDate;

@property(nonatomic,strong)NSDate *dateEnd;

@property(nonatomic,strong)NSString *strShareTitle;
@property(nonatomic,strong)NSString *strShareText;
@property(nonatomic,strong)NSString *strShareImage;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewClose;

@property (weak, nonatomic) IBOutlet UIButton *buttonClose;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewShare;

@property (weak, nonatomic) IBOutlet UIButton *buttonShare;
- (IBAction)buttonClose:(id)sender;

- (IBAction)buttonShare:(id)sender;


@end
