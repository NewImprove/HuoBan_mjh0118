#import <UIKit/UIKit.h>
#import "HuoBanUserFollowData.h"

@interface HuoBanUserFollowModel : NSObject

@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * token;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end