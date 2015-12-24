//
//  CreateANViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "RegisterAccountViewController.h"
#import "CommonCrypto/CommonDigest.h"
#import "JSONKit.h"
#import "CommonBase64.h"
#import "ToolClass.h"
#import "CDPMonitorKeyboard.h"
#import "MKNetworkKit.h"

#import "DataModel.h"
#import "UserInfomation.h"

//#import "httpProtocol.h"
//接口地址 http://test.lcrfbj.com:8888/

//#define httpAdd "http://test.lcrfbj.com:8888/"
@interface RegisterAccountViewController ()

@end

@implementation RegisterAccountViewController
@synthesize textFieldUN,textFieldPW,textCheckId,delegate,buttonDone,imageMain,buttonCheckID,textUNTopNum,imageClose;

NSString *_checkid;
NSString *_iOSSizeRegister;
NSMutableDictionary *_resRegisterDic;
NSMutableDictionary *_resGetCheckIDDic;
HttpClassSelf *httpClass;

DataModel *_dataModelRegister;

UserInfomation *_userInfomationRegister;
NSTimer *_timerCheckIdRegister;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowRgister:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideRgister:) name:UIKeyboardWillHideNotification object:nil];
    
    _checkid = @"";
    
    
    buttonDone.clipsToBounds = YES;
    buttonDone.layer.cornerRadius = 8;
    
    
    //http接口
    httpClass = [[HttpClassSelf alloc]init];
    
    _dataModelRegister = [[DataModel alloc] init];
    
//    _userInfomationRegister = [[UserInfomation alloc] init];
    
    
    _iOSSizeRegister = _dataModelRegister.userInfomation.iOSDeviceSize;
    
//    if([_iOSSizeRegister isEqualToString:@"iPhone6Plus"]){
//        
//        self.textUNTopNum.constant = 394;
//        self.imageMain.image = [UIImage imageNamed:@"logo144@3x"];
//    }else if( [_iOSSizeRegister isEqualToString:@"iPhone6"]){
//        self.textUNTopNum.constant = 325;
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        
//    }else if([_iOSSizeRegister isEqualToString:@"iPhone5"]){
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        self.textUNTopNum.constant = 226;
//    }else if([_iOSSizeRegister isEqualToString:@"iPhone4"]){
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        self.textUNTopNum.constant = 138;
//    }
    if([_iOSSizeRegister isEqualToString:@"iPhone6Plus"]){
        
        //            self.textUNTopNum.constant = 394;
//        self.imageMain.image = [UIImage imageNamed:@"huoban_login_3x"];
        self.imageClose.image = [UIImage imageNamed:@"close_grey_@3x"];
    }else{
//        self.imageMain.image = [UIImage imageNamed:@"huoban_login_2x"];
        self.imageClose.image = [UIImage imageNamed:@"close_grey_@2x"];
    }
    
    
    self.buttonCheckID.clipsToBounds = YES;
    self.buttonCheckID.layer.cornerRadius = 8;
    
    self.textCheckId.clipsToBounds = YES;
    self.textCheckId.layer.cornerRadius = 8;
    self.textCheckId.borderStyle = UITextBorderStyleNone;
    self.textCheckId.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textCheckId.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.textFieldUN.clipsToBounds = YES;
    self.textFieldUN.layer.cornerRadius = 8;
    self.textFieldUN.borderStyle = UITextBorderStyleNone;
    self.textFieldUN.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textFieldUN.leftViewMode = UITextFieldViewModeAlways;
    
    self.textFieldPW.clipsToBounds = YES;
    self.textFieldPW.layer.cornerRadius = 8;
    self.textFieldPW.borderStyle = UITextBorderStyleNone;
    self.textFieldPW.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textFieldPW.leftViewMode = UITextFieldViewModeAlways;
    
    self.labelCheckPWD.clipsToBounds = YES;
    self.labelCheckPWD.layer.cornerRadius = 8;
    self.labelCheckPWD.borderStyle = UITextBorderStyleNone;
    self.labelCheckPWD.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.labelCheckPWD.leftViewMode = UITextFieldViewModeAlways;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}



