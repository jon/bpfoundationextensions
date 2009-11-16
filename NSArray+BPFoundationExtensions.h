//
//  NSArray+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/9/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <PLBlocks/Block.h>

@interface NSArray (BPFoundationExtensions)

- (NSArray *)map:(id (^)(id))block;
- (NSArray *)inject:(id (^)(id, id))block withInitialValue:(id)value;

- (NSArray *)mapSelector:(SEL)selector;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument;
- (NSArray *)mapSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

- (NSDictionary *)dictionaryByApplyingBlock:(id (^)(id))block;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument;
- (NSDictionary *)dictionaryByApplyingSelector:(SEL)selector withArgument:(id)argument withArgument:(id)secondArgument;

@end


