//
//  AppDelegate.m
//  Selectors
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Object.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    Грубо говоря selector - это указатель на метод.(Точнее просто имя метода)
//    [self testMethod];
    
    SEL selector1 = @selector(testMethod);
    [self performSelector:selector1]; //performSelector вызывает метод по этому селектору
    
    
    //    WithObject: не может вернуть нам примитивный тип!!!Даже если обернуть оболочкой NSNumber
    SEL selector2 = @selector(testMethod:);
    [self performSelector:selector2 withObject:@"test string"];
    
    SEL selector3 = @selector(testMethod:parameter2:);
    [self performSelector:selector3 withObject:@"test string one" withObject:@"test string two"];
    
    
//    вызвать селектор с задержкой
    [self performSelector:selector1 withObject:nil afterDelay:5.f];
    
    
    
    SEL selector4 = @selector(testMethodParameter1:);
    [self performSelector:selector4 withObject:[NSNumber numberWithInteger:6]];
    
    
    
    
//    Чтобы показать,что селектор не привязан к классам.Это просто название метода
    Object* object = [[Object alloc]init];
    [object performSelector:selector1];
    
    
//    Если узнали про секретный метод объекта Object
    //NSLog(@"%@", [object performSelector:@selector(superSecretText)]);
    NSString* string = [object performSelector:@selector(superSecretText)];
    NSLog(@"Secret is %@", string);
    
    
    
//    Из селекторов можно создавать строки.SELECTOR нельзя поместить в массив
//    Тут мы из селектора сделали строку,а потом из строки сделали селектор
    NSString* a = NSStringFromSelector(selector1);
    SEL sel = NSSelectorFromString(a);
    
    
    
    
    return YES;
}

//метод без параметра selector1
-(void) testMethod {
    NSLog(@"Test method");
}

//метод с параметром selector2
-(void) testMethod:(NSString*) string {
    NSLog(@"testMethod: %@", string);
}
//метод с двумя параметрами selector3
-(void) testMethod:(NSString*) string parameter2:(NSString*) string2 {
    NSLog(@"testMethod:parameter2 %@, %@", string, string2);
}



-(void) testMethodParameter1:(NSInteger) intValue {
    NSLog(@"test methodParameter1: %ld", intValue);
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
