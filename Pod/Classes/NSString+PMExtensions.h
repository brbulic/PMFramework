//
//  NSString+GenericHelpers.h
//  MLG.tv
//
//  Created by Bruno Bulić on 28/02/14.
//  Copyright (c) 2014 Bruno Bulić. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PMExtensions)

@property (nonatomic, readonly) NSURL * toUrl;

- (NSString *)urlEncode;

+ (BOOL)isNullOrEmpty:(NSString *)string;

@end
