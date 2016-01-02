#import <UIKit/UIKit.h>

@interface huobanUserBaseInfoPost : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * postcode;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end