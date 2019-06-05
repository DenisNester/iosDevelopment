//
//  AppDelegate.m
//  DictionariesHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    Player* player1 = [[Player alloc]init];
    Player* player2 = [[Player alloc]init];
    Player* player3 = [[Player alloc]init];
    Player* player4 = [[Player alloc]init];
    Player* player5 = [[Player alloc]init];
    Player* player6 = [[Player alloc]init];
    
    
    player1.name = @"Stephen";
    player1.lastname = @"Curry";
    player1.greetings = @"Golden State Warriors";
    
    player2.name = @"Lebron";
    player2.lastname = @"James";
    player2.greetings = @"Los Angeles Lakers";
    
    
    player3.name = @"Gilbert";
    player3.lastname = @"Arenas";
    player3.greetings = @"Washington Wizards";
    
    
    player4.name = @"Ray";
    player4.lastname = @"Allen";
    player4.greetings = @"Boston Celtics";
    
    
    player5.name = @"Allen";
    player5.lastname = @"Iverson";
    player5.greetings = @"Philadelphia 76 sixers";
    
    player6.name = @"Carmelo";
    player6.lastname = @"Anthony";
    player6.greetings = @"New York Knicks";
    
    
    
    
    
    
    
    NSDictionary* nbaJournal = [NSDictionary dictionaryWithObjectsAndKeys:
                                player1, [player1.name stringByAppendingString:player1.lastname],
                                player2, [player2.name stringByAppendingString:player2.lastname],
                                player3, [player3.name stringByAppendingString:player3.lastname],
                                player4, [player4.name stringByAppendingString:player4.lastname],
                                player5, [player5.name stringByAppendingString:player5.lastname],
                                player6, [player6.name stringByAppendingString:player6.lastname],
                                nil];
    
    
//    NSLog(@"%@", nbaJournal);
    
    
    //STUDENT
    
    for (NSString* key in [nbaJournal allKeys]) {
        /*
        id obj = [nbaJournal objectForKey:key];
        NSLog(@"name = %@, lastname = %@, greetings = %@", [obj name], [obj lastname], [obj greetings]);
         */
        //Так как мы знаем,что там одни player - можем сделать так
        Player* player = [nbaJournal objectForKey:key];
        NSLog(@"name = %@, lastname = %@, greetings = %@", player.name, player.lastname, player.greetings);
        
    }

    NSLog(@"MASTER IS HERE");
    //Сортировка dictionary по ключам
    
    NSArray* keysArray = [nbaJournal allKeys];
    NSArray* sortedKeys = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];

    
    for (NSString* key in sortedKeys) {
        Player* player = [nbaJournal objectForKey:key];
        NSLog(@"name = %@, lastname = %@, greetings = %@", player.name, player.lastname, player.greetings);
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
