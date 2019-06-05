//
//  Doctor.m
//  Notifications
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"
@implementation Doctor


#pragma mark - Initialization

//при создании доктора сразу подпишем его на нотификации
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(salaryChangedNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
        
        [nc addObserver:self selector:@selector(averagePriceChangedNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
    }
    return self;
}


//когда объект "умирает" - отписывается от нотификаций
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Notifications

-(void) salaryChangedNotification:(NSNotification*) notification {
//    Когда правительство изменит зарплату,соответственно и у нашего доктора изменится зарплата
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
   
    
    
    if (salary < self.salary) {
        NSLog(@"Doctors are unhappy");
    } else {
        NSLog(@"Doctors are happy");
    }
    
     self.salary = salary;
}



-(void) averagePriceChangedNotification:(NSNotification*) notification {
    
}



@end
