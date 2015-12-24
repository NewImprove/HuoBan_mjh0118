//
//  UserSettingTableViewController.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/19.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "UserSettingTableViewController.h"
#import "PECropView.h"
#import "PECropViewController.h"
#import "DataModel.h"
#import "HttpClassSelf.h"
#import "ToolClass.h"
#import "UserSelfViewController.h"
#import "ImageSameWidth.h"
#import "QiniuSDK.h"
#import "ToolClass.h"

@interface UserSettingTableViewController ()

@end

@implementation UserSettingTableViewController
@synthesize UserImage,labelAdd,labelContent,labelName,labelSex,labelSign,delegate;


DataModel *_dataUserSetting;

HttpClassSelf *_httpClassUserSetting;

UIImage *_imageChose;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    

    
    _httpClassUserSetting = [[HttpClassSelf alloc] init];
    
    
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1]}];

    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19]} forState:UIControlStateNormal];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245.0/255 green:230.0/255 blue:0.0/255 alpha:1];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    

    self.UserImage.clipsToBounds = YES;
    self.UserImage.layer.cornerRadius = 30;
        [self reloadtableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
        [self reloadtableView];
    
}


-(void)reloadtableView{
    
    _dataUserSetting = [[DataModel alloc] init];
   
    
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_dataUserSetting.userInfomation.ImagePreson]]];
    
//    self.UserImage.image = [ImageSameWidth imageCompressForWidth:image targetWidth:60];
    
    self.UserImage.image = image;
    self.labelAdd.text = _dataUserSetting.userInfomation.add;
    
    NSLog(@"地址%@",self.labelAdd.text);
    
    self.labelContent.text = _dataUserSetting.userInfomation.contents;
    
        NSLog(@"简介%@",self.labelContent.text);
    self.labelName.text = _dataUserSetting.userInfomation.Name;
//    self.labelSign.text = _dataUserSetting.userInfomation.sign;
    
    if([_dataUserSetting.userInfomation.sex isEqualToString:@"1"]){
        self.labelSex.text = @"男";
    }else{
        self.labelSex.text = @"女";
    }
    
}

#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0 && indexPath.row == 0){
        //弹出相册
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.delegate = self;
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:controller animated:YES completion:NULL];
    }else if(indexPath.section == 1 && indexPath.row == 0){
//            NSLog(@"清除缓存");
        
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        
        [[ToolClass sharedInstance] showAlert:@"清除缓存成功"];
        
        
    }else if(indexPath.section == 1 && indexPath.row == 1){
//        NSLog(@"退出登陆");
//        [self.delegate UserSettingControllerCancel:self];
        
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        
        [self performSegueWithIdentifier:@"CancelLoginSegue" sender:nil];
    }
}



#pragma mark 跳转
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"EditNameSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        EditNameTableViewController *controller = (EditNameTableViewController*)naVC.topViewController;
        controller.strName = self.labelName.text;
        
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"EditSexSegue"]){
        UINavigationController *naVC = segue.destinationViewController;
        
        EditSexTableViewController *controller = (EditSexTableViewController*)naVC.topViewController;
        
        controller.delegate =self;
        
        controller.strSex = self.labelSex.text;
        
    }else if([segue.identifier isEqualToString:@"EditAddSegue"]){
        
        
        UINavigationController *naVC = segue.destinationViewController;
        
        EditAddTableViewController *controller = (EditAddTableViewController*)naVC.topViewController;
        
        controller.delegate = self;
        
        controller.strAdd = self.labelAdd.text;
    }else if([segue.identifier isEqualToString:@"EditSignSegue"]){
        
//        
//        UINavigationController *naVC = segue.destinationViewController;
//        
//        EditSignTableViewController *controller = (EditSignTableViewController*)naVC.topViewController;
//        
//        controller.delegate = self;
//        
//        controller.strSign = self.labelSign.text;
    }else if([segue.identifier isEqualToString:@"EditContentSegue"]){
        
        UINavigationController *naVC = segue.destinationViewController;
        
        EditContentTableViewController *controller = (EditContentTableViewController*)naVC.topViewController;
        
        
        controller.delegate = self;
        
        controller.strContent = self.labelContent.text;
    }
    
    
    
}
//选择图片触发
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    _imageChose =  [info objectForKey:UIImagePickerControllerOriginalImage];
//    立即修改头像，之后如果上传失败，则在失败返回消息后再复原头像
    [self.UserImage setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self openEditor:nil];
    }];
}



