//
//  CreateDynamicViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "CreateDynamicViewController.h"
#import "CreateDynamicNavigationController.h"
#import "YcKeyBoardView.h"
#import "DataModel.h"
#import "ProjectModel.h"
#import "DataModel.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "ImageSameWidth.h"
#import "QiniuSDK.h"
#import "ImageSameWidth.h"
#import "PECropView.h"
#import "PECropViewController.h"
#import "SendDynamicBar.h"


@interface CreateDynamicViewController ()

@end

@implementation CreateDynamicViewController


HttpClassSelf *_httpClassSend;
DataModel *_dataModelSemd;
NSCharacterSet * _subImageSend;

NSString *_iOSSizeSend;
NSString *_strImageDynamic;
int _imageWidth;
SendDynamicBar *_sendDynamicBar;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _subImageSend = [NSCharacterSet characterSetWithCharactersInString:@"{,}"];
    
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
    
    self.title = [NSString stringWithFormat:@"@ %@",self.projectModelSendData.projectTitle];
    
    
    _httpClassSend = [[HttpClassSelf alloc] init];
    _dataModelSemd = [[DataModel alloc] init];
    
    _iOSSizeSend = _dataModelSemd.userInfomation.iOSDeviceSize;
    
    if([_iOSSizeSend isEqualToString:@"iPhone6Plus"]){
        
                self.labelHeight.constant = 220;
        
        self.imageClose.image = [UIImage imageNamed:@"back_blue_3x"];
        
    }else if([_iOSSizeSend isEqualToString:@"iPhone6"]){
        
        self.labelHeight.constant = 173;
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
        
    }else if([_iOSSizeSend isEqualToString:@"iPhone5"]){
        
        self.labelHeight.constant = 80;
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
    }else if([_iOSSizeSend isEqualToString:@"iPhone4"]){
        
        self.labelHeight.constant =40;
        self.imageClose.image = [UIImage imageNamed:@"back_blue_2x"];
        
    }

    //    self.textViewCreateDynamic.layer.borderWidth = 1.0f;
            [self.textViewCreateDynamic becomeFirstResponder];
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择项目" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(toggleMenu)];
    
    
    //
    //    self.textViewCreateDynamic.layer.borderWidth = 1.0f;
    //    self.textViewCreateDynamic.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    //    self.textViewCreateDynamic.clipsToBounds =YES;
    //    self.textViewCreateDynamic.layer.cornerRadius = 8;
    self.ImageCreateDynamic.clipsToBounds = YES;
    self.ImageCreateDynamic.layer.cornerRadius = 8;

    
    [self.textViewCreateDynamic becomeFirstResponder];
    
    _strImageDynamic = @"";
    
    CGSize  iOSBounds = [UIScreen mainScreen].bounds.size;
    
    //    UIView *viewButtons = [[UIView alloc] initWithFrame:CGRectMake(0,iOSBounds.height-70, iOSBounds.width, 44)];
    //
    //    viewButtons.backgroundColor = [UIColor redColor];
    //
    //    [self.view addSubview:viewButtons];
    
     _sendDynamicBar = [[SendDynamicBar alloc]initWithFrame:CGRectMake(-2,iOSBounds.height - 50,iOSBounds.width + 4,50)];
    
    _sendDynamicBar.backgroundColor = [UIColor whiteColor];
    
    _sendDynamicBar.delegate = self;
    
    [_sendDynamicBar.imageBtn addTarget:self action:@selector(choseImageBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sendDynamicBar];
    
    //    [sendBar.sendBtn addTarget:self action:@selector(buttonDone:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(choseImageBtn:)];
    //
    //    [sendBar.imageBtm addGestureRecognizer:tap];
    
    
    
    self.ImageCreateDynamic.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

-(void)buttonDone:(id)sender{
    
    
}

-(void)choseImageBtn:(UITapGestureRecognizer*)sender{
    
    NSLog(@"选择图片图片");
    
    
    //弹出相册
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:controller animated:YES completion:NULL];
}

