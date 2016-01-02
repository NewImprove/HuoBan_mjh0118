#import <UIKit/UIKit.h>
#import "huobanUserBaseInfoAllproject.h"
#import "huobanUserBaseInfoCreator.h"
#import "huobanUserBaseInfoAllproject.h"
#import "huobanUserBaseInfoCreator.h"
#import "huobanUserBaseInfoCreator.h"
#import "huobanUserBaseInfoPost.h"

@interface huobanUserBaseInfoData : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) huobanUserBaseInfoAllproject * allprojects;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) huobanUserBaseInfoCreator * creator;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) huobanUserBaseInfoAllproject * feed;
@property (nonatomic, strong) huobanUserBaseInfoCreator * focus;
@property (nonatomic, assign) NSInteger followers;
@property (nonatomic, assign) NSInteger following;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger isfollower;
@property (nonatomic, strong) NSString * mobibuild;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * mobitype;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) huobanUserBaseInfoCreator * orders;
@property (nonatomic, strong) huobanUserBaseInfoPost * post;
@property (nonatomic, strong) NSString * pwd;
@property (nonatomic, strong) NSString * realname;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * umengid;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end