//切图代理，切图确认触发
- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    self.UserImage.image = croppedImage;
    
    UIImage *smallImage = [UserSettingTableViewController imageWithImageSimple:croppedImage scaledToSize:CGSizeMake(150.0, 150.0)];
    //将图片打包成data存储
    NSData *dataImage = UIImageJPEGRepresentation(smallImage, 1.0);
    
    [_httpClassUserSetting qiniuSDK:@"qiniu" CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *dataRes = [operatioin responseData];
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataRes options:NSJSONReadingAllowFragments error:nil];
        
        NSString *sdkToken = dic[@"token"];

        QNUploadManager *upManager = [[QNUploadManager alloc] init];
    
        int imageIndex = arc4random() % 1000000000;
      
        NSString *strImagePreson = [NSString stringWithFormat:@"user/%@-%i",_dataUserSetting.userInfomation.tokenID,imageIndex];
        
        //   feed/
        
        [upManager putData:dataImage key:strImagePreson token:sdkToken
                  complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"%@", info);
                      NSLog(@"%@", resp);


                      _dataUserSetting.userInfomation.ImagePreson = [NSString stringWithFormat:@"http://images.huoban.io/%@",strImagePreson];
                      
                      NSLog(@"图图图图图%@",_dataUserSetting.userInfomation.ImagePreson);
                      
                      
                      self.UserImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_dataUserSetting.userInfomation.ImagePreson]]];
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
    controller.image =  _imageChose;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self presentViewController:navigationController animated:YES completion:NULL];
}






//取消按钮的点击事件
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
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

-(void)EditAddController:(EditAddTableViewController *)controller retAdd:(NSString *)text{
    [controller dismissViewControllerAnimated:YES completion:nil];
    _dataUserSetting.userInfomation.add = text;
    NSLog(@"打印保存地址%@",_dataUserSetting.userInfomation.add);
    [_dataUserSetting saveUserInfomation];
    [self reloadtableView];
}

-(void)EditAddControllerClose:(EditAddTableViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)editContentController:(EditContentTableViewController *)controller retContent:(NSString *)textContent{
    [controller dismissViewControllerAnimated:YES completion:nil];
    _dataUserSetting.userInfomation.contents = textContent;
    NSLog(@"%@",_dataUserSetting.userInfomation.contents);
        [_dataUserSetting saveUserInfomation];
    [self reloadtableView];
}

-(void)editContentControllerClose:(EditContentTableViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)EditNameControllerClose:(EditNameTableViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)EditNameControllerSave:(EditNameTableViewController *)controller retName:(NSString *)textFieldname{
    [controller dismissViewControllerAnimated:YES completion:nil];
    _dataUserSetting.userInfomation.Name = textFieldname;
    [_dataUserSetting saveUserInfomation];
    [self reloadtableView];
    
}

-(void)editSexController:(EditSexTableViewController *)controller retSex:(NSString *)textSex{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    NSString *strSex = @"0";
    
    if([textSex isEqualToString:@"男"]){
        strSex = @"1";
    }else{
        strSex = @"0";
    }
    
    _dataUserSetting.userInfomation.sex = strSex;
    [_dataUserSetting saveUserInfomation];
    [self reloadtableView];
}

-(void)editSexControllerClose:(EditSexTableViewController *)controller{
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

//-(void)editSignController:(EditSignTableViewController *)controller retSign:(NSString *)textSign{
//    
//    [controller dismissViewControllerAnimated:YES completion:nil];
//    
//    _dataUserSetting.userInfomation.sign = textSign;
//    [_dataUserSetting saveUserInfomation];
//    [self reloadtableView];
//}
//
//-(void)editSignControllerClose:(EditSignTableViewController *)controller{
//    
//    [controller dismissViewControllerAnimated:YES completion:nil];
//}
- (IBAction)buttonSave:(id)sender {
    
    [_dataUserSetting saveUserInfomation];
    _dataUserSetting = [[DataModel alloc] init];
//    
//    [_httpClassUserSetting UpdateUserSettingSetUser:_dataUserSetting.userInfomation.UserID setToken:
//     _dataUserSetting.userInfomation.tokenID setImage:_dataUserSetting.userInfomation.ImagePreson setName:_dataUserSetting.userInfomation.Name setSex:_dataUserSetting.userInfomation.sex setAddress:_dataUserSetting.userInfomation.add setSign:_dataUserSetting.userInfomation.sign setDesc:_dataUserSetting.userInfomation.contents CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        NSLog(@"头像：%@--名称：%@--性别：%@",_dataUserSetting.userInfomation.ImagePreson,_dataUserSetting.userInfomation.Name,_dataUserSetting.userInfomation.sex);
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//         NSLog(@"%@",dic);
//         
//        if([dic[@"status"] isEqualToString:@"success"]){
//            
//            [_dataUserSetting saveUserInfomation];
//            NSLog(@"%@",_dataUserSetting.userInfomation.ImagePreson);
//            [[ToolClass sharedInstance] showAlert:@"个人信息保存成功"];
////            [self.delegate UserSettingControllerSave:self];
//            [self dismissViewControllerAnimated:YES completion:nil];
//            
//        }else{
//            [[ToolClass sharedInstance] showAlert:@"个人信息保存失败,服务器错误"];
//        }
//        
//    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//        
//            [[ToolClass sharedInstance] showAlert:@"个人信息保存失败,请检查网络"];
//        
//    }];
  
}

- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
