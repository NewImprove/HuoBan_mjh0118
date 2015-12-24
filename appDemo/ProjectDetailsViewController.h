//
//  ProjectMessageViewController.h
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModel.h"
#import "ProjectDynamicSelfTableViewController.h"
#import "ProjectMoreStoryViewController.h"
#import "ALMoviePlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "LoginViewController.h"
#import "UMSocialData.h"
#import "UMSocialDataService.h"
#import "UMSocialControllerService.h"

@interface ProjectDetailsViewController : UIViewController<ProjectDynamicSelfDelegate,LoginViewControllerDelegate,UMSocialUIDelegate,UMSocialDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageViewJoin;

@property (weak, nonatomic) IBOutlet UILabel *textFactMoney;
@property (weak, nonatomic) IBOutlet UILabel *textWantedMoney;
@property (weak, nonatomic) IBOutlet UILabel *labelCreator;
@property (weak, nonatomic) IBOutlet UILabel *labelHuoban;

@property (weak, nonatomic) IBOutlet UIImageView *imageAdd;

@property (weak, nonatomic) IBOutlet UIImageView *imageType;

@property (weak, nonatomic) IBOutlet UILabel *textTitle;

@property (weak, nonatomic) IBOutlet UILabel *textType;

@property (weak, nonatomic) IBOutlet UILabel *textCountry;

@property (weak, nonatomic) IBOutlet UILabel *textSummarize;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imagelineHeight;

@property (weak, nonatomic) IBOutlet UIButton *buttonMoreDynamic;
@property (weak, nonatomic) IBOutlet UILabel *textPercentage;

@property (weak, nonatomic) IBOutlet UILabel *textContents;
@property (weak, nonatomic) IBOutlet UILabel *labelProgress;

@property (weak, nonatomic) IBOutlet UILabel *labelFactMoney;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTOP;

@property (nonatomic, strong)MPMoviePlayerController *moviePlayer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewCreatorTopHeight;

@property (weak, nonatomic) IBOutlet UIView *viewSuccess;

@property (weak, nonatomic) IBOutlet UIImageView *imagesTimeLines;

//@property(nonatomic,strong)ALMoviePlayerController *ALmoviePlayer;


@property (weak, nonatomic) IBOutlet UIImageView *imageViewLove;

- (IBAction)buttonMoreStory:(id)sender;

- (IBAction)buttonMoreDynamic:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonMoreStory;

@property (weak, nonatomic) IBOutlet UIButton *buttonCollect;

- (IBAction)buttonLove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonLove;
- (IBAction)buttonAllPreson:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonAllPreson;

@property(nonatomic,strong)ProjectModel *projectModel;

@property(nonatomic,strong)NSString *strProjectID;


@property (weak, nonatomic) IBOutlet UIView *viewImagePresonBlock;

@property (weak, nonatomic) IBOutlet UIView *viewCreatorBlock;
@property (weak, nonatomic) IBOutlet UIView *viewFocusBlock;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewFocusHeight;

@end
