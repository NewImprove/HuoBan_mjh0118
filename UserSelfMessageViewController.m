//
//  UserSelfMessageViewController.m
//  huoban
//
//  Created by Lyc on 15/12/14.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserSelfMessageViewController.h"
#import "HttpClassSelf.h"
#import "DataModel.h"
#import "ToolClass.h"

@interface UserSelfMessageViewController ()

@end

@implementation UserSelfMessageViewController

HttpClassSelf *httpClassUserMessage;

DataModel *dataModelUserMessage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //httpClassSelf 网络数据模型
    httpClassUserMessage = [[HttpClassSelf alloc] init];
    
    //dataMode 个人信息数据模型
    dataModelUserMessage = [[DataModel alloc] init];
    
    //获取个人信息数据接口
    [httpClassUserMessage CheckUserSelfSetUser:dataModelUserMessage.userInfomation.UserID token:dataModelUserMessage.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
        
        
        
        
        
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
    
    //提示框弹窗
    [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
        
    }];
    
    
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

@end
