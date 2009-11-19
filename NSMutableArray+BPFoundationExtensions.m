//
//  NSMutableArray+BPFoundationExtensions.m
//  BPFoundationExtensions
//
//  Created by Jon Olson on 11/18/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "NSArray+BPFoundationExtensions.h"
#import "NSMutableArray+BPFoundationExtensions.h"

@implementation NSMutableArray (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
- (void)mapInPlace:(id (^)(id))block {
	[self setArray:[self map:block]];
}

- (void)selectInPlace:(BOOL (^)(id))block {
	[self setArray:[self select:block]];
}

- (void)rejectInPlace:(BOOL (^)(id))block {
	[self setArray:[self reject:block]];
}

- (void)sortInPlace:(NSComparisonResult (^)(id, id))comparator {
	[self setArray:[self sort:comparator]];
}
#endif

- (void)reverse {
	[self setArray:[self reversedArray]];
}

- (void)shuffle {
	[self setArray:[self shuffledArray]];
}

- (void)sort {
	[self setArray:[self sortedArray]];
}

- (void)flatten {
	[self setArray:[self flattenedArray]];
}

- (void)mapSelectorInPlace:(SEL)selector {
	[self setArray:[self mapSelector:selector]];
}

- (void)mapSelectorInPlace:(SEL)selector withArgument:(id)argument {
	[self setArray:[self mapSelector:selector withArgument:argument]];
}

- (void)mapSelectorInPlace:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument {
	[self setArray:[self mapSelector:selector withArgument:argument withArgument:secondArgument]];
}

@end
