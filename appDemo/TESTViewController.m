//
//  TESTViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/11/3.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "TESTViewController.h"
#import "HttpClassSelf.h"


@interface TESTViewController ()

@end

@implementation TESTViewController
@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.scrollView.contentSize = CGSizeMake(2000,2000);
    
    HttpClassSelf *httptext = [[HttpClassSelf alloc] init];
    
    //测试推送
//    [httptext uMengGetMessage:@"text" CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        NSData *data = [operatioin responseData];
//        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        
//        NSLog(@"测试推送推送推送%@",dic);
//        
//        
//        
//        
//    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//        
//        
//        NSLog(@"测试推送推送推送失败失败%@",err);
//        
//        
//    }];
    
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
