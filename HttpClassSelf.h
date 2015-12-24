//
//  HttpClassSelf.h
//  appDemo
//
//  Created by 刘雨辰 on 15/9/10.
//  Copyright (c) 2015年 lyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"
typedef void (^CallBackYES)(MKNetworkOperation *operatioin);
typedef void (^CallBackNO)(MKNetworkOperation *errorOp,NSError *err);


@interface HttpClassSelf : NSObject


#pragma mark POST
//登陆
-(void)loginSetMobile:(NSString *)mobile pwd:(NSString *)pwd umengid:(NSString *)umengid mobibuild:(NSString *)mobibuild mobitype:(NSString *)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


//修改用户信息
-(void)UpdateUserSettingSetUser:(NSString*)steUser setToken:(NSString*)strToken setImage:(NSString*)steImage setName:(NSString*)strName setSex:(NSString*)strSex setAddress:(NSString*)strAddress setSign:(NSString*)strSign setDesc:(NSString*)strDesc payName:(NSString*)strPayName payMobile:(NSString*)strPayMobile payPostCode:(NSString*)strPostCode  CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//注册
-(void)RegisterSetMobile:(NSString*)mobile pwd:(NSString*)pwd umengid:(NSString*)umengid mobibuild:(NSString*)mobibuild mobitype:(NSString*)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//忘记密码
-(void)forgotPWDSetMobile:(NSString*)mobile pwd:(NSString*)pwd umengid:(NSString*)umengid mobibuild:(NSString*)mobibuild mobitype:(NSString*)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//发布项目动态
-(void)sendProjectselfDynamicSetProjectID:(NSString*)strProjectID strToken:(NSString*)strToken message:(NSString*)message image:(NSString*)strImage CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//评论项目动态
-(void)commentProjectselDynamicSetFeed:(NSString*)strFeed strToken:(NSString*)strToken message:(NSString*)message CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


//回复项目动态
-(void)answerComment:(NSString *)strComment token:(NSString *)strToken message:(NSString *)strMessage CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


#pragma mark GET
//主页项目列表
-(void)homePageSetKey:(NSString*)strkey numPage:(int)numPage numNum:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

////项目评论
-(void)projectTalkSetFeed:(NSString*)strFeed numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackyes:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//显示一个用户的所有动态
-(void)projectDynmaicUserSelfSetUser:(NSString*)strUser numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//我们全部动态
-(void)projectDynamicOurSetUser:(NSString*)strUser numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//显示某一用户的所有动态
-(void)personDynamic:(NSString*)strUserID numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//项目详情-更多动态
-(void)projectDetailsDynamic:(NSString*)strProjectID numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//项目详情
-(void)projectDetailsSetProjectID:(NSString*)strProjectID token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//单一项目动态
-(void)oneProjectDynamicSetProjectID:(NSString*)strProjectID numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;



//项目点赞
-(void)loveProjectselfSetFeed:(NSString*)strFeed up:(int)upInt token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//关注一个项目(返回状态)
-(void)focusProjectselfSetProjectID:(NSString*)strProjectID up:(int)upInt token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//查看用户关注的项目(自己，别人)
-(void)focusProjectselfSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//查看用户基本信息
-(void)CheckUserSelfSetUser:(NSString*)strUser token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


////查看用户发起的项目
//-(void)CheckUserCreateProjectSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;
////查看用户支持的项目
//-(void)CheckUserSuppotProjectSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//获取评论列表;
-(void)getTalkListSetFeed:(NSString*)strFeed page:(int)pageInt num:(int)numInt token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


//骑牛；
-(void)qiniuSDK:(NSString*)qiniu CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


//ping++charge
-(void)pingSDk:(NSString*)pingsdk projectID:(NSString*)strProjectID paytype:(NSString*)strPaytype chou:(NSString*)strChouID token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNo:(CallBackNO)BlockNO;


//注册获取验证码
-(void)GetCheckIDSetTelephoneNumForCreate:(NSString*)strTelephone getKey:(NSString*)strKey CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//修改密码获取验证码
-(void)GetCheckIDSetTelephoneNumForFixPWD:(NSString*)strTelephone getKey:(NSString*)strKey CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;


-(void)CheckIDReviewForCreate:(NSString*)strTelephone getKey:(NSString*)strKey getCode:(NSString*)strCode CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

-(void)CheckIDReviewForFixPWD:(NSString*)strTelephone getKey:(NSString*)strKey getCode:(NSString*)strCode CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//用户可发动态项目列表
-(void)ChoseMyProjectIDByUserID:(NSString*)strUserID token:(NSString*)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//用户可发动态项目列表
-(void)UpAndJoinProjectList:(NSString*)strUserID token:(NSString*)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//用户可发动态项目列表
-(void)CHeckPayList:(NSString*)strUserID token:(NSString*)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//删除动态
-(void)deleteProjectDynamic:(NSString*)strFeedID token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//删除动态
-(void)getOneDynamic:(NSString*)strFeedID token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//时间轴
-(void)getUserTimeLineByUserID:(NSString*)strUserID page:(int)pageInt num:(int)numInt token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;

//Umeng发推送
//-(void)uMengGetMessage:(NSString*)str CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO;



@end
