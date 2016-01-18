//
//  ViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize textFieldPWD,textFieldUN,buttonLogin,textUNTopNum,delegate;

//NSMutableDictionary *_getReturnDic;
NSMutableDictionary *_resLoginDic;
HttpClassSelf *_httpClassLogin;

DataModel *_dataModelLogin;
NSString *_iOSSizeLogin;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//#pragma mark 回传机制
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(createANView:) name:@"CreateANNotification" object:nil];
//    
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFindPW:) name:@"FindPWNotification" object:nil];
    
    buttonLogin.clipsToBounds = YES;
    buttonLogin.layer.cornerRadius = 8;
    
    self.textFieldUN.borderStyle = UITextBorderStyleNone;
    self.textFieldPWD.borderStyle  = UITextBorderStyleNone;
    self.textFieldUN.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textFieldUN.leftViewMode = UITextFieldViewModeAlways;
    self.textFieldUN.delegate = self;
    
    
    self.textFieldUN.clipsToBounds = YES;
    self.textFieldUN.layer.cornerRadius = 8;
    self.textFieldPWD.delegate = self;
    self.textFieldPWD.clipsToBounds = YES;
    self.textFieldPWD.layer.cornerRadius = 8;
    self.textFieldPWD.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textFieldPWD.leftViewMode = UITextFieldViewModeAlways;
    

    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //    _getReturnDic = [NSMutableDictionary dictionary];
    //    [MobClick beginLogPageView:@"PageOne"];
    
    
    _httpClassLogin = [[HttpClassSelf alloc]init];
    
    
    _dataModelLogin = [[DataModel alloc] init];
    
    NSLog(@"%@",_dataModelLogin.userInfomation.iOSDeviceSize);
    
    _iOSSizeLogin = _dataModelLogin.userInfomation.iOSDeviceSize;
    
//    if([_iOSSizeLogin isEqualToString:@"iPhone6Plus"]){
//        
//        self.textUNTopNum.constant = 394;
//        self.imageMain.image = [UIImage imageNamed:@"huobanBlackLogo@3x"];
//    }else if( [_iOSSizeLogin isEqualToString:@"iPhone6"]){
//                self.textUNTopNum.constant = 325;
//        self.imageMain.image = [UIImage imageNamed:@"huobanBlackLogo@2x"];
//        
//    }else if([_iOSSizeLogin isEqualToString:@"iPhone5"]){
//        self.imageMain.image = [UIImage imageNamed:@"huobanBlackLogo@2x"];
//        self.textUNTopNum.constant = 226;
//    }else if([_iOSSizeLogin isEqualToString:@"iPhone4"]){
//        self.imageMain.image = [UIImage imageNamed:@"huobanBlackLogo@2x"];
//                self.textUNTopNum.constant = 138;
//    }
    
        if([_iOSSizeLogin isEqualToString:@"iPhone6Plus"]){
    
//            self.textUNTopNum.constant = 394;
//            self.imageMain.image = [UIImage imageNamed:@"huoban_login_3x"];
            self.imageViewClose.image = [UIImage imageNamed:@"close_grey_@3x"];
            
        }else{
//            self.imageMain.image = [UIImage imageNamed:@"huoban_login_2x"];
            self.imageViewClose.image = [UIImage imageNamed:@"close_grey_@2x"];
        }
    
    
    if(_dataModelLogin.userInfomation.userName != nil&& _dataModelLogin.userInfomation.passWord != nil){
        
        
        
        self.textFieldUN.text = _dataModelLogin.userInfomation.userName;
        self.textFieldPWD.text = _dataModelLogin.userInfomation.passWord;

    }
    
//    if([self.textFieldUN.text isEqualToString:@""] && [self.textFieldUN.text isEqualToString:@""]){
//        
//        self.buttonLogin.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
//        [self.buttonLogin setTitleColor:[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1] forState:UIControlStateNormal];
//        self.buttonLogin.layer.borderWidth = 1;
//        self.buttonLogin.layer.borderColor =[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
//        
//        
//        
//    }else{
//        
//        
//        self.buttonLogin.backgroundColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
//        //        self.buttonLogin.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
//        [self.buttonLogin setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
//        
//        
//        self.buttonLogin.layer.borderWidth = 0;
//    }
    
    NSLog(@"%@",_dataModelLogin.userInfomation.userName);
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
   


}


#pragma mark 键盘监听方法设置
//当键盘出现时调用
-(void)keyboardWillShow:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:0];
    
}
//当键退出时调用
-(void)keyboardWillHide:(NSNotification *)aNotification{
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];
}

