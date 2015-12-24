//
//  TalkViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/23.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TalkViewController;
@protocol talkViewDelegate <NSObject>

-(void)talkViewControllerDeleteDynamic:(TalkViewController*)controller;

@end


@interface TalkViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imagePreson;
@property (weak, nonatomic) IBOutlet UILabel *isCreator;

@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (weak, nonatomic) IBOutlet UIImageView *imageDelete;
@property (weak, nonatomic) IBOutlet UILabel *labelProjectName;
@property (weak, nonatomic) IBOutlet UIImageView *imageLove;

@property (weak, nonatomic) IBOutlet UILabel *labelTalk;

- (IBAction)buttonBy:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonBy;
@property (weak, nonatomic) IBOutlet UILabel *labelBy;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

- (IBAction)buttonDelete:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonLoveRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewContentHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewContentWidth;


@property (weak, nonatomic) IBOutlet UIView *viewComment;

@property (weak, nonatomic) IBOutlet UIButton *buttonLove;

- (IBAction)buttonLove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *keyBoardCancel;

- (IBAction)buttonUpList:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonUpList;

@property (weak, nonatomic) IBOutlet UILabel *labelContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageContent;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewTalk;

@property(nonatomic,strong)NSMutableDictionary *dicTalk;

- (IBAction)buttonCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelFocusPreson;

@property(nonatomic)NSInteger  dataModelCount;

@property(nonatomic,strong)NSString *strfeedID;

@property(nonatomic)BOOL isDelete;

@property(nonatomic,strong)id<talkViewDelegate>delegate;


@property(nonatomic)BOOL keyBoardIsAppear;

- (IBAction)keyBoardCancel:(id)sender;

@end
