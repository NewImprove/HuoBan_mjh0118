//
//  FindPWViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/8/24.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ForgotPWDViewController.h"
#import "ToolClass.h"
#import "CommonCrypto/CommonDigest.h"
#import "JSONKit.h"
#import "CommonBase64.h"
#import "ToolClass.h"
#import "CDPMonitorKeyboard.h"
#import "CommonCrypto/CommonDigest.h"
#import "JSONKit.h"
#import "CommonBase64.h"
#import "ToolClass.h"
#import "CDPMonitorKeyboard.h"
#import "HttpClassSelf.h"
#import "DataModel.h"

NSMutableDictionary *_returnUpdateDic;
@interface ForgotPWDViewController ()

@end

@implementation ForgotPWDViewController
@synthesize textFieldCheckID,textFieldPW,textFieldUN,buttonDone,imageMain,buttonCheckID,textCheckID,textPWD,textUM,buttonCheckIDHeight,textUNTopNum,labelCheckPWD,imageClose,delegate;


NSString *_checkID;
NSString *_iOSSizeForgotPWD;
NSMutableDictionary *_resFotgotPWDDic;
HttpClassSelf *_httpClass;

DataModel *_dataModelFoegotPW;
CGSize  _iOSBounds;

NSTimer *_timerCheckId;
- (void)viewDidLoad {
    [super viewDidLoad];
    
  _iOSBounds = [UIScreen mainScreen].bounds.size;
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]];
    
    
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
    

    
//    //增加监听，当键盘出现或改变时收出消息
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    //增加监听，当键退出时收出消息
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowForgot:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideForgot:) name:UIKeyboardWillHideNotification object:nil];
    
    
    buttonDone.clipsToBounds = YES;
    buttonDone.layer.cornerRadius = 8;
    
    _httpClass = [[HttpClassSelf alloc]init];
    
    _dataModelFoegotPW = [[DataModel alloc] init];
    
    
    
    

    
    NSLog(@"%@",_dataModelFoegotPW.userInfomation.iOSDeviceSize);
    
    _iOSSizeForgotPWD = _dataModelFoegotPW.userInfomation.iOSDeviceSize;
    
    
//    if([_iOSSizeForgotPWD isEqualToString:@"iPhone6Plus"]){
//        
//        self.textUNTopNum.constant = 394;
//        self.imageMain.image = [UIImage imageNamed:@"logo144@3x"];
//    }else if( [_iOSSizeForgotPWD isEqualToString:@"iPhone6"]){
//        self.textUNTopNum.constant = 325;
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        
//    }else if([_iOSSizeForgotPWD isEqualToString:@"iPhone5"]){
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        self.textUNTopNum.constant = 226;
//    }else if([_iOSSizeForgotPWD isEqualToString:@"iPhone4"]){
//        self.imageMain.image = [UIImage imageNamed:@"logo144@2x"];
//        self.textUNTopNum.constant = 138;
//    }

    
    if([_iOSSizeForgotPWD isEqualToString:@"iPhone6Plus"]){
        
        //            self.textUNTopNum.constant = 394;
//        self.imageMain.image = [UIImage imageNamed:@"huoban_login_3x"];
        self.imageClose.image = [UIImage imageNamed:@"close_grey_@3x"];
    }else{
//        self.imageMain.image = [UIImage imageNamed:@"huoban_login_2x"];
        self.imageClose.image = [UIImage imageNamed:@"close_grey_@2x"];
    }
    
    
    self.buttonCheckID.clipsToBounds = YES;
    self.buttonCheckID.layer.cornerRadius = 8;
    
    
    self.textFieldCheckID.clipsToBounds = YES;
    self.textFieldCheckID.layer.cornerRadius = 8;
    self.textFieldCheckID.borderStyle = UITextBorderStyleNone;
    self.textFieldCheckID.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
    //设置显示模式为永远显示(默认不显示)
    self.textFieldCheckID.leftViewMode = UITextFieldViewModeAlways;
    
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
-(void)keyboardWillShowForgot:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:10];
    
}
//当键退出时调用
-(void)keyboardWillHideForgot:(NSNotification *)aNotification{
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];
}

//当键盘出现时调用
//-(void)keyboardWillShow:(NSNotification *)aNotification{
//    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
//    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
//    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:0];
//    
//}
//当键退出时调用
//-(void)keyboardWillHide:(NSNotification *)aNotification{
//    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];
//}

//取消响应
-(IBAction)backgroundTap:(id)sender{
    [self.textFieldUN resignFirstResponder];
    [self.textFieldCheckID resignFirstResponder];
    [self.textFieldPW resignFirstResponder];
    [self.labelCheckPWD resignFirstResponder];
}


- (IBAction)cancel:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
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


