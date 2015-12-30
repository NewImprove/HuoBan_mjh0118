//
//  AppDelegate.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "DataModel.h"
#import "MainTabBarViewController.h"
#import "UMessage.h"
#import "RegisterAccountViewController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "huobanAuthViewController.h"
#import "huobanLoginGuideViewController.h"
#import "UserSelfMessageViewController.h"


@interface AppDelegate ()
{
    MainTabBarViewController *loginTabBarvc;
}

@end

@implementation AppDelegate
@synthesize isRotation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //推送冷启动
    NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    NSLog(@"Payload: %@", userInfo);
    
    
    NSLog(@"%ld",(long)application.applicationState);
    //集成微信分享
    [UMSocialWechatHandler setWXAppId:@"wxced960be6a9db2af" appSecret:@"49b432ecb3e7f6a4bc379e0107e220b9" url:@"www.huoban.io"];
    
    [UMessage startWithAppkey:@"5629c5de67e58e4ea8002490" launchOptions:launchOptions];
    
    [UMSocialData setAppKey:@"5629c5de67e58e4ea8002490"];
    
    [UMessage setLogEnabled:YES];
    

    
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                         settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                         categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
//隐藏iOS状态栏
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    [NSThread sleepForTimeInterval:1.0];
    
    [_window makeKeyAndVisible];
    
    DataModel *dataModelCreate = [[DataModel alloc] init];
    
    CGSize iOSDeviceSize = [UIScreen mainScreen].bounds.size;
    
    if(iOSDeviceSize.height == 568){
        NSLog(@"iPhone5");
        dataModelCreate.userInfomation.iOSDeviceSize = @"iPhone5";
    }else if (iOSDeviceSize.height == 667){
        NSLog(@"iPhone6");
        dataModelCreate.userInfomation.iOSDeviceSize = @"iPhone6";
    }else if (iOSDeviceSize.height == 736){
        NSLog(@"iPhone6+");
        dataModelCreate.userInfomation.iOSDeviceSize = @"iPhone6Plus";
    }else{
        NSLog(@"iPhone4");
        dataModelCreate.userInfomation.iOSDeviceSize = @"iPhone4";
    }
    
    [dataModelCreate saveUserInfomation];
    NSLog(@"%@",dataModelCreate.userInfomation.iOSDeviceSize);
    
    loginTabBarvc = [self.window.rootViewController.storyboard
                                            instantiateViewControllerWithIdentifier:@"mainTabBarView"];
        loginTabBarvc.indexSelect = 0;
    self.window.rootViewController = loginTabBarvc;
    
    
    [self settingTabbarViewControllersDependsIsUserLogin];
    
    return YES;
}

//分享回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}


-(void)application:(UIApplication*)app didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"获取TOKENTOEKN : %@", token);
    
    DataModel *dataUMessage = [[DataModel alloc] init];
    dataUMessage.userInfomation.deviceToken = token;
    [dataUMessage saveUserInfomation];
    
    //Umeng
    [UMessage registerDeviceToken:deviceToken];
    
    [UMessage setBadgeClear:NO];
}


-(void)application:(UIApplication*)app didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error{
    
    NSString *str = [NSString stringWithFormat:@"报错报错报错TOKEN%@",error];
    
    NSLog(@"%@--",str);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [UMessage didReceiveRemoteNotification:userInfo];
    
    NSLog(@"Payload : %@",userInfo);
    
    NSMutableDictionary *dicPayLod = [NSMutableDictionary alloc];
    
//    DataModel *dataModelRemind = [[DataModel alloc] init];
   
//    dataModelRemind.remindMessage.strID = userInfo[@"id"];
//    dataModelRemind.remindMessage.strBy = userInfo[@"name"];
//    dataModelRemind.remindMessage.strContents = [userInfo[@"text"] substringFromIndex:1];
//    dataModelRemind.remindMessage.strImage = userInfo[@"image"];
//    dataModelRemind.remindMessage.strTime = userInfo[@"time"];
//    dataModelRemind.remindMessage.type = [userInfo[@"type"] intValue];
//
//    [dataModelRemind.aryRemindMessage addObject:dataModelRemind];
//    NSLog(@"%lu",[dataModelRemind.aryRemindMessage count]);
//    [dataModelRemind saveUserInfomation];
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//
//    NSMutableArray *aryRemind = [[NSMutableArray alloc]init];
//    [aryRemind addObject:dataModelRemind];
//    
//    [ud setObject:dataModelRemind forKey:@"RemindMessage"];
    
//    MainTabBarViewController *loginTabBarvc = [self.window.rootViewController.storyboard
//                                               instantiateViewControllerWithIdentifier:@"mainTabBarView"];
//    loginTabBarvc.indexSelect = 1;
//    self.window.rootViewController = loginTabBarvc;
}

//  每次试图切换的时候都会走的方法,用于控制设备的旋转方向.
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (isRotation) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else {
        return UIInterfaceOrientationMaskPortrait;
    }
    
}


//退出后台前
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//退出后台后
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//后台进入前
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    
}

//后台进入后
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    
//     NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"HomePageCellDataModel"];
    [defaults removeObjectForKey:@"ProjectDynamicWM"];
    [self saveContext];

}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.lyc.appDemo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"appDemo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"appDemo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}


#pragma mark 判断用户是否登录并显示相应的页面
- (void) settingTabbarViewControllersDependsIsUserLogin {
    
    NSMutableArray * tabBarViewControllers = [NSMutableArray arrayWithArray:loginTabBarvc.viewControllers];
    //    huobanAuthViewController * authNavigationController = [[huobanAuthViewController alloc]init];
    
NSLog(@"%ld",(long)[[NSUserDefaults standardUserDefaults]integerForKey:@"runtimes"]);
    if([[NSUserDefaults standardUserDefaults]integerForKey:@"runtimes"]){
        NSLog(@"当前用户已经登录");
    huobanAuthViewController * authNavigationController = [[huobanAuthViewController alloc]initWithRootViewController:[[UserSelfMessageViewController alloc] init]];
        
        [tabBarViewControllers replaceObjectAtIndex:tabBarViewControllers.count-1 withObject:authNavigationController];
        
        loginTabBarvc.viewControllers = tabBarViewControllers;

    } else {
        NSLog(@"当前用户未登录");
        huobanAuthViewController * authNavigationController = [[huobanAuthViewController alloc]initWithRootViewController:[[huobanLoginGuideViewController alloc] init]];
        [tabBarViewControllers replaceObjectAtIndex:tabBarViewControllers.count-1 withObject:authNavigationController];
        loginTabBarvc.viewControllers = tabBarViewControllers;
        
    }
    
}



#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
