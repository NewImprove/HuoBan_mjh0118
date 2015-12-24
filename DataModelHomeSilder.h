//
//  DataModelHomeSilder.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/21.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModelHomeSilder : NSObject

@property(nonatomic)NSMutableArray *arySilderImage;
@property(nonatomic)NSString *projectID;
@property(nonatomic,strong)NSString *imageType;
@property(nonatomic,strong)NSString *strContents;


-(DataModelHomeSilder*)initWithResJSON:(id)JSON;
@end
