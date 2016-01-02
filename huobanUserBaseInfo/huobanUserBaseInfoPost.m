//
//	huobanUserBaseInfoPost.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "huobanUserBaseInfoPost.h"

@interface huobanUserBaseInfoPost ()
@end
@implementation huobanUserBaseInfoPost




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"address"] isKindOfClass:[NSNull class]]){
		self.address = dictionary[@"address"];
	}	
	if(![dictionary[@"mobile"] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[@"mobile"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"postcode"] isKindOfClass:[NSNull class]]){
		self.postcode = dictionary[@"postcode"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[@"address"] = self.address;
	}
	if(self.mobile != nil){
		dictionary[@"mobile"] = self.mobile;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.postcode != nil){
		dictionary[@"postcode"] = self.postcode;
	}
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:@"address"];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:@"mobile"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.postcode != nil){
		[aCoder encodeObject:self.postcode forKey:@"postcode"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:@"address"];
	self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.postcode = [aDecoder decodeObjectForKey:@"postcode"];
	return self;

}
@end