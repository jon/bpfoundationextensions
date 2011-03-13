//
//  BPPrimitiveArray.h
//  BPFoundationExtensions
//
//  Created by Jon Olson on 3/12/11.
//  Copyright 2011 Ballistic Pigeon, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BPPrimitiveArray : NSObject {
    NSUInteger count;
    NSUInteger primitiveSize;
    NSUInteger size;
    void *array;
}

@property (assign) NSUInteger count;

@property (readonly) BOOL *boolArray;
@property (readonly) char *charArray;
@property (readonly) short *shortArray;
@property (readonly) int *intArray;
@property (readonly) NSInteger *integerArray;
@property (readonly) long *longArray;
@property (readonly) long long *longLongArray;
@property (readonly) float *floatArray;
@property (readonly) double *doubleArray;
@property (readonly) unsigned char *unsignedCharArray;
@property (readonly) unsigned short *unsignedShortArray;
@property (readonly) unsigned int *unsignedIntArray;
@property (readonly) NSUInteger *unsignedIntegerArray;
@property (readonly) unsigned long *unsignedLongArray;
@property (readonly) unsigned long long *unsignedLongLongArray;

@property (readonly) int8_t *int8Array;
@property (readonly) int16_t *int16Array;
@property (readonly) int32_t *int32Array;
@property (readonly) int64_t *int64Array;
@property (readonly) uint8_t *uint8Array;
@property (readonly) uint16_t *uint16Array;
@property (readonly) uint32_t *uint32Array;
@property (readonly) uint64_t *uint64Array;

- (id)initWithPrimitiveSize:(NSInteger)size count:(NSInteger)count;
- (id)initBoolArray:(NSInteger)count;
- (id)initCharArray:(NSInteger)count;
- (id)initShortArray:(NSInteger)count;
- (id)initIntArray:(NSInteger)count;
- (id)initIntegerArray:(NSInteger)count;
- (id)initLongArray:(NSInteger)count;
- (id)initLongLongArray:(NSInteger)count;
- (id)initFloatArray:(NSInteger)count;
- (id)initDoubleArray:(NSInteger)count;
- (id)initUnsignedCharArray:(NSInteger)count;
- (id)initUnsignedShortArray:(NSInteger)count;
- (id)initUnsignedIntArray:(NSInteger)count;
- (id)initUnsignedIntegerArray:(NSInteger)count;
- (id)initUnsignedLongArray:(NSInteger)count;
- (id)initUnsignedLongLongArray:(NSInteger)count;

- (id)initInt8Array:(NSInteger)count;
- (id)initInt16Array:(NSInteger)count;
- (id)initInt32Array:(NSInteger)count;
- (id)initInt64Array:(NSInteger)count;
- (id)initUint8Array:(NSInteger)count;
- (id)initUint16Array:(NSInteger)count;
- (id)initUint32Array:(NSInteger)count;
- (id)initUint64Array:(NSInteger)count;

- (BOOL)boolAtIndex:(NSInteger)index;
- (char)charAtIndex:(NSInteger)index;
- (short)shortAtIndex:(NSInteger)index;
- (int)intAtIndex:(NSInteger)index;
- (NSInteger)integerAtIndex:(NSInteger)index;
- (long)longAtIndex:(NSInteger)index;
- (long long)longLongAtIndex:(NSInteger)index;
- (float)floatAtIndex:(NSInteger)index;
- (double)doubleAtIndex:(NSInteger)index;
- (unsigned char)unsignedCharAtIndex:(NSInteger)index;
- (unsigned short)unsignedShortAtIndex:(NSInteger)index;
- (unsigned int)unsignedIntAtIndex:(NSInteger)index;
- (NSUInteger)unsignedIntegerAtIndex:(NSInteger)index;
- (unsigned long)unsignedLongAtIndex:(NSInteger)index;
- (unsigned long long)unsignedLongLongAtIndex:(NSInteger)index;

- (int8_t)int8AtIndex:(NSInteger)index;
- (int16_t)int16AtIndex:(NSInteger)index;
- (int32_t)int32AtIndex:(NSInteger)index;
- (int64_t)int64AtIndex:(NSInteger)index;
- (uint8_t)uint8AtIndex:(NSInteger)index;
- (uint16_t)uint16AtIndex:(NSInteger)index;
- (uint32_t)uint32AtIndex:(NSInteger)index;
- (uint64_t)uint64AtIndex:(NSInteger)index;

- (void)clear;

@end
