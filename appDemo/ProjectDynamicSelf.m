//
//  ProjectAllOneTableViewCell.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/8.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ProjectDynamicSelf.h"

#import "ImageSameWidth.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "DataModel.h"


@implementation ProjectDynamicSelf
@synthesize textBy,textContents,textLabel,textlove,textTitle,textTalk,imageContents,imagePreson,dataModelDynamic,imageWidth,imageViewLeft,imageViewRight,imageHeight,labelTime;

CGSize  _iOSBoundsDetailsDynamic;
NSString *_iOSSizeDynamic;
NSDate *_dateNowProjectDetails;

- (void)awakeFromNib {
    // Initialization code
    
    
//    [self.buttonClose setImage:[ImageSameWidth imageCompressForWidth:[UIImage imageNamed:@"CloseRed"] targetWidth:30] forState:UIControlStateNormal];
//
    DataModel *dataModelDynamicProejct = [[DataModel alloc] init];
    
//    self.textContents.layer.borderWidth = 1.5;
//    self.textContents.layer.borderColor = [UIColor yellowColor].CGColor;
//    
//    self.imageContents.layer.borderWidth = 1.5;
//    self.imageContents.layer.borderColor = [UIColor redColor].CGColor;

    _iOSSizeDynamic = dataModelDynamicProejct.userInfomation.iOSDeviceSize;
    
    
    imageViewLeft.constant = 0;
    imageViewRight.constant = 0;
    
    
    
    if([_iOSSizeDynamic isEqualToString:@"iPhone6"]){
        
//        imageWidth.constant = 359;
        
//        imageWidth.constant = 30;
    }
    
    
    /*
     UIViewContentModeScaleToFill
     UIViewContentModeScaleAspectFit
     UIViewContentModeScaleAspectFill
     UIViewContentModeRedraw
     UIViewContentModeCenter
     UIViewContentModeTop
     UIViewContentModeBottom
     UIViewContentModeLeft
     UIViewContentModeRight
     UIViewContentModeTopLeft
     UIViewContentModeTopRight
     UIViewContentModeBottomLeft
     UIViewContentModeBottomRight
     */
    self.imageContents.clipsToBounds  = YES;
    self.imageContents.contentMode = UIViewContentModeScaleToFill;

    self.imagePreson.clipsToBounds = YES;
    self.imagePreson.layer.cornerRadius = 18;
    
//    _iOSBoundsDetailsDynamic = [UIScreen mainScreen].bounds.size;
//    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y,_iOSBoundsDetailsDynamic.width, self.frame.size.height)];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataModelDynamic:(DataModelCellProjectDetailDynamic *)sender{
    
    NSMutableAttributedString  *strtextSummarize =[[NSMutableAttributedString alloc]initWithString:sender.labelContents];
    
    NSMutableParagraphStyle * paragraphSummarizeStyle=[[NSMutableParagraphStyle alloc]init];
    
    [paragraphSummarizeStyle setMinimumLineHeight:18];
    
    [strtextSummarize addAttribute:NSParagraphStyleAttributeName value:paragraphSummarizeStyle range:NSMakeRange(0, [sender.labelContents length])];
    
//    self.textSummarize.attributedText = strtextSummarize;

    _dateNowProjectDetails = [NSDate date];
    
    self.textBy.text = sender.dicUser[@"name"];
    self.textContents.attributedText = strtextSummarize;
//    [self.textContents sizeToFit];
//    NSLog(@"--%f",self.textContents.frame.size.height);
    
    self.textlove.text =   [NSString stringWithFormat:@"%lu个喜欢",[sender.dicUp[@"count"] longValue]];
    self.textTitle.text = [NSString stringWithFormat:@"@ %@",sender.dicProject[@"title"]];
    
    
    self.textTalk.text = [NSString stringWithFormat:@"%lu个评论",[sender.dicComment[@"count"] longValue]];

    [self.imagePreson sd_setImageWithURL:[NSURL URLWithString:sender.dicUser[@"image"]]];
    
    NSLog(@"%@----%@",_dateNowProjectDetails,sender.createDate);
    
    
    if([_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/60 < 60){
        
        self.labelTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/60] componentsSeparatedByString:@"."][0] ];
        NSLog(@"%f天",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/86400);
    }else if([_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/3600 < 24 && [_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/3600 >= 1){
        
        self.labelTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/3600] componentsSeparatedByString:@"."][0] ];
        
        NSLog(@"%f小时",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/3600+ 8);
        
        
    }else if([_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/86400 < 30 && [_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/86400 >= 1){
        self.labelTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/86400 ] componentsSeparatedByString:@"."][0]];
    }else if([_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/2592000 >=1){
        self.labelTime.text =[NSString stringWithFormat:@"%@个月前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDetails timeIntervalSinceDate:sender.createDate]/2592000 ] componentsSeparatedByString:@"."][0]];
    }
    

}



@end
