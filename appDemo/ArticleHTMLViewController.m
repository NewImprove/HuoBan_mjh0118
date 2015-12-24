//
//  ArticleHTMLViewController.m
//  huoban
//
//  Created by 刘雨辰 on 15/10/24.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import "ArticleHTMLViewController.h"
#import "DataModel.h"

@interface ArticleHTMLViewController ()

@end

@implementation ArticleHTMLViewController
@synthesize strContents,webViewContents,webViewTopNum,imageClose;

NSString *_iOSArticleHTML;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DataModel *dataModelHTML = [[DataModel alloc] init];
    
    _iOSArticleHTML = dataModelHTML.userInfomation.iOSDeviceSize;
    
    //上放导航栏
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
    
//         [self.webViewContents setBackgroundColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
        [self.webViewContents loadHTMLString:[NSString stringWithFormat:@"%@",self.strContents] baseURL:nil];

    
    if([_iOSArticleHTML isEqualToString:@"iPhone6Plus"]){
        webViewTopNum.constant = 50;
        self.imageClose.image = [UIImage imageNamed:@"back_white_3x"];
        
    }else{

        webViewTopNum.constant = 30;
        self.imageClose.image = [UIImage imageNamed:@"back_white_2x"];
    }
    
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

- (IBAction)buttonCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
