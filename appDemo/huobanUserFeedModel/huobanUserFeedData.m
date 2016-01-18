//
//	huobanUserFeedData.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "huobanUserFeedData.h"

@interface huobanUserFeedData ()
@end
@implementation huobanUserFeedData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"_id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"_id"];
	}	
	if(![dictionary[@"comment"] isKindOfClass:[NSNull class]]){
//		self.comment = [[huobanUserFeedComment alloc] initWithDictionary:dictionary[@"comment"]];
        self.comment = dictionary[@"comment"];
	}

	if(![dictionary[@"image"] isKindOfClass:[NSNull class]]){
		self.image = dictionary[@"image"];
	}	
	if(![dictionary[@"isCreator"] isKindOfClass:[NSNull class]]){
		self.isCreator = [dictionary[@"isCreator"] integerValue];
	}

	if(![dictionary[@"isUp"] isKindOfClass:[NSNull class]]){
		self.isUp = [dictionary[@"isUp"] integerValue];
	}

	if(![dictionary[@"message"] isKindOfClass:[NSNull class]]){
		self.message = dictionary[@"message"];
	}	
	if(![dictionary[@"project"] isKindOfClass:[NSNull class]]){
//		self.project = [[huobanUserFeedProject alloc] initWithDictionary:dictionary[@"project"]];
        self.project = dictionary[@"project"];
	}

	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = dictionary[@"status"];
	}	
	if(![dictionary[@"time"] isKindOfClass:[NSNull class]]){
		self.time = dictionary[@"time"];
	}	
	if(![dictionary[@"up"] isKindOfClass:[NSNull class]]){
//		self.up = [[huobanUserFeedUp alloc] initWithDictionary:dictionary[@"up"]];
		self.up = dictionary[@"up"];
        
	}

	if(![dictionary[@"user"] isKindOfClass:[NSNull class]]){
//		self.user = [[huobanUserFeedUser alloc] initWithDictionary:dictionary[@"user"]];
        self.user = dictionary[@"user"];

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
	if(self.comment != nil){
//		dictionary[@"comment"] = [self.comment toDictionary];
        dictionary[@"comment"] = self.comment;

	}
	if(self.image != nil){
		dictionary[@"image"] = self.image;
	}
	dictionary[@"isCreator"] = @(self.isCreator);
	dictionary[@"isUp"] = @(self.isUp);
	if(self.message != nil){
		dictionary[@"message"] = self.message;
	}
	if(self.project != nil){
//		dictionary[@"project"] = [self.project toDictionary];
        dictionary[@"project"] = self.project;

	}
	if(self.status != nil){
		dictionary[@"status"] = self.status;
	}
	if(self.time != nil){
		dictionary[@"time"] = self.time;
	}
	if(self.up != nil){
//		dictionary[@"up"] = [self.up toDictionary];
        dictionary[@"up"] = self.up;

	}
	if(self.user != nil){
//        dictionary[@"up"] = [self.up toDictionary];
        dictionary[@"up"] = self.up;

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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:@"_id"];
	}
	if(self.comment != nil){
		[aCoder encodeObject:self.comment forKey:@"comment"];
	}
	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:@"image"];
	}
	[aCoder encodeObject:@(self.isCreator) forKey:@"isCreator"];	[aCoder encodeObject:@(self.isUp) forKey:@"isUp"];	if(self.message != nil){
		[aCoder encodeObject:self.message forKey:@"message"];
	}
	if(self.project != nil){
		[aCoder encodeObject:self.project forKey:@"project"];
	}
	if(self.status != nil){
		[aCoder encodeObject:self.status forKey:@"status"];
	}
	if(self.time != nil){
		[aCoder encodeObject:self.time forKey:@"time"];
	}
	if(self.up != nil){
		[aCoder encodeObject:self.up forKey:@"up"];
	}
	if(self.user != nil){
		[aCoder encodeObject:self.user forKey:@"user"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:@"_id"];
	self.comment = [aDecoder decodeObjectForKey:@"comment"];
	self.image = [aDecoder decodeObjectForKey:@"image"];
	self.isCreator = [[aDecoder decodeObjectForKey:@"isCreator"] integerValue];
	self.isUp = [[aDecoder decodeObjectForKey:@"isUp"] integerValue];
	self.message = [aDecoder decodeObjectForKey:@"message"];
	self.project = [aDecoder decodeObjectForKey:@"project"];
	self.status = [aDecoder decodeObjectForKey:@"status"];
	self.time = [aDecoder decodeObjectForKey:@"time"];
	self.up = [aDecoder decodeObjectForKey:@"up"];
	self.user = [aDecoder decodeObjectForKey:@"user"];
	return self;

}
@end