//
//	HuoBanUserProjectData.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "HuoBanUserProjectData.h"

@interface HuoBanUserProjectData ()
@end
@implementation HuoBanUserProjectData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"_id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"_id"];
	}	
	if(![dictionary[@"create_date"] isKindOfClass:[NSNull class]]){
		self.createDate = dictionary[@"create_date"];
	}	
	if(![dictionary[@"end_date"] isKindOfClass:[NSNull class]]){
		self.endDate = dictionary[@"end_date"];
	}	
	if(![dictionary[@"fact_money"] isKindOfClass:[NSNull class]]){
		self.factMoney = [dictionary[@"fact_money"] integerValue];
	}

	if(![dictionary[@"fact_person"] isKindOfClass:[NSNull class]]){
		self.factPerson = [dictionary[@"fact_person"] integerValue];
	}

	if(![dictionary[@"images"] isKindOfClass:[NSNull class]]){
		self.images = dictionary[@"images"];
	}	
	if(![dictionary[@"money"] isKindOfClass:[NSNull class]]){
		self.money = [dictionary[@"money"] integerValue];
	}

	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = dictionary[@"type"];
	}	
	if(![dictionary[@"wanted_money"] isKindOfClass:[NSNull class]]){
		self.wantedMoney = [dictionary[@"wanted_money"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[@"_id"] = self.idField;
	}
	if(self.createDate != nil){
		dictionary[@"create_date"] = self.createDate;
	}
	if(self.endDate != nil){
		dictionary[@"end_date"] = self.endDate;
	}
	dictionary[@"fact_money"] = @(self.factMoney);
	dictionary[@"fact_person"] = @(self.factPerson);
	if(self.images != nil){
		dictionary[@"images"] = self.images;
	}
	dictionary[@"money"] = @(self.money);
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.type != nil){
		dictionary[@"type"] = self.type;
	}
	dictionary[@"wanted_money"] = @(self.wantedMoney);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:@"_id"];
	}
	if(self.createDate != nil){
		[aCoder encodeObject:self.createDate forKey:@"create_date"];
	}
	if(self.endDate != nil){
		[aCoder encodeObject:self.endDate forKey:@"end_date"];
	}
	[aCoder encodeObject:@(self.factMoney) forKey:@"fact_money"];	[aCoder encodeObject:@(self.factPerson) forKey:@"fact_person"];	if(self.images != nil){
		[aCoder encodeObject:self.images forKey:@"images"];
	}
	[aCoder encodeObject:@(self.money) forKey:@"money"];	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:@"type"];
	}
	[aCoder encodeObject:@(self.wantedMoney) forKey:@"wanted_money"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:@"_id"];
	self.createDate = [aDecoder decodeObjectForKey:@"create_date"];
	self.endDate = [aDecoder decodeObjectForKey:@"end_date"];
	self.factMoney = [[aDecoder decodeObjectForKey:@"fact_money"] integerValue];
	self.factPerson = [[aDecoder decodeObjectForKey:@"fact_person"] integerValue];
	self.images = [aDecoder decodeObjectForKey:@"images"];
	self.money = [[aDecoder decodeObjectForKey:@"money"] integerValue];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.type = [aDecoder decodeObjectForKey:@"type"];
	self.wantedMoney = [[aDecoder decodeObjectForKey:@"wanted_money"] integerValue];
	return self;

}
@end