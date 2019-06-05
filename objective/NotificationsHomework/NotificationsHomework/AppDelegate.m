//
//  AppDelegate.m
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"

#import "Pensioner.h"
#import "Businessman.h"
@interface AppDelegate ()
@property (strong, nonatomic) Government* government;
@property (strong, nonatomic) Pensioner* pensioner;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.government = [[Government alloc]init];
    
    self.pensioner = [[Pensioner alloc]init];
    self.pensioner.name = @"Grandfather Teddy";
    
    Businessman* businessman = [[Businessman alloc]init];
    businessman.name = @"Wolf from walk street";
    
    self.government.pension = 1200;
    self.government.taxLevel = 5;
    
    
    
    
    
    
    
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
