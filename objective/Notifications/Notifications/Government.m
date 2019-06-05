//
//  Government.m
//  Notifications
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";


NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";



@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000.f;
        _pension = 500.f;
        _averagePrice = 10.f;
    }
    return self;
}

//Переопределяем сеттеры
-(void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
//    Мы не можем положить taxLevel в дикшинари(т.к примитивный тип),поэтому создаём оболочку
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:GovernmentAveragePriceUserInfoKey];
// Вот так мы пошлём нотификацию о том,что наш taxLevel изменился
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification object:nil userInfo:dictionary];
}


-(void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:GovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification object:nil userInfo:dictionary];
    
    
}


-(void) setPension:(CGFloat)pension {
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:GovernmentPensionUserInfoKey];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification object:nil userInfo:dictionary];
    
}



-(void) setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:GovernmentAveragePriceUserInfoKey];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification object:nil userInfo:dictionary];
    
    
}





@end
