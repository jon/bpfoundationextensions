//
//  NSArray+BPFoundationExtensions.m
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

@implementation NSArray (BPFoundationExtensions)

- (NSArray *)map:(id (^)(id))block {
	const NSInteger count = [self count];
	id items[count];
	
	NSInteger i = 0;
	for (id item in self)
		items[i++] = block(item);
	
	return [NSArray arrayWithObjects:items count:count];
}

- (NSArray *)select:(BOOL (^)(id))block {
	const NSInteger count = [self count];
	id items[count];
	
	NSInteger i = 0;
	for (id item in self)
		if (block(item))
			items[i++] = item;
	
	return [NSArray arrayWithObjects:items count:i];
}

- (NSArray *)reject:(BOOL (^)(id))block {
	const NSInteger count = [self count];
	id items[count];
	
	NSInteger i = 0;
	for (id item in self)
		if (!block(item))
			items[i++] = item;
	
	return [NSArray arrayWithObjects:items count:i];
}

- (NSArray *)reduce:(id (^)(id, id))block withInitialValue:(id)value {
	for (id item in self)
		value = block(value, item);
	
	return value;
}

static NSComparisonResult SortComparator(id first, id second, void *block) {
	NSComparisonResult (^comparator)(id, id) = block;
	
	return comparator(first, second);
}

- (NSArray *)sort:(NSComparisonResult (^)(id, id))comparator {
	return [self sortedArrayUsingFunction:SortComparator context:comparator];
}

- (NSArray *)reversedArray {
	const NSInteger count = [self count];
	id items[count];

	NSInteger i = count - 1;
	for (id item in self)
		items[i--] = item;
	
	return [NSArray arrayWithObjects:items count:count];
}

- (NSArray *)shuffledArray {
	static BOOL randomized = NO;
	const NSInteger count = [self count];
	id items[count];
	
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
	
	return [NSArray arrayWithObjects:items count:count];
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
