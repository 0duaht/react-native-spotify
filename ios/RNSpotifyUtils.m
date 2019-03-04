//
//  RNSpotifyUtils.m
//  RNSpotify
//
//  Created by Luis Finke on 3/3/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNSpotifyUtils.h"

@implementation RNSpotifyUtils

+(NSString*)makeQueryString:(NSDictionary*)params {
	NSMutableArray* parts = [NSMutableArray array];
	for(NSString* key in params) {
		id value = [params objectForKey:key];
		NSString* keyStr = [key stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
		NSString* valueStr = (![value isKindOfClass:[NSNull class]]) ? (
			[[value description] stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet]
		) : nil;
		if(valueStr != nil) {
			NSString* part = [NSString stringWithFormat: @"%@=%@", keyStr, valueStr];
			[parts addObject:part];
		}
	}
	return [parts componentsJoinedByString:@"&"];
}

+(BOOL)isNull:(id)obj {
	if(obj == nil || [obj isKindOfClass:[NSNull class]]) {
		return YES;
	}
	return NO;
}

+(id)getOption:(NSString*)option from:(NSDictionary*)options fallback:(NSDictionary*)fallback {
	id value = options[option];
	if(value == nil && fallback != nil) {
		value = fallback[option];
	}
	if(value != nil && [value isKindOfClass:[NSNull class]]) {
		return nil;
	}
	return value;
}

+(void)setOrRemoveObject:(id)object forKey:(NSString*)key in:(NSMutableDictionary*)dict {
	if(object != nil && ![object isKindOfClass:[NSNull null]]) {
		[dict setObject:object forKey:key];
	}
	else {
		[dict removeObjectForKey:key];
	}
}

@end
