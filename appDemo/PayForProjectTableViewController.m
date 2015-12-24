//
//  PayForProjectTableViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "PayForProjectTableViewController.h"

#import "DataModel.h"

#import "HttpClassSelf.h"

#import "Pingpp.h"

#import "ToolClass.h"

typedef void (^PingppCompletion)(NSString *result, PingppError *error);

@interface PayForProjectTableViewController ()

@end

@implementation PayForProjectTableViewController
@synthesize choseLabeldate,choseLabelPreson,choseLabelTitle,choseView,addLabelAdd,addView,dicPayDataModel,choseLabelPayMoney,projectID,buttonAlipay,buttonWeChat,buttonPay,labelName,labelTelephontNum,imageClose,projectEndDate,labelProjectEnd,imageViewButtonPay,buttonEditMessage,imageFire;

DataModel *_dataModelPayProject;

HttpClassSelf *_httpClassPay;

bool _buttonWeChatBool;
bool _buttonAlipayBool;
NSInteger _choseButtonNum;
NSString *_iOSPay;



- (void)viewDidLoad {
    [super viewDidLoad];
//    

  
    self.navigationController.navigationBar.translucent = NO;
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.7], NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.buttonAlipay.layer.borderColor =[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;
    self.buttonAlipay.layer.borderWidth = 1;
    self.buttonAlipay.clipsToBounds = YES;
    self.buttonAlipay.layer.cornerRadius = 8;
    
    
    self.buttonWeChat.layer.borderColor =[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1].CGColor;
    self.buttonWeChat.layer.borderWidth = 1;
    self.buttonWeChat.clipsToBounds = YES;
    self.buttonWeChat.layer.cornerRadius = 8;
    
    
    
    _httpClassPay = [[HttpClassSelf alloc] init];
    _dataModelPayProject = [[DataModel alloc] init];
    _iOSPay = _dataModelPayProject.userInfomation.iOSDeviceSize;
    
    
    if([_iOSPay isEqualToString:@"iPhone6Plus"]){
       
        imageClose.image = [UIImage imageNamed:@"back_white_3x"];
        imageFire.image = [UIImage imageNamed:@"fireWhite@3x"];
        self.tableView.scrollEnabled = NO;
        
    }else if([_iOSPay isEqualToString:@"iPhone6"]){
        imageClose.image = [UIImage imageNamed:@"back_white_2x"];
        imageFire.image = [UIImage imageNamed:@"fireWhite@2x"];
        self.tableView.scrollEnabled = NO;
    }else{
        imageClose.image = [UIImage imageNamed:@"back_white_2x"];
        imageFire.image = [UIImage imageNamed:@"fireWhite@2x"];
        self.tableView.scrollEnabled = YES;
    }
    
//    //支付按钮
    self.choseView.clipsToBounds = YES;
    self.choseView.layer.cornerRadius = 6;
    

    self.addView.clipsToBounds = YES;
    self.addView.layer.cornerRadius = 6;
    
    
//    self.buttonEditMessage.layer.borderWidth = 1;
    
    NSLog(@"%@",self.dicPayDataModel);

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    _buttonAlipayBool = NO;
//    _buttonWeChatBool = NO;
    
    self.buttonAlipay.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
    
    [self.buttonAlipay setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
    
    self.buttonWeChat.backgroundColor = [UIColor whiteColor];
    
    [self.buttonWeChat setTitleColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1] forState:UIControlStateNormal];
    
    _choseButtonNum = 1;

    
    self.choseLabelPayMoney.text = [NSString stringWithFormat:@"支持%ld元",[self.dicPayDataModel[@"money"]longValue]];
    
    self.choseLabelTitle.text = self.dicPayDataModel[@"title"];
    
    if([self.dicPayDataModel[@"want"] longValue] > 10000){
 self.choseLabelPreson.text = [NSString stringWithFormat:@"已支持%ld人",[self.dicPayDataModel[@"fact"] longValue]];
    }else{
            self.choseLabelPreson.text = [NSString stringWithFormat:@"已支持%ld人/%ld个名额",[self.dicPayDataModel[@"fact"] longValue],[self.dicPayDataModel[@"want"] longValue]];
    }

    DataModel *_dataModelUserPayMessage = [[DataModel alloc] init];
    
    NSLog(@"打印地址地址%@",_dataModelUserPayMessage.userInfomation.add);
    
    if(_dataModelUserPayMessage.userInfomation.payMobile == nil){
        _dataModelUserPayMessage.userInfomation.payMobile = @"";
    }else if(_dataModelUserPayMessage.userInfomation.payPost == nil){
        _dataModelUserPayMessage.userInfomation.payPost = @"";
    }else if(_dataModelUserPayMessage.userInfomation.payName == nil){
        _dataModelUserPayMessage.userInfomation.payName = @"";
    }else if(_dataModelUserPayMessage.userInfomation.add == nil){
        _dataModelUserPayMessage.userInfomation.add = @"";
    }
    
    self.addLabelAdd.text = [NSString stringWithFormat:@"%@ %@",_dataModelUserPayMessage.userInfomation.add,_dataModelUserPayMessage.userInfomation.payPost];
    
    self.choseLabeldate.text = [NSString stringWithFormat:@"众筹结束后%lu天内发送",[self.dicPayDataModel[@"send_number"] longValue]];
    
    NSLog(@"%@------%@",_dataModelUserPayMessage.userInfomation.payName,_dataModelUserPayMessage.userInfomation.payMobile);
    
    if([_dataModelUserPayMessage.userInfomation.payName isEqualToString:@"" ]|| _dataModelUserPayMessage.userInfomation.payName == nil){
        self.labelName.text = @"请编辑收货姓名";
    }else{
            self.labelName.text = _dataModelUserPayMessage.userInfomation.payName;
    }
    
    if([_dataModelUserPayMessage.userInfomation.payMobile isEqualToString:@"" ]|| _dataModelUserPayMessage.userInfomation.payMobile == nil){
        self.labelTelephontNum.text = @"请编辑联系电话";
    }else{
        self.labelTelephontNum.text = _dataModelUserPayMessage.userInfomation.payMobile;
    }
    
    
    
    if([_dataModelUserPayMessage.userInfomation.add isEqualToString:@""] && [_dataModelUserPayMessage.userInfomation.payName isEqualToString:@""] && [_dataModelUserPayMessage.userInfomation.payPost isEqualToString:@""] && [_dataModelUserPayMessage.userInfomation.payMobile isEqualToString:@""]){
        
        self.addView.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];

        if([_iOSPay isEqualToString:@"iPhone6Plus"]){
            self.imageViewButtonPay.image = [UIImage imageNamed:@"payChoseButtonNone@3x"];
        }else{
        self.imageViewButtonPay.image = [UIImage imageNamed:@"payChoseButtonNone@2x"];
        }
    }else{
        self.addView.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
        
        if([_iOSPay isEqualToString:@"iPhone6Plus"]){
            self.imageViewButtonPay.image = [UIImage imageNamed:@"payChoseButtonYES@3x"];
        }else{
            self.imageViewButtonPay.image = [UIImage imageNamed:@"payChoseButtonYES@2x"];
        }
        
    }

    NSLog(@"%@",self.projectEndDate);
    self.labelProjectEnd.text = [NSString stringWithFormat:@"如本项目在 %@年%@月%@日 24点前未能达成目标，支持款项将全部返还。",[[[NSString stringWithFormat:@"%@",self.projectEndDate] substringFromIndex:0] substringToIndex:4],[[[NSString stringWithFormat:@"%@",self.projectEndDate] substringFromIndex:5] substringToIndex:2],[[[NSString stringWithFormat:@"%@",self.projectEndDate] substringFromIndex:8] substringToIndex:2]];

    

    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buttonAlipay:(id)sender {
    

    

        self.buttonAlipay.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
        
        [self.buttonAlipay setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
    
    
        self.buttonWeChat.backgroundColor = [UIColor whiteColor];

        [self.buttonWeChat setTitleColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1] forState:UIControlStateNormal];

        
        _choseButtonNum = 1;
//        _buttonWeChatBool = NO;
//        _buttonAlipayBool = YES;
    

    
    
 }

