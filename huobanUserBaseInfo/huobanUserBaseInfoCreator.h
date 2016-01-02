#import <UIKit/UIKit.h>
#import "huobanUserBaseInfoProject.h"

@interface huobanUserBaseInfoCreator : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray * projects;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end