/*
 *  NSSet+BPFoundationExtensions.h
 *  BPFoundation
 *
 *  Created by Jon Olson on 7/10/09.
 *  Copyright 2009 Ballistic Pigeon, LLC. All rights reserved.
 *
 */

@interface NSSet (BPFoundationExtensions)

- (NSSet *)setByIntersectingWithSet:(NSSet *)other;
- (NSSet *)setByUnioningWithSet:(NSSet *)other;
- (NSSet *)setBySubtractingSet:(NSSet *)other;

@end
