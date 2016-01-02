#import <UIKit/UIKit.h>

@interface huobanUserBaseInfoProject : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, strong) NSString * littleImage;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end