#pragma mark 键盘监听
//当键盘出现时调用
-(void)keyboardWillShowRgister:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:10];
    
}
//当键退出时调用
-(void)keyboardWillHideRgister:(NSNotification *)aNotification{
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];
}

//取消响应
-(IBAction)backgroundTap;{
    [self.textFieldUN resignFirstResponder];
    [self.textFieldPW resignFirstResponder];
    [self.textCheckId resignFirstResponder];
    [self.labelCheckPWD resignFirstResponder];
}


//键盘NEXT
-(IBAction)usernameNEXT:(id)sender{
    
    [self.textCheckId becomeFirstResponder];
}
-(IBAction)checkidNEXT:(id)sender{
    [self.textFieldPW becomeFirstResponder];
}


- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"关闭注册view");
    }];
}

#pragma mark 获取验证码
- (IBAction)checkidButton:(id)sender {

    if(![self.textFieldUN.text isEqualToString:@""]){
        
    NSString *strKey = @"register";
    
    [httpClass GetCheckIDSetTelephoneNumForCreate:self.textFieldUN.text getKey:strKey CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"打印回传JSON%@",dic);
        
        if([dic[@"status"] isEqualToString:@"success"]){
            
            [[ToolClass sharedInstance] showAlert:@"验证码已发送，请尽快完成操作，60秒后可再次获取验证码"];
            
//            [self.buttonCheckID setBackgroundColor:[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1]];
            
            [self.buttonCheckID setBackgroundColor:[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1]];
            //延时对象
            _timerCheckIdRegister = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timerButtonCheckID) userInfo:nil repeats:NO];
            
            self.buttonCheckID.enabled = NO;
        }else{
            
            NSData *dataFail = [operatioin responseData];
            
            NSMutableDictionary *dicFail = [NSJSONSerialization JSONObjectWithData:dataFail options:NSJSONReadingAllowFragments error:nil];
            
            [[ToolClass sharedInstance]showAlert:[NSString stringWithFormat:@"%@",dicFail[@"msg"]]];
            
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"验证码获取失败，请检查网络"];
    }];
        
    }else{
        
        [[ToolClass sharedInstance] showAlert:@"请填写账号"];
    }
    
//    //开发者账号
//    NSString *accountSid = @"c529d51ce44750e2cdd4d501886a59f1";
//    //authToken
//    NSString *authToken = @"c02514384a1333a364f3b1b8b660b628";
//    //应用ID
//    NSString *appId = @"9cbef032f75f435d871dd1d7cdbaf96f";
//    //短信模板ID
//    NSString *templateId = @"11972";
//    //手机号
//    NSString *to = self.textFieldUN.text;
//    
//    
//    //四位验证码
//    _checkid =    [NSString stringWithFormat:@"%i",(int)(1000 + (arc4random() % (9999 - 1001)))];;
//    
//    NSString *version = @"2014-06-30";
//    
//    //获取时间戳
//    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]]; // 只能够修改该程序的defaultTimeZone，不能修改系统的，更不能修改其他程序的。
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
//    NSDate *now = [NSDate date];
//    NSString *strTime = [dateFormatter stringFromDate:now];
//    
//    //sig参数
//    NSString *sigStr = [[accountSid stringByAppendingString:authToken]stringByAppendingString:strTime];
//    
//    //包头验证参数
//    NSString *AuthorizationStr = [[accountSid stringByAppendingString:@":"]stringByAppendingString:strTime];
//    
//    NSString *md5Text =  [RegisterAccountViewController MD5ByAStr:sigStr];
//    
//    NSString *httpsURL = @"https://api.ucpaas.com/";
//    NSString *strURL = [[[[[httpsURL stringByAppendingString:version] stringByAppendingString:@"/Accounts/"]stringByAppendingString:accountSid]stringByAppendingString:@"/Messages/templateSMS?sig="]stringByAppendingString:[md5Text uppercaseString]];
//    
//    //给string编码
//    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    //转成URL对象
//    NSURL *url = [NSURL URLWithString:strURL];
//    
//    //词典JSON
//    NSDictionary *dataDic = [NSDictionary dictionaryWithObjectsAndKeys:appId,@"appId",_checkid,@"param",templateId,@"templateId",to,@"to", nil];
//    
//    NSDictionary *postDic = [NSDictionary dictionaryWithObjectsAndKeys:dataDic,@"templateSMS", nil];
//    //post Body
//    NSString *postStr = [postDic JSONString];
//    
//    //字符串转成Data
//    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
//    
//    //地址
//    //把URL转成request对象
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    
//    //包体
//    [request setHTTPBody:postData];
//    
//    
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:[CommonBase64 base64StringFromText:AuthorizationStr] forHTTPHeaderField:@"Authorization"];
//    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%i",256] forHTTPHeaderField:@"Content-Length"];
//    
//    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
//    [connection start];

    }

