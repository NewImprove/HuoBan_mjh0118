//
//  UserMessageViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserMessageViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *labelName;
@property (weak, nonatomic) IBOutlet UITextField *labelSex;
@property (weak, nonatomic) IBOutlet UITextView *labelContents;
@property (weak, nonatomic) IBOutlet UIImageView *imagePreson;
@property (weak, nonatomic) IBOutlet UITextField *labelPayName;
@property (weak, nonatomic) IBOutlet UITextField *labelPayTelephone;
@property (weak, nonatomic) IBOutlet UITextField *labelPayAdd;
- (IBAction)buttonTestSetting:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageClose;


@property (weak, nonatomic) IBOutlet UIButton *buttonPayList;
- (IBAction)buttonPayList:(id)sender;





@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonitemSave;
- (IBAction)buttonItemSave:(id)sender;
- (IBAction)buttonItemCancel:(id)sender;

- (IBAction)labelPayAddTouch:(id)sender;

@property(nonatomic,strong)NSMutableDictionary *dicUserMessage;
@property (weak, nonatomic) IBOutlet UIView *viewLineName;
@property (weak, nonatomic) IBOutlet UIView *viewLineSex;
@property (weak, nonatomic) IBOutlet UIView *viewLineContents;
@property (weak, nonatomic) IBOutlet UIView *viewLinePayMessage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonTopContract;
-(IBAction)backgroundTap:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTopContract;
@end
