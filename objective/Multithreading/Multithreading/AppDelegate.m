//
//  AppDelegate.m
//  Multithreading
//
//  Created by Denis Nesteruk on 2/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSMutableArray* array;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self performSelectorInBackground:@selector(testThread) withObject:nil];
   
//    Создание потока
    
    
//    [[NSThread currentThread] isMainThread]; возвращает булевое значение - на главном потоке или нет
    
    
    /*
    for (int i = 0; i < 50; i++) {
        NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
        thread.name = [NSString stringWithFormat:@"Thread #%d", i + 1];
        [thread start];
    }
    */
    
    /*
    self.array = [NSMutableArray array];
    
    NSThread* thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
    NSThread* thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
    thread1.name = [NSString stringWithFormat:@"Thread 1"];
    thread2.name = [NSString stringWithFormat:@"Thread 2"];
    [thread1 start];
    [thread2 start];
    
   
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    */
    
    
//    GRAND CENTRAL DISPATCH - ЗАЖУЖЛИТЬ
    
    //    принимает queue(очередь)  и принимает блок.Очередь это stack блоков(parovoz :)
    /*
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        double startTime = CACurrentMediaTime(); //сколько длился по времени поток
        
        NSLog(@"%@ starts", [[NSThread currentThread] name]);
        
        
        for (int i = 0; i < 200000; i++) {
            }
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        });
    });
    */
    
    self.array = [NSMutableArray array];
//    Создание своей очереди
//    SERIAL поочереди,CONCURENT - одновременно
    dispatch_queue_t queue = dispatch_queue_create("com.rune.testthreads.queue", DISPATCH_QUEUE_SERIAL);
    
    
    
    
//    _weak id weakSelf = self; это в том случае,если объект проживёт меньше,чем наш блок
    
//    Глобальная очередь
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self addStringToArray:@"x"];
    });
    dispatch_async(queue, ^{
        [self addStringToArray:@"0"];
    });
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
//            UI graphics refresh
        });
    });
    
    /*
    NSOperation* operation;
    NSOperationQueue;
    */
    
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
    return YES;
}


-(void) addStringToArray:(NSString*) string {
    
    
    @autoreleasepool {
    
       
        double startTime = CACurrentMediaTime(); //сколько длился по времени поток
        
        NSLog(@"%@ starts", [[NSThread currentThread] name]);
        
//        Ставится замок.Какой из первых потоков добирается первым - тот начинает заполнять массив,второй становится в очередь
//        @synchronized (self) {
        
            NSLog(@"%@ calculations started", [[NSThread currentThread] name]);
            
            for (int i = 0; i < 10; i++) {
                [self.array addObject:string];
            }
            NSLog(@"%@ calculations ended", [[NSThread currentThread] name]);
//        }
        
        
         NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
        
    
    }
    





-(void) printArray {
    NSLog(@"%@", self.array);
}




-(void) testThread {
    
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime(); //сколько длился по времени поток
    
        NSLog(@"%@ starts", [[NSThread currentThread] name]);
        
        
    for (int i = 0; i < 200000; i++) {
        
    }
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        
    }
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
