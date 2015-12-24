//
//  DataModelCellProjectDetailDynamic.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/4.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModelCellProjectDetailDynamic : NSObject

@property(nonatomic,strong)NSMutableDictionary *dicComment;
@property(nonatomic,strong)NSString *imageContent;
@property(nonatomic,strong)NSMutableDictionary *dicUp;
@property(nonatomic,strong)NSMutableDictionary *dicProject;
@property(nonatomic,strong)NSMutableDictionary *dicUser;
@property(nonatomic,strong)NSDate *createDate;
@property(nonatomic,strong)NSString *labelContents;
@property(nonatomic,strong)NSString *isCreator;



-(DataModelCellProjectDetailDynamic*)initWithResJSON:(id)JSON;



@end
