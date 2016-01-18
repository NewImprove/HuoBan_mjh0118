#import <UIKit/UIKit.h>

@interface huobanUserFeedProject : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end