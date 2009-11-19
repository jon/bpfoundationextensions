//
//  NSMutableArray+BPFoundationExtensions.h
//  BPFoundationExtensions
//
//  Created by Jon Olson on 11/18/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (BPFoundationExtensions)

- (void)mapInPlace:(id (^)(id))block;
- (void)selectInPlace:(BOOL (^)(id))block;
- (void)rejectInPlace:(BOOL (^)(id))block;

- (void)sortInPlace:(NSComparisonResult (^)(id, id))comparator;

- (void)reverse;
- (void)shuffle;
- (void)sort;
- (void)flatten;

- (void)mapSelectorInPlace:(SEL)selector;
- (void)mapSelectorInPlace:(SEL)selector withArgument:(id)argument;
- (void)mapSelectorInPlace:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

@end
