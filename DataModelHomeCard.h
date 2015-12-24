//
//  DataModelHomeCard.h
//  huoban
//
//  Created by 刘雨辰 on 15/10/4.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModelHomeCard : NSObject



@property(nonatomic,assign)long factPreson;

@property(nonatomic,strong)NSDate *createData;
@property(nonatomic,strong)NSDate *endData;

@property(nonatomic,assign)float wantedMoney;
@property(nonatomic,assign)float factMoney;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign)long isFocus;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSMutableArray *images;
@property(nonatomic,strong)NSString *iD;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *desc;
//@property(nonatomic,strong)NSString *creator;
@property(nonatomic,strong)NSMutableArray *dicCreate;
@property(nonatomic,assign)long isJoin;


-(DataModelHomeCard*)initWithResJSON:(id)JSON;





@end
