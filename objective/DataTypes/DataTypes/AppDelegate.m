//
//  AppDelegate.m
//  DataTypes
//
//  Created by Denis Nesteruk on 1/30/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    ПРИМИТИВНЫЕ ТИПЫ НЕЛЬЗЯ КЛАСТЬ В МАССИВЫ ИЛИ ДИКШИНАРИ
    BOOL boolVar = YES;
    NSInteger intVar = 10;
    NSUInteger uIntVar = 5;
    CGFloat floatVar = 5.5f;
    double doubleVar = 2.5f;
    
//    Создание оболочки,чтобы можно было класть в массивы или дикшинари
    NSNumber* boolObject = [NSNumber numberWithBool:boolVar];
    NSNumber* intObject = [NSNumber numberWithInteger:intVar];
    NSNumber* uIntObject = [NSNumber numberWithUnsignedInteger:uIntVar];
    NSNumber* floatObject = [NSNumber numberWithFloat:floatVar];
    NSNumber* doubleObject = [NSNumber numberWithDouble:doubleVar];
    
    
    
    
    NSArray* array = [NSArray arrayWithObjects:boolObject, intObject, uIntObject, floatObject, doubleObject, nil];
    
//    ЧТОБЫ РАСПЕЧАТАТЬ НАШИ ЗНАЧЕНИЯ
    NSLog(@"boolVar = %d, intVar = %ld, uIntVar = %ld, floatVar = %f, doubleVar = %f",
          [[array objectAtIndex:0]boolValue],
          [[array objectAtIndex:1]integerValue],
          [[array objectAtIndex:2]unsignedIntegerValue],
          [[array objectAtIndex:3]floatValue],
          [[array objectAtIndex:4]doubleValue]
          );
    
    
//    Структуры тоже нельзя класть в массивы и дикшинари,поэтому тоже нужна оболчка (NSValue)
    CGPoint point1 = CGPointMake(3, 2);
    CGPoint point2 = CGPointMake(4, 6);
    CGPoint point3 = CGPointMake(1, 7);
    
    NSArray* array2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:point1],
                       [NSValue valueWithCGPoint:point2],
                       [NSValue valueWithCGPoint:point3],
                       nil];
    
    
    for (NSValue* value in array2) {
        CGPoint p  = [value CGPointValue];
        NSLog(@"point = %@", NSStringFromCGPoint(p)); 
    }
    
    
    
    /*
    NSLog(@"boolVar = %d, intVar = %ld, uIntVar = %ld, floatVar = %f, doubleVar = %f", boolVar, intVar, uIntVar, floatVar, doubleVar);
    */
    
    
    //С объектами
    /*
    Student* studentA = [[Student alloc]init];
    studentA.name = @"Good student";
    NSLog(@"Student A name = %@", studentA.name);
    
    
    Student* studentB = studentA;
    studentB.name = @"Worst student";
    NSLog(@"student A name = %@", studentA.name);
   */
    
    
    //C примитивными типами
    /*
    NSInteger a = 5;
    NSInteger b = a;
    b = 10;
    NSLog(@"a = %ld, b = %ld", a, b);
    
    NSInteger *c = &a;
    *c = 6;
    NSLog(@"a = %ld", a);
    */
    
//    taburetka a = 8;
    
    
    CGPoint point;
    point.x = 5.5f;
    point.y = 10.f;
//    point = CGPointMake(<#CGFloat x#>, <#CGFloat y#>);
    
    
    CGSize size;
    size.width = 3;
    size.height = 2;
//    size = CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
    
    CGRect rect; // прямоугольник
    rect.origin = point;
    rect.size = size;
    //    rect = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
    
//   BOOL result = CGRectContainsPoint(rect, point); попадает ли точка в данный прямоугольник
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
