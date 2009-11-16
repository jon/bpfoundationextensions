//
//  NSArray+BPFoundationExtensions.m
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

@implementation NSArray (BPFoundationExtensions)

- (NSArray *)map:(id (^)(id))block {
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id item in self)
		[result addObject:block(item)];
	
	return result;
}

- (NSArray *)inject:(id (^)(id, id))block withInitialValue:(id)value {
	for (id item in self)
		value = block(value, item);
	
	return value;
}

- (NSArray *)mapSelector:(SEL)selector {
	return [self map:^(id object) {
		return [object performSelector:selector];
	}];
}

- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument {
	return [self map:^(id object) {
		return [object performSelector:selector withObject:argument];
	}];
}

- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument {
	return [self map:^(id object) {
		return [object performSelector:selector withObject:argument withObject:secondArgument];
	}];
}

- (NSDictionary *)dictionaryByApplyingBlock:(id (^)(id))block {
	NSMutableArray *keys = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id item in self)
		[keys addObject:block(item)];

	return [NSDictionary dictionaryWithObjects:self forKeys:keys];
}

- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	
	for (id item in self)
		[map setObject:item forKey:[item performSelector:selector]];
	
	return map;	
}

- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	
	for (id item in self)
		[map setObject:item forKey:[item performSelector:selector withObject:argument]];
	
	return map;	
}

- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument {
	NSMutableDictionary *map = [NSMutableDictionary dictionary];
	
	for (id item in self)
		[map setObject:item forKey:[item performSelector:selector withObject:argument withObject:secondArgument]];
	
	return map;	
}

@end
