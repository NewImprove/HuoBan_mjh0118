//
//  OtherUserInfoViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/29.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "OtherUserInfoViewController.h"

#import "HttpClassSelf.h"

#import "DataModel.h"
#import "ImageSameWidth.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

@interface OtherUserInfoViewController ()

@end

@implementation OtherUserInfoViewController
@synthesize labelContents,imagePreson,dicOtherUser,labelBy,labelCreate,labelJoin,labelLove,imageClose;

HttpClassSelf *_httpClassOtherUserSetting;

DataModel *_dataModelOtherUserSetting;


NSString *_iOSSizeOtherUser;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"打印传递用户ID%@",self.dicOtherUser);
    
//    self.title = self.dicOtherUser[@"name"];

    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]}];
    
    //    导航栏左侧Item
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName :[UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1]} forState:UIControlStateNormal];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    
    self.title = self.dicOtherUser[@"name"];
    
    self.labelBy.text = self.dicOtherUser[@"name"];
    
    self.imagePreson.layer.cornerRadius = 36;
    
    _httpClassOtherUserSetting = [[HttpClassSelf alloc] init];
    
    if([_iOSSizeOtherUser isEqualToString:@"iPhone6Plus"]){
        ;
        self.imageClose.image = [UIImage imageNamed:@"back_white_3x"];
    }else{
        self.imageClose.image = [UIImage imageNamed:@"back_white_2x"];
    }
    
//    self.imagePreson.image = [ImageSameWidth imageCompressForWidth:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.dicOtherUser[@"image"]]]] targetWidth:100];
//    
//    [self.imagePreson sd_setImageWithURL:[NSURL URLWithString:dicOtherUser[@"image"]] placeholderImage:nil];
//    
//    
//    
//    
//    _httpClassOtherUserSetting = [[HttpClassSelf alloc] init];
//    _dataModelOtherUserSetting = [[DataModel alloc] init];
//    
//    
//    
//    _iOSSizeOtherUser = _dataModelOtherUserSetting.userInfomation.iOSDeviceSize;
//    
//    if([_iOSSizeOtherUser isEqualToString:@"iPhone6Plus"]){
//        
//        self.imageViewMain.image = [UIImage imageNamed:@"logo598@3x"];
//    }else if( [_iOSSizeOtherUser isEqualToString:@"iPhone6"]){
//        self.imageViewMain.image = [UIImage imageNamed:@"logo498@2x"];
//    }else{
//        self.imageViewMain.image = [UIImage imageNamed:@"logo280@2x"];
//    }
    
    [_httpClassOtherUserSetting CheckUserSelfSetUser:self.dicOtherUser[@"_id"] token:self.dicOtherUser[@"_id"]  CallBackYES:^(MKNetworkOperation *operatioin){
        
        NSData *data = [operatioin responseData];
        
        NSMutableDictionary *dicRes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableDictionary *dicUser = dicRes[@"data"];
        
        self.imagePreson.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicUser[@"image"]]]];
        
        self.labelContents.text = dicUser[@"desc"];
        
        NSMutableDictionary *dicCreate = dicUser[@"creator"];
        self.labelCreate.text = [NSString stringWithFormat:@"已发起 %lu 个项目",[dicCreate[@"count"] longValue]];
        
        NSMutableDictionary *dicOrder = dicUser[@"orders"];
        self.labelJoin.text = [NSString stringWithFormat:@"已加入 %lu 个项目",[dicOrder[@"count"] longValue]];
        
        NSMutableDictionary *dicLove = dicUser[@"focus"];
        self.labelLove.text = [NSString stringWithFormat:@"已关注 %lu 个项目",[dicLove[@"count"] longValue]];
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSMutableAttributedString *) changeWithText:(NSString *) string withColor:(UIColor *) color withSubString:(NSString *) subString
{
    NSMutableAttributedString * attr=[[NSMutableAttributedString alloc]initWithString:string];
    NSRange range=[string rangeOfString:subString];
    
    [attr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attr;
}
@end
