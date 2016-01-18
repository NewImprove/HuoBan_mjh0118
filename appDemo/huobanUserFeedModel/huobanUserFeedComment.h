#import <UIKit/UIKit.h>

@interface huobanUserFeedComment : NSObject

@property (nonatomic, assign) NSInteger count;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end