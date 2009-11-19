//
//  NSArray+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
- (NSArray *)map:(id (^)(id))block;
- (NSArray *)select:(BOOL (^)(id))block;
- (NSArray *)reject:(BOOL (^)(id))block;
- (id)reduce:(id (^)(id, id))block withInitialValue:(id)value;

#if MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_6
- (NSArray *)mapConcurrent:(id (^)(id))block;
- (NSArray *)selectConcurrent:(BOOL (^)(id))block;
- (NSArray *)rejectConcurrent:(BOOL (^)(id))block;
#endif

- (NSArray *)sort:(NSComparisonResult (^)(id, id))comparator;
#endif

- (NSArray *)reversedArray;
- (NSArray *)shuffledArray;
- (NSArray *)sortedArray;
- (NSArray *)flattenedArray;

- (NSArray *)mapSelector:(SEL)selector;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

#if NS_BLOCKS_AVAILABLE
- (NSDictionary *)dictionaryByApplyingBlock:(id (^)(id))block;
#endif
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

@end


