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

- (id<NSCoding>)decodeObjectForKey:(NSString *)key withError:(NSError *__autoreleasing *)error {
    NSParameterAssert(key);
    
    NSData * data = [self objectForKey:key];
    if (!data) {
        return nil;
    }
    
    
    id result;
    
    @try {
        result = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if (result) {
            BOOL doesConform = [result conformsToProtocol:@protocol(NSCoding)];
            if (!doesConform) {
                NSError * retEr = [NSError errorWithDomain:@"Doesn't conform to NSCoding, how did it get here?" code:-1 userInfo:@{}];
                *error = retEr;
            }
        } else {
            NSLog(@"We have a nil result here");
            NSError * rE = [NSError errorWithDomain:@"Result is nil!" code:-1 userInfo:@{}];
            *error = rE;
        }
    }
    @catch (NSException *exception) {
        NSError * returnedError = [NSError errorWithDomain:exception.description code:exception.hash userInfo:exception.userInfo];
        *error = returnedError;
    }
    
    return result;
}


@end