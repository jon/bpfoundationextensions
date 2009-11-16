/*
 *  NSSet+BPFoundationExtensions.m
 *  BPFoundation
 *
 *  Created by Jon Olson on 7/10/09.
 *  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
 *
 */

#include "NSSet+BPFoundationExtensions.h"

@implementation NSSet (BPFoundationExtensions)

- (NSSet *)setByIntersectingWithSet:(NSSet *)other {
	NSMutableSet *result = [NSMutableSet setWithSet:self];
	[result intersectSet:other];
	return result;
}

- (NSSet *)setByUnioningWithSet:(NSSet *)other {
	return [self setByAddingObjectsFromSet:other];
}

- (NSSet *)setBySubtractingSet:(NSSet *)other {
	NSMutableSet *result = [NSMutableSet setWithSet:self];
	[result minusSet:other];
	return result;
}

@end
