//
//  EditPayForAddAndNameViewController.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/30.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditPayForAddAndNameViewController;

@protocol EditPayForAddNameNumDelegate <NSObject>

-(void)editPayViewController:(EditPayForAddAndNameViewController*)controller strAddMessage:(NSString*)strAddMessage strName:(NSString*)strName strTelephone:(NSString*)strTelephone strPostCode:(NSString*)strPostCode;

@end

@interface EditPayForAddAndNameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *labelTelephoneNum;

- (IBAction)labelUpbyKeyBoard:(id)sender;

- (IBAction)buttonSave:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelTopNum;


@property (weak, nonatomic) IBOutlet UITextField *labelAddress;
@property (weak, nonatomic) IBOutlet UITextField *labelPost;
@property (weak, nonatomic) IBOutlet UITextField *labelGetPresonName;


@property (weak, nonatomic) IBOutlet UIImageView *imageClose;

@property(nonatomic,strong)NSString *strName;
@property(nonatomic,strong)NSString *strAdd;
@property(nonatomic,strong)NSString *strTelephoneNum;

- (IBAction)buttonCancel:(id)sender;

-(IBAction)backgroundTap:(id)sender;
@property(nonatomic,strong)id<EditPayForAddNameNumDelegate>delegate;
@end
