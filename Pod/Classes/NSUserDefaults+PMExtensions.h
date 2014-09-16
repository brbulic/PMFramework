//
//  HODao.h
//  SmashIcons
//
//  Created by Bruno Bulić on 05/07/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (PMExtensions)

- (void)encodeObject:(id<NSCoding>)object forKey:(NSString *)key;
- (id<NSCoding>)decodeObjectForKey:(NSString *)key;

@end
