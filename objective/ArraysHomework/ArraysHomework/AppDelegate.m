//
//  AppDelegate.m
//  ArraysHomework
//
//  Created by Denis Nesteruk on 1/30/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"

#import "Animal.h"
#import "Cat.h"
#import "Dog.h"


#import "Human.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Crossfiter.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Cyclist* cyclist = [[Cyclist alloc]init];
    Runner* runner = [[Runner alloc]init];
    Swimmer* swimmer = [[Swimmer alloc]init];
    Crossfiter* crossfiter = [[Crossfiter alloc]init];
    
    Cat* cat = [[Cat alloc]init];
    Dog* dog = [[Dog alloc]init];
    
    
    cat.nickname = @"Cegas";
    cat.age = 3;
    
    dog.nickname = @"Aver";
    dog.age = 1;
    
    
    cyclist.name = @"Michael";
    cyclist.height = 1.90f;
    cyclist.weight = 80.f;
    cyclist.gender = Male;
    
    
    runner.name = @"Blash";
    runner.height = 1.80f;
    runner.weight = 75.f;
    runner.gender = Male;
    
    
    swimmer.name = @"Florida";
    swimmer.height = 1.70f;
    swimmer.weight = 55.f;
    swimmer.gender = Female;
    
    crossfiter.name = @"Jason";
    crossfiter.height = 2.00;
    crossfiter.weight = 95.f;
    crossfiter.gender = Male;
    crossfiter.totalPower = 1000;
    crossfiter.country = @"USA";
    
    ///  ***SUPERMAN***
    
    NSArray* arrayOfCreatures = [NSArray arrayWithObjects:  swimmer, dog, runner, cat, crossfiter,  cyclist, nil];
    
    
    NSArray* sortedArray = [arrayOfCreatures sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
       
        
        /*
          NSString *key1, *key2;
         
        if ([obj1 isKindOfClass:[Human class]]) {
            key1 = [obj1 name];
        } else {
            key1 = [obj1 nickname];
        }
        
        if ([obj2 isKindOfClass:[Animal class]]) {
            key2 = [obj2 nickname];
        } else {
            key2 = [obj2 name];
        }
         
          return [key1 caseInsensitiveCompare:key2];
        */
        
        if ([obj1 isKindOfClass:[Human class]] && [obj2 isKindOfClass:[Human class]]) {
            return [[(Human*) obj1 name] compare:[(Human*) obj2 name]];
            
        } else if ([obj1 isKindOfClass:[Animal class]] && [obj2 isKindOfClass:[Animal class]]) {
            return [[(Animal*) obj1 nickname] compare:[(Animal*) obj2 nickname]];
        
        } else if ([obj1 isKindOfClass:[Human class]]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
        
        
        
       
        
    }];
    
    for (id creature in sortedArray) {
        
        if ([creature isKindOfClass:[Human class]]) {
            Human* human = (Human*) creature;
            NSLog(@"name = %@", human.name);
        }
        
        if ([creature isKindOfClass:[Animal class]]) {
            Animal* animal = (Animal*) creature;
            NSLog(@"nickname = %@", animal.nickname);
        }
    }
    
    
    
    // ***STAR***
    
    /*
    NSArray* arrayOfHumans = [NSArray arrayWithObjects:crossfiter, swimmer, runner, cyclist, nil];
    NSArray* arrayOfAnimals = [NSArray arrayWithObjects:cat, dog, nil];
    
    
    NSInteger humansCount = [arrayOfHumans count];
    NSInteger animalsCount = [arrayOfAnimals count];
    
    NSInteger creaturesCount = MAX(humansCount, animalsCount);
    
    
    for (int i = 0; i < creaturesCount; i++) {
        
        if (i < humansCount) {
            Human* human = [arrayOfHumans objectAtIndex:i];
            NSLog(@"name = %@", human.name);
        }
        
        if (i < animalsCount) {
            Animal* animal = [arrayOfAnimals objectAtIndex:i];
            NSLog(@"nickname = %@", animal.nickname);
        }
        
    }
  */
    
    
    
    /// ***MASTER***
    /*
     
     
       NSArray* arrayOfCreatures = [NSArray arrayWithObjects:swimmer, runner, cyclist, crossfiter, cat, dog, nil];
     
     
     
    for (id creature in arrayOfCreatures) {
        
        if ([creature isKindOfClass:[Animal class]]) {
            NSLog(@"ANIMAL!!!!!");
            Animal* animal = (Animal*) creature;
            NSLog(@"nickname = %@, age = %ld", animal.nickname, animal.age);
        }
        
        
        if ([creature isKindOfClass:[Human class]]) {
            NSLog(@"HUMAN!!!!!!");
            Human* human = (Human*) creature;
            NSLog(@"name = %@, height = %f, weight = %f, gender = %u", human.name, human.height, human.weight, human.gender);
            
            
         if ([creature isKindOfClass:[Crossfiter class]]) {
            Crossfiter* crossfiter = (Crossfiter*) creature;
            NSLog(@"country = %@, total power = %ld", crossfiter.country, crossfiter.totalPower);
        }
        
    }
        [creature movement];
    }
    */
    
    
    
    
    
    ///  ***PUPIL***
    
    /*
    NSArray* arrayOfSportsmens = [NSArray arrayWithObjects:
                                  cyclist,
                                  runner,
                                  crossfiter,
                                  swimmer,
                                  nil];
    
    NSArray* reversedArray = [[arrayOfSportsmens reverseObjectEnumerator]allObjects];
    
    
    
    for (Human* sportsmen in reversedArray) {
        NSLog(@"name = %@, height = %f, weight = %f, gender = %u", sportsmen.name, sportsmen.height, sportsmen.weight, sportsmen.gender);
        NSLog(@"index = %lu", [arrayOfSportsmens indexOfObject:sportsmen]);
        
        if ([sportsmen isKindOfClass:[Crossfiter class]]) {
            NSLog(@"total power = %ld, country = %@", crossfiter.totalPower, crossfiter.country);
        }
        [sportsmen movement];
    }
    */
    
    
    
    
    
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
