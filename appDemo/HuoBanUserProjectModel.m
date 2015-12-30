//
//	HuoBanUserProjectModel.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "HuoBanUserProjectModel.h"

@interface HuoBanUserProjectModel ()
@end
@implementation HuoBanUserProjectModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"data"] != nil && [dictionary[@"data"] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[@"data"];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			HuoBanUserProjectData * dataItem = [[HuoBanUserProjectData alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[@"msg"] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[@"msg"];
	}	
	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = dictionary[@"status"];
	}	
	if(![dictionary[@"token"] isKindOfClass:[NSNull class]]){
		self.token = dictionary[@"token"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.data != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(HuoBanUserProjectData * dataElement in self.data){
			[dictionaryElements addObject:[dataElement toDictionary]];
		}
		dictionary[@"data"] = dictionaryElements;
	}
	if(self.msg != nil){
		dictionary[@"msg"] = self.msg;
	}
	if(self.status != nil){
		dictionary[@"status"] = self.status;
	}
	if(self.token != nil){
		dictionary[@"token"] = self.token;
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
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:@"data"];
	}
	if(self.msg != nil){
		[aCoder encodeObject:self.msg forKey:@"msg"];
	}
	if(self.status != nil){
		[aCoder encodeObject:self.status forKey:@"status"];
	}
	if(self.token != nil){
		[aCoder encodeObject:self.token forKey:@"token"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.data = [aDecoder decodeObjectForKey:@"data"];
	self.msg = [aDecoder decodeObjectForKey:@"msg"];
	self.status = [aDecoder decodeObjectForKey:@"status"];
	self.token = [aDecoder decodeObjectForKey:@"token"];
	return self;

}
@end