//
//  HODao.h
//  SmashIcons
//
//  Created by Bruno Bulić on 05/07/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSUserDefaults+PMExtensions.h"

@interface PMSerializable : NSObject<NSCoding>

- (BOOL)isValid;

- (void)defaultRule:(NSCoder *)aCoder;

@end
