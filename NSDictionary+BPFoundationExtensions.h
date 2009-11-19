//
//  NSDictionary+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/25/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (BPFoundationExtensions)

#if NS_BLOCKS_AVAILABLE
- (NSArray *)map:(id (^)(id, id))block;
- (id)reduce:(id (^)(id, id, id))block withInitialValue:(id)value;
#endif

@end
