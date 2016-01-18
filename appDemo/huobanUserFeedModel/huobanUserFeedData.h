#import <UIKit/UIKit.h>
#import "huobanUserFeedComment.h"
#import "huobanUserFeedProject.h"
#import "huobanUserFeedUp.h"
#import "huobanUserFeedUser.h"

@interface huobanUserFeedData : NSObject

@property (nonatomic, strong) NSString * idField;
//@property (nonatomic, strong) huobanUserFeedComment * comment;
@property (nonatomic, strong) NSDictionary * comment;

@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger isCreator;
@property (nonatomic, assign) NSInteger isUp;
@property (nonatomic, strong) NSString * message;
//@property (nonatomic, strong) huobanUserFeedProject * project;
@property (nonatomic, strong) NSDictionary * project;

@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * time;

@property (nonatomic, strong) NSDictionary * up;
@property (nonatomic, strong) NSDictionary * user;

//@property (nonatomic, strong) huobanUserFeedUp * up;
//@property (nonatomic, strong) huobanUserFeedUser * user;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end