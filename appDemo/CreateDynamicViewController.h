//
//  CreateDynamicViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SendDynamicBar.h"
#import "ProjectModel.h"
#import "PECropViewController.h"

@class CreateDynamicViewController;
@protocol CreateDynamicDelegate <NSObject>

-(void)createDynamicDone:(CreateDynamicViewController*)controller;
-(void)createDynamicClose:(CreateDynamicViewController *)controller;

@end


@interface CreateDynamicViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,SendDynamicDelegate,PECropViewControllerDelegate>


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContentTop;

@property (weak, nonatomic) IBOutlet UITextView *textViewCreateDynamic;

- (IBAction)buttonBackground:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *ImageCreateDynamic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContentsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageContentsWidth;

- (IBAction)buttonCancel:(id)sender;

@property(nonatomic,strong)id<CreateDynamicDelegate>delegate;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelHeight;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;


@property(nonatomic,strong)ProjectModel *projectModelSendData;
@end
