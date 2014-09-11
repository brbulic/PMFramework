//
//  HODao.m
//  SmashIcons
//
//  Created by Bruno Bulić on 05/07/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//

#import "PMSerializable.h"
#import "PMPracticFunction.h"
#include <objc/runtime.h>

@implementation PMSerializable


+ (NSString *)generateKeyForPropertyName:(NSString *)propName {
    NSString * stringFromClass = NSStringFromClass(self);
    return [NSString stringWithFormat:@"%@_%@", stringFromClass, propName];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [[[self class] propertyNamesFromClass] forEach:^(NSString * element) {
            NSString *keyForPropertyName = [[self class] generateKeyForPropertyName:element];
            id value = [aDecoder decodeObjectForKey:keyForPropertyName];
            [self setValue:value forKey:element];
        }];
    }
    
    return self;
}

- (BOOL)isValid {
    return NO;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self defaultRule:aCoder];
}

- (void)defaultRule:(NSCoder *)aCoder {
    if (![self isValid]) return;
    
    NSArray * propNames = [[self class] propertyNamesFromClass];
    [propNames forEach:^(NSString * element) {
        NSString *keyForPropertyName = [[self class] generateKeyForPropertyName:element];
        [aCoder encodeObject:[self valueForKey:element] forKey:keyForPropertyName];
    }];
}

+ (NSArray *)propertyNamesFromClass {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:outCount];
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
            [arr addObject:propertyName];
        }
    }
    free(properties);
    
    return [NSArray arrayWithArray:arr];
}

@end
