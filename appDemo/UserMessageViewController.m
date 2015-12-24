 //
//  UserMessageViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/31.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "UserMessageViewController.h"
#import "DataModel.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "PECropViewController.h"
#import "ImageSameWidth.h"
#import "QiniuSDK.h"
#import "CDPMonitorKeyboard.h"

@interface UserMessageViewController ()

@end

@implementation UserMessageViewController
@synthesize labelName,labelContents,labelPayAdd,labelPayName,labelPayTelephone,labelSex,dicUserMessage,viewLineSex,viewLineContents,viewLineName,viewLinePayMessage,imageClose,imageTopContract,buttonTopContract;

DataModel *_dataModelUserSetting;
HttpClassSelf *_httpClassUserMessage;
UIImage *_imagMessageChose;
NSString *_iOSMessage;


- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"打印sender----%@",self.dicUserMessage);
    //上放导航栏
    
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUserMessageWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUserMessageWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    //键盘高度改变的通知
//    [[NSNotificationCenter
//      defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:)
//     name:UIKeyboardWillChangeFrameNotification object:nil];
    
    _dataModelUserSetting = [[DataModel alloc] init];
    _httpClassUserMessage = [[HttpClassSelf alloc]init];
   
    _iOSMessage = _dataModelUserSetting.userInfomation.iOSDeviceSize;
    
    if([_iOSMessage isEqualToString:@"iPhone6Plus"]){
       
        self.imageClose.image = [UIImage imageNamed:@"back_yellow_3x"];
        
    }else{
        
        self.imageClose.image = [UIImage imageNamed:@"back_yellow_3x"];
        
    }
    
    self.imagePreson.clipsToBounds = YES;
    self.imagePreson.layer.cornerRadius = 45;
    
    _imagMessageChose = [[UIImage alloc] init];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    
    //    导航栏左侧Item
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"<          " style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(buttonItemCancel)];
    
    
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName :[UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]} forState:UIControlStateNormal];
    
    //    导航栏左侧Item
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(buttonItemSave)];
    
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName :[UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]} forState:UIControlStateNormal];

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    
    
    self.viewLineName.clipsToBounds = YES;
    self.viewLineName.layer.cornerRadius = 8;
    self.viewLineName.layer.borderWidth = 0;
    self.viewLineName.layer.borderColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
    
    self.viewLineSex.clipsToBounds = YES;
    self.viewLineSex.layer.cornerRadius = 8;
    self.viewLineSex.layer.borderWidth = 0;
    self.viewLineSex.layer.borderColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
    
    self.viewLineContents.clipsToBounds = YES;
    self.viewLineContents.layer.cornerRadius = 8;
    self.viewLineContents.layer.borderWidth = 0;
    self.viewLineContents.layer.borderColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
    
    self.viewLinePayMessage.clipsToBounds = YES;
    self.viewLinePayMessage.layer.cornerRadius = 8;
    self.viewLinePayMessage.layer.borderWidth = 0;
    self.viewLinePayMessage.layer.borderColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;

    self.labelName.clipsToBounds = YES;
    self.labelName.layer.borderWidth = 0;
        self.labelName.layer.borderColor = [UIColor colorWithRed:199.0/255 green:199.0/255 blue:199.0/255 alpha:1].CGColor;
    
//    self.labelName.borderStyle = UITextBorderStyleNone;
//    self.labelName.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
//    //设置显示模式为永远显示(默认不显示)
//    self.labelName.leftViewMode = UITextFieldViewModeAlways;
//    
//    self.labelSex.borderStyle = UITextBorderStyleNone;
//    self.labelSex.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
//    //设置显示模式为永远显示(默认不显示)
//    self.labelSex.leftViewMode = UITextFieldViewModeAlways;

