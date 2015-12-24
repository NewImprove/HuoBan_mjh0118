//
//  EditPayForAddAndNameViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/30.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "EditPayForAddAndNameViewController.h"
#import "DataModel.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"


@interface EditPayForAddAndNameViewController ()

@end

@implementation EditPayForAddAndNameViewController
@synthesize delegate,labelTelephoneNum,strAdd,strName,strTelephoneNum,imageClose,labelGetPresonName,labelAddress,labelPost,labelTopNum;

DataModel *_dataModelEditPay;
HttpClassSelf *_httpClassEditPay;

NSString *_iOSEditPay;
NSString *_strAddMessage;

- (void)viewDidLoad {
    [super viewDidLoad];

    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUserMessageWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUserMessageWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //导航栏背景
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];
    
    //    导航栏左侧Item
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName :[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]} forState:UIControlStateNormal];
    
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName :[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]} forState:UIControlStateNormal];
    
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.7], NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.labelGetPresonName.borderStyle = UITextBorderStyleNone;
    self.labelGetPresonName.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    self.labelGetPresonName.leftViewMode = UITextFieldViewModeAlways;
//    [self.labelGetPresonName setTextColor:[UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1]];
    
    
    self.labelTelephoneNum.borderStyle = UITextBorderStyleNone;
    self.labelTelephoneNum.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    self.labelTelephoneNum.leftViewMode = UITextFieldViewModeAlways;
//    [self.labelTelephoneNum setTextColor:[UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1]];
    
    self.labelPost.borderStyle = UITextBorderStyleNone;
    self.labelPost.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    self.labelPost.leftViewMode = UITextFieldViewModeAlways;
//    [self.labelPost setTextColor:[UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1]];
    
    self.labelAddress.borderStyle = UITextBorderStyleNone;
    self.labelAddress.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    self.labelAddress.leftViewMode = UITextFieldViewModeAlways;
//    [self.labelAddress setTextColor:[UIColor colorWithRed:20.0/255 green:20.0/255 blue:20.0/255 alpha:1]];

    
    
    _httpClassEditPay = [[HttpClassSelf alloc] init];
    _dataModelEditPay = [[DataModel alloc]init];
    
    _iOSEditPay = _dataModelEditPay.userInfomation.iOSDeviceSize;
    
    if([_iOSEditPay isEqualToString:@"iPone6Plus"]){
        
        self.imageClose.image = [UIImage imageNamed:@"payBackIcon@3x"];
        
    }else{
        self.imageClose.image = [UIImage imageNamed:@"payBackIcon@2x"];
        
    }
    

}

-(void)keyboardUserMessageWillShow:(NSNotification*)sender{
    
}
-(void)keyboardUserMessageWillHide:(NSNotification*)sender{
    
    self.labelTopNum.constant = 0;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    _strAddMessage = @"";
    
    DataModel *dataModelPayMessage = [[DataModel alloc] init];
    
    self.labelPost.text = dataModelPayMessage.userInfomation.payPost;
    self.labelGetPresonName.text = dataModelPayMessage.userInfomation.payName;
    self.labelTelephoneNum.text = dataModelPayMessage.userInfomation.payMobile;
    self.labelAddress.text = dataModelPayMessage.userInfomation.add;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)labelUpbyKeyBoard:(id)sender {
    
    if([_iOSEditPay isEqualToString:@"iPhone4"]){
    self.labelTopNum.constant = -100;
    }
    

}

- (IBAction)buttonSave:(id)sender {
    
    
    
    if(self.labelAddress.text == nil){
       self.labelAddress.text = @"";
    }else if(self.labelPost.text == nil){
        self.labelPost.text = @"";
    }else if(self.labelGetPresonName.text == nil){
        self.labelGetPresonName.text = @"";
    }else if(self.labelTelephoneNum.text == nil){
        self.labelTelephoneNum.text = @"";
    }
    
    DataModel *dataModelEditPay = [[DataModel alloc] init];

    dataModelEditPay.userInfomation.payPost = self.labelPost.text;
    dataModelEditPay.userInfomation.payMobile = self.labelTelephoneNum.text;
    dataModelEditPay.userInfomation.payName = self.labelGetPresonName.text;
    dataModelEditPay.userInfomation.add = self.labelAddress.text;
    
    [dataModelEditPay saveUserInfomation];
    
    [_httpClassEditPay UpdateUserSettingSetUser:dataModelEditPay.userInfomation.UserID setToken:dataModelEditPay.userInfomation.tokenID setImage:dataModelEditPay.userInfomation.ImagePreson setName:dataModelEditPay.userInfomation.Name setSex:dataModelEditPay.userInfomation.sex setAddress:self.labelAddress.text setSign:@"" setDesc:dataModelEditPay.userInfomation.contents payName:self.labelGetPresonName.text  payMobile:self.labelTelephoneNum.text payPostCode:self.labelPost.text  CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataRes = [operatioin responseData];
        
        NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:dataRes options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",dicData);
        
        if([dicData[@"status"] isEqualToString:@"success"]){
            
            [self dismissViewControllerAnimated:YES completion:nil];
            [[ToolClass sharedInstance] showAlert:@"支付信息保存成功"];
            [self.delegate editPayViewController:self strAddMessage:self.labelAddress.text strName:self.labelGetPresonName.text strTelephone:self.labelTelephoneNum.text strPostCode:self.labelPost.text];
            
        }else{
            [[ToolClass sharedInstance] showAlert:@"支付信息保存失败，服务器错误"];
        }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"支付信息保存失败，请检查网络"];
    }];
}


- (IBAction)buttonCancel:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 点击背景隐藏键盘
-(IBAction)backgroundTap:(id)sender{
    
    [self.labelGetPresonName resignFirstResponder];
    [self.labelTelephoneNum resignFirstResponder];
    [self.labelPost resignFirstResponder];
    [self.labelAddress resignFirstResponder];
    
}
@end
