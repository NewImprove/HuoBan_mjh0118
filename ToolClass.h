//
//  ToolClass.h
//  酷评
//
//  Created by 王欢 on 14-11-6.
//  Copyright (c) 2014年 ___KEDOUWANGLUO___. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KPNetwork.h"
//#import "DKCircleButton.h"
//#import "UMSocial.h"
//#import "PXAlertView.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

#define UmengAppkey @"545996fbfd98c596d7000bbf"
#define KPLinker @"http://qoping.com/098fdb39bd81c286ca03aba2e0b40f59c24e3e9ed830a35a.jhtml"
#define KPLinkerWeb @"http://www.qoping.com"

#define KPRedColor [UIColor colorWithRed:241.0/256.0 green:82.0/256.0 blue:86.0/256.0 alpha:1.0]
#define LINEHEIGHT 6

@interface ToolClass : NSObject
//single
+sharedInstance;

-(void)showAlert:(NSString *) _message;

- (void)showTwoButtonAlertViewwithTitle:(NSString*)title withMessage:(NSString*)message withID:(id)idd;

-(NSString*)picHeightwithURL:(NSString*)string;

-(void)GetUserAddressBook;

//设置
-(void)settingViewWithNav:(UINavigationController*)nav withJudge:(int)judge withVC:(UIViewController*)vc;

//设置分享页
-(void)changeUrl:(NSString*)url;

-(void)jiesuoMethod:(id)ID;
@end
