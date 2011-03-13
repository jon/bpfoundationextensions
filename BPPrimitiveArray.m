//
//  BPPrimitiveArray.m
//  BPFoundationExtensions
//
//  Created by Jon Olson on 3/12/11.
//  Copyright 2011 Ballistic Pigeon, LLC. All rights reserved.
//

#import "BPPrimitiveArray.h"


@implementation BPPrimitiveArray

#pragma mark -
#pragma mark Initialization and deallocation

- (id)initWithPrimitiveSize:(NSInteger)aSize count:(NSInteger)aCount {
    if ((self = [super init])) {
        array = calloc(aCount, aSize);
        count = aCount;
        primitiveSize = aSize;
        size = aSize*aCount;
        
        if (array == NULL) {
            [self release];
            return nil; // Failed to allocate space for our array
        }
    }
    
    return self;
}

- (id)initBoolArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(BOOL) count:aCount];
}

- (id)initCharArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(char) count:aCount];
}

- (id)initShortArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(short) count:aCount];
}

- (id)initIntArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(int) count:aCount];
}

- (id)initIntegerArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(NSInteger) count:aCount];
}

- (id)initLongArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(long) count:aCount];
}

- (id)initLongLongArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(long long) count:aCount];
}

- (id)initFloatArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(float) count:aCount];
}

- (id)initDoubleArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(double) count:aCount];
}

- (id)initUnsignedCharArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(unsigned char) count:aCount];
}

- (id)initUnsignedShortArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(unsigned short) count:aCount];
}

- (id)initUnsignedIntArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(unsigned int) count:aCount];
}

- (id)initUnsignedIntegerArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(NSUInteger) count:aCount];
}

- (id)initUnsignedLongArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(unsigned long) count:aCount];
}

- (id)initUnsignedLongLongArray:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(unsigned long long) count:aCount];
}

#pragma types.h integer types

- (id)initInt8Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(int8_t) count:aCount];
}

- (id)initInt16Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(int16_t) count:aCount];
}

- (id)initInt32Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(int32_t) count:aCount];
}

- (id)initInt64Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(int64_t) count:aCount];
}

- (id)initUint8Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(uint8_t) count:aCount];
}

- (id)initUint16Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(uint16_t) count:aCount];
}

- (id)initUint32Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(uint32_t) count:aCount];
}

- (id)initUint64Array:(NSInteger)aCount {
    return [self initWithPrimitiveSize:sizeof(uint64_t) count:aCount];
}

- (void)dealloc {
    free(array);
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return count;
}

- (void)setCount:(NSUInteger)aCount {
    array = reallocf(array, primitiveSize*aCount);
    if (array == NULL)
        count = 0;
    else
        count = aCount;
}

- (BOOL *)boolArray {
    return (BOOL *)array;
}

- (char *)charArray {
    return (char *)array;
}

- (short *)shortArray {
    return (short *)array;
}

- (int *)intArray {
    return (int *)array;
}

- (NSInteger *)integerArray {
    return (NSInteger *)array;
}

- (long *)longArray {
    return (long *)array;
}

- (long long *)longLongArray {
    return (long long *)array;
}

- (float *)floatArray {
    return (float *)array;
}

- (double *)doubleArray {
    return (double *)array;
}

- (unsigned char *)unsignedCharArray {
    return (unsigned char *)array;
}

- (unsigned short *)unsignedShortArray {
    return (unsigned short *)array;
}

- (unsigned int *)unsignedIntArray {
    return (unsigned int *)array;
}

- (NSUInteger *)unsignedIntegerArray {
    return (NSUInteger *)array;
}

- (unsigned long *)unsignedLongArray {
    return (unsigned long *)array;
}

- (unsigned long long *)unsignedLongLongArray {
    return (unsigned long long *)array;
}

- (int8_t *)int8Array {
    return (int8_t *)array;
}

- (int16_t *)int16Array {
    return (int16_t *)array;
}

- (int32_t *)int32Array {
    return (int32_t *)array;
}

- (int64_t *)int64Array {
    return (int64_t *)array;
}

- (uint8_t *)uint8Array {
    return (uint8_t *)array;
}

- (uint16_t *)uint16Array {
    return (uint16_t *)array;
}

- (uint32_t *)uint32Array {
    return (uint32_t *)array;
}

- (uint64_t *)uint64Array {
    return (uint64_t *)array;
}

#pragma mark -
#pragma mark Indexers

- (BOOL)boolAtIndex:(NSInteger)index {
    BOOL *boolArray = array;
    return boolArray[index];
}

- (char)charAtIndex:(NSInteger)index {
    char *charArray = array;
    return charArray[index];
}

- (short)shortAtIndex:(NSInteger)index {
    short *shortArray = array;
    return shortArray[index];
}

- (int)intAtIndex:(NSInteger)index {
    int *intArray = array;
    return intArray[index];
}

- (NSInteger)integerAtIndex:(NSInteger)index {
    NSInteger *integerArray = array;
    return integerArray[index];
}

- (long)longAtIndex:(NSInteger)index {
    long *longArray = array;
    return longArray[index];
}

- (long long)longLongAtIndex:(NSInteger)index {
    long long *longLongArray = array;
    return longLongArray[index];
}

- (float)floatAtIndex:(NSInteger)index {
    float *floatArray = array;
    return floatArray[index];
}

- (double)doubleAtIndex:(NSInteger)index {
    double *doubleArray = array;
    return doubleArray[index];
}

- (unsigned char)unsignedCharAtIndex:(NSInteger)index {
    unsigned char *charArray = array;
    return charArray[index];
}

- (unsigned short)unsignedShortAtIndex:(NSInteger)index {
    unsigned short *shortArray = array;
    return shortArray[index];
}

- (unsigned int)unsignedIntAtIndex:(NSInteger)index {
    unsigned int *intArray = array;
    return intArray[index];
}

- (NSUInteger)unsignedIntegerAtIndex:(NSInteger)index {
    NSUInteger *integerArray = array;
    return integerArray[index];
}

- (unsigned long)unsignedLongAtIndex:(NSInteger)index {
    unsigned long *longArray = array;
    return longArray[index];
}

- (unsigned long long)unsignedLongLongAtIndex:(NSInteger)index {
    unsigned long long *longLongArray = array;
    return longLongArray[index];
}

#pragma types.h integer types

- (int8_t)int8AtIndex:(NSInteger)index {
    int8_t *intArray = array;
    return intArray[index];
}

- (int16_t)int16AtIndex:(NSInteger)index {
    int16_t *intArray = array;
    return intArray[index];
}

- (int32_t)int32AtIndex:(NSInteger)index {
    int32_t *intArray = array;
    return intArray[index];
}

- (int64_t)int64AtIndex:(NSInteger)index {
    int64_t *intArray = array;
    return intArray[index];
}

- (uint8_t)uint8AtIndex:(NSInteger)index {
    uint8_t *intArray = array;
    return intArray[index];
}

- (uint16_t)uint16AtIndex:(NSInteger)index {
    uint16_t *intArray = array;
    return intArray[index];
}

- (uint32_t)uint32AtIndex:(NSInteger)index {
    uint32_t *intArray = array;
    return intArray[index];
}

- (uint64_t)uint64AtIndex:(NSInteger)index {
    uint64_t *intArray = array;
    return intArray[index];
}

#pragma -
#pragma Bulk operations

- (void)clear {
    memset(array, 0, size);
}

@end