#pragma mark 按钮实现segue
- (IBAction)forgotPWD:(id)sender {
    [self performSegueWithIdentifier:@"FindPWSegue" sender:nil];
}
- (IBAction)registerAccount:(id)sender{
    [self performSegueWithIdentifier:@"CreateUNSegue" sender:nil];
}
#pragma mark 登陆按钮
- (IBAction)Login:(id)sender {
    
    if (self.textFieldUN.text.length == 0) {
        //手机号不能为空
        [[ToolClass sharedInstance] showAlert:@"手机号不能为空"];
        return;
    }
    else if (self.textFieldUN.text.length < 11)
    {
        //手机号长度不够
        [[ToolClass sharedInstance] showAlert:@"手机号码输入有误，请重新输入"];
        return;
    }
    else if (self.textFieldPWD.text.length == 0){
        //密码不能为空
        [[ToolClass sharedInstance] showAlert:@"密码不能为空"];
        return;
    }
    
        DataModel *dataModelLoginSuccess = [[DataModel alloc] init];
    
        [_httpClassLogin loginSetMobile:self.textFieldUN.text pwd:self.textFieldPWD.text umengid:@"test"mobibuild:[UIDevice currentDevice].model mobitype:@"iOS" CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
    
        _resLoginDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",_resLoginDic);
//           NSLog(@"%@",[NSString stringWithFormat:@"%@",[_resLoginDic[@"msg"] dataUsingEncoding:NSUTF8StringEncoding]]);
        
        if([_resLoginDic[@"status"] isEqualToString:@"success" ]){

            
#warning 登录后的操作
            //登陆先清除缓存
            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
            
            [ud removeObjectForKey:@"HomePageCellDataModel"];
            [ud removeObjectForKey:@"ProjectDynamicWM"];
            
            [ud setInteger:1 forKey:@"runtimes"];
            
            
            NSMutableDictionary *dic = _resLoginDic[@"data"];

            NSMutableDictionary *dicPOST = dic[@"post"];
            
            dataModelLoginSuccess.userInfomation.tokenID = _resLoginDic[@"token"];
            dataModelLoginSuccess.userInfomation.UserID = dic[@"_id"];
            dataModelLoginSuccess.userInfomation.userName = self.textFieldUN.text;
            dataModelLoginSuccess.userInfomation.passWord = self.textFieldPWD.text;
            dataModelLoginSuccess.userInfomation.ImagePreson = dic[@"image"];
            dataModelLoginSuccess.userInfomation.Name = dic[@"name"];
            dataModelLoginSuccess.userInfomation.payName = dicPOST[@"name"];
            dataModelLoginSuccess.userInfomation.payMobile = dicPOST[@"mobile"];
            dataModelLoginSuccess.userInfomation.add = dicPOST[@"address"];
            
            [dataModelLoginSuccess saveUserInfomation];
           
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            NSData *dataFail = [operatioin responseData];
            
            NSMutableDictionary *dicFail = [NSJSONSerialization JSONObjectWithData:dataFail options:NSJSONReadingAllowFragments error:nil];
            
            [[ToolClass sharedInstance]showAlert:[NSString stringWithFormat:@"%@",dicFail[@"msg"]]];
        }
   
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance]showAlert:@"登录失败,请检查网络"];
    }];
    
}

#pragma mark 点击背景隐藏键盘
-(IBAction)backgroundTap:(id)sender{
    
    [self.textFieldUN resignFirstResponder];
    [self.textFieldPWD resignFirstResponder];
    
}
#pragma mark 键盘NEXT
-(IBAction)textfieldUNNEXT:(id)sender{
    [self.textFieldPWD becomeFirstResponder];
}


#pragma mark 执行segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateUNSegue"]) {
//        UINavigationController *navigationController = segue.destinationViewController;
        RegisterAccountViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"loginSegue"]){
        
        MainTabBarViewController *Maincontroller = segue.destinationViewController;
        
        UINavigationController *naVC = Maincontroller.childViewControllers[2];
        
        UserSelfViewController *controller = (UserSelfViewController*)naVC.topViewController;
        
//        controller.delegate = self;
//
//        [controller.tabBarItem setImage:[[ImageSameWidth imageCompressForWidth:[UIImage imageNamed:@"tamenNO"] targetWidth:40] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        
//        [controller.tabBarItem setSelectedImage:[[ImageSameWidth imageCompressForWidth:[UIImage imageNamed:@"tamenYES"] targetWidth:40] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        
//        controller.tabBarItem.
//        
//        
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            ProjectDynamicTableViewController  *controllerProjectAll =[storyboard instantiateViewControllerWithIdentifier:@"ProjectAllController"];
//        
//            UINavigationController *naVCProejctAll = [[UINavigationController alloc]initWithRootViewController:controllerProjectAll];
        
//        [naVCProejctAll.tabBarItem setImage:[[ImageSameWidth imageCompressForWidth:[UIImage imageNamed:@"womenNO"] targetWidth:60] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
//        MainTabBarViewController *controller = segue.destinationViewController;
        
    }else if([segue.identifier isEqual:@"FindPWSegue"]){
        
//        UINavigationController *navigationController = segue.destinationViewController;
  
        ForgotPWDViewController *controller = segue.destinationViewController;
//        controller.delegate = self;
    }
}
//
//- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
////    NSLog(@"%@----%@",range,string);
//    
//    NSLog(@"%@----%@",self.textFieldUN.text,self.textFieldPWD.text);
//    
//    if([string length] != 0 || ![self.textFieldUN.text isEqualToString:@""] || ![self.textFieldPWD.text isEqualToString:@""]){
//        
//        self.buttonLogin.backgroundColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
////        self.buttonLogin.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
//        [self.buttonLogin setTitleColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1] forState:UIControlStateNormal];
//
//        self.buttonLogin.layer.borderWidth = 0;
//        
//    }else{
//        self.buttonLogin.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
//         [self.buttonLogin setTitleColor:[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1] forState:UIControlStateNormal];
//        self.buttonLogin.layer.borderWidth = 1;
//        self.buttonLogin.layer.borderColor =[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
//        
//    }
//    
//    return YES;  
//}


#pragma mark 实现代理
//-(void)RegisterAccountViewController:(RegisterAccountViewController *)controller getPOST:(NSMutableDictionary *)dic{
////    _getReturnDic = [NSMutableDictionary dictionaryWithDictionary:dic];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//-(void)forgotPWDViewController:(ForgotPWDViewController *)controller getDic:(NSMutableDictionary *)dic{
// 
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//}
//-(void)ForgotPWDViewController:(ForgotPWDViewController *)controller getPOST:(NSMutableDictionary *)returnDic{
////    _getReturnDic = [NSMutableDictionary dictionaryWithDictionary:returnDic];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}



//系统低内存
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (IBAction)buttonClose:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    
//    [self.delegate loginViewDelegateClose:self];
    
    [self.delegate LoginViewControllerClose:self];
    
}
@end