-(void)chosePoindBtn:(UIButton*)sender{
    
    NSLog(@"添加##");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//选择图片触发
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //立即修改头像，之后如果上传失败，则在失败返回消息后再复原头像
    [self.ImageCreateDynamic setImage:image];
    
    
    
    NSLog(@"%@",info[@"UIImagePickerControllerOriginalImage"]);
    
    NSArray *aryImageStr = [[NSString stringWithFormat:@"%@",info[@"UIImagePickerControllerOriginalImage"] ] componentsSeparatedByCharactersInSet:_subImageSend];
    
    
    
    self.imageContentsWidth.constant = 90/([aryImageStr[2] floatValue]/[aryImageStr[1] floatValue]);
    
    
    self.ImageCreateDynamic.frame = CGRectMake(self.ImageCreateDynamic.frame.origin.x,_sendDynamicBar.frame.origin.y - 12,self.ImageCreateDynamic.frame.size.width,self.ImageCreateDynamic.frame.size.height);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self openEditor:nil];
    }];
}


-(void)cropViewControllerDidCancel:(PECropViewController *)controller{
    
    self.ImageCreateDynamic.image = nil;
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}
//切图代理，切图确认触发
- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    self.ImageCreateDynamic.image = croppedImage;
    
    
    self.ImageCreateDynamic.contentMode = UIViewContentModeScaleAspectFit;
    //    UIImage *smallImage = [CreateDynamicViewController imageWithImageSimple:croppedImage scaledToSize:CGSizeMake(150.0, 150.0)];
    
    NSLog(@"%f----%f", croppedImage.size.height,croppedImage.size.width);
    
    
    
    self.imageContentsWidth.constant = 90/(croppedImage.size.height / croppedImage.size.width);
    
    //将图片打包成data存储
    _imageWidth = 397;
    
    UIImage *imageUpdate = [ImageSameWidth imageCompressForWidth:croppedImage targetWidth:_imageWidth];
    
    
    NSLog(@"打印图片高：%f--宽：%f",imageUpdate.size.height,imageUpdate.size.width);
    
    
    NSData *dataImage = UIImageJPEGRepresentation(imageUpdate,1.0);
    
    [_httpClassSend qiniuSDK:@"qiniu" CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataRes = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataRes options:NSJSONReadingAllowFragments error:nil];
        
        NSString *sdkToken = dic[@"token"];
        
        QNUploadManager *upManager = [[QNUploadManager alloc] init];
        
        int x = arc4random() % 1000000000;
        
        NSString *imageRandom = [NSString stringWithFormat:@"%@%i",sdkToken,x];
        
        NSString *strImage = [NSString stringWithFormat:@"userDynamic/%@!%i*%i",imageRandom,(int)imageUpdate.size.width,(int)imageUpdate.size.height];
        
        
        
        _strImageDynamic = [NSString stringWithFormat:@"http://images.huoban.io/%@",strImage];
        
        //   feed/
        
        NSLog(@"上传图片地址%@",_strImageDynamic);
        
        [upManager putData:dataImage key:strImage token:sdkToken
                  complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"%@", info);
                      NSLog(@"%@", resp);
                      
                      
                  } option:nil];
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        [[ToolClass sharedInstance] showAlert:@"上传图片失败,请检查网络"];
    }];
}


