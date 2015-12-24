//
//  CreateDynamicNavigationController.m
//  huoban
//
//  Created by 刘雨辰 on 15/9/22.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "CreateDynamicNavigationController.h"
//#import "YFInputBar.h"
//#import "YcKeyBoardView.h"
#import "DataModel.h"
#import "ProjectModel.h"
//#import "CreateDynamicViewController.h"
#import "ProjectDynamicTableViewController.h"
#import "HttpClassSelf.h"


@interface CreateDynamicNavigationController ()

@end

@implementation CreateDynamicNavigationController


DataModel *_dataCreateDynamic;

ProjectModel *_projectModelDynamic;
ProjectModel *_proModel;
HttpClassSelf *_httpClassSendDynamic;
NSMutableArray *_dicREItem;


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    [_menu close];
    _dataCreateDynamic = [[DataModel alloc] init];
    _projectModelDynamic = [[ProjectModel alloc] init];
    _httpClassSendDynamic = [[HttpClassSelf alloc] init];
    

    [_httpClassSendDynamic ChoseMyProjectIDByUserID:_dataCreateDynamic.userInfomation.UserID token:_dataCreateDynamic.userInfomation.tokenID page:0 num:500 CallBackYES:^(MKNetworkOperation *operatioin){
        
        
        NSData *data = [operatioin responseData];
        
                NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if([dic[@"status"] isEqualToString:@"success"]){
                    
//        NSLog(@"%u",[dic[@"data"] count]);

        _dicREItem = [[NSMutableArray alloc] init];
            
        for(int i = 0;i < [dic[@"data"] count];i++ ){
                    
        NSMutableDictionary *dicDataItem = dic[@"data"][i];
                        
                        REMenuItem *Projectitem = [[REMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"@ %@",dicDataItem[@"title"]] subtitle:dicDataItem[@"_id"] image:nil highlightedImage:nil action:^(REMenuItem *item) {
                            
                            NSLog(@"%@----%@",item.title,item.subtitle);
                            
                            [_menu close];
                            
                            ProjectDynamicTableViewController *contrnller =   (ProjectDynamicTableViewController*)self.topViewController;
                            
                            [contrnller sendDynamicPush:item.subtitle title:item.title];

                        }];
                        
                        NSLog(@"%i",i);
                        
                        Projectitem.tag = i;
                        
                        [_dicREItem addObject:Projectitem];
                    
                        NSLog(@"%lu",(unsigned long)[_dicREItem count]);
                    }
                    
                    NSLog(@"%lu",(unsigned long)[_dicREItem count]);
                    _menu = [[REMenu alloc] initWithItems:_dicREItem];
                    _menu.cornerRadius = 4;
                    _menu.shadowRadius = 4;
//                    _menu.shadowColor = [UIColor blackColor];
                    _menu.shadowColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.8];
                    _menu.shadowOffset = CGSizeMake(0, 1);
                    _menu.shadowOpacity = 1;
                    _menu.imageOffset = CGSizeMake(5, -1);
                    _menu.waitUntilAnimationIsComplete = NO;
                _menu.font = [UIFont fontWithName:@"Helvetica" size:12.0];
            _menu.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
            
                }
        
    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
        
        
        
        
    }];
//    [_httpClassSendDynamic ChoseMyProjectIDByToken:_dataCreateDynamic.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        if([dic[@"status"] isEqualToString:@"success"]){
//            
//            
//            
//        }
//    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *err){
//        
//        
//        
//        
//        
//        
//    }];

    
}




- (void)toggleMenu
{
    if([_dicREItem count] == 0){
     
        
        REMenuItem *Projectitem = [[REMenuItem alloc] initWithTitle:@"@ 你还没有支持过项目" subtitle:@"" image:nil highlightedImage:nil action:^(REMenuItem *item) {
            
            [_menu close];
            
//            ProjectDynamicTableViewController *contrnller =   (ProjectDynamicTableViewController*)self.topViewController;
//            
//            [contrnller sendDynamicPush:item.subtitle title:item.title];

        }];
        
        [_dicREItem addObject:Projectitem];
        
        _menu = [[REMenu alloc] initWithItems:_dicREItem];
        _menu.cornerRadius = 4;
        _menu.shadowRadius = 4;
//        _menu.shadowColor = [UIColor blackColor];
//        _menu.shadowColor = [UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:0.8];
//        
//        _menu.shadowOffset = CGSizeMake(0, 1);
//        _menu.shadowOpacity = 1;
        _menu.imageOffset = CGSizeMake(5, -1);
        _menu.waitUntilAnimationIsComplete = NO;
        _menu.textColor = [UIColor colorWithRed:51.0/255 green:163.0/255 blue:219.0/255 alpha:1];
                        _menu.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    }else{
    
    if (_menu.isOpen)
        return [_menu close];
    
    [_menu showFromNavigationController:self];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
