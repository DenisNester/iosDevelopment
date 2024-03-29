//
//  NSString+Random.m
//  TableViewSearch
//
//  Created by Denis Nesteruk on 5/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)


+ (NSString *)randomAlphanumericString {
    
    int length = arc4random() % 11 + 5; //длина строки от 5 до 15 
    
    return [self randomAlphanumericStringWithLength:length];
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz";//ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //0123456789
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}




@end
