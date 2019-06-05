//
//  AppDelegate.m
//  BitwiseOperationsHomework
//
//  Created by Denis Nesteruk on 2/9/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
//    PUPIL
    
    NSMutableArray* students = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        Student* student = [[Student alloc]init];
        student.subjectType = 127 & arc4random() % 127 + 1; //random number from 0 to 7
        [students addObject:student];
    }
   NSLog(@"%@", students);
    
    
//    STUDENT
    
    
    NSMutableArray* humanists = [[NSMutableArray alloc]init];
    NSMutableArray* techies = [[NSMutableArray alloc]init];
    
    NSInteger programLearnersCount = 0;
    NSInteger humanistsCount = 0;
    NSInteger techiesCount = 0;
    

    for (Student* student in students) {
        
        
        if (student.subjectType & StudentSubjectHistory) {
            [humanists addObject:student];
            humanistsCount++;
        }
        
        if (student.subjectType & StudentSubjectEngineering) {
            [techies addObject:student];
            techiesCount++;
        }
        
        if (student.subjectType & StudentSubjectDevelopment) {
            programLearnersCount++;
        }
        
        if (student.subjectType & StudentSubjectPsychology) {
          student.subjectType =  ~(StudentSubjectPsychology);
            NSLog(@"Psychology was CANCELED!");
        }
        
    }
    
 
    NSLog(@"The number of students,who are techies is %ld", techiesCount);
    
    NSLog(@"The number of students,who are humanists is %ld", humanistsCount);
    
    NSLog(@"The number of students who learns development is %ld", programLearnersCount);
    
    
    
    
    
    
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
