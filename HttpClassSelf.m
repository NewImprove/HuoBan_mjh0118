//
//  HttpClassSelf.m
//  appDemo
//
//  Created by 刘雨辰 on 15/9/10.
//  Copyright (c) 2015年 lyc. All rights reserved.


#import "HttpClassSelf.h"
#import "MKNetworkKit.h"
#import "CommonCrypto/CommonDigest.h"
#import "CommonBase64.h"

//#define HTTPAddHuoBan  @"api.huoban.io:8877"
//服务器测试地址
#define HTTPAddHuoBan  @"123.57.33.133:8888"

@implementation HttpClassSelf

#pragma mark POST

//登陆
-(void)loginSetMobile:(NSString *)mobile pwd:(NSString *)pwd umengid:(NSString *)umengid mobibuild:(NSString *)mobibuild mobitype:(NSString *)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/auth/login"];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSString *pwdMD5 =  [self MD5ByAStr:pwd];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:mobile forKey:@"mobile"];
    [postBody setValue:pwdMD5 forKey:@"pwd"];
    [postBody setValue:umengid forKey:@"umengid"];
    [postBody setValue:mobibuild forKey:@"mobibuild"];
    [postBody setValue:mobitype forKey:@"mobitype"];
    
    NSLog(@"%@",umengid);
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];

    //发起网络请求
    [engine enqueueOperation:op];

}

//登陆
-(void)answerComment:(NSString *)strComment token:(NSString *)strToken message:(NSString *)strMessage CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/comment/%@/reply/%@",strComment,strToken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:strMessage forKey:@"message"];

    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
    
}

/*
 {
 "appkey":"xx",          // 必填 应用唯一标识
 "timestamp":"xx",       // 必填 时间戳，10位或者13位均可，时间戳有效期为10分钟
 "type":"xx",            // 必填 消息发送类型,其值可以为:
 unicast-单播
 listcast-列播(要求不超过500个device_token)
 filecast-文件播
 (多个device_token可通过文件形式批量发送）
 broadcast-广播
 groupcast-组播
 (按照filter条件筛选特定用户群, 具体请参照filter参数)
 customizedcast(通过开发者自有的alias进行推送),
 包括以下两种case:
 - alias: 对单个或者多个alias进行推送
 - file_id: 将alias存放到文件后，根据file_id来推送
 "device_tokens":"xx",   // 可选 设备唯一表示
 当type=unicast时,必填, 表示指定的单个设备
 当type=listcast时,必填,要求不超过500个,
 多个device_token以英文逗号间隔
 "alias_type": "xx"      // 可选 当type=customizedcast时，必填，alias的类型,
 alias_type可由开发者自定义,开发者在SDK中
 调用setAlias(alias, alias_type)时所设置的alias_type
 "alias":"xx",           // 可选 当type=customizedcast时, 开发者填写自己的alias。
 要求不超过50个alias,多个alias以英文逗号间隔。
 在SDK中调用setAlias(alias, alias_type)时所设置的alias
 "file_id":"xx",         // 可选 当type=filecast时，file内容为多条device_token,
 device_token以回车符分隔
 当type=customizedcast时，file内容为多条alias，
 alias以回车符分隔，注意同一个文件内的alias所对应
 的alias_type必须和接口参数alias_type一致。
 注意，使用文件播前需要先调用文件上传接口获取file_id,
 具体请参照"2.4文件上传接口"
 "filter":{},            // 可选 终端用户筛选条件,如用户标签、地域、应用版本以及渠道等,
 具体请参考附录G。
 "payload":              // 必填 消息内容(iOS最大为2012B), 包含参数说明如下(JSON格式):
 {
 "aps":                 // 必填 严格按照APNs定义来填写
 {
 "alert": "xx"          // 必填
 "badge": xx,           // 可选
 "sound": "xx",         // 可选
 "content-available":xx // 可选
 "category": "xx",      // 可选, 注意: ios8才支持该字段。
 },
 "key1":"value1",       // 可选 用户自定义内容, "d","p"为友盟保留字段，
 key不可以是"d","p"
 "key2":"value2",
 ...
 },
 "policy":                // 可选 发送策略
 {
 "start_time":"xx",   // 可选 定时发送时间，默认为立即发送。发送时间不能小于当前时间。
 格式: "YYYY-MM-DD HH:mm:ss"。
 注意, start_time只对任务生效。
 "expire_time":"xx",  // 可选 消息过期时间,其值不可小于发送时间,
 默认为3天后过期。格式同start_time
 "max_send_num": xx   // 可选 发送限速，每秒发送的最大条数。
 开发者发送的消息如果有请求自己服务器的资源，可以考虑此参数。
 },
 "production_mode":"true/false" // 可选 正式/测试模式。测试模式下，广播/组播只会将消息发给测试设备。
 测试设备需要到web上添加。
 iOS: 测试模式对应APNs的开发环境(sandbox),
 正式模式对应APNs的正式环境(prod),
 正式、测试设备完全隔离。
 "description": "xx"      // 可选 发送消息描述，建议填写。
 "thirdparty_id": "xx"    // 可选 开发者自定义消息标识ID, 开发者可以为同一批发送的消息提供
 同一个thirdparty_id, 便于后期合并统计数据。
 }
 */
