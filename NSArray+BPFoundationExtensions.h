//
//  NSArray+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//


@interface NSArray (BPFoundationExtensions)

- (NSArray *)map:(id (^)(id))block;
- (NSArray *)select:(BOOL (^)(id))block;
- (NSArray *)reject:(BOOL (^)(id))block;
- (id)reduce:(id (^)(id, id))block withInitialValue:(id)value;

- (NSArray *)sort:(NSComparisonResult (^)(id, id))comparator;

- (NSArray *)reversedArray;
- (NSArray *)shuffledArray;
- (NSArray *)sortedArray;
- (NSArray *)flattenedArray;

- (NSArray *)mapSelector:(SEL)selector;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

- (NSDictionary *)dictionaryByApplyingBlock:(id (^)(id))block;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

@end


