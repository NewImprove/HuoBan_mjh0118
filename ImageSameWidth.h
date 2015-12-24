//
//  ImageSameWidth.h
//  huoban
//
//  Created by 刘雨辰 on 15/9/23.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageSameWidth : NSObject


+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

+(UIImage *) imageCompressForHeight:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;

+ (CGSize)getSizeWithStr:(NSString*)str width:(float)width font:(float)font;
@end
