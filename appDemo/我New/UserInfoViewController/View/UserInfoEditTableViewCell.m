//
//  UserInfoEditTableViewCell.m
//  huoban
//
//  Created by 马锦航 on 16/1/11.
//  Copyright © 2016年 lyc. All rights reserved.
//

#import "UserInfoEditTableViewCell.h"


// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width



@implementation UserInfoEditTableViewCell


- (void)setTextPlaceTitle:(NSString *)textPlaceTitle {
    _textPlaceTitle = textPlaceTitle;
    self.userInfo.placeholder = textPlaceTitle;
    //    [self addSubview:self.userInfo];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.userInfo];
        
        [self addSubview:self.underLine];
        //        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (UITextField *)userInfo {
    if (!_userInfo) {
        _userInfo = [[UITextField alloc]init];
        _userInfo.frame = CGRectMake(12, 0, Main_Screen_Width - 24, 60);
        _userInfo.delegate = self;
        //        _userInfo.backgroundColor = [UIColor blueColor];
        //        _userInfo.placeholder = self.textPlaceTitle;
        _userInfo.placeholder = @"hhhhhh";
    }
    return _userInfo;
}

- (UIView *)underLine {
    if (!_underLine) {
        _underLine = [[UIView alloc]init];
        _underLine.frame = CGRectMake(12, 60, Main_Screen_Width - 12*2, 0.5);
        _underLine.backgroundColor = [UIColor redColor];
    }
    return _underLine;
}

#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    
    //    if ([self.huobanPassWorld.text isEqualToString:@""]) {
    //        self.passWorldCancel.hidden = YES;
    //    }
    //    else {
    //        self.passWorldCancel.hidden = NO;
    //    }
    //    CGRect _footViewNewFrame = self.huobanFootView.frame;
    //    _footViewNewFrame.origin.y -= 194;
    //    self.huobanFootView.frame = _footViewNewFrame;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"输入中");
    return YES;
}


#pragma mark 取消键盘
- (void) resignTextFieldFirstResponder {
    
    NSLog(@"resignTextFieldFirstResponder");
    //    [self.huobanPassWorld resignFirstResponder];
    //    [self.huobanPhoneNum resignFirstResponder];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
