//
//  Object.m
//  TimeAndDate
//
//  Created by Denis Nesteruk on 2/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Object.h"

@interface Object()
@property (strong, nonatomic) NSTimer* timer;
@end




@implementation Object

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of Object was initialized");
        
        __weak id weakSelf = self; //не поможет,объект не будет уничтожен,т.к таймер его держит
        
        NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest:) userInfo:nil repeats:YES];
        [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]]; //  C КАКОГО МОМЕНТА БУДЕТ ЗАПУЩЕН ТАЙМЕР
        //    ОЧЕНЬ ВАЖНО! ТАЙМЕР РАНО ИЛИ ПОЗДНО НАДО УНИЧТОЖАТЬ
        self.timer = timer;
    }
    return self;
}




-(void) dealloc {
    [self.timer invalidate]; //dealloc всё-равно не будет вызван,т.к работает таймер
    NSLog(@"Object is deallocated");
}





-(void) timerTest:(NSTimer*) timer {
    //Исользовать scheduledTimerWithTimeInterval
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss:SSS"];
    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]); // [NSDate date] - текущая дата
    
    
//    [timer invalidate]; // таймер сработает только один раз и остановится
}



@end
