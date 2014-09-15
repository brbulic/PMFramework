//
//  NSString+GenericHelpers.m
//  MLG.tv
//
//  Created by Bruno Bulić on 28/02/14.
//  Copyright (c) 2014 Bruno Bulić. All rights reserved.
//

#import "NSString+PMExtensions.h"
#import <objc/runtime.h>

@implementation NSString (PMExtensions)

@dynamic toUrl;

- (NSURL *)toUrl {
    NSURL * objectFromString = objc_getAssociatedObject(self, @selector(toUrl));
    
    if (!objectFromString) {
        objectFromString = [NSURL URLWithString:self];
        objc_setAssociatedObject(self, @selector(toUrl), objectFromString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return objectFromString;
}

+ (BOOL)isNullOrEmpty:(NSString *)string
{
    return string == nil
    || [string isKindOfClass:[NSNull class]]
    || ([string respondsToSelector:@selector(length)]
        && [(NSData *)string length] == 0)
    || ([string respondsToSelector:@selector(count)]
        && [(NSArray *)string count] == 0);
}

- (NSString *)urlEncode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    unsigned long sourceLen = strlen((const char *)source);
    for (unsigned long i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}



@end