//图片剪切controller
- (void)openEditor:(id)sender
{
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.delegate = self;
    controller.image = self.ImageCreateDynamic.image;
    
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

- (IBAction)buttonCancel:(id)sender {
    
//    [self.delegate createDynamicClose:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonBackground:(id)sender {
    
    
    
    
    //    if([_iOSSizeSend isEqualToString:@"iPhone6Plus"]){
    //
    //        self.imageViewTOPNum.constant = 350;
    //
    //    }else if([_iOSSizeSend isEqualToString:@"iPhone6"]){
    //        self.imageViewTOPNum.constant = 200;
    //
    //
    //    }else if([_iOSSizeSend isEqualToString:@"iPhone5"]){
    //
    //
    //    }else if([_iOSSizeSend isEqualToString:@"iPhone4"]){
    //
    //
    //    }
    
    [self.textViewCreateDynamic resignFirstResponder];
}

-(void)keyboardWillShow:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
    
        if([_iOSSizeSend isEqualToString:@"iPhone6Plus"]){
                self.imageContentTop.constant = 60;
    
//                self.ImageCreateDynamic.frame = CGRectMake(self.ImageCreateDynamic.frame.origin.x,_sendBar.frame.origin.y - 12,self.ImageCreateDynamic.frame.size.width,self.ImageCreateDynamic.frame.size.height);
    
        }else if([_iOSSizeSend isEqualToString:@"iPhone6"]){
    
            self.imageContentTop.constant = 12;
    
        }else if([_iOSSizeSend isEqualToString:@"iPhone5"]){
                self.imageContentTop.constant = 12;
    
        }else if([_iOSSizeSend isEqualToString:@"iPhone4"]){
                self.imageContentTop.constant = 12;
            
        }
}
//当键退出时调用
-(void)keyboardWillHide:(NSNotification *)aNotification{
    
    
    
    
        if([_iOSSizeSend isEqualToString:@"iPhone6Plus"]){
             self.imageContentTop.constant = 335;
    
        }else if([_iOSSizeSend isEqualToString:@"iPhone6"]){
    
             self.imageContentTop.constant = 277;
    
        }else if([_iOSSizeSend isEqualToString:@"iPhone5"]){
    
               self.imageContentTop.constant = 270;
        }else if([_iOSSizeSend isEqualToString:@"iPhone4"]){
               self.imageContentTop.constant = 240;
            
        }
    
}

-(void)inputBar:(SendDynamicBar *)inputBar sendBtnPress:(UIButton *)sendBtn withInputString:(NSString *)str{
    if([_strImageDynamic isEqualToString:@""] && [self.textViewCreateDynamic.text length] <1){
        
        [[ToolClass sharedInstance] showAlert:@"发布内容不可为空"];
        return;
    }else if(![_strImageDynamic isEqualToString:@""] && [self.textViewCreateDynamic.text length] >2000){
        
        [[ToolClass sharedInstance] showAlert:@"发布内容不可超过2000字"];
        return;
        
    }else if([self.textViewCreateDynamic.text length] > 2000){
        
        [[ToolClass sharedInstance] showAlert:@"发布内容不可超过2000字"];
        return;
    }
    
    if(![self.projectModelSendData.projectID isEqualToString:@""]){
        
        [_httpClassSend sendProjectselfDynamicSetProjectID:self.projectModelSendData.projectID strToken:_dataModelSemd.userInfomation.tokenID message:self.textViewCreateDynamic.text image:_strImageDynamic CallBackYES:^(MKNetworkOperation *operatioin){
            
            NSData *data = [operatioin responseData];
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"%@",dic);
            if([dic[@"status"] isEqualToString:@"success"]){
                
//                [[ToolClass sharedInstance] showAlert:@"动态发送成功"];
//                [self.delegate createDynamicDone:self];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [[ToolClass sharedInstance] showAlert:@"动态发送失败，服务器错误"];
            }
        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
            [[ToolClass sharedInstance] showAlert:@"动态发送失败，请检查网络"];
        }];
        
    }else{
        [[ToolClass sharedInstance] showAlert:@"请选择项目名称"];
    }
    
    
}
//取消按钮的点击事件
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}





//-(void)inputBar:(YFInputBar *)inputBar sendBtnPress:(UIButton *)sendBtn withInputString:(NSString *)str
//{
//
//    if(![str isEqualToString:@""]){
//
//        [_httpClassTalk commentProjectselDynamicSetFeed:self.dicTalk[@"_id"] strToken:_dataModelTalk.userInfomation.tokenID message:str CallBackYES:^(MKNetworkOperation *operatioin){
//
//            NSData *data = [operatioin responseData];
//            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//
//            if([dic[@"status"] isEqualToString:@"success"]){
//
//                [self.tableViewTalk headerBeginRefreshing];
//                [[ToolClass sharedInstance] showAlert:@"发布评论成功"];
//            }else{
//                [[ToolClass sharedInstance] showAlert:@"发布评论失败,服务器错误"];
//            }
//
//        }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//            [[ToolClass sharedInstance] showAlert:@"发布评论失败,请检查网络"];
//        }];
//    }else{
//        
//        [[ToolClass sharedInstance] showAlert:@"评论不可为空~"];
//        
//    }
//    
//}


- (IBAction)buttonClose:(id)sender {
}
@end
