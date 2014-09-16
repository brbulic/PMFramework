//
//  HODao.m
//  SmashIcons
//
//  Created by Bruno Bulić on 05/07/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//


#import "NSUserDefaults+PMExtensions.h"

@implementation NSUserDefaults (PMExtensions)

- (void)encodeObject:(id<NSCoding>)object forKey:(NSString *)key {
    NSParameterAssert(object);
    NSParameterAssert(key);
    
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
    [self setObject:data forKey:key];
    [self synchronize];
}

- (id<NSCoding>)decodeObjectForKey:(NSString *)key {
    NSParameterAssert(key);
    
    NSData * data = [self objectForKey:key];
    if (!data) {
        return nil;
    }
    
    id result = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (result) {
        __unused BOOL doesConform = [result conformsToProtocol:@protocol(NSCoding)];
        NSAssert(doesConform, @"The extracted object must conform to NSCoding protocol!");
        
        return result;
    }
    
    NSLog(@"We have a nil result here");
    
    return nil;
}


@end