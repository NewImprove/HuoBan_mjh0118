//
//  PaySuccessViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/11/3.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "PaySuccessViewController.h"
#import "DataModel.h"


@interface PaySuccessViewController ()

@end

@implementation PaySuccessViewController
@synthesize buttonCancel,imagePagSuccess,imageClose;


DataModel *_dataModelPaySuccess;
NSString *_iOSPaySuccess;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _dataModelPaySuccess = [[DataModel alloc] init];
    
    _iOSPaySuccess = _dataModelPaySuccess.userInfomation.iOSDeviceSize;
    
    if([_iOSPaySuccess isEqualToString:@"iPhone6Plus"]){

        self.imageClose.image = [UIImage imageNamed:@"back_white_3x"];
        
    }else{
        
        self.imageClose.image = [UIImage imageNamed:@"back_white_2x"];
        
    }
    
            imagePagSuccess.image = [UIImage imageNamed:@"buttonPayDown72@2x"];
    
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


- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
