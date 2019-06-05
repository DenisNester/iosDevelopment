//
//  Government.m
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 10;
        _pension = 1000;
        _averagePrice = 20;
    }
    return self;
}


-(void) setTaxLevel:(NSInteger)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary =  [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:taxLevel] forKey:GovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification object:nil userInfo:dictionary];
    
}


-(void) setPension:(NSInteger)pension {
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:pension] forKey:GovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification object:nil userInfo:dictionary];
    
    
    
}


-(void) setAveragePrice:(NSInteger)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification object:nil userInfo:dictionary];
    
    
}





@end
