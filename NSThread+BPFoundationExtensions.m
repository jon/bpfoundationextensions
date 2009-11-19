//
//  NSThread+BPFoundationExtensions.m
//  BPFoundation
//
//  Created by Jon Olson on 7/25/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import "NSThread+BPFoundationExtensions.h"


@implementation NSThread (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
+ (void)_performBlock:(void (^)())block {
	block();
}

+ (void)performOnMainThread:(void (^)())block {
	[self performSelectorOnMainThread:@selector(_performBlock:) withObject:[block copy] waitUntilDone:NO];
}

+ (void)performOnMainThread:(void (^)())block waitUntilDone:(BOOL)wait {
	[self performSelectorOnMainThread:@selector(_performBlock:) withObject:[block copy] waitUntilDone:wait];
}

+ (void)performInBackground:(void (^)())block {
	[self performSelectorInBackground:@selector(_performBlock:) withObject:[block copy]];	
}

- (void)_performBlock:(void (^)())block {
	block();
}

- (void)perform:(void (^)())block {
	[self performSelector:@selector(_performBlock:) onThread:self withObject:[block copy] waitUntilDone:NO];
}

- (void)perform:(void (^)())block waitUntilDone:(BOOL)wait {
	[self performSelector:@selector(_performBlock:) onThread:self withObject:[block copy] waitUntilDone:wait];
}
#endif

@end
