//
//  AppDelegate.m
//  Notifications
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
@interface AppDelegate ()
@property (strong, nonatomic) Government* government;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    синглтон - во всём приложении существует только один объект данного класса
//    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    
    //    ВОТ ТАК МЫ ПОДПИСЫВАЕМСЯ НА НОТИФИКАЦИЮ
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(governmentNotification:) name:GovernmentTaxLevelDidChangeNotification object:nil];
    
    Doctor* doctor = [[Doctor alloc]init];
    
    doctor.salary = self.government.salary;
    
    
    self.government = [[Government alloc]init];
    
    self.government.taxLevel = 5.5f;
    self.government.salary = 1100.f;
    self.government.pension = 550.f;
    self.government.averagePrice = 15.f;
    

    self.government.salary = 900.f;
    self.government.salary = 1100.f;
    self.government.salary = 1000.f;
    
    
    return YES;
}


-(void) governmentNotification:(NSNotification*) notification {
    NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}




//ВОТ ТАК ОТПИСЫВАЕМСЯ ОТ НОТИФИКАЦИЙ
-(void) dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:GovernmentTaxLevelDidChangeNotification object:nil]; Так отписываемся от одной нотификации
    [[NSNotificationCenter defaultCenter] removeObserver:self]; // вот так отписываемся от всех
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
