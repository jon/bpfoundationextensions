//
//  NSArrayExtensionsTest.m
//  BPFoundationExtensions
//
//  Created by Jon Olson on 11/18/09.
//  Copyright 2009 Jon Olson. All rights reserved.
//

#import "NSArrayExtensionsTest.h"

@implementation NSArrayExtensionsTest

- (void)testMapWithCount:(NSUInteger)count {
	id *items = malloc(sizeof(id)*count);
	
	for (NSInteger i = 0; i < count; i++)
		items[i] = [NSNumber numberWithInteger:i];
	
	NSArray *array = [NSArray arrayWithObjects:items count:count];
	STAssertNotNil(array, @"Array should not be nil");
	STAssertEquals([array count], count, @"Array should have correct number of objects");
	
	NSArray *mapped = [array map:^(id number) {
		return (id)[NSNumber numberWithInteger:[number integerValue]*[number integerValue]];
	}];
	STAssertNotNil(mapped, @"Mapped result should be non-nil");
	
	free(items);
}

- (void)testMap {
	[self testMapWithCount:100];
}

- (void)testLargeMap {
	// 1,000,000
	[self testMapWithCount:1000000];
}

@end
