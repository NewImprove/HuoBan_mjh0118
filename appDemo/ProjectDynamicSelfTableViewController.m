////
////  ProjectMoreStoryTableViewController.m
////  appDemo
////
////  Created by 刘雨辰 on 15/9/6.
////  Copyright (c) 2015年 lyc. All rights reserved.
////
//
//#import "ProjectDynamicSelfTableViewController.h"
//
//#import "HttpClassSelf.h"
//
//#import "MJRefresh.h"
//
//#import "HomeDynamicImageTableViewCell.h"
//
//#import "ProjectDynamicSelf.h"
//
//#import "ToolClass.h"
//
//#import "DataModel.h"
//
//#import "ImageSameWidth.h"
//#import "UIImageView+WebCache.h"
//#import "SDImageCache.h"
//#import "DataModelCellProjectDetailDynamic.h"
//
//#import "JoinProjectTableViewController.h"
//
//@interface ProjectDynamicSelfTableViewController ()
//
//@end
//
//@implementation ProjectDynamicSelfTableViewController
//@synthesize projectModelDynamicSelf,delegate,strProjectID,aryChouMordDynameic;
//
//HttpClassSelf *_httpClassProjectDynamicSelf;
//
//NSMutableArray *_cellData;
//NSMutableArray *_resProjectDynamicself;
//NSMutableArray *_arrProjectImage;
//
//DataModel *_dataModelprojectDynamecSelf;
//
//CGFloat _floatCellLabelContent;
//CGFloat _floatCellImageContent;
//
//NSMutableArray *_aryCellImageHeight;
//
//NSInteger _xibCloseNum;
//NSInteger _xibNum;
//NSInteger _imageViewWidth;
//
//UIButton *_buttonClose;
//
//NSString *_iOSSizeMoreDynamic;
//
//NSUserDefaults *_userDefaultsImage;
//DataModelCellProjectDetailDynamic *_dataModelCellProjectDynamic;
//
//NSString *strText;
//NSCharacterSet * _subImageStr;
//
//NSCharacterSet *_subImageTEXTA;
//
//NSArray * _aryImageStr;
//
//
//NSArray *_aryImageTEXT;
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    _dataModelprojectDynamecSelf = [[DataModel alloc] init];
//    
//    _userDefaultsImage = [NSUserDefaults standardUserDefaults];
//    
//    _iOSSizeMoreDynamic = _dataModelprojectDynamecSelf.userInfomation.iOSDeviceSize;
//
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    
////    _buttonClose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
////    [_buttonClose addTarget:self
////               action:@selector(xibProjectDynamicButtonClose)
////     forControlEvents:UIControlEventTouchUpInside];
////
////    if([_iOSSizeMoreDynamic isEqualToString:@"iPhone6Plus"]){
////        _buttonClose.frame = CGRectMake(339.0, 5.0, 40.0, 40.0);
////        [_buttonClose setImage:[[UIImage imageNamed:@"CloseRed@3x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]forState:UIControlStateNormal];
////        _imageViewWidth = 398;
////    }else if ([_iOSSizeMoreDynamic isEqualToString:@"iPhone6"]){
////        _buttonClose.frame = CGRectMake(300.0, 5.0, 40.0, 40.0);
////        [_buttonClose setImage:[[UIImage imageNamed:@"CloseRed@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
////        _imageViewWidth = 359;
////    }else{
////        _buttonClose.frame = CGRectMake(245.0, 5.0, 40.0, 40.0);
////        [_buttonClose setImage:[[UIImage imageNamed:@"CloseRed@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
////        _imageViewWidth = 302;
////    }
////
////    [self.tableView addSubview:_buttonClose];
////    [self.view addSubview:_buttonClose];
//    
//    CGSize  iOSBounds = [UIScreen mainScreen].bounds.size;
//    
//    NSArray *buttonList = [NSArray arrayWithObjects:@"<",@"加入他们",@"火伴众筹",nil];
//    
//    UISegmentedControl *buttonSegmented =[[UISegmentedControl alloc] initWithItems:buttonList];
//    
//    [buttonSegmented setFrame:CGRectMake(0,iOSBounds.height- 190, iOSBounds.width, 45)];
//    
//    [buttonSegmented setBackgroundColor:[UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1]];
//    buttonSegmented.layer.borderColor =[UIColor colorWithRed:21.0/255 green:29.0/255 blue:40.0/255 alpha:1].CGColor;
//    
//    buttonSegmented.clipsToBounds = YES;
//    
//    buttonSegmented.layer.borderWidth = 0;
//    
//    [buttonSegmented setTintColor:[UIColor whiteColor]];
//    
//    //    [[buttonSegmented.subviews objectAtIndex:0] setTintColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1]];
//    
//    [[buttonSegmented.subviews objectAtIndex:1] setBackgroundColor:[UIColor colorWithRed:0.0/255 green:153.0/255 blue:153.0/255 alpha:1]];
//    
//    
//    
//    buttonSegmented.apportionsSegmentWidthsByContent = NO;
//    
//    //分段按钮控件
//    buttonSegmented.momentary = YES;
//    
//    
//    //分段按钮
//    [buttonSegmented addTarget:self action:@selector(segmentedClick:) forControlEvents:UIControlEventValueChanged];
//    
//    
////    [self.view addSubview:buttonSegmented];
////    [self.view bringSubviewToFront:buttonSegmented];
//    
////    [self.tableView.superview addSubview:buttonSegmented];
//    
////    [self.tableView setTableFooterView:buttonSegmented];
//    
//
//    
//    
//
//  
//}
//
//-(void)segmentedClick:(id)sender{
//    UISegmentedControl *control = (UISegmentedControl*)sender;
//    
//    
//    if(control.selectedSegmentIndex == 0){
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }else if(control.selectedSegmentIndex == 1){
//        
//        [self performSegueWithIdentifier:@"JoinSegue" sender:self.aryChouMordDynameic];
//        
//    }else if(control.selectedSegmentIndex == 2){
//        
//
//    }
//}
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    if([segue.identifier isEqualToString:@"JoinSegue"]){
//        
//        UINavigationController *naVC = segue.destinationViewController;
//        
////         *controller = (JoinProjectTableViewController*)naVC.topViewController;
////        
////        controller.aryDataChou = _aryChou;
////        
////        controller.projectID = self.strProjectID;
//        
//        JoinProjectTableViewController *controller = (JoinProjectTableViewController*)naVC.topViewController;
//        
//        controller.aryDataChou = sender;
//        controller.projectID = self.strProjectID;
//
//        
//        
//    }
//    
//    
//    
//}
//
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    strText = @"http://images.huoban.io/userDynamic/515073019!398x266";
//    
////    _subImageStr = [NSCharacterSet characterSetWithCharactersInString:@"!x"];
//    
//    _subImageTEXTA = [NSCharacterSet characterSetWithCharactersInString:@"!*"];
//    
//    _httpClassProjectDynamicSelf = [[HttpClassSelf alloc] init];
//    
//    _arrProjectImage = [[NSMutableArray alloc] init];
//
//
//    
//    _aryCellImageHeight = [[NSMutableArray alloc] init];
//    
//    _xibNum = 0;
//    _xibCloseNum = 0;
//    
//    int _numPage = 0;
//    int _numNum = 5;
//    
//    
////    if([[NSUserDefaults standardUserDefaults] objectForKey:@"ProjectDynamicOneSelf"]){
////        
////        
////        
////        NSData *dataProjectDynamicOneSelf = [[NSUserDefaults standardUserDefaults] objectForKey:@"ProjectDynamicOneSelf"];
////        _resProjectDynamicself = [NSKeyedUnarchiver unarchiveObjectWithData:dataProjectDynamicOneSelf];
////        NSLog(@"%@",_resProjectDynamicself);
////        
////        [self.tableView reloadData];
////        
////    }
//    
//    
//    
//    [_httpClassProjectDynamicSelf projectSelfDynamicSetProjectID:self.strProjectID numPage:_numPage numNum:_numNum token:_dataModelprojectDynamecSelf.userInfomation.tokenID CallBackYES:^(MKNetworkOperation *operatioin){
//        
//        _resProjectDynamicself = [[NSMutableArray alloc] init];
//        
//        NSData *data = [operatioin responseData];
//        
//        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        
//        NSLog(@"打印小动态返回数据%@",dic);
//        
//        if ([dic[@"status"] isEqualToString:@"success"]) {
//    
//            for(NSMutableDictionary *resDic in dic[@"data"]){
//                [_resProjectDynamicself addObject:resDic];
//            }
//            
//            
////            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"ProjectDynamicOneSelf"];
////            NSData *dataSaveProjectDynamicOneSelf = [NSKeyedArchiver archivedDataWithRootObject:_resProjectDynamicself];
////            [[NSUserDefaults standardUserDefaults] setObject:dataSaveProjectDynamicOneSelf forKey:@"ProjectDynamicOneSelf"];
////            [[NSUserDefaults standardUserDefaults] synchronize];
//            
//            
//            
//            
//            [self.tableView reloadData];
//        }
//    }CallBackNO:^(MKNetworkOperation *errorOp,NSError *error){
//        [[ToolClass sharedInstance] showAlert:@"获取数据失败，请检查网络"];
//        
//    }];
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    NSLog(@"打印cell数量%i",(int)[_resProjectDynamicself count]);
//    return [_resProjectDynamicself count];
//}
//
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSMutableDictionary *dicCell = _resProjectDynamicself[indexPath.row];
//   
////    if(indexPath.row == 0){
//////        ProjectDynamicSelf *cell = (ProjectDynamicSelf*)[tableView dequeueReusableCellWithIdentifier:HomeDynamicCell];
//////        if (cell == nil)
//////        {
//////            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProjectDynamicSelf" owner:self options:nil];
//////            cell = [nib objectAtIndex:0];
//////        }
////        
//////        static BOOL nibsRegistered = NO;
////        
////        if (_xibCloseNum == 0) {
////            UINib *nib = [UINib nibWithNibName:@"ProjectDynamicSelf" bundle:nil];
////            [tableView registerNib:nib forCellReuseIdentifier:@"ProjectDynamicSelf"];
//////            nibsRegistered = YES;
////            _xibCloseNum = 1;
////        }
////        // 3. 从TableView中获取标识符为paperCell的Cell
////        ProjectDynamicSelf *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectDynamicSelf"];
////        
//////        cell.buttonClose.hidden = NO;
////
////        
////
////        _dataModelCellProjectDynamic = [[DataModelCellProjectDetailDynamic alloc] initWithResJSON:dicCell];
////        cell.dataModelDynamic = _dataModelCellProjectDynamic;
////        
////        [cell.textContents sizeToFit];
////        _floatCellLabelContent = cell.textContents.frame.size.height;
//////        NSLog(@"--%f",_floatCellLabelContent);
//////        
//////        NSLog(@"打印图片%@",dicCell[@"image"]);
////        if([dicCell[@"image"] isEqualToString:@""]){
////            
////            [cell.imageContents setFrame:CGRectMake(cell.imageContents.frame.origin.x,cell.imageContents.frame.origin.y,cell.imageContents.frame.size.width,1)];
////            [cell.imageContents setImage:nil];
////        }else{
////            [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:dicCell[@"image"]] placeholderImage:nil completed:^(UIImage *image, NSError *err, SDImageCacheType typ,NSURL *imageURL){
////                
////                // save height of an image to some cache
////                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:image.size.height] forKey:[NSString stringWithFormat:@"%@",imageURL]];
////                
////                                NSLog(@"图片地址%@",imageURL);
////                
////            
////                    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
////                
//////                [_aryCellImageHeight addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
////                
//////                [tableView beginUpdates];
//////
//////
//////
//////                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//////
//////                [tableView endUpdates];
//////                
//////                NSLog(@"%f",image.size.height);
////                
//////                [self.tableView reloadData];
////                
////            }];
////
////        }
////        
//////        if([dicCell[@"image"] isEqualToString:@""]){
//////            
//////            
//////            [cell.imageContents setFrame:CGRectMake(cell.imageContents.frame.origin.x,cell.imageContents.frame.origin.y,cell.imageContents.frame.size.width, 1)];
//////            _floatCellImageDynamic = 1;
//////        }
//////        
//////        [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:dicCell[@"image"]]];
//////        [cell.imageContents sizeToFit];
//////        _floatCellImageDynamic = cell.imageContents.frame.size.height;
//////        
//////        //项目标题;
//////        cell.textTitle.text = resProject[@"title"];
//////        
//////        
//////        //发起人信息
//////        NSMutableDictionary *resUser = dicCell[@"user"];
//////        
//////        //姓名
//////        cell.textBy.text = resUser[@"name"];
//////        
//////        UIImage *Presonimage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:resUser[@"image"]]]];
//////        
//////        
//////        //头像
////////        cell.imagePreson.image = [self imageCompressForWidth:Presonimage targetWidth:60];
//////        cell.imagePreson.image = [ImageSameWidth imageCompressForWidth:Presonimage targetWidth:120];
//////        
////////        NSString  *commentCount = dicCellB[@"count"];
//////        
////////        NSString *strCount = [NSString stringWithFormat:@"%@%@",commentCount,@"条评论"];
//////        //
//////        //    NSLog(@"%@",strCount);
//////        //
//////
//////        
//////        cell.textTalk.text = @"10条评论";
//////        
//////        //内容
//////        cell.textContents.text = dicCell[@"message"];
//////        [cell.textContents sizeToFit];
//////        _floatCellDynamic = cell.textContents.frame.size.height;
////
////        
////
////  
////        return cell;
////
////    }else{
//    
////        ProjectDynamicSelf *cell = (ProjectDynamicSelf*)[tableView dequeueReusableCellWithIdentifier:HomeDynamicCell];
////        if (cell == nil)
////        {
////            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProjectDynamicSelf" owner:self options:nil];
////            cell = [nib objectAtIndex:0];
////        }
////                    [cell.buttonClose addTarget:self action:@selector(xibProjectDynamicButtonClose) forControlEvents:UIControlEventTouchUpInside];
//
////        static BOOL nibNoClose = NO;
//        
//        if (_xibNum == 0) {
//            UINib *nib = [UINib nibWithNibName:@"ProjectDynamicSelf" bundle:nil];
//            [tableView registerNib:nib forCellReuseIdentifier:@"ProjectDynamicSelf"];
////            nibNoClose = YES;
//            _xibNum = 1;
//        }
//        // 3. 从TableView中获取标识符为paperCell的Cell
//        ProjectDynamicSelf *cell = [tableView dequeueReusableCellWithIdentifier:@"ProjectDynamicSelf"];
//        
////        cell.buttonClose.hidden = YES;
//    
//        _dataModelCellProjectDynamic = [[DataModelCellProjectDetailDynamic alloc] initWithResJSON:dicCell];
//        cell.dataModelDynamic  = _dataModelCellProjectDynamic;
//        
//        [cell.textContents sizeToFit];
//        _floatCellLabelContent = cell.textContents.frame.size.height;
//        NSLog(@"文字高度%f",_floatCellLabelContent);
//        
////        NSLog(@"%@",dicCell[@"image"]);
//    
////
//    
//  
//   _aryImageTEXT = [dicCell[@"image"] componentsSeparatedByCharactersInSet:_subImageTEXTA];
////    NSString * str1 = array[1];
////    NSString * str2 = array[2];
////    NSLog(@"%@",str1);
////    NSLog(@"%@",str2);
//    
//    NSLog(@"%@",dicCell[@"image"]);
//    if([dicCell[@"image"] isEqualToString:@""]){
//
////    if([strText isEqualToString:@""]){
//    
//        cell.imageContents.image = nil;
//        [cell.imageContents setFrame:CGRectMake(cell.imageContents.frame.origin.x,cell.imageContents.frame.origin.y,cell.imageContents.frame.size.width,1)];
//        _floatCellImageContent = 1;
//    }else{
//        
//
//        _floatCellImageContent = _imageViewWidth/([_aryImageTEXT[1] floatValue]/[_aryImageTEXT[2] floatValue]);
//        NSLog(@"图片地址:%@---%@",dicCell[@"image"],_aryImageTEXT);
//        [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:dicCell[@"image"]] placeholderImage:nil];
//        
//    }
//    
//    
//    
////        }else{
////            [cell.imageContents sd_setImageWithURL:[NSURL URLWithString:dicCell[@"image"]] placeholderImage:nil completed:^(UIImage *image, NSError *err, SDImageCacheType typ,NSURL *imageURL){
////                
////                // save height of an image to some cache
////                
////                if([[_userDefaultsImage objectForKey:[NSString stringWithFormat:@"%@",imageURL]] isEqualToString:@""]){
////                    
////                    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:image.size.height] forKey:[NSString stringWithFormat:@"%@",imageURL]];
////                    
////                    //                NSLog(@"图片地址%@",imageURL);
////                    
////                    cell.imageContents.contentMode = UIViewContentModeScaleAspectFit;
////                    
////                    
////                    //
////                    //                [tableView beginUpdates];
////                    
////                    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
////                }
////               
////                
//////                [tableView endUpdates];
////                
//////                NSLog(@"%f",image.size.height);
////                
//////                [self.tableView reloadData];
////                
////            }];
//    
////        }
//    
//    
////        if([_arrProjectImage count] <= indexPath.row){
////            
////            cell.imageContents.removeFromSuperview;
////            [cell.imageContents sizeToFit];
////            _floatCellImageDynamic = cell.imageContents.frame.size.height;
////        }else{
////            UIImage *ProjectImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_arrProjectImage[0]]]];
////            cell.imageContents.image = [self imageCompressForWidth:ProjectImage targetWidth:359];
////            [cell.imageContents sizeToFit];
////            _floatCellImageDynamic = cell.imageContents.frame.size.height;
////        }
//        
//
//        
////        UIImage *imageContent = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dicCell[@"image"]]]];
////        if(imageContent == nil){
////            
////            
////            [cell.imageContents setFrame:CGRectMake(cell.imageContents.frame.origin.x,cell.imageContents.frame.origin.y,cell.imageContents.frame.size.width, 1)];
////            _floatCellImageDynamic = 1;
////        }
////        cell.imageContents.image = [ImageSameWidth imageCompressForWidth:imageContent targetWidth:348];
////        [cell.imageContents sizeToFit];
////        _floatCellImageDynamic = cell.imageContents.frame.size.height;
//////
////        cell.textTitle.text = resProject[@"title"];
////        
////        cell.textBy.text = resUser[@"name"];
////        
////        UIImage *presonImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:resUser[@"image"]]]];
//////        cell.imagePreson.image = [self imageCompressForWidth:presonImage targetWidth:60];
////        cell.imagePreson.image = [ImageSameWidth imageCompressForWidth:presonImage targetWidth:120];
////        
//////        cell.textTitle.text = @"10条评论";
////        
////        cell.textContents.text = dicCell[@"message"];
////        [cell.textContents sizeToFit];
////        _floatCellDynamic = cell.textContents.frame.size.height;
//        
//        
//        
//        return  cell;
//    
////    }
//        }
//
////关闭更多动态;
//-(void)xibProjectDynamicButtonClose{
//    [self.delegate CloseProjectDynamicSelfController:self];
//}
//
////调整界面
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
////    NSMutableDictionary *dicCell = _resProjectDynamicself[indexPath.row];
////    
////    CGFloat heightImageCell = [[[NSUserDefaults standardUserDefaults] objectForKey:dicCell[@"image"]] floatValue];
////    
////    NSLog(@"%f",heightImageCell);
//    
////    NSLog(@"%f--%f",_floatCellLabelContent,_floatCellImageContent);
//    
//    return _floatCellLabelContent + _floatCellImageContent + 190;
////    return 500;
//    
//}
//
////-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
////    
////    [button setFrame:CGRectMake(button.frame.origin.x,self.tableView.contentOffset.y -2, button.frame.size.width, button.frame.size.height)];
////}
//
//@end
