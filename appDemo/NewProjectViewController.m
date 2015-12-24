//
//  NewProjectViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/11/5.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "NewProjectViewController.h"
#import "DataModel.h"

@interface NewProjectViewController ()

@end

@implementation NewProjectViewController
@synthesize imageClose;


DataModel *_dataModelNewProject;
NSString *_iOSNewProject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataModelNewProject = [[DataModel alloc] init];
    
    _iOSNewProject = _dataModelNewProject.userInfomation.iOSDeviceSize;
    
    if([_iOSNewProject isEqualToString:@"iPhone6Plus"]){

        self.imageClose.image = [UIImage imageNamed:@"close_grey_@3x"];
    }else{
        self.imageClose.image = [UIImage imageNamed:@"close_grey_@2x"];
    }
    

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

- (IBAction)buttonClose:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
