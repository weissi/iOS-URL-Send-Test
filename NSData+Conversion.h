//
//  NSObject+NSData_Conversion.h
//  CommTestA
//
//  Created by Johannes Weiß on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (NSData_Conversion)

#pragma mark - String Conversion
- (NSString *)hexadecimalString;
+ (NSData *)dataFromHexadecimalString:(NSString *)string;

@end