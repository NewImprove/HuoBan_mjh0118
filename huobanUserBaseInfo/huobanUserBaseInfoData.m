//
//	huobanUserBaseInfoData.m
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "huobanUserBaseInfoData.h"

@interface huobanUserBaseInfoData ()
@end
@implementation huobanUserBaseInfoData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"_id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"_id"];
	}	
	if(![dictionary[@"address"] isKindOfClass:[NSNull class]]){
		self.address = dictionary[@"address"];
	}	
	if(![dictionary[@"allprojects"] isKindOfClass:[NSNull class]]){
		self.allprojects = [[huobanUserBaseInfoAllproject alloc] initWithDictionary:dictionary[@"allprojects"]];
	}

	if(![dictionary[@"city"] isKindOfClass:[NSNull class]]){
		self.city = dictionary[@"city"];
	}	
	if(![dictionary[@"creator"] isKindOfClass:[NSNull class]]){
		self.creator = [[huobanUserBaseInfoCreator alloc] initWithDictionary:dictionary[@"creator"]];
	}

	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"feed"] isKindOfClass:[NSNull class]]){
		self.feed = [[huobanUserBaseInfoAllproject alloc] initWithDictionary:dictionary[@"feed"]];
	}

	if(![dictionary[@"focus"] isKindOfClass:[NSNull class]]){
		self.focus = [[huobanUserBaseInfoCreator alloc] initWithDictionary:dictionary[@"focus"]];
	}

	if(![dictionary[@"followers"] isKindOfClass:[NSNull class]]){
		self.followers = [dictionary[@"followers"] integerValue];
	}

	if(![dictionary[@"following"] isKindOfClass:[NSNull class]]){
		self.following = [dictionary[@"following"] integerValue];
	}

	if(![dictionary[@"image"] isKindOfClass:[NSNull class]]){
		self.image = dictionary[@"image"];
	}	
	if(![dictionary[@"isfollower"] isKindOfClass:[NSNull class]]){
		self.isfollower = [dictionary[@"isfollower"] integerValue];
	}

	if(![dictionary[@"mobibuild"] isKindOfClass:[NSNull class]]){
		self.mobibuild = dictionary[@"mobibuild"];
	}	
	if(![dictionary[@"mobile"] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[@"mobile"];
	}	
	if(![dictionary[@"mobitype"] isKindOfClass:[NSNull class]]){
		self.mobitype = dictionary[@"mobitype"];
	}	
	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"orders"] isKindOfClass:[NSNull class]]){
		self.orders = [[huobanUserBaseInfoCreator alloc] initWithDictionary:dictionary[@"orders"]];
	}

	if(![dictionary[@"post"] isKindOfClass:[NSNull class]]){
		self.post = [[huobanUserBaseInfoPost alloc] initWithDictionary:dictionary[@"post"]];
	}

	if(![dictionary[@"pwd"] isKindOfClass:[NSNull class]]){
		self.pwd = dictionary[@"pwd"];
	}	
	if(![dictionary[@"realname"] isKindOfClass:[NSNull class]]){
		self.realname = dictionary[@"realname"];
	}	
	if(![dictionary[@"sex"] isKindOfClass:[NSNull class]]){
		self.sex = [dictionary[@"sex"] integerValue];
	}

	if(![dictionary[@"sign"] isKindOfClass:[NSNull class]]){
		self.sign = dictionary[@"sign"];
	}	
	if(![dictionary[@"status"] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[@"status"] integerValue];
	}

	if(![dictionary[@"umengid"] isKindOfClass:[NSNull class]]){
		self.umengid = dictionary[@"umengid"];
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
	if(self.address != nil){
		dictionary[@"address"] = self.address;
	}
	if(self.allprojects != nil){
		dictionary[@"allprojects"] = [self.allprojects toDictionary];
	}
	if(self.city != nil){
		dictionary[@"city"] = self.city;
	}
	if(self.creator != nil){
		dictionary[@"creator"] = [self.creator toDictionary];
	}
	if(self.desc != nil){
		dictionary[@"desc"] = self.desc;
	}
	if(self.feed != nil){
		dictionary[@"feed"] = [self.feed toDictionary];
	}
	if(self.focus != nil){
		dictionary[@"focus"] = [self.focus toDictionary];
	}
	dictionary[@"followers"] = @(self.followers);
	dictionary[@"following"] = @(self.following);
	if(self.image != nil){
		dictionary[@"image"] = self.image;
	}
	dictionary[@"isfollower"] = @(self.isfollower);
	if(self.mobibuild != nil){
		dictionary[@"mobibuild"] = self.mobibuild;
	}
	if(self.mobile != nil){
		dictionary[@"mobile"] = self.mobile;
	}
	if(self.mobitype != nil){
		dictionary[@"mobitype"] = self.mobitype;
	}
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.orders != nil){
		dictionary[@"orders"] = [self.orders toDictionary];
	}
	if(self.post != nil){
		dictionary[@"post"] = [self.post toDictionary];
	}
	if(self.pwd != nil){
		dictionary[@"pwd"] = self.pwd;
	}
	if(self.realname != nil){
		dictionary[@"realname"] = self.realname;
	}
	dictionary[@"sex"] = @(self.sex);
	if(self.sign != nil){
		dictionary[@"sign"] = self.sign;
	}
	dictionary[@"status"] = @(self.status);
	if(self.umengid != nil){
		dictionary[@"umengid"] = self.umengid;
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:@"address"];
	}
	if(self.allprojects != nil){
		[aCoder encodeObject:self.allprojects forKey:@"allprojects"];
	}
	if(self.city != nil){
		[aCoder encodeObject:self.city forKey:@"city"];
	}
	if(self.creator != nil){
		[aCoder encodeObject:self.creator forKey:@"creator"];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:@"desc"];
	}
	if(self.feed != nil){
		[aCoder encodeObject:self.feed forKey:@"feed"];
	}
	if(self.focus != nil){
		[aCoder encodeObject:self.focus forKey:@"focus"];
	}
	[aCoder encodeObject:@(self.followers) forKey:@"followers"];	[aCoder encodeObject:@(self.following) forKey:@"following"];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:@"image"];
	}
	[aCoder encodeObject:@(self.isfollower) forKey:@"isfollower"];	if(self.mobibuild != nil){
		[aCoder encodeObject:self.mobibuild forKey:@"mobibuild"];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:@"mobile"];
	}
	if(self.mobitype != nil){
		[aCoder encodeObject:self.mobitype forKey:@"mobitype"];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.orders != nil){
		[aCoder encodeObject:self.orders forKey:@"orders"];
	}
	if(self.post != nil){
		[aCoder encodeObject:self.post forKey:@"post"];
	}
	if(self.pwd != nil){
		[aCoder encodeObject:self.pwd forKey:@"pwd"];
	}
	if(self.realname != nil){
		[aCoder encodeObject:self.realname forKey:@"realname"];
	}
	[aCoder encodeObject:@(self.sex) forKey:@"sex"];	if(self.sign != nil){
		[aCoder encodeObject:self.sign forKey:@"sign"];
	}
	[aCoder encodeObject:@(self.status) forKey:@"status"];	if(self.umengid != nil){
		[aCoder encodeObject:self.umengid forKey:@"umengid"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:@"_id"];
	self.address = [aDecoder decodeObjectForKey:@"address"];
	self.allprojects = [aDecoder decodeObjectForKey:@"allprojects"];
	self.city = [aDecoder decodeObjectForKey:@"city"];
	self.creator = [aDecoder decodeObjectForKey:@"creator"];
	self.desc = [aDecoder decodeObjectForKey:@"desc"];
	self.feed = [aDecoder decodeObjectForKey:@"feed"];
	self.focus = [aDecoder decodeObjectForKey:@"focus"];
	self.followers = [[aDecoder decodeObjectForKey:@"followers"] integerValue];
	self.following = [[aDecoder decodeObjectForKey:@"following"] integerValue];
	self.image = [aDecoder decodeObjectForKey:@"image"];
	self.isfollower = [[aDecoder decodeObjectForKey:@"isfollower"] integerValue];
	self.mobibuild = [aDecoder decodeObjectForKey:@"mobibuild"];
	self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
	self.mobitype = [aDecoder decodeObjectForKey:@"mobitype"];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.orders = [aDecoder decodeObjectForKey:@"orders"];
	self.post = [aDecoder decodeObjectForKey:@"post"];
	self.pwd = [aDecoder decodeObjectForKey:@"pwd"];
	self.realname = [aDecoder decodeObjectForKey:@"realname"];
	self.sex = [[aDecoder decodeObjectForKey:@"sex"] integerValue];
	self.sign = [aDecoder decodeObjectForKey:@"sign"];
	self.status = [[aDecoder decodeObjectForKey:@"status"] integerValue];
	self.umengid = [aDecoder decodeObjectForKey:@"umengid"];
	return self;

}
@end