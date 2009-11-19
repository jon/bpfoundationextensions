//
//  NSThread+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/25/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSThread (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
+ (void)performOnMainThread:(void (^)())block;
+ (void)performOnMainThread:(void (^)())block waitUntilDone:(BOOL)wait;

+ (void)performInBackground:(void (^)())block;

- (void)perform:(void (^)())block;
- (void)perform:(void (^)())block waitUntilDone:(BOOL)wait;
#endif

@end
