//
//	huobanUserBaseInfoCreator.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "huobanUserBaseInfoCreator.h"

@interface huobanUserBaseInfoCreator ()
@end
@implementation huobanUserBaseInfoCreator




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(dictionary[@"projects"] != nil && [dictionary[@"projects"] isKindOfClass:[NSArray class]]){
		NSArray * projectsDictionaries = dictionary[@"projects"];
		NSMutableArray * projectsItems = [NSMutableArray array];
		for(NSDictionary * projectsDictionary in projectsDictionaries){
			huobanUserBaseInfoProject * projectsItem = [[huobanUserBaseInfoProject alloc] initWithDictionary:projectsDictionary];
			[projectsItems addObject:projectsItem];
		}
		self.projects = projectsItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"count"] = @(self.count);
	if(self.projects != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(huobanUserBaseInfoProject * projectsElement in self.projects){
			[dictionaryElements addObject:[projectsElement toDictionary]];
		}
		dictionary[@"projects"] = dictionaryElements;
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
	[aCoder encodeObject:@(self.count) forKey:@"count"];	if(self.projects != nil){
		[aCoder encodeObject:self.projects forKey:@"projects"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:@"count"] integerValue];
	self.projects = [aDecoder decodeObjectForKey:@"projects"];
	return self;

}
@end