- (IBAction)buttonWeChat:(id)sender {
    
//    _buttonWeChatBool = !_buttonWeChatBool;

        self.buttonWeChat.backgroundColor = [UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1];
        [self.buttonWeChat setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
    
    
        self.buttonAlipay.backgroundColor = [UIColor whiteColor];
        [self.buttonAlipay setTitleColor:[UIColor colorWithRed:79.0/255 green:194.0/255 blue:177.0/255 alpha:1] forState:UIControlStateNormal];
        
        _choseButtonNum = 2;
    
    
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    [Pingpp handleOpenURL:url
           withCompletion:^(NSString *result, PingppError *error) {
               if ([result isEqualToString:@"success"]) {
                   
                   NSLog(@"%@",result);
                   
                   NSLog(@"支付代理方法启动，跳转成功");
                   // 支付成功
               } else {
                   // 支付失败或取消
                   NSLog(@"支付代理方法启动，跳转成功Error: code=%lu msg=%@", error.code, [error getMsg]);
                        [[ToolClass sharedInstance] showAlert:@"支付失败，取消或失败"];
               }
           }];
    return  YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqual:@"EditPay"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
  
        EditPayForAddAndNameViewController *controller  = (EditPayForAddAndNameViewController*)naVC.topViewController;
        
        controller.delegate = self;
        controller.strAdd = self.addLabelAdd.text;
        controller.strName = self.labelName.text;
        controller.strTelephoneNum = self.labelTelephontNum.text;
    }
    
}


-(void)editPayViewController:(EditPayForAddAndNameViewController *)controller strAddMessage:(NSString *)strAddMessage strName:(NSString *)strName strTelephone:(NSString *)strTelephone strPostCode:(NSString *)strPostCode{
    
    self.addLabelAdd.text = [NSString stringWithFormat:@"%@ %@",strAddMessage,strPostCode];
    self.labelName.text = strName;
    self.labelTelephontNum.text = strTelephone;
    
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonPay:(id)sender {
    if([self.addLabelAdd.text isEqualToString:@""] || self.addLabelAdd.text == nil){
        [[ToolClass sharedInstance] showAlert:@"收货地址不可为空，请点击'编辑收货信息'"];
        return;
    }else if([self.labelName.text isEqualToString:@""] || self.labelName.text == nil){
        [[ToolClass sharedInstance] showAlert:@"收货人名称不可为空，请点击'编辑收货信息'"];
        return;
    }else if([self.labelTelephontNum.text isEqualToString:@""] || self.labelTelephontNum.text == nil){
        [[ToolClass sharedInstance] showAlert:@"联系电话不可为空，请点击'编辑收货信息'"];
        return;
    }else{
        
        [[ToolClass sharedInstance] showAlert:@"正在跳转支付界面，请稍等"];
        
        if(_choseButtonNum == 1){

        NSLog(@"打印输入地址:%@",self.addLabelAdd.text);
        
        NSLog(@"%@---%@",self.dicPayDataModel[@"_id"],_dataModelPayProject.userInfomation.tokenID);
        [_httpClassPay pingSDk:@"ping++" projectID:self.projectID paytype:@"alipay" chou:self.dicPayDataModel[@"_id"] token:_dataModelPayProject.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *dicRes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"aliPay支付返回%@", dicRes);
            
            [Pingpp createPayment:dicRes
                   viewController:self
                     appURLScheme:@"alipay0926"
                   withCompletion:^(NSString *result, PingppError *error) {
                       if ([result isEqualToString:@"success"]) {
                           // 支付成功
                           
                           NSLog(@"%@",result);
                           NSLog(@"支付成功成功成功");
                           //成功界面跳转
                           [self performSegueWithIdentifier:@"paySuccess" sender:nil];
                       } else {
                           
                           
                           // 支付失败或取消
                           NSLog(@"支付失败失败失败Error: code=%lu msg=%@", (unsigned long)error.code, [error getMsg]);
                           NSLog(@"%@",dicRes);
                           
                           if([result isEqualToString:@"cancel"]){
                               [[ToolClass sharedInstance] showAlert:@"支付取消"];
                           }else if([result isEqualToString:@"fail"]){
                               [[ToolClass sharedInstance] showAlert:[NSString stringWithFormat:@"支付失败：%@",dicRes[@"msg"]]];
                           }else if([result isEqualToString:@"invalid"]){
                               [[ToolClass sharedInstance] showAlert:@"支付无效"];
                           }else{
                               [[ToolClass sharedInstance] showAlert:@"支付退出"];
                           }
                       }
                   }];
            
        }CallBackNo:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"支付跳转失败,请检查手机网络"];
        }];
        
        
    }else if(_choseButtonNum == 2){
        
        
        NSLog(@"打印输入地址:%@",self.addLabelAdd.text);
        
        [_httpClassPay pingSDk:@"ping++" projectID:self.projectID paytype:@"wx" chou:self.dicPayDataModel[@"_id"] token:_dataModelPayProject.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *dicRes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"wx支付返回%@",dicRes);
            [Pingpp createPayment:dicRes
                   viewController:self
                     appURLScheme:@"wxced960be6a9db2af"
                   withCompletion:^(NSString *result, PingppError *error) {
                       if ([result isEqualToString:@"success"]) {
                           // 支付成功
                           NSLog(@"%@",result);
                           NSLog(@"支付成功成功成功");
                           //支付成功跳转
                           [self performSegueWithIdentifier:@"paySuccess" sender:nil];
                       } else {
                           // 支付失败或取消
                           NSLog(@"支付失败失败失败Error: code=%lu msg=%@", (unsigned long)error.code, [error getMsg]);
                           
                           if([result isEqualToString:@"cancel"]){
                               [[ToolClass sharedInstance] showAlert:@"支付取消"];
                           }else if([result isEqualToString:@"fail"]){
                               [[ToolClass sharedInstance] showAlert:[NSString stringWithFormat:@"支付失败：%@",dicRes[@"msg"]]];
                           }else if([result isEqualToString:@"invalid"]){
                               [[ToolClass sharedInstance] showAlert:@"支付无效"];
                           }else{
                               [[ToolClass sharedInstance] showAlert:@"支付退出"];
                           }
                           
                       }
                   }];
            
        }CallBackNo:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"支付跳转失败,请检查手机网络"];
        }];
    
    }
//    else{
//        
//        [[ToolClass sharedInstance] showAlert:@"请选择一种支付方式"];
//        
//    }
    
    
    }


}
- (IBAction)buttonEditMessage:(id)sender {
    
    [self performSegueWithIdentifier:@"EditPay" sender:nil];
}

@end