#pragma mark 完成注册
- (IBAction)doneButton:(id)sender {

    NSString *strCheckKEY = @"register";
    
    if(![self checkTextField:self.textFieldUN.text andPW:self.textFieldPW.text andCheckid:self.textCheckId.text]){
        return;
    }
    
    if(![self.textFieldPW.text isEqualToString:self.labelCheckPWD.text]){
        [[ToolClass sharedInstance] showAlert:@"确认密码输入不一致，请重新输入"];
        
        return;
    }

    
    [httpClass CheckIDReviewForFixPWD:self.textFieldUN.text getKey:strCheckKEY getCode:self.textCheckId.text CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataCheckID = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataCheckID options:NSJSONReadingAllowFragments error:nil];
        
        if([dic[@"status"] isEqualToString:@"success"]){

            //http接口
            [httpClass RegisterSetMobile:self.textFieldUN.text pwd:self.textFieldPW.text umengid:@"" mobibuild:[UIDevice currentDevice].model mobitype:@"iOS" CallBackYES:^(MKNetworkOperation *operatioin) {
                NSLog(@"打印打印%@",_resRegisterDic);
                //返回data数据
                NSData *data = [operatioin responseData];
                //词典对象
                _resRegisterDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                NSLog(@"返回注册注册JSON%@",_resRegisterDic);
                
                
                if([_resRegisterDic[@"status"] isEqualToString:@"success"]){
//                    NSLog(@"打印注册成功JSON%@",_resRegisterDic);
                    
                    NSMutableDictionary *dicData = _resRegisterDic[@"data"];
                    
//                    NSLog(@"%@,%@,%@",dicData[@"name"],dicData[@"image"],dicData[@"_id"]);
                    
                    _userInfomationRegister.userName = dicData[@"mobile"];
                    _userInfomationRegister.ImagePreson = dicData[@"image"];
                    _userInfomationRegister.Name = dicData[@"name"];
                    _userInfomationRegister.passWord = self.textFieldPW.text;
                    _userInfomationRegister.tokenID = _resRegisterDic[@"token"];
                    _userInfomationRegister.UserID = dicData[@"_id"];
                    
      
                    
//                    NSLog(@"%@,%@,%@,%@,",_userInfomationRegister.userName,_userInfomationRegister.passWord,_userInfomationRegister.tokenID,_userInfomationRegister.UserID);
                    _dataModelRegister.userInfomation = _userInfomationRegister;
                    [_dataModelRegister saveUserInfomation];
                    
                    [[ToolClass sharedInstance]showAlert:@"注册成功，请登录"];
//                    [self.delegate RegisterAccountViewController:self getPOST:_resRegisterDic];
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }else{
                    NSData *dataFail = [operatioin responseData];
                    
                    NSMutableDictionary *dicFail = [NSJSONSerialization JSONObjectWithData:dataFail options:NSJSONReadingAllowFragments error:nil];
                    
                    [[ToolClass sharedInstance]showAlert:[NSString stringWithFormat:@"%@",dicFail[@"msg"]]];
                    
                }
                
            }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                _resRegisterDic = nil;
                
                [[ToolClass sharedInstance] showAlert:@"注册失败，请检查网络"];
            }];
            
        }else{
            
            [[ToolClass sharedInstance] showAlert:@"验证码验证失败，此账号已被注册"];
        }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        [[ToolClass sharedInstance]  showAlert:@"验证码验证失败，请检查网络"];
 
    }];
    
    
    
    
    
    
    
    
    
}