//    self.labelPayAdd.borderStyle = UITextBorderStyleNone;
//    self.labelPayAdd.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
//    //设置显示模式为永远显示(默认不显示)
//    self.labelPayAdd.leftViewMode = UITextFieldViewModeAlways;
//    
//    self.labelPayTelephone.borderStyle = UITextBorderStyleNone;
//    self.labelPayTelephone.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 6, 0)];
//    //设置显示模式为永远显示(默认不显示)
//    self.labelPayTelephone.leftViewMode = UITextFieldViewModeAlways;
    
    NSLog(@"%@",self.dicUserMessage[@"name"]);

    self.labelName.text = self.dicUserMessage[@"name"];
    
    if([self.dicUserMessage[@"sex"] longValue] == 1){
        self.labelSex.text = @"男";
    }else{
        self.labelSex.text = @"女";
    }
    self.labelContents.text = self.dicUserMessage[@"desc"];
    
    NSMutableDictionary *dicPayMessage = self.dicUserMessage[@"post"];
    
    self.labelPayName.text = dicPayMessage[@"name"];
    self.labelPayTelephone.text = dicPayMessage[@"mobile"];
    self.labelPayAdd.text = dicPayMessage[@"address"];


    
    self.imagePreson.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.dicUserMessage[@"image"]]]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImagePreson:)];
    
    [self.imagePreson addGestureRecognizer:tap];
    
    
    
    
    
}
/**
* 键盘的frame发生改变时调用（显示、隐藏等）
*/
//- (void)keyboardWillChangeFrame:(NSNotification *)notification
//{
//    //    if (self.picking) return;
//    /**
//     notification.userInfo = @{
//     // 键盘弹出\隐藏后的frame
//     UIKeyboardFrameEndUserInfoKey = NSRect: {{0, 352}, {320, 216}},
//     // 键盘弹出\隐藏所耗费的时间
//     UIKeyboardAnimationDurationUserInfoKey = 0.25,
//     // 键盘弹出\隐藏动画的执行节奏（先快后慢，匀速）
//     UIKeyboardAnimationCurveUserInfoKey = 7
//     }
//     */
//    
//
//}


#pragma mark 键盘监听方法设置
//当键盘出现时调用
-(void)keyboardUserMessageWillShow:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
//    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:0];
//  
//    NSDictionary *userInfo = aNotification.userInfo;
//
//    // 键盘的frame
//    CGRect keyboardF = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//
//    NSLog(@"%f-----%f",keyboardF.origin.x,keyboardF.origin.y);
    
//    self.viewLineName.frame = CGRectMake(self.viewLineName.frame.origin.x,100,self.viewLineName.frame.size.width,self.viewLineName.frame.size.height);
//    
//    self.viewLinePayMessage.frame = CGRectMake(self.viewLinePayMessage.frame.origin.x,100, self.viewLinePayMessage.frame.size.width,self.viewLinePayMessage.frame.size.height);
    
    
    
}
//当键退出时调用
-(void)keyboardUserMessageWillHide:(NSNotification *)aNotification{
    
//    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];

    self.imageTopContract.constant = 12;
}
-(void)clickImagePreson:(UITapGestureRecognizer *)sender{
    
    
     //弹出相册
     UIImagePickerController *controller = [[UIImagePickerController alloc] init];
     controller.delegate = self;
     controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
     [self presentViewController:controller animated:YES completion:NULL];
     
}




//选择图片触发
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    _imagMessageChose =  [info objectForKey:UIImagePickerControllerOriginalImage];
    //    立即修改头像，之后如果上传失败，则在失败返回消息后再复原头像
    [self.imagePreson setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self openEditor:nil];
    }];
}



//切图代理，切图确认触发
- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    self.imagePreson.image = croppedImage;
    
    UIImage *smallImage = [UserMessageViewController imageWithImageSimple:croppedImage scaledToSize:CGSizeMake(150.0, 150.0)];
    //将图片打包成data存储
    
    NSData *dataImage = UIImageJPEGRepresentation(smallImage, 1.0);
    
    [_httpClassUserMessage qiniuSDK:@"qiniu" CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataRes = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataRes options:NSJSONReadingAllowFragments error:nil];
        
        NSString *sdkToken = dic[@"token"];
        
        
        QNUploadManager *upManager = [[QNUploadManager alloc] init];
        
        int imageIndex = arc4random() % 1000000000;
        
        NSString *strImagePreson = [NSString stringWithFormat:@"user/%@-%i",_dataModelUserSetting.userInfomation.tokenID,imageIndex];
        
        //   feed/
        
        [upManager putData:dataImage key:strImagePreson token:sdkToken
                  complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"%@", info);
                      NSLog(@"%@", resp);
                      
                      
                      _dataModelUserSetting.userInfomation.ImagePreson = [NSString stringWithFormat:@"http://images.huoban.io/%@",strImagePreson];
                      
                      NSLog(@"图图图图图%@",_dataModelUserSetting.userInfomation.ImagePreson);
                      
                      
                      self.imagePreson.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_dataModelUserSetting.userInfomation.ImagePreson]]];
                      //不在这保存
                      //                      [_dataUserSetting saveUserInfomation];
                      
                  } option:nil];
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        
        NSLog(@"%@",@"服务器错误错误");
        
        
    }];
    
    
}
//图片剪切controller
- (void)openEditor:(id)sender
{
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.delegate = self;
    //    controller.image = self.UserImage.image;
    controller.image =  _imagMessageChose;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self presentViewController:navigationController animated:YES completion:NULL];
}

