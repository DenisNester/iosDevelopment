//
//  AppDelegate.m
//  TimeAndDate
//
//  Created by Denis Nesteruk on 2/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Object.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    NSDate* date = [NSDate date];
    NSLog(@"%@", date); //Выводит часы минуты секунды
    
    NSLog(@"%@",[date dateByAddingTimeInterval:5000]); //Дата,которая будет на 5000 секунд больше текущей даты.Time interval может быть отрицательным
    NSLog(@"%@",[date dateByAddingTimeInterval:-5000]);
    
    
    
    
    [date compare:[date dateByAddingTimeInterval:5000]]; //Даты можно сравнивать
    [date earlierDate:[date dateByAddingTimeInterval:5000]]; //Вернёт ту дату,которая меньше
    [date laterDate:[date dateByAddingTimeInterval:5000]]; //Вернёт ту дату,которая позже
    
    
    
    NSDate* date2 = [NSDate dateWithTimeIntervalSinceReferenceDate:10]; //с 1 января 2001 года
    NSLog(@"%@", date2);
    */
    
    
    /*
    NSDate* date = [NSDate date];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
   
    [dateFormatter setDateStyle: NSDateFormatterShortStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]); //Чтобы вывести дату в нужном нам формате
    
    [dateFormatter setDateStyle: NSDateFormatterMediumStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    
    
    [dateFormatter setDateStyle: NSDateFormatterLongStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    
    
    [dateFormatter setDateStyle:  NSDateFormatterFullStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    
    
//    Если не нравится ни один из представленных стилей - можно создать свой
//    [dateFormatter setDateFormat:@"yyyy MMMMM"]; // "yyyy" выведет только год, big M - месяц, small  m - минуты
//    [dateFormatter setDateFormat:@"yyyy/MM/dd EEEE hh:mm:SS a"]; // dd - выводит день, EEEE - день недели, HH - 24 часа, hh - от 0 до 12,  a - PM,
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    
    
//    Форматор также можно использовать для того,ЧТОБЫ СОЗДАТЬ ДАТУ
    NSDate* date3 = [dateFormatter dateFromString:@"2011/01/17 18:40"]; //СОЗДАНИЕ ДАТЫ ИЗ СТРОКИ
    NSLog(@"%@", date3);
    */
    
    
//    !!!УЗНАТЬ КАКОЙ СЕЙЧАС ГОД МЕСЯЦ И ДЕНЬ
    /*
    NSDate* date = [NSDate date];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    
    NSDateComponents* components =
    [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |
                        NSCalendarUnitDay | NSCalendarUnitHour |
                        NSCalendarUnitMinute | NSCalendarUnitSecond
                fromDate:date]; //логическое сложение,маска
    NSLog(@"%@", components);
     */
     
//    NSInteger year = [@"2013" integerValue]; //взять из строки integer значение
    
//    И если мы хотим взять что-то одно из наших компонентов
//    NSInteger hours = [components hour];
    
    
    
    
//    !!!УЗНАТЬ СКОЛЬКО  ПРОШЛО ДНЕЙ,ЧАСОВ И МИНУТ МЕЖДУ ДВУМЯ ДАТАМИ
    /*
    NSDate* date1 = [NSDate date];
    NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:-1000000];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* components = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date2 toDate:date1 options:0];
    
    NSLog(@"%@", components);
    */
    
    
    
    
//    ТАЙМЕР
    
//    не использовать INVOCATION
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest:) userInfo:nil repeats:YES];
    
    
    Object* object = [[Object alloc]init];
    

    
    
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