//
//-(void)uMengGetMessage:(NSString*)str CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
//
//      //获取时间戳
//        [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]]; // 只能够修改该程序的defaultTimeZone，不能修改系统的，更不能修改其他程序的。
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
//        NSDate *now = [NSDate date];
//        NSString *strTime = [dateFormatter stringFromDate:now];
//    
//
//    
//
//    
//    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
//    [postBody setValue:@"55dfb883e0f55a2f4a000a79" forKey:@"appkey"];
//    [postBody setValue:strTime forKey:@"timestamp"];
//    [postBody setValue:@"broadcast" forKey:@"type"];
//    [postBody setValue:@"false" forKey:@"production_mode"];
//    
//    
//    NSMutableDictionary *dicPayload = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dicAPS = [[NSMutableDictionary alloc] init];
//    
//    [dicAPS setValue:@"测试推送推送" forKey:@"alert"];
//    
//    [dicPayload setValue:dicAPS forKey:@"aps"];
//    [postBody setValue:dicPayload forKey:@"payload"];
//    
//    
//    NSString * strSignColllect = [NSString stringWithFormat:@"POSThttp://msg.umeng.com/api/send%@f2xpfhff1jbk5lowlgfbwidvi8h0l6dx",postBody];
//    
//        NSString *strSign =  [self MD5ByAStr:strSignColllect];
//    
//    
////    设置请求路径
//    NSString *path = [[NSString alloc]initWithFormat:@"/api/status?sign=%@",strSign];
//    
//    //设置主机名
//    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:@"msg.umeng.com" customHeaderFields:nil ];
//    
//    
//    //请求地址，参数
//    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
//    
//    
//    NSLog(@"打印POST参数%@",postBody);
//    //请求闭包
//    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
//    
//    //发起网络请求
//    [engine enqueueOperation:op];
////
//    
//    
//    
//}

//
-(void)UpdateUserSettingSetUser:(NSString*)steUser setToken:(NSString*)strToken setImage:(NSString*)steImage setName:(NSString*)strName setSex:(NSString*)strSex setAddress:(NSString*)strAddress setSign:(NSString*)strSign setDesc:(NSString*)strDesc payName:(NSString *)strPayName payMobile:(NSString *)strPayMobile payPostCode:(NSString *)strPostCode CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/user/profile/user-%@/%@",steUser,strToken];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init];
    
    [postBody setValue:steUser forKey:@"user"];
    [postBody setValue:strToken forKey:@"token"];
    [postBody setValue:steImage forKey:@"image"];
    [postBody setValue:strName forKey:@"name"];
    [postBody setValue:strSex forKey:@"sex"];
    [postBody setValue:strAddress forKey:@"address"];
    [postBody setValue:strSign forKey:@"sign"];
    [postBody setValue:strDesc forKey:@"desc"];
    [postBody setValue:strPayName forKey:@"postname"];
    [postBody setValue:strPayMobile forKey:@"postmobile"];
    [postBody setValue:strAddress forKey:@"postaddress"];
    [postBody setValue:strPostCode forKey:@"postcode"];
    
//    NSLog(@"%@--%@--%@--%@--%@--%@--%@--%@--%@---%@---%@",steUser,strToken,steImage,strName,strSex,strAddress,strSign,strDesc,strPayName,strPayMobile,strAddress);
    
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

//注册
-(void)RegisterSetMobile:(NSString*)mobile pwd:(NSString*)pwd umengid:(NSString*)umengid mobibuild:(NSString*)mobibuild mobitype:(NSString*)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/auth/register"];
    
    NSString *pwdMD5 =  [self MD5ByAStr:pwd];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:mobile forKey:@"mobile"];
    [postBody setValue:pwdMD5 forKey:@"pwd"];
    [postBody setValue:umengid forKey:@"umengid"];
    [postBody setValue:mobibuild forKey:@"mobibuild"];
    [postBody setValue:mobitype forKey:@"mobitype"];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];

    [op addCompletionHandler:BlockYES errorHandler:BlockNO];

    //发起网络请求
    [engine enqueueOperation:op];
}


