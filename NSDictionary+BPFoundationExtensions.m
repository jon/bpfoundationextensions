//
//  NSDictionary+BPFoundationExtensions.m
//  BPFoundation
//
//  Created by Jon Olson on 7/25/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "NSDictionary+BPFoundationExtensions.h"

@implementation NSDictionary (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
- (NSArray *)map:(id (^)(id, id))block {
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id key in self) {
		id object = [self objectForKey:key];
		[result addObject:block(key, object)];
	}
	
	return result;
}

- (id)reduce:(id (^)(id, id, id))block withInitialValue:(id)value {
	for (id key in self) {
		id object = [self objectForKey:key];
		
		value = block(value, key, object);
	}
	
	return value;
}
#endif
			  

@end
