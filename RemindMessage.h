//
//  RemindMessage.h
//  huoban
//
//  Created by Lyc on 15/12/18.
//  Copyright © 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemindMessage : NSObject

@property(nonatomic,strong)NSString *strBy;
@property(nonatomic,strong)NSString *strImage;
@property(nonatomic,assign)int type;
@property(nonatomic,strong)NSString *strID;
@property(nonatomic,strong)NSString *strTime;
@property(nonatomic,strong)NSString *strContents;



@end