//md5加密
+ (NSString *)MD5ByAStr:(NSString *)aSourceStr {
    const char* cStr = [aSourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    
    return ret;
}
//接收到服务器回应的时候调用此方法

//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//
//{
//}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次

//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//
//    _resGetCheckIDDic = [data objectFromJSONData];
//
//}

//数据传完之后调用此方法

//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//
//        if(_resGetCheckIDDic[@"resp"] != nil){
//            NSMutableDictionary *dicResp = _resGetCheckIDDic[@"resp"];
//            if([dicResp[@"respCode"] isEqualToString:@"000000"]){
//                [[ToolClass sharedInstance]showAlert:@"验证码已发送，请稍等"];
//            }else{
//                [[ToolClass sharedInstance]showAlert:@"验证码下发失败，请检查手机号并重试"];
//                return;
//            }
//        }
//    
//}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
//-(void)connection:(NSURLConnection *)connection
// didFailWithError:(NSError *)error
//{
////    NSLog(@"%@",[error localizedDescription]);
//    [[ToolClass sharedInstance]showAlert:@"验证码下发失败，请检查网络"];
//}

#pragma mark textField检查
-(BOOL)checkTextField:(NSString*)username andPW:(NSString*)password andCheckid:(NSString*)checkID{
    BOOL returnChose = YES;

    if(username == nil){
        username = @"";
    }else if(password == nil){
        password = @"";
    }else if (checkID == nil){
        checkID = @"";
    }
    
    if([username isEqualToString:@""] && ![password isEqualToString:@""] && ![checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"手机号不可为空"];
        returnChose = NO;
    }else if(![username isEqualToString:@""] && [password isEqualToString:@""] && ![checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"密码不可为空"];
        returnChose = NO;
    }else if(![username isEqualToString:@""] && ![password isEqualToString:@""] && [checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"验证码不可为空"];
        returnChose = NO;
    }else if(![username isEqualToString:@""] && ![password isEqualToString:@""] && ![checkID isEqualToString:@""]){
        if ([password length] <6 || [password length]> 16){
            [[ToolClass sharedInstance]showAlert:@"'密码位数不正确'密码为6~16字母&数字组合，请重新填写"];
            returnChose = NO;
        }
    }else if([username isEqualToString:@""] && [password isEqualToString:@""] && [checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"请正确填写'账号''验证码''密码'信息"];
        returnChose = NO;
    }else if(![username isEqualToString:@""] && [password isEqualToString:@""] && [checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"请正确填写'验证码''密码'信息"];
        returnChose = NO;
    }
    return returnChose;
}

-(BOOL)checkTextFieldByCheckID:(NSString*)username andPW:(NSString*)password andCheckid:(NSString*)checkID{
    BOOL returnChose = YES;
    
    if(username == nil){
        username = @"";
    }else if(password == nil){
        password = @"";
    }else if (checkID == nil){
        checkID = @"";
    }
    
    if([username isEqualToString:@""] && ![password isEqualToString:@""] && ![checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"手机号不可为空"];
        returnChose = NO;
    }else if(![username isEqualToString:@""] && ![password isEqualToString:@""] && [checkID isEqualToString:@""]){
        [[ToolClass sharedInstance]showAlert:@"验证码不可为空"];
        returnChose = NO;
    }
    return returnChose;
}

-(void)timerButtonCheckID{
    
    [self.buttonCheckID setBackgroundColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1]];
    
    self.buttonCheckID.enabled = YES;
    [_timerCheckIdRegister invalidate];
    _timerCheckIdRegister = nil;
    
    
    
}

#pragma mark 释放内存
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