#pragma mark 获取验证码
- (IBAction)checkidButton:(id)sender {
    
    NSString *checkIdkey = @"resetpwd";
//        NSString *checkIdkey = @"register";
    
    if(![self.textFieldUN.text isEqualToString:@""]){
        [_httpClass GetCheckIDSetTelephoneNumForFixPWD:self.textFieldUN.text getKey:checkIdkey CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            
            NSMutableDictionary *resdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

            NSLog(@"返回:%@",resdic);
            
            if([resdic[@"status"] isEqualToString:@"success"]){
                
                [[ToolClass sharedInstance] showAlert:@"验证码已发送，请尽快完成操作，60秒后可再次获取验证码"];
                
                
                
                [self.buttonCheckID setBackgroundColor:[UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1]];
                
                //延时对象
                _timerCheckId = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(timerButtonCheckID) userInfo:nil repeats:NO];
                
                self.buttonCheckID.enabled = NO;
                
            }else{
                
                NSData *dataFail = [operatioin responseData];
                
                NSMutableDictionary *dicFail = [NSJSONSerialization JSONObjectWithData:dataFail options:NSJSONReadingAllowFragments error:nil];
                
                [[ToolClass sharedInstance]showAlert:[NSString stringWithFormat:@"%@",dicFail[@"msg"]]];
                
            }
            
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"获取验证码失败，请检查网络"];
        }];
        
    }else{
        [[ToolClass sharedInstance] showAlert:@"请填写账号"];
    }
   
    
    
    
//    if(![self checkTextField:self.textFieldUN.text andPW:@"" andCheckid:@""]){
//        return;
//    }
//    
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
//    NSString *para =    [NSString stringWithFormat:@"%i",(int)(1000 + (arc4random() % (9999 - 1001)))];;
//    
//    _checkID = para;
//    
//    //softVersion
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
////    NSString *sigStr = [[accountSid stringByAppendingString:authToken]stringByAppendingString:strTime];
//    NSString *sigStr = [NSString stringWithFormat:@"%@%@%@",accountSid,authToken,strTime];
//    //sigMD5验证
//    NSString *sigStrMD5 =  [ForgotPWDViewController MD5ByAStr:sigStr];
//    
//    //包头验证参数
////    NSString *AuthorizationStr = [[accountSid stringByAppendingString:@":"]stringByAppendingString:strTime];
//    NSString *AuthorizationStr = [NSString stringWithFormat:@"%@:%@",accountSid,strTime];
//    
//  
//    
////    NSString *httpsURL = @"https://api.ucpaas.com/";
//    
////    NSString *strURL = [[[[[httpsURL stringByAppendingString:version] stringByAppendingString:@"/Accounts/"]stringByAppendingString:accountSid]stringByAppendingString:@"/Messages/templateSMS?sig="]stringByAppendingString:[md5Text uppercaseString]];
//    
//    NSString *strURL = [NSString stringWithFormat:@"/2014-06-30/Accounts/%@/Messages/templateSMS?sig=%@",accountSid,[sigStrMD5 uppercaseString]];
//
//    NSLog(@"%@",strURL);
////    //给string编码
////    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////    
//    
//    //词典JSON
//    NSDictionary *dataDic = [NSDictionary dictionaryWithObjectsAndKeys:appId,@"appId",para,@"param",templateId,@"templateId",to,@"to", nil];
//    //包体
////    NSDictionary *postBodyDic = [NSDictionary dictionaryWithObjectsAndKeys:dataDic,@"templateSMS", nil];
//    
//    
////    NSLog(@"%@",postBodyDic);
//    
//    //post Body
////    NSString *postStr = [postDic JSONString];
//    
//    //字符串转成Data
////    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableDictionary *postHeader = [[NSMutableDictionary alloc]init ];
//    [postHeader setValue:@"application/json" forKey:@"Accept"];
//    [postHeader setValue:[CommonBase64 base64StringFromText:AuthorizationStr] forKey:@"Authorization"];
//    [postHeader setValue:@"application/json;charset=utf-8" forKey:@"Content-Type"];
//    [postHeader setValue:[NSString stringWithFormat:@"%i",256]  forKey:@"Content-Length"];
//    
//    NSLog(@"打印头属性：%@",postHeader);
//
//    //设置主机名
//    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:@"api.ucpaas.com" customHeaderFields:postHeader ];
//    
//    //请求地址，参数
//    MKNetworkOperation *op = [engine operationWithPath:strURL params:dataDic httpMethod:@"POST" ssl:YES];
//    
//    //请求闭包
//    [op addCompletionHandler:^(MKNetworkOperation *operatioin){
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        NSLog(@"%@",dic);
//        
//        
//        
//    }errorHandler:^(MKNetworkOperation *errorOp,NSError *err){
//        
//        
//        NSLog(@"打印报错了:%@",err);
//        
//    }];
//    
//    //发起网络请求
//    [engine enqueueOperation:op];
    
}

