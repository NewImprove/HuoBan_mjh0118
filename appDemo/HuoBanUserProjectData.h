#import <UIKit/UIKit.h>

@interface HuoBanUserProjectData : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * createDate;
@property (nonatomic, strong) NSString * endDate;
@property (nonatomic, assign) NSInteger factMoney;
@property (nonatomic, assign) NSInteger factPerson;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, assign) NSInteger money;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, assign) NSInteger wantedMoney;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end