//忘记密码
-(void)forgotPWDSetMobile:(NSString*)mobile pwd:(NSString*)pwd umengid:(NSString*)umengid mobibuild:(NSString*)mobibuild mobitype:(NSString*)mobitype CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/auth/forgetpwd"];
    
    NSString *pwdMD5 =  [self MD5ByAStr:pwd];

    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:mobile forKey:@"mobile"];
    [postBody setValue:pwdMD5 forKey:@"pwd"];
    [postBody setValue:umengid forKey:@"umengid"];
    [postBody setValue:mobibuild forKey:@"mobibuild"];
    [postBody setValue:mobitype forKey:@"mobitype"];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
    
    
}

//发布项目动态
-(void)sendProjectselfDynamicSetProjectID:(NSString*)strProjectID strToken:(NSString*)strToken message:(NSString*)message image:(NSString*)strImage CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/project/feed/p-%@/new/%@",strProjectID,strToken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:message forKey:@"message"];
    [postBody setValue:strImage forKey:@"image"];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];

    
}
//评论项目动态
-(void)commentProjectselDynamicSetFeed:(NSString*)strFeed strToken:(NSString*)strToken message:(NSString*)message CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/project/feed/%@/comment/%@",strFeed,strToken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    NSMutableDictionary *postBody = [[NSMutableDictionary alloc]init ];
    [postBody setValue:message forKey:@"message"];
    
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path params:postBody httpMethod:@"POST"];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
    
}
#pragma mark GET
//主页项目列表
-(void)homePageSetKey:(NSString*)strkey numPage:(int)numPage numNum:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/project/list/%@/page-%i/num-%i/%@",strkey,numPage,numNum,strtoken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
}

//聊天列表;
-(void)projectTalkSetFeed:(NSString *)strFeed numPage:(int)numPage numNum:(int)numNum token:(NSString *)strToken CallBackyes:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/comments/list/f-%@/page-%i/num-%i/%@",strFeed,numPage,numNum,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

//项目详情
-(void)projectDetailsSetProjectID:(NSString*)strProjectID token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/project/p-%@/%@",strProjectID,strtoken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
}
-(void)oneProjectDynamicSetProjectID:(NSString *)strProjectID numPage:(int)numPage numNum:(int)numNum token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    
    NSString *path = [[NSString alloc] initWithFormat:@"/feed/p-%@/page-%i/num-%i/%@",strProjectID,numPage,numNum,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

//显示一个用户的所有动态
-(void)projectDynmaicUserSelfSetUser:(NSString*)strUser numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    NSString *path = [[NSString alloc] initWithFormat:@"/feed/u-%@/page-%i/num-%i/%@",strUser,numPage,numNum,strToken];
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan  customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

//全部动态接口
-(void)projectDynamicOurSetUser:(NSString*)strUser numPage:(int)numPage numNum:(int)numNum token:(NSString*)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/feed/u-%@-we/page-%i/num-%i/%@",strUser,numPage,numNum,strToken];

    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

//  查看个人所有动态接口
-(void)personDynamic:(NSString *)strUserID numPage:(int)numPage numNum:(int)numNum token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/feed/u-%@/page-%i/num-%i/%@",strUserID,numPage,numNum,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

-(void)projectDetailsDynamic:(NSString *)strProjectID numPage:(int)numPage numNum:(int)numNum token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/feed/p-%@-creator/page-%i/num-%i/%@",strProjectID,numPage,numNum,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];

}


//项目点赞(取消)
-(void)loveProjectselfSetFeed:(NSString*)strFeed up:(int)upInt token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/project/feed/%@/up/%i/%@",strFeed,upInt,strtoken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan  customHeaderFields:nil ];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
}

//关注一个项目(取消)(返回状态)
-(void)focusProjectselfSetProjectID:(NSString*)strProjectID up:(int)upInt token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/user/focus/%@/%i/%@",strProjectID,upInt,strtoken];
    
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan  customHeaderFields:nil ];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
}

//查看用户关注的项目(自己，别人)
-(void)focusProjectselfSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/user/profile/focus/%@/page-%i/num-%i/%@",strUser,numPage,numNum,strtoken];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
}