//压缩图片
+(UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
}


//将图片保存
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"error = %@",error);
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

- (IBAction)buttonPayList:(id)sender {
    
    [self performSegueWithIdentifier:@"PayListSegue" sender:nil];
}
- (IBAction)buttonItemSave:(id)sender {
    _dataModelUserSetting.userInfomation.Name = self.labelName.text;
    
    if([self.labelSex.text isEqualToString:@"男"]){
        _dataModelUserSetting.userInfomation.sex = @"1";
    }else if([self.labelSex.text isEqualToString:@"女"]){
        _dataModelUserSetting.userInfomation.sex = @"0";
    }else{
        [[ToolClass sharedInstance] showAlert:@"请正确填写性别‘男’or‘女’"];
        return;
    }
    _dataModelUserSetting.userInfomation.contents = self.labelContents.text;
    
    _dataModelUserSetting.userInfomation.payName = self.labelPayName.text;
    
    _dataModelUserSetting.userInfomation.payMobile = self.labelPayTelephone.text;
    
    _dataModelUserSetting.userInfomation.add = self.labelPayAdd.text;
    
    [_dataModelUserSetting saveUserInfomation];
    
    
    
    DataModel *dataModelUser = [[DataModel alloc] init];

    
    
    NSLog(@"%@------%@",dataModelUser.userInfomation.payMobile,dataModelUser.userInfomation.payName);
    
    NSLog(@"%@---%@---%@",_dataModelUserSetting.userInfomation.payMobile,_dataModelUserSetting.userInfomation.payName,_dataModelUserSetting.userInfomation.Name);


    [_httpClassUserMessage UpdateUserSettingSetUser:dataModelUser.userInfomation.UserID setToken:dataModelUser.userInfomation.tokenID setImage:dataModelUser.userInfomation.ImagePreson setName:dataModelUser.userInfomation.Name setSex:dataModelUser.userInfomation.sex setAddress:dataModelUser.userInfomation.add setSign:@"" setDesc:dataModelUser.userInfomation.contents payName:dataModelUser.userInfomation.payName payMobile:dataModelUser.userInfomation.payMobile payPostCode:dataModelUser.userInfomation.payPost CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataRes = [operatioin responseData];
        
        NSMutableDictionary *dicData = [NSJSONSerialization JSONObjectWithData:dataRes options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",dicData);
        if([dicData[@"status"] isEqualToString:@"success"]){
            
            
            [self dismissViewControllerAnimated:YES completion:nil];
            [[ToolClass sharedInstance] showAlert:@"个人信息保存成功"];
            
        }else{
            [[ToolClass sharedInstance] showAlert:@"个人信息保存失败，服务器错误"];
        }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"个人信息保存失败，请检查网络"];
    }];
    
    
    
    
}

- (IBAction)buttonItemCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)labelPayAddTouch:(id)sender {
    
        if([_iOSMessage isEqualToString:@"iPhone6"]){
         
            self.imageTopContract.constant = -50;
            self.buttonTopContract.constant = -50;
            
        }else if([_iOSMessage isEqualToString:@"iPhone5"]){
            
            self.imageTopContract.constant = -200;
            self.buttonTopContract.constant = -200;
            
        }else if([_iOSMessage isEqualToString:@"iPhone4"]){
            
            self.imageTopContract.constant = -250;
            self.buttonTopContract.constant = -250;
        }
}


#pragma mark 点击背景隐藏键盘
-(IBAction)backgroundTap:(id)sender{
    [self.labelName resignFirstResponder];
    [self.labelSex resignFirstResponder];
    [self.labelContents resignFirstResponder];
    [self.labelPayName resignFirstResponder];
    [self.labelPayAdd resignFirstResponder];
    [self.labelPayTelephone resignFirstResponder];
    
}

- (IBAction)buttonTestSetting:(id)sender {
    //弹出相册
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:controller animated:YES completion:NULL];
}


@end
