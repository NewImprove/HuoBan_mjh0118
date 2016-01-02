#import <UIKit/UIKit.h>

@interface huobanUserBaseInfoAllproject : NSObject

@property (nonatomic, assign) NSInteger count;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end