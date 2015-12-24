//
//  ToolClass.m
//  酷评
//
//  Created by 王欢 on 14-11-6.
//  Copyright (c) 2014年 ___KEDOUWANGLUO___. All rights reserved.
//

#import "ToolClass.h"
//#import "SettingViewController.h"
//#import "PersonInfoViewController.h"
//#import "SuggestViewController.h"
//#import "UMSocialQQHandler.h"
//#import "UMSocialWechatHandler.h"
//#import "ChangePersonViewController.h"
static ToolClass *shareTool = nil;

@interface ToolClass()

@property(nonatomic,strong)UINavigationController *nav; //获取调用设置方法的导航条指针
@property(nonatomic) int judgeInt; //判断是否解锁
@property(nonatomic,strong) UIViewController* vc;
@end

@implementation ToolClass

+sharedInstance
{
    @synchronized(self)
    {
        if (shareTool == nil) {
            shareTool = [[self alloc]init];
        }
    }
    
    return shareTool;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self)
    {
        if (shareTool == nil) {
            shareTool = [super allocWithZone:zone];
            return shareTool;
        }
    }
    return  nil;

}

- (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}


- (void)showAlert:(NSString *) _message
{
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}


////解锁用的提示框
//- (void)showTwoButtonAlertViewwithTitle:(NSString*)title withMessage:(NSString*)message withID:(id)idd
//{
//    [PXAlertView showAlertWithTitle:title
//                            message:@""
//                        cancelTitle:@"稍后解锁"
//                         otherTitle:@"立即解锁"
//                         completion:^(BOOL cancelled) {
//                             
//                             if (cancelled) {
//                                 
//                             } else {
//                                 
//                                 [[ToolClass sharedInstance]jiesuoMethod:idd];
//                             }
//    }];
//}


-(NSString*)picHeightwithURL:(NSString*)string
{
    NSArray *array = [string componentsSeparatedByString:@"."];
    if ([array[array.count-2] hasPrefix:@"!"]) {//说明有宽高比
        
        NSString *subString = array[array.count-2];
        subString = [subString substringFromIndex:1];
        array = [subString componentsSeparatedByString:@"X"];
        return [NSString stringWithFormat:@"%.f",[array[1] floatValue]*300.0/[array[0]floatValue]];
    }
    else if([array[array.count-3] hasPrefix:@"!"]){
        NSString *subString = array[array.count-3];
        subString = [subString substringFromIndex:1];
        array = [subString componentsSeparatedByString:@"X"];
        return [NSString stringWithFormat:@"%.f",[array[1] floatValue]*300.0/[array[0]floatValue]];
    }
    else{
        return @"450";
    }
}



////获取通讯录
//-(void)GetUserAddressBook
//{
//    //获取通讯录权限
//    ABAddressBookRef ab = NULL;
//    // ABAddressBookCreateWithOptions is iOS 6 and up.
//    if (&ABAddressBookCreateWithOptions) {
//        CFErrorRef error = nil;
//        ab = ABAddressBookCreateWithOptions(NULL, &error);
//        
//        if (error) { NSLog(@"%@", error); }
//    }
//    if (ab == NULL) {
//        ab = ABAddressBookCreate();
//    }
//    if (ab) {
//        // ABAddressBookRequestAccessWithCompletion is iOS 6 and up. 适配IOS6以上版本
//        if (&ABAddressBookRequestAccessWithCompletion) {
//            ABAddressBookRequestAccessWithCompletion(ab,
//                                                     ^(bool granted, CFErrorRef error) {
//                                                         if (granted) {
//                                                             // constructInThread: will CFRelease ab.
//                                                             [NSThread detachNewThreadSelector:@selector(constructInThread:)
//                                                                                      toTarget:self
//                                                                                    withObject:CFBridgingRelease(ab)];
//                                                         } else {
//                                                             //                                                             CFRelease(ab);
//                                                             // Ignore the error
//                                                         }
//                                                     });
//        } else {
//            // constructInThread: will CFRelease ab.
//            [NSThread detachNewThreadSelector:@selector(constructInThread:)
//                                     toTarget:self
//                                   withObject:CFBridgingRelease(ab)];
//        }
//    }
//}


