//
//  AppDelegate.m
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "DoctorsFriend.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Patient* patient1 = [[Patient alloc]init];
    Patient* patient2 = [[Patient alloc]init];
    Patient* patient3 = [[Patient alloc]init];
    Patient* patient4 = [[Patient alloc]init];
    Patient* patient5 = [[Patient alloc]init];
    Patient* patient6 = [[Patient alloc]init];
    
    
    patient4.name = @"Hertus";
    patient4.symptom = Headache;
    patient4.bodyPart = Head;
    
    patient5.name = @"Kasder";
    patient5.symptom = Temperature;
    patient5.bodyPart = Stomach;
    
    patient6.name = @"Yerts";
    patient6.symptom = Sorethroat;
    patient6.bodyPart = Throat;
    
    DoctorsFriend* doctorAlcoholic = [[DoctorsFriend alloc]init];
    
    doctorAlcoholic.name = @"All kinds of drinks";
    
    
    
    
    patient1.name = @"Mever";
    patient1.symptom = Headache;
    patient1.bodyPart = Head;
    
    patient2.name = @"Keler";
    patient2.symptom = Temperature;
    patient2.bodyPart = Stomach;
    
    patient3.name = @"Gunir";
    patient3.symptom = Sorethroat;
    patient3.bodyPart = Throat;
    
 
    
 

    
    
    NSArray* patients = [NSArray arrayWithObjects:
                         patient1,
                         patient2,
                         patient3,
                         patient6,
                         patient5,
                         patient4,
                         nil];
    
    
    BlockForPatient blockForPatient = ^(Patient* anyPatient, BodyPart anyBodyPart) {
       
        switch (anyBodyPart) {
                    case Head:
                        [anyPatient takeRinza];
                        break;
                    case Stomach:
                        [anyPatient takeAspirin];
                        break;
                    case Throat:
                        [anyPatient drinkHoneyWithTea];
                        break;
                        
                        
                    default:
                        break;
                }
    };
    
    
    
    
    for (Patient* patient in patients) {
        
        [patient becameWorse:blockForPatient];
        
        }
    
    
    
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
