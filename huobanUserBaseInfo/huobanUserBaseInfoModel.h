#import <UIKit/UIKit.h>
#import "huobanUserBaseInfoData.h"

@interface huobanUserBaseInfoModel : NSObject

@property (nonatomic, strong) huobanUserBaseInfoData * data;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * token;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end