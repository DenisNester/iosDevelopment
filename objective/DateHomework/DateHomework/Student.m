//
//  Student.m
//  DateHomework
//
//  Created by Denis Nesteruk on 2/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Student.h"

@implementation Student


-(NSDate*) getRandomBirthDate {
    NSInteger i = arc4random() % 34 +1969;
    NSInteger y = arc4random() % 28;
    NSInteger z = arc4random() % 12;
    
    NSDateComponents* components = [[NSDateComponents alloc]init];
    [components setDay:y];
    [components setMonth:z];
    [components setYear:i];
    NSDate* date = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    self.dateOfBirth = date;
    
    return self.dateOfBirth;
    
}





@end