////获取到addressbook的权限
//-(void)constructInThread:(ABAddressBookRef) ab
//{
//    NSMutableArray *newPhonesArray = [NSMutableArray array];
//    
//    CFArrayRef results = ABAddressBookCopyArrayOfAllPeople(ab);
//    for(int i = 0; i < CFArrayGetCount(results); i++)
//    {
//        ABRecordRef person = CFArrayGetValueAtIndex(results, i);
//        
//        ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
//        NSString *phone = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(phones, 0));
//        if (phone.length == 13 && [phone hasPrefix:@"1"]) {
//            NSArray *tmpArray = [phone componentsSeparatedByString:@"-"];
//            NSMutableString *tmpMutableString = [NSMutableString string];
//            for (NSString *tmp in tmpArray) {
//                [tmpMutableString appendFormat:@"%@",tmp];
//            }
//            [newPhonesArray addObject:tmpMutableString];
//        }
//    }
    //在获取数据库中的电话号码对比
//    NSArray *updatePhones = newPhonesArray;
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *oldPhones = [ud stringForKey:@"phones"];
//    if (oldPhones != nil) {
//        NSArray *oldPhonesArray = [oldPhones componentsSeparatedByString:@";"];
//        
//        NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",oldPhonesArray];
//        updatePhones = [newPhonesArray filteredArrayUsingPredicate:filterPredicate];
//        NSLog(@"%@",updatePhones);
//    }
//    else{
//        updatePhones = newPhonesArray;
//    }
    
//    //如果有增量
//    if (updatePhones.count != 0) {
//        //上传增量
//        NSMutableString *mutableString = [NSMutableString string];
//        for (NSString *tmp in updatePhones) {
//            [mutableString appendFormat:@";%@",tmp];
//        }
//        mutableString = (NSMutableString*)[mutableString substringFromIndex:1];
//        
//        [[KPNetwork sharedInstance] updateContactwithMobile:[ud stringForKey:@"phone"] withContacts:mutableString withCallBack:^(id obj) {
//            
//            NSLog(@"%@",[obj objectForKey:@"status"]);
//        }];
//        
//        //并且保存新的电话号码数组
//        //[ud setObject:mutableString forKey:@"phones"];
//    }
    
//}

//设置－方法
-(void)settingViewWithNav:(UINavigationController*)nav withJudge:(int)judge withVC:(UIViewController*)vc
{
    [[NSNotificationCenter defaultCenter]removeObserver:vc];
    
    //添加一个alertview
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"附件功能" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"邀请朋友",@"设置",@"我的资料",@"意见反馈", nil];
    alert.backgroundColor = [UIColor blackColor];
    self.nav = nav;
    self.judgeInt = judge;
    self.vc = vc;
    [alert show];
}

//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    if (buttonIndex == 1) {
//        //邀请朋友
//        [self jiesuo];
////        [[KPNetwork sharedInstance] inviteUserwithCallBack:^(id obj) {
////            NSLog(@"%@",[obj objectForKey:@"status"]);
////        }];
//    }
//    else if ( buttonIndex == 2){
//        //设置
//        SettingViewController *vc = [board instantiateViewControllerWithIdentifier:@"settingVC"];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.nav pushViewController:vc animated:YES];
//    }
//    else if (buttonIndex == 3){
//        //我的资料
//        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//        NSNumber *allinfo = [ud objectForKey:@"allinfo"];
//        if ([allinfo intValue] == 1){
//            PersonInfoViewController *vc = [board instantiateViewControllerWithIdentifier:@"personInforVC"];
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.nav pushViewController:vc animated:YES];
//        }
//        else{
//            ChangePersonViewController *vc = [board instantiateViewControllerWithIdentifier:@"changeVC"];
//            vc.hidesBottomBarWhenPushed = YES;
//            [self.nav pushViewController:vc animated:YES];
//        }
//    }
//    else if (buttonIndex == 4){
//        //意见反馈
//        SuggestViewController *vc = [board instantiateViewControllerWithIdentifier:@"suggestVC"];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.nav pushViewController:vc animated:YES];
//    }
//}

