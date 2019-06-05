//
//  AppDelegate.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"

#import "Jumpers.h"
#import "Swimmers.h"
#import "Runners.h"


#import "Human.h"
#import "Jumper.h"
#import "Swimmer.h"
#import "Runner.h"
#import "Crossfiter.h"


#import "Animal.h"
#import "Kangaroo.h"
#import "Crocodyle.h"
#import "Cheetah.h"
#import "Cat.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Cat* cat = [[Cat alloc]init];
    cat.nickname = @"Trixy";
    cat.birthplace = @"Canada";
    
    
    
    
    Crossfiter* crossfiter = [[Crossfiter alloc]init];
    crossfiter.name = @"Jason";
    crossfiter.age = 27;
    crossfiter.highestJump = 7.f;
    crossfiter.height = 81.f;
    crossfiter.distanceToSwim = 300;
    crossfiter.swimmingStyle = @"bbbbbutterfly";
    crossfiter.maxSpeed = 50;
    crossfiter.distanceToRun = 500;
    
    
    
    Jumper* jumper = [[Jumper alloc]init];
    
    jumper.name = @"Bivis";
    jumper.age = 22;
    jumper.height = 85.f;
    jumper.highestJump = 5.5f;
    
    
    Swimmer* swimmer = [[Swimmer alloc]init];
    
    swimmer.name = @"Michael";
    swimmer.age = 19;
    swimmer.distanceToSwim = 200;
    swimmer.swimmingStyle = @"free style";
    
    
    Runner* runner = [[Runner alloc]init];
    
    runner.name = @"Husein";
    runner.age = 24;
    runner.maxSpeed = 90;
    runner.distanceToRun = 10;
    
    
    
    
    
    Kangaroo* kangaroo = [[Kangaroo alloc]init];
    
    kangaroo.nickname = @"Kengo";
    kangaroo.birthplace = @"Australia";
    kangaroo.height = 90.f;
    kangaroo.highestJump = 8.f;
    
    
    
    Crocodyle* crocodyle = [[Crocodyle alloc]init];
    
    crocodyle.nickname = @"Django";
    crocodyle.birthplace = @"South America";
    crocodyle.distanceToSwim = 1000;
    crocodyle.swimmingStyle = @"Croco style";
    
    
    
    Cheetah* cheetah = [[Cheetah alloc]init];
    
    cheetah.nickname = @"Cheetos";
    cheetah.birthplace = @"Africa";
    cheetah.maxSpeed = 140;
    cheetah.distanceToRun = 2000;
    
    
    
    NSArray* arrayOfCreatures = [NSArray arrayWithObjects:cat, swimmer, cheetah, runner, kangaroo, jumper, crocodyle, crossfiter,  nil];
    
    
    for (id <Jumpers, Swimmers, Runners> creature in arrayOfCreatures) {
        
        if ([creature conformsToProtocol:@protocol(Jumpers)]) {
            
            
            if ([creature isKindOfClass:[Human class]]) {
                Human* human = (Human*) creature;
                NSLog(@"name = %@, age = %ld, height = %f, highestJump = %f", human.name, human.age, creature.height, creature.highestJump);
            }
            
            if ([creature isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*) creature;
                NSLog(@"nickname = %@, birthplace = %@, height = %f, highestJump = %f", animal.nickname, animal.birthplace, creature.height, creature.highestJump);
            }
               
            if ([creature respondsToSelector:@selector(getReadyBeforeJump)]) {
                [creature getReadyBeforeJump];
            }
            
            if ([creature respondsToSelector:@selector(jumpRecord)]) {
                NSLog(@"jump record is = %ld", [creature jumpRecord]);
            }
            [creature jump];
        }
        
        
        
        if ([creature conformsToProtocol:@protocol(Swimmers)]) {
            
            
            if ([creature isKindOfClass:[Human class]]) {
                Human* human = (Human*) creature;
                NSLog(@"name = %@, age = %ld, distanceToSwim = %ld, swimmingStyle = %@", human.name, human.age, creature.distanceToSwim, creature.swimmingStyle);
            }
            
            if ([creature isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*) creature;
                NSLog(@"nickname = %@, birthplace = %@, distanceToSwim = %ld, swimmingStyle = %@", animal.nickname, animal.birthplace, creature.distanceToSwim, creature.swimmingStyle);
            }
            
            if ([creature respondsToSelector:@selector(getReadyBeforeSwimming)]) {
                NSLog(@"%@", [creature getReadyBeforeSwimming]);
            }
            
            if ([creature respondsToSelector:@selector(swimLikeFish)]) {
               [creature swimLikeFish];
            }
            [creature swim];
        }
        
        
        
        
        
        if ([creature conformsToProtocol:@protocol(Runners)]) {
            
            
            if ([creature isKindOfClass:[Human class]]) {
                Human* human = (Human*) creature;
                NSLog(@"name = %@, age = %ld, maxSpeed = %ld, distanceToRun = %ld", human.name, human.age, creature.maxSpeed, creature.distanceToRun);
            }
            
            if ([creature isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*) creature;
                NSLog(@"nickname = %@, birthplace = %@, maxSpeed = %ld, distanceToRun = %ld", animal.nickname, animal.birthplace, creature.maxSpeed, creature.distanceToRun);
            }
            
            if ([creature respondsToSelector:@selector(getReadyBeforeRunning)]) {
                NSLog(@"%@", [creature getReadyBeforeRunning]);
            }
            
            if ([creature respondsToSelector:@selector(stopRunning)]) {
                [creature stopRunning];
            }
            [creature run];
        }
        
        
        if ([creature conformsToProtocol:@protocol(Jumpers)] &&
            [creature conformsToProtocol:@protocol(Runners)] &&
            [creature conformsToProtocol:@protocol(Swimmers)]) {
            
            NSLog(@"THIS PERSON IS ABSOLUTE INSANE");
            
            if ([creature isKindOfClass:[Human class]]) {
                Human* human = (Human*) creature;
                NSLog(@"name = %@, age = %ld, height = %f, highest jump = %f, distance to swim = %ld, swimming style = %@, maxSpeed = %ld, distance to run = %ld", human.name, human.age, creature.height, creature.highestJump, creature.distanceToSwim, creature.swimmingStyle, creature.maxSpeed, creature.distanceToRun);
            }
            [creature run];
            [creature swim];
            [creature jump];
            
        }
        
        if ([creature conformsToProtocol:@protocol(Jumpers)] &&
            [creature conformsToProtocol:@protocol(Runners)] &&
            [creature conformsToProtocol:@protocol(Swimmers)]) {
            
            NSLog(@"THIS PERSON IS ABSOLUTE INSANE");
            
            if ([creature isKindOfClass:[Human class]]) {
                Human* human = (Human*) creature;
                NSLog(@"name = %@, age = %ld, height = %f, highest jump = %f, distance to swim = %ld, swimming style = %@, maxSpeed = %ld, distance to run = %ld", human.name, human.age, creature.height, creature.highestJump, creature.distanceToSwim, creature.swimmingStyle, creature.maxSpeed, creature.distanceToRun);
            }
            [creature run];
            [creature swim];
            [creature jump];
            
        }
        
        if (![creature conformsToProtocol:@protocol(Jumpers)] &&
            ![creature conformsToProtocol:@protocol(Runners)] &&
            ![creature conformsToProtocol:@protocol(Swimmers)]) {
            
            NSLog(@"The laziest PERSON IN THE WORLD");
            if ([creature isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*) creature;
                NSLog(@"nickname = \n%@", animal.nickname);
            }
            
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
