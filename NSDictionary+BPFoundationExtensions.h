//
//  NSDictionary+BPFoundationExtensions.h
//  BPFoundation
//
//  Created by Jon Olson on 7/25/09.
//  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (BPFoundationExtensions)

- (NSArray *)map:(id (^)(id, id))block;
- (id)inject:(id (^)(id, id, id))block withInitialValue:(id)value;

@end