//-(void)jiesuo
//{
//    if (self.judgeInt == 0) {//未解锁
//        
//        [PXAlertView showAlertWithTitle:@"邀请朋友使用酷评即可解锁"
//                                message:@"为了保护隐私，当您有两个来自手机通讯录的朋友使用酷评时，即可解锁，解锁后会第一时间通知您。"
//                            cancelTitle:@"稍后解锁"
//                             otherTitle:@"立即解锁"
//                             completion:^(BOOL cancelled) {
//                                 if (cancelled) {
//                                     //
//                                 }
//                                 else{
//                                     //分享
//                                     NSString *shareText = @"巨好玩的朋友圈糗事点评，你从未发现身边有这么多的奇葩朋友!"; //分享内嵌文字
//                                     
//                                     UIImage *shareImage = [UIImage imageNamed:@"logo.png"];
//                                     
//                                     NSArray *snss = [NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToSina,nil];
//                                     
//                                     //如果得到分享完成回调，需要设置delegate为self
//                                     [UMSocialSnsService presentSnsIconSheetView:self.vc appKey:UmengAppkey shareText:shareText shareImage:shareImage shareToSnsNames:snss delegate:self.vc];
//                                     
//                                    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeDefault url:nil];
//                                     
//                                     [UMSocialData defaultData].extConfig.sinaData.shareText = [NSString stringWithFormat:@"%@ %@",shareText,KPLinkerWeb];
//                                     [[ToolClass sharedInstance]changeUrl:@""];
//                                     
//                                     [UMSocialData defaultData].extConfig.qzoneData.title = @"酷评巨好玩，快来一起玩～";
//                                     [UMSocialData defaultData].extConfig.qqData.title = @"酷评巨好玩，快来一起玩～";
//                                     [UMSocialData defaultData].extConfig.wechatSessionData.title = @"酷评巨好玩，快来一起玩～";
//                                 }
//
//                             }
//         ];
//    }
//    else{//解锁
//        //分享
//        NSString *shareText = @"巨好玩的朋友圈糗事点评，你从未发现身边有这么多的奇葩朋友!"; //分享内嵌文字
//        
//        UIImage *shareImage = [UIImage imageNamed:@"logo.png"];
//        
//        NSArray *snss = [NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToSina,nil];
//        
//        //如果得到分享完成回调，需要设置delegate为self
//        [UMSocialSnsService presentSnsIconSheetView:self.vc appKey:UmengAppkey shareText:shareText shareImage:shareImage shareToSnsNames:snss delegate:self.vc];
//        [UMSocialData defaultData].extConfig.sinaData.shareText = [NSString stringWithFormat:@"%@ %@",shareText,KPLinkerWeb];
//        [[ToolClass sharedInstance]changeUrl:@""];
//        
//        [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeDefault url:nil];
//        
//        [UMSocialData defaultData].extConfig.qzoneData.title = @"酷评巨好玩，快来一起玩～";
//        [UMSocialData defaultData].extConfig.qqData.title = @"酷评巨好玩，快来一起玩～";
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = @"酷评巨好玩，快来一起玩～";
//        
//    }
//}


//-(void)changeUrl:(NSString*)url
//{
//    //微信
//    [UMSocialWechatHandler setWXAppId:@"wx19c7e219ac9385e4" appSecret:@"13963ca214b41f066ef5a89a5f13509b" url:[NSString stringWithFormat:@"http://www.qoping.com%@",url]];
//    //QQ
//    [UMSocialQQHandler setQQWithAppId:@"1103179609" appKey:@"0JyZTw0AQwgPm3os" url:[NSString stringWithFormat:@"http://www.qoping.com%@",url]];
//}
//
//-(void)jiesuoMethod:(id)ID
//{
//    [PXAlertView showAlertWithTitle:@"邀请朋友使用酷评即可解锁"
//                            message:@"为了保护隐私，当您有两个来自手机通讯录的朋友使用酷评时，即可解锁，解锁后会第一时间通知您。"
//                        cancelTitle:@"取消"
//                         otherTitle:@"邀请朋友"
//                         completion:^(BOOL cancelled) {
//                             if (cancelled) {
//                                 //
//                             } else {
//                                 
//                                 //分享
//                                 NSString *shareText = @"巨好玩的朋友圈糗事点评，你从未发现身边有这么多的奇葩朋友!"; //分享内嵌文字
//                                 UIImage *shareImage = [UIImage imageNamed:@"logo.png"];
//                                 
//                                 NSArray *snss = [NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToSina,nil];
//                                 
//                                 //如果得到分享完成回调，需要设置delegate为self
//                                 [UMSocialSnsService presentSnsIconSheetView:ID appKey:UmengAppkey shareText:shareText shareImage:shareImage shareToSnsNames:snss delegate:ID];
//                                 [UMSocialData defaultData].extConfig.sinaData.shareText = [NSString stringWithFormat:@"%@ %@",shareText,KPLinkerWeb];
//                                 [[ToolClass sharedInstance]changeUrl:@""];
//                                 
//                                 [UMSocialData defaultData].extConfig.qzoneData.title = @"酷评巨好玩，快来一起玩～";
//                                 [UMSocialData defaultData].extConfig.qqData.title = @"酷评巨好玩，快来一起玩～";
//                                 [UMSocialData defaultData].extConfig.wechatSessionData.title = @"酷评巨好玩，快来一起玩～";
//                                 
//
//                             }
//                         }];
//
//}

@end
