//
//  AppSettingViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "AppSettingViewController.h"
#import "ToolClass.h"
#import "DataModel.h"

@interface AppSettingViewController ()

@end

@implementation AppSettingViewController
@synthesize imageLogo,viewLine,buttonCancel,cancelLoginIn,CleanDataModel,imageClose,delegate;

NSString *_iOSSizeAppSetting;
DataModel *_dataModelAppSetting;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//     background.userInteractionEnabled = YES;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName :[UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]} forState:UIControlStateNormal];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    _dataModelAppSetting = [[DataModel alloc]init];

    _iOSSizeAppSetting = _dataModelAppSetting.userInfomation.iOSDeviceSize;
    
    
    if([_iOSSizeAppSetting isEqualToString:@"iPhone6Plus"]){
        
        self.imageLogo.image = [UIImage imageNamed:@"logo144@3x"];
        self.imageClose.image = [UIImage imageNamed:@"back_yellow_3x"];
        
    }else{
 
        self.imageLogo.image = [UIImage imageNamed:@"logo144@2x"];
        self.imageClose.image = [UIImage imageNamed:@"back_yellow_3x"];
        
    }
    
    cancelLoginIn.clipsToBounds = YES;
    cancelLoginIn.layer.cornerRadius = 8;

    
    CleanDataModel.clipsToBounds = YES;
    CleanDataModel.layer.cornerRadius = 8;
    
    
    viewLine.clipsToBounds = YES;
    viewLine.layer.cornerRadius = 8;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CleanDataModel:(id)sender {

//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"HomePageCellDataModel"];
    [defaults removeObjectForKey:@"ProjectDynamicWM"];
    [[ToolClass sharedInstance] showAlert:@"清除缓存成功"];
    
    
}

- (IBAction)cancelLoginIn:(id)sender {
    
    //CancelLoginInSegue
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    
    [ud setInteger:0 forKey:@"runtimes"];
    
    [self performSegueWithIdentifier:@"CancelLoginInSegue" sender:nil];
    
}
- (IBAction)buttonCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)LoginViewControllerClose:(LoginViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    [self.delegate appSettingViewControllerCancelLogin:self];
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"CancelLoginInSegue"]){

        LoginViewController *controller = segue.destinationViewController;
        
        controller.delegate = self;
        
    }
}

@end
