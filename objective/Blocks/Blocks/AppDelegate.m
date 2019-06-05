//
//  AppDelegate.m
//  Blocks
//
//  Created by Denis Nesteruk on 2/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

//создаём свой собсветнный тип блоков
typedef void (^OurTestBlock)(void);

//typedef NSString* (^OurTestBlock2)(NSInteger);

#import "AppDelegate.h"
#import "Object.h"



@interface AppDelegate ()
//БЛОКИ ДОЛЖНЫ БЫТЬ ТОЛЬКО COPY
@property (copy, nonatomic) OurTestBlock testBlock;
@property (strong, nonatomic) NSString* name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    Блок - это объект(который сохраняет кусок кода из метода,который можно потом использовать n-ое количество раз)
    
    /*
    [self testMethod];
    
    
    
    [self testMethodWithParams:@"Gogogog" value:6];
    
    
    
    NSLog(@"Test method 3 = %@", [self testMethodWithReturnValueAndParams:@"Test method" value:1000]);
     
     NSString* result = [self testMethodWithReturnValueAndParams:@"test method" value:333];
     NSLog(@"result = %@", result);
    */
    
    
    
   /*
    
    //    BLOOOOOOOCKS!
//    блок,который ничего не возвращает и ничего не принимает
    //1 возвращаемое значение,потом идёт название блока,потом тип возвращаемой переменной
    void (^testBlock)(void);
//    initialization
    testBlock = ^{
        NSLog(@"test block");
    };
    //    Вызов блока
    testBlock();
    
    
//    Блок 2 с принимаемым параметром
//    создание и инициализация водно действие
    void (^testBlockWithParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
        NSLog(@"test Block With Params: %@ %ld", string, intValue);
    };
//    Вызов блока
    testBlockWithParams(@"test string", 6);
    
    
    
    
    //Блок 3 с принимаемым и возвращаемым параметрами
    NSString* (^testBlockWithReturnValueAndParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
            return [NSString stringWithFormat:@"testMethodWithReturnValueAndParams: %@ %ld", string, intValue];
    };
//    Вызов блока
    NSString* result = testBlockWithReturnValueAndParams(@"test block", 1333);
    NSLog(@"result = %@", result);
    
    */
    
    
   
    /*
//    взяли переменную из вне и подставили в блок!!!В методе такое не прокатит.+Мы можем эту строку в блоке поменять
    __block NSString* testString = @"How is it possible";
    __block NSInteger i = 0; // ЭТО ЗНАЧИТ,ЧТО ПЕРЕМЕННАЯ БУДЕТ ИЗМЕНЯТЬСЯ В БЛОКЕ
    
    
    void (^testBlock2)(void) = ^() {
        NSLog(@"test block 2");
        i = i + 1;
        testString = [NSString stringWithFormat:@"How is it possible? %ld", i];
        NSLog(@"test string = %@", testString);
        };
    
    testBlock2();
    testBlock2();
    testBlock2();
    */
    
  
//    НЕ РАБОТАЕ СОЗДАННЫЙ ТИП БЛОКОВ С NSSTRING
    /*
    OurTestBlock2 tb = ^(NSInteger intValue) {
        return [NSString stringWithFormat:@"%ld", intValue];
    };
    NSLog(@"%@", tb(5));
    */
    
    
    /*
//  Вызовем метод,который принимает блок
    [self testBlocksMethod:^{
        NSLog(@"BLOOOCK!");
    }];
    
    
    
//    Определяем наш созданный тип блоков
    OurTestBlock testBlock2 = ^{
        NSLog(@"Block 2!!!");
    };
    
//    Вызов метода с созданным типом блока OurTestBlock
    [self testBlocksMethod2:testBlock2];
    
    */
    
    
    /*
    Object* obj = [[Object alloc]init];
    obj.name = @"OBJECT NAME";
    
//    Если сделать так,то объект БУДЕТ УНИЧТОЖЕН
    __weak Object* weakObj = obj;
    
//     !!!!!!!!НА ВСЁ,ЧТО ПОПАДАЕТ В БЛОК,СОЗДАЁТСЯ STRONG ссылка!!ПОЭТОМУ ЭТИ ОБЪЕКТЫ/ПРИМИТИВНЫЕ ТИПЫ НЕ МОГУТ БЫТЬ УДАЛЕНЫ
    self.testBlock = ^ {
        NSLog(@"name = %@", weakObj.name);
    };
    
    self.testBlock();
    */

    Object* obj1 = [[Object alloc]init];
    obj1.name = @"OBJECT NAME ONE";
    
//  имя appDelegate
    self.name = @"Hello";
    
    /*
    [obj1 testMethod:^{
        NSLog(@"%@", self.name); //ТУТ СЕЛФ ВЫЗОВЕТ НЕ ИМЯ ОБЪЕКТА,А ИМЯ APPDELEGATE
    }];
    */
    
    
    return YES;
}






//Метод может принимать блоки как параметр.Блок,который ничего не принимает и ничего не возвращает
-(void) testBlocksMethod:(void (^)(void)) testBlock {
    
    NSLog(@"test block method");
    testBlock();
}

    

-(void) testBlocksMethod2:(OurTestBlock) testBlock {
    
    NSLog(@"test block method");
//    testBlock();
}





//like block one
-(void) testMethod {
    NSLog(@"test method");
}

//like block two
-(void) testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
    NSLog(@"test method with parameter: %@ and value %ld", string, intValue);
}

//like block three
-(NSString*) testMethodWithReturnValueAndParams:(NSString*) string  value:(NSInteger) intValue {
    return [NSString stringWithFormat:@"testMethodWithReturnValueAndParams: %@ %ld", string, intValue];
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
