//
//  AppDelegate.m
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Dancer.h"
#import "Student.h"
#import "Developer.h"

#import "Patient.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    Dancer* dancer1 = [[Dancer alloc]init];
    Dancer* dancer2 = [[Dancer alloc]init];
    Student* student1 = [[Student alloc]init];
    Student* student2 = [[Student alloc]init];
    Developer* developer = [[Developer alloc]init];
    
    dancer1.name = @"Palma";
    dancer2.name = @"Blow";
    
    student1.name = @"Kiwi";
    student2.name = @"Cherry";
    
    developer.name = @"Mr Robot";
    
    
    
    dancer1.favouriteDance = @"Chacha";
    dancer2.favouriteDance = @"Rumba";
    
    student1.univercityName = @"BNTU";
    student2.univercityName = @"BSEU";
    
    developer.workLanguage = @"Swift";
    
    
    NSObject* fake = [[NSObject alloc]init];
    
    NSArray* patients = [NSArray arrayWithObjects:
                         fake,
                         dancer2,
                         dancer1,
                         student1,
                         student2,
                         developer,
                         nil];
    
    
    for (id <Patient> patient in patients) {
        
        if ([patient conformsToProtocol:@protocol(Patient)]) {
            
            NSLog(@"Patient name = %@", patient.name);
            
            if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
                NSLog(@"How is your family ? \n%@", [patient howIsYourFamily]);
            }
            
            if ([patient respondsToSelector:@selector(howIsYourJob)]) {
                NSLog(@"How is your job? \n%@", [patient howIsYourJob]);
            }
            
            
            if (![patient areYouOk]) {
                [patient takePill];
                
                if (![patient areYouOk]) {
                    [patient makeShot];
                }
                
            }
            
            
            
        } else {
            NSLog(@"FAKE!!!!!!!");
        }
        
        
    
        
        
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
