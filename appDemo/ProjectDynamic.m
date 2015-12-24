//
//  projectMessageTableViewCell.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/6.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import "ProjectDynamic.h"

#import "ImageSameWidth.h"

#import "DataModel.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

@implementation ProjectDynamic


NSString *_iOSSizeProjectDynamicWM;
NSDateFormatter *_dateFormatterProjectDynamic;
NSDate *_dateNowProjectDynamic;
NSMutableAttributedString * _attributedString;
NSMutableParagraphStyle * _paragraphStyle;

- (void)awakeFromNib {
    // Initialization code
    
    self.imagePerson.clipsToBounds = YES;

    
    DataModel *dataModelProjectD = [[DataModel alloc] init];
    
//    _dateFormatterProjectDynamic = [[NSDateFormatter alloc] init];
    
//    [_dateFormatterProjectDynamic setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    


    _iOSSizeProjectDynamicWM = dataModelProjectD.userInfomation.iOSDeviceSize;
    
    if([_iOSSizeProjectDynamicWM isEqualToString:@"iPhone6Plus"]){
        
        self.imageButtonDelete.image = [UIImage imageNamed:@"DeleteDynamic@3x"];
                self.imageTalk.image = [UIImage imageNamed:@"pinglun15@3x"];

    }else{

        self.imageButtonDelete.image = [UIImage imageNamed:@"DeleteDynamic@2x"];
        self.imageTalk.image = [UIImage imageNamed:@"pinglun15@2x"];
    }

    
    self.imagePerson.clipsToBounds = YES;
    self.imagePerson.layer.cornerRadius = 22;
    
    self.imageContents.clipsToBounds = YES;
    self.imageContents.contentMode = UIViewContentModeScaleAspectFit;
    self.imageContents.layer.cornerRadius = 8;
    
//    self.buttonDelete.layer.borderWidth = 1;
    

    //压缩尺寸
    //Scale会保证图片在ImageView里
//    self.imageContents.contentMode = UIViewContentModeScaleToFill;
    
    
    //AspectFill保证图片比例不变,但是会超出imageView
    //Fit保证图片比例不变
//    self.imageContents.clipsToBounds = YES;
//    self.imageContents.contentMode = UIViewContentModeScaleAspectFit;
//    self.imageContents.layer.borderColor = [UIColor redColor].CGColor;
//    self.imageContents.layer.borderWidth = 1;


    

    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataModelPD:(DataModelCellProjectDetailDynamic *)sender{

    _dateNowProjectDynamic = [NSDate date];
    
    
    NSLog(@"%@",sender.dicProject[@"title"]);
    
    if([sender.isCreator isEqualToString:@"1"]){

        self.labelIsCreator.text = @"发起人";
        [self.labelIsCreator sizeToFit];
        
    }else{
        self.labelIsCreator.text = @"";
        [self.labelIsCreator sizeToFit];
    }
    
    self.textProject.text = [NSString stringWithFormat:@"@ %@",sender.dicProject[@"title"]];
    
    self.textBy.text = sender.dicUser[@"name"];
    
    [self.imagePerson sd_setImageWithURL:[NSURL URLWithString:sender.dicUser[@"image"]]];
    
    //文字排版！！！！！
    /*
     
     NSString * tipStr= [NSString stringWithFormat:@"%@",sender.labelContents];
     
     NSMutableAttributedString * attributedString=[[NSMutableAttributedString alloc]initWithString:tipStr];
     NSMutableParagraphStyle * paragraphStyle=[[NSMutableParagraphStyle alloc]init];
     

     [paragraphStyle setMinimumLineHeight:18];
     
     
     [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, tipStr.length)];
     
     self.textContents.attributedText = attributedString;

     */
    
   _attributedString =[[NSMutableAttributedString alloc]initWithString:sender.labelContents];
    NSMutableParagraphStyle * paragraphStyle=[[NSMutableParagraphStyle alloc]init];
    
    [paragraphStyle setMinimumLineHeight:18];
    
    [_attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, sender.labelContents.length)];
    
        if([_attributedString length] > 140 ){
             self.textContents.text = [NSString stringWithFormat:@"%@...",[[NSString stringWithFormat:@"%@",_attributedString] substringToIndex:141] ];
              self.textContents.attributedText = _attributedString;
        }else{
//            self.textContents.text = _attributedString;
      self.textContents.attributedText = _attributedString;
            
            [self.textContents sizeToFit];
        }
    
        if([_iOSSizeProjectDynamicWM isEqualToString:@"iPhone6Plus"]){
    
            if([sender.labelContents length] > 109){
    
                self.textContents.text = [NSString stringWithFormat:@"%@...",[[NSString stringWithFormat:@"%@",_attributedString] substringToIndex:109] ];
                self.textContents.attributedText = _attributedString;
            }else{
                //            self.textContents.text = _attributedString;
                self.textContents.attributedText = _attributedString;
    
            }
        }else if([_iOSSizeProjectDynamicWM isEqualToString:@"iPhone6"]){
    
            if([sender.labelContents length] > 98){
    
                self.textContents.text = [NSString stringWithFormat:@"%@...",[[NSString stringWithFormat:@"%@",_attributedString] substringToIndex:98] ];
                self.textContents.attributedText = _attributedString;
            }else{
                //            self.textContents.text = _attributedString;
                self.textContents.attributedText = _attributedString;
                
            }
    
        }else{
    
            if([sender.labelContents length] > 85){
    
                self.textContents.text = [NSString stringWithFormat:@"%@...",[[NSString stringWithFormat:@"%@",_attributedString] substringToIndex:85] ];
                self.textContents.attributedText = _attributedString;
            }else{
                //            self.textContents.text = _attributedString;
                self.textContents.attributedText = _attributedString;
                
            }
        }
    
    //    self.textContents.text = ;
    
    /*
     @property(NS_NONATOMIC_IOSONLY) CGFloat lineSpacing;
     @property(NS_NONATOMIC_IOSONLY) CGFloat paragraphSpacing;
     @property(NS_NONATOMIC_IOSONLY) NSTextAlignment alignment;
     @property(NS_NONATOMIC_IOSONLY) CGFloat firstLineHeadIndent;
     //首字符空格
     @property(NS_NONATOMIC_IOSONLY) CGFloat headIndent;
     @property(NS_NONATOMIC_IOSONLY) CGFloat tailIndent;
     @property(NS_NONATOMIC_IOSONLY) NSLineBreakMode lineBreakMode;
     @property(NS_NONATOMIC_IOSONLY) CGFloat minimumLineHeight;
     @property(NS_NONATOMIC_IOSONLY) CGFloat maximumLineHeight;
     @property(NS_NONATOMIC_IOSONLY) NSWritingDirection baseWritingDirection;
     @property(NS_NONATOMIC_IOSONLY) CGFloat lineHeightMultiple;
     @property(NS_NONATOMIC_IOSONLY) CGFloat paragraphSpacingBefore;
     @property(NS_NONATOMIC_IOSONLY) float hyphenationFactor;
     */
    
    
//    NSMutableDictionary *dicUser = sender.dicUp;
    
    
    self.buttonTalk.contentMode = UIViewContentModeScaleAspectFit;

//    self.strLoveATalk.text = [NSString stringWithFormat:@"%lu个喜欢，%lu条评论",[dicUser[@"count"] longValue],[sender.dicComment[@"count"] longValue]];

    self.labelTalk.text = [NSString stringWithFormat:@"%lu条评论",[sender.dicComment[@"count"] longValue]];
    

    
    
    NSLog(@"%f小时",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8);
    NSLog(@"%f分钟",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/60);
    NSLog(@"%f天",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400);
    NSLog(@"%f个月",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/2592000);
    
    
        if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/60 < 60){
    
            self.textTime.text = [NSString stringWithFormat:@"%@分钟前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/60] componentsSeparatedByString:@"."][0] ];
            NSLog(@"%f天",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400);
        }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600 < 24 && [_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600 >= 1){
    
            self.textTime.text = [NSString stringWithFormat:@"%@小时前",[[NSString stringWithFormat:@"%f小时前",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600] componentsSeparatedByString:@"."][0] ];
    
            NSLog(@"%f小时",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/3600+ 8);
    
    
        }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 == 1){

            self.textTime.text = @"昨天";
            
        }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 > 1 && [_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 <= 2){
   
            self.textTime.text =[NSString stringWithFormat:@"%@天前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 ] componentsSeparatedByString:@"."][0]];
        
        }else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 > 2){
        
            self.textTime.text =[NSString stringWithFormat:@"%@",[[NSString stringWithFormat:@"%@",sender.createDate] substringToIndex:10]];
        }
    
    //            self.textTime.text =[NSString stringWithFormat:@"昨天",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/86400 ] componentsSeparatedByString:@"."][0]];
    
    
    
    
    //月份
//        else if([_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/2592000 >=1){
//            self.textTime.text =[NSString stringWithFormat:@"%@个月前",[[NSString stringWithFormat:@"%f",[_dateNowProjectDynamic timeIntervalSinceDate:sender.createDate]/2592000 ] componentsSeparatedByString:@"."][0]];
//        }
//   



}
@end

