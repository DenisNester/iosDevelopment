//
//  AppDelegate.m
//  Threads
//
//  Created by Denis Nesteruk on 2/23/19.
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
    
//    [[NSThread currentThread] isMainThread]; возвращает булевое значение,главный поток или нет
    
    /*
    for (int i = 0; i < 10; i++) {
        NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
        thread.name = [NSString stringWithFormat:@"Thread # %d", i + 1];
        [thread start];
    }
    */
    
    
    
    
    
    
    
    /*
    NSThread* thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
    NSThread* thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"y"];
    
    thread1.name = @"Thread 1";
    thread2.name = @"Thread 2";
    [thread1 start];
    [thread2 start];
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
    
    self.array = [NSMutableArray array];
    */
    
//    GRAND CENTRAL DISPATCH
//    NSOperation метод работы с потоками
    
    
//    принимает очередь и принимает блок( очередь это stack блоков)
    /*
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ stared", [[NSThread currentThread] name]);
        
        
        for (int i = 0; i < 200000; i++) {
            
        }
        
//        если нам что-то нужно вывести после всех операций на экран
        
        dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        });
        
        
    });
     

    */
    
    //     С крестиками и ноликами
    
    self.array = [NSMutableArray array];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    если мы не хотим использовать глобальную очередь, а хотим создать свою
    //SERIAL - по очереди, concurent - одновременно
    dispatch_queue_t queue = dispatch_queue_create("com.repeatThreads.queue", DISPATCH_QUEUE_SERIAL);
    
//    Если наш селф можем прожить меньше,чем сам блок,то лучше сделать слабую ссылку на селф
    
    __weak id weakSelf = self;
    
    dispatch_async(queue, ^{
        [self addStringToArray:@"x"];
    });
    
    dispatch_async(queue, ^{
        [self addStringToArray:@"0"];
    });
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
//           UI refresh
        });
    });
    
    /*
    NSOperation* operation;
    NSOperationQueue
    */
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
    
    
    return YES;
}

-(void) addStringToArray:(NSString*) string {
    
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ stared", [[NSThread currentThread] name]);
        
        @synchronized (self) { // ставится замок - какой первый поток дойдёт сюда,поставится замок и следующий поток будет ждать,пока закончится первый
            
            NSLog(@"%@ calculations stared", [[NSThread currentThread] name]);
            
            for (int i = 0; i < 20; i++) {
                [self.array addObject:string];
            }
            
            NSLog(@"%@ calculations ended", [[NSThread currentThread] name]);
        }
        
       
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
    
    
}

-(void) printArray {
    NSLog(@"%@", self.array);
}




-(void) testThread {

    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ stared", [[NSThread currentThread] name]);
        
        
        for (int i = 0; i < 20000000; i++) {
          
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
