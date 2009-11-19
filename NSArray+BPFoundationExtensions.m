//
//  NSArray+BPFoundationExtensions.m
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "NSArray+BPFoundationExtensions.h"

@implementation NSArray (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
- (NSArray *)map:(id (^)(id))block {
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self)
		items[i++] = block(item);
	
	NSArray *result = [NSArray arrayWithObjects:items count:count];
	free(items);
	return result;
}

- (NSArray *)select:(BOOL (^)(id))block {
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self)
		if (block(item))
			items[i++] = item;
	
	NSArray *result = [NSArray arrayWithObjects:items count:i];
	free(items);
	return result;
}

- (NSArray *)reject:(BOOL (^)(id))block {
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self)
		if (!block(item))
			items[i++] = item;
	
	NSArray *result = [NSArray arrayWithObjects:items count:i];
	free(items);
	return result;
}

- (NSArray *)reduce:(id (^)(id, id))block withInitialValue:(id)value {
	for (id item in self)
		value = block(value, item);
	
	return value;
}

#if MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_6
- (NSArray *)mapConcurrent:(id (^)(id))block {
	dispatch_group_t group = dispatch_group_create();
	dispatch_queue_t queue = dispatch_get_current_queue();
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self) {
		id *result = &items[i++];
		dispatch_group_async(group, queue, ^{
			*result = block(item);
		});
	}
	
	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
	
	NSArray *result = [NSArray arrayWithObjects:items count:count];
	free(items);
	return result;
}

- (NSArray *)selectConcurrent:(BOOL (^)(id))block {
	dispatch_group_t group = dispatch_group_create();
	dispatch_queue_t queue = dispatch_get_current_queue();
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self) {
		id *result = &items[i++];
		dispatch_group_async(group, queue, ^{
			*result = block(item) ? item : nil;
		});
	}
	
	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
	
	id compacted[count];
	
	NSInteger c = 0;
	for (i = 0; i < count; i++)
		if (items[i])
			compacted[c++] = items[i];
	
	NSArray *result = [NSArray arrayWithObjects:items count:c];
	free(items);
	return result;
}

- (NSArray *)rejectConcurrent:(BOOL (^)(id))block {
	dispatch_group_t group = dispatch_group_create();
	dispatch_queue_t queue = dispatch_get_current_queue();
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = 0;
	for (id item in self) {
		id *result = &items[i++];
		dispatch_group_async(group, queue, ^{
			*result = !block(item) ? item : nil;
		});
	}
	
	dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
	
	id compacted[count];
	
	NSInteger c = 0;
	for (i = 0; i < count; i++)
		if (items[i])
			compacted[c++] = items[i];
	
	NSArray *result = [NSArray arrayWithObjects:items count:c];
	free(items);
	return result;
}
#endif

static NSComparisonResult SortComparator(id first, id second, void *block) {
	NSComparisonResult (^comparator)(id, id) = block;
	
	return comparator(first, second);
}

- (NSArray *)sort:(NSComparisonResult (^)(id, id))comparator {
	return [self sortedArrayUsingFunction:SortComparator context:comparator];
}
#endif

- (NSArray *)reversedArray {
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	NSInteger i = count - 1;
	for (id item in self)
		items[i--] = item;
	
	NSArray *result = [NSArray arrayWithObjects:items count:count];
	free(items);
	return result;
}

- (NSArray *)shuffledArray {
	static BOOL randomized = NO;
	const NSInteger count = [self count];
	id *items = malloc(sizeof(id)*count);
	if (!items)
		return nil;
	
	if (!randomized) {
		srandomdev();
		randomized = YES;
	}
	
	NSInteger i = 0;
	for (id item in self)
		items[i++] = item;
	
	// Swap each item with an item at an index greater than or equal to its current index.
	// This ammounts to picking n items from an urn of n balls without replacement
	// In other words, it generates any given permutation with probability 1/n!
	for (i = 0; i < count; i++) {
		NSInteger index = (random() % (count - i)) + i;
		id tmp = items[i];
		items[i] = items[index];
		items[index] = tmp;
	}
	
	NSArray *result = [NSArray arrayWithObjects:items count:count];
	free(items);
	return result;
}

- (NSArray *)sortedArray {
	return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)flattenedArray {
	NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id item in self) {
		if ([item isKindOfClass:[NSArray class]])
			[result addObjectsFromArray:[((NSArray *)item) flattenedArray]];
		else
			[result addObject:item];
	}
	
	return result;
}

#if NS_BLOCKS_AVAILABLE
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
#else
- (NSArray *)mapSelector:(SEL)selector {
	NSMutableArray *result = [NSMutableArray array];
	
	for (id item in self)
		[result addObject:[item performSelector:selector]];

	return result;
}

- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument {
	NSMutableArray *result = [NSMutableArray array];
	
	for (id item in self)
		[result addObject:[item performSelector:selector withObject:argument]];
	
	return result;
}

- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument {
	NSMutableArray *result = [NSMutableArray array];
	
	for (id item in self)
		[result addObject:[item performSelector:selector withObject:argument withObject:secondArgument]];
	
	return result;
}
#endif

#if NS_BLOCKS_AVAILABLE
- (NSDictionary *)dictionaryByApplyingBlock:(id (^)(id))block {
	NSMutableArray *keys = [NSMutableArray arrayWithCapacity:[self count]];
	
	for (id item in self)
		[keys addObject:block(item)];

	return [NSDictionary dictionaryWithObjects:self forKeys:keys];
}
#endif

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
