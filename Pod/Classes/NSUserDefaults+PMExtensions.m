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
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
    [self setObject:data forKey:key];
    [self synchronize];
}

@end