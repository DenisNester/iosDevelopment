//
//  AppDelegate.m
//  BlocksHomework
//
//  Created by Denis Nesteruk on 2/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

typedef void (^HomeworkBlock)(void);


#import "AppDelegate.h"
#import "Student.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    Pupil
    
    
//    1.Block wihout returnable parameter
    void (^blockOne)(void) = ^() {
        NSLog(@"block without returnable variable");
    };
    
    blockOne();
    
    
    
    
//    1.2 Block with returnable parameter
    NSString* (^blockTwo)(void) = ^() {
        return [NSString stringWithFormat:@"block with returnable varible NSSTRING"];
    };
    
    NSString* result = blockTwo();
    NSLog(@"result = %@", result);
    
    
    
    
//    1.3 Block without returnable parameter and passed parameter NSString
    void (^blockThree)(NSString* string) = ^(NSString* string) {
        NSLog(@"block withou returnable parameter and passed parameter NSString %@", string);
    };
    
    blockThree(@"the string from test");
    
//   1.4  Block with returnable parameter and passed parameter
    NSString* (^blockFour)(NSString* string) = ^(NSString* string) {
        return [NSString stringWithFormat:@"what string? %@", string];
    };
    NSString* resultOfBlockFour = blockFour(@"THIS STRING");
    NSLog(@"result of block four = %@", resultOfBlockFour);
    
    
    
//    4 Create method with block
    HomeworkBlock brickBlock = ^() {
        NSLog(@"dat block is for method");
    };
    
    [self testMethodWithBlockHomework:brickBlock];
    
    
    
    
//    STUDENT
    

    Student* student1 = [[Student alloc]init];
    Student* student2 = [[Student alloc]init];
    Student* student3 = [[Student alloc]init];
    Student* student4 = [[Student alloc]init];
    Student* student5 = [[Student alloc]init];
    Student* student6 = [[Student alloc]init];
    Student* student7 = [[Student alloc]init];
    Student* student8 = [[Student alloc]init];
    Student* student9 = [[Student alloc]init];
    Student* student10 = [[Student alloc]init];
    
    
    student1.name = @"Glen";
    student2.name = @"Tlen";
    student3.name = @"Plen";
    student4.name = @"Zlen";
    student5.name = @"Rlen";
    student6.name = @"Nlen";
    student7.name = @"Mlen";
    student8.name = @"Flen";
    student9.name = @"Vlen";
    student10.name = @"Xlen";
    
    student1.lastname = @"Apple";
    student2.lastname = @"Popest";
    student3.lastname = @"Apple";
    student4.lastname = @"Joips";
    student5.lastname = @"Keaslsa";
    student6.lastname = @"Qasd";
    student7.lastname = @"Mokicsa";
    student8.lastname = @"Nerrts";
    student9.lastname = @"Qasd";
    student10.lastname = @"Kilorp";
    
    NSArray* studentsArray = [NSArray arrayWithObjects:
                              student10,
                              student9,
                              student3,
                              student7,
                              student4,
                              student6,
                              student5,
                              student8,
                              student2,
                              student1,
                              nil];
    
    NSArray* sortedArray = [studentsArray sortedArrayUsingComparator:^NSComparisonResult(id  obj1, id  obj2) {
        NSString *key1, *key2;
        
        key1 = [obj1 lastname];
        key2 = [obj2 lastname];
        
       
        if ([key1 isEqualToString:key2]) {
            key1 = [obj1 name];
            key2 = [obj2 name];
            return NSOrderedDescending;
        }
        
        
        /*
        if ([obj1 lastname] == [obj2 lastname]) {
            return [[obj1 name] compare:[obj2 name]];
        } else {
            return [[obj1 lastname] compare:[obj2 lastname]];
        }
        */
        
        
        return [key1 caseInsensitiveCompare:key2];
    }];
    
    
    for (Student* student in sortedArray) {
        NSLog(@"student name = %@, student lastname = %@", student.name, student.lastname);
    }
    
    
    return YES;
}



-(void) testMethodWithBlockHomework:(HomeworkBlock) testBlock {
    NSLog(@"Only for homework");
    testBlock();
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