//查看用户基本信息
-(void)CheckUserSelfSetUser:(NSString*)strUser token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/user/profile/userv2-%@/%@",strUser,strtoken];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
}

//查看用户发起的项目
-(void)CheckUserCreateProjectSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/user/profile/create/%@/page-%i/num-%i/%@",strUser,numPage,numNum,strtoken];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
    
}
//查看用户支持的项目
-(void)CheckUserSuppotProjectSetUser:(NSString*)strUser page:(int)numPage num:(int)numNum token:(NSString*)strtoken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    //设置请求路径
    NSString *path = [[NSString alloc]initWithFormat:@"/user/profile/pay/%@/page-%i/num-%i/%@",strUser,numPage,numNum,strtoken];
    //设置主机名
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:HTTPAddHuoBan customHeaderFields:nil ];
    //请求地址，参数
    MKNetworkOperation *op = [engine operationWithPath:path];
    //请求闭包
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    //发起网络请求
    [engine enqueueOperation:op];
}

-(void)qiniuSDK:(NSString*)qiniu CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/qiniu/1w3EcXsD"];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

-(void)pingSDk:(NSString *)pingsdk projectID:(NSString *)strProjectID paytype:(NSString *)strPaytype chou:(NSString *)strChouID token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNo:(CallBackNO)BlockNO{

    NSString *path = [[NSString alloc] initWithFormat:@"/pay/p-%@/%@/%@/%@",strProjectID,strPaytype,strChouID,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}


-(void)getTalkListSetFeed:(NSString *)strFeed page:(int)pageInt num:(int)numInt token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"comments/list/f-%@/page-%i/num-%i/%@",strFeed,pageInt,numInt,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

-(void)GetCheckIDSetTelephoneNumForCreate:(NSString *)strTelephone getKey:(NSString *)strKey CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/sendsms/%@/%@",strKey,strTelephone];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

-(void)GetCheckIDSetTelephoneNumForFixPWD:(NSString *)strTelephone getKey:(NSString *)strKey CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/sendsms/%@/%@",strKey,strTelephone];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

-(void)CheckIDReviewForCreate:(NSString *)strTelephone getKey:(NSString *)strKey getCode:(NSString *)strCode CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/sendsms/verify/%@/%@/%@",strKey,strTelephone,strCode];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

-(void)CheckIDReviewForFixPWD:(NSString *)strTelephone getKey:(NSString *)strKey getCode:(NSString *)strCode CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/sendsms/verify/%@/%@/%@",strKey,strTelephone,strCode];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}


-(void)ChoseMyProjectIDByUserID:(NSString *)strUserID token:(NSString *)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/user/profile/postfeed/%@/page-%i/num-%i/%@",strUserID,pageInt,numInt,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];

    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}
//查看关注和加入项目接口
-(void)UpAndJoinProjectList:(NSString *)strUserID token:(NSString *)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    
    NSString *path = [[NSString alloc] initWithFormat:@"/v2/user/profile/postfeed/%@/page-%i/num-%i/%@",strUserID,pageInt,numInt,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
}

-(void)CHeckPayList:(NSString *)strUserID token:(NSString *)strToken page:(int)pageInt num:(int)numInt CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
  
    NSString *path = [[NSString alloc] initWithFormat:@"user/orders/%@/page-%i/num-%i/%@",strUserID,pageInt,numInt,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];

}

-(void)deleteProjectDynamic:(NSString *)strFeedID token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/project/feed/%@/%@",strFeedID,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path params:nil httpMethod:@"DELETE"];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

-(void)getOneDynamic:(NSString *)strFeedID token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/project/feed/%@/%@",strFeedID,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path params:nil httpMethod:@"GET"];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}

-(void)getUserTimeLineByUserID:(NSString *)strUserID page:(int)pageInt num:(int)numInt token:(NSString *)strToken CallBackYES:(CallBackYES)BlockYES CallBackNO:(CallBackNO)BlockNO{
    
    NSString *path = [[NSString alloc] initWithFormat:@"/user/profile/timeline/%@/page-%i/num-%i/%@",strUserID,pageInt,numInt,strToken];
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HTTPAddHuoBan customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:path params:nil httpMethod:@"GET"];
    
    [op addCompletionHandler:BlockYES errorHandler:BlockNO];
    
    [engine enqueueOperation:op];
    
}
//md5加密
-(NSString *)MD5ByAStr:(NSString *)aSourceStr {
    const char* cStr = [aSourceStr UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    
    return ret;
}

@end