- (IBAction)Done:(id)sender {
    
    NSString *fixPWDKey = @"resetpwd";
    
    if(![self checkTextField:self.textFieldUN.text andPW:self.textFieldPW.text andCheckid:self.textFieldCheckID.text]){
        return;
    }
    
    NSLog(@"%@----%@",self.textFieldPW.text,self.labelCheckPWD.text);
    if(![self.textFieldPW.text isEqualToString:self.labelCheckPWD.text]){
        [[ToolClass sharedInstance] showAlert:@"确认密码输入不一致，请重新输入"];
        
        return;
    }
    

    [_httpClass CheckIDReviewForFixPWD:self.textFieldUN.text getKey:fixPWDKey getCode:self.textFieldCheckID.text CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataCheckID = [operatioin responseData];
        
        NSMutableDictionary *dicCheckID = [NSJSONSerialization JSONObjectWithData:dataCheckID options:NSJSONReadingAllowFragments error:nil];
        
        if([dicCheckID[@"status"]isEqualToString:@"success"]){
            
            [_httpClass forgotPWDSetMobile:self.textFieldUN.text pwd:self.textFieldPW.text umengid:@"" mobibuild:[UIDevice currentDevice].model mobitype:@"iOS" CallBackYES:^(MKNetworkOperation *operatioin){
                
                NSData *data = [operatioin responseData];
                
                //词典对象
                _resFotgotPWDDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                
                if([_resFotgotPWDDic[@"status"] isEqualToString:@"success"]){
                    _dataModelFoegotPW.userInfomation.userName = self.textFieldUN.text;
                    _dataModelFoegotPW.userInfomation.passWord = self.textFieldPW.text;
                    
                    [_dataModelFoegotPW saveUserInfomation];
                    
                    [[ToolClass sharedInstance]showAlert:@"更改密码成功"];
                    
//                    [self.delegate ForgotPWDViewController:self getPOST:_resFotgotPWDDic];
                    
//                    [self.delegate ForgotPWDViewController:self getPOST:_resFotgotPWDDic];
                    
//                    [self.delegate forgotPWDViewController:self getDic:_resFotgotPWDDic];
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }else{
                    [[ToolClass sharedInstance]showAlert:@"更改密码失败，请检查手机号"];
                }
            }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
                [[ToolClass sharedInstance]showAlert:@"更改密码失败，请检查网络"];
            }];
        }else{
            NSData *dataFail = [operatioin responseData];
            
            NSMutableDictionary *dicFail = [NSJSONSerialization JSONObjectWithData:dataFail options:NSJSONReadingAllowFragments error:nil];
            
            [[ToolClass sharedInstance]showAlert:[NSString stringWithFormat:@"%@",dicFail[@"msg"]]];
            
        }
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance]showAlert:@"验证码验证失败，请检查网络"];

    }];
    
}



//接收到服务器回应的时候调用此方法

//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//
//{
//    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
//    //    NSLog(@"%@",res);
//}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
//
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSMutableDictionary *dic = [data objectFromJSONData];
//    
//    if(dic[@"resp"] != nil){
//        NSMutableDictionary *dicResp = dic[@"resp"];
//        if([dicResp[@"respCode"] isEqualToString:@"000000"]){
//            [[ToolClass sharedInstance]showAlert:@"验证码已发送，请稍等"];
//        }else{
//            [[ToolClass sharedInstance]showAlert:@"验证码下发失败，请检查手机号并重试"];
//            return;
//        }
//    }else{
//            if(dic[@"resp"] == nil && dic[@"status"] != nil){
//                _returnUpdateDic = dic;
//            }
//    }
//    
//}

//数据传完之后调用此方法

//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    if(_returnUpdateDic[@"status"] != nil){
//        if([_returnUpdateDic[@"status"] isEqualToString:@"success"]){
//            [[ToolClass sharedInstance]showAlert:@"更改密码成功，请重新登录"];
//            [self.delegate ForgotPWDViewController:self getPOST:_returnUpdateDic];
//        }
//    }else{
//        
//    }
//}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法

-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"网络传输报错：%@",[error localizedDescription]);
}
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

#pragma mark textFieldNEXT方法
-(IBAction)textfieldUNNEXT:(id)sender{
    [self.textFieldCheckID becomeFirstResponder];
}

-(IBAction)textfieldCheckIDNEXT:(id)sender{
    [self.textFieldPW becomeFirstResponder];
}

#pragma mark 低内存
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)timerButtonCheckID{
    
    self.buttonCheckID.enabled = YES;
    [_timerCheckId invalidate];
    _timerCheckId = nil;
    
        [self.buttonCheckID setBackgroundColor:[UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1]];
    
    NSLog(@"定时器定时器");
    
}
@end
