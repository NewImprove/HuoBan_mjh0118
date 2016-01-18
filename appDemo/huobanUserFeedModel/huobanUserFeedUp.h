#import <UIKit/UIKit.h>
#import "huobanUserFeedUser.h"

@interface huobanUserFeedUp : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) huobanUserFeedUser * users;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end