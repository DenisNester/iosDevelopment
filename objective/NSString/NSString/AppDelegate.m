//
//  AppDelegate.m
//  NSString
//
//  Created by Denis Nesteruk on 2/5/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    NSString* string1 = @"String 1";
    NSString* string2 = @"String 2";
    
    NSArray* array = [NSArray arrayWithObjects:string1, string2, nil];
    
    
    for (NSString* string in array) {
//        никогда не сравниваем объекты через ==, сравниваем через isEqual
        if ([string isEqualToString:@"String 1"]) {
            NSLog(@"index = %lu", [array indexOfObject:string]);
        }
    }
    */
    
    
    
    
    
    
    /*
    NSString* string = @"Hello World";
    NSLog(@"%@", string);
    
    
    NSRange range = [string rangeOfString:@"World"]; //Структура
//    NSRange range = [string rangeOfString:@"world" options:NSCaseInsensitiveSearch]; //Написали  wolrd с маленькой буквы.При помощи NSCaseInsensitiveSearch нашло.
//    NSBackwardSearch - ищет последнее слово в тексте
//    Проверка на поиск символов в строке
    if (range.location != NSNotFound) {
        NSLog(@"range = %@", NSStringFromRange(range));
    } else {
        NSLog(@"Sovpadeniy ne naideno");
    }
    */
    
    
    NSString* text = @"Jack London, an American writer, came of a poor family. When he was a schoolboy he had to sell newspapers and do other work to get money for a living. Then he became a sailor. Later he did some other work. His life was very hard and he described it in his book 'Martin Eden. Jack London wrote about fifty books: short stories, novels and other works.  He was made famous by his book 'Call of the Wild'. 'Martin Eden' is another of his well-known books.  You will read 'Brown Wolf', one of the stories written by Jack London. The story is adapted.";
    
    
//    text = [text substringToIndex:10]; //Обрезать строку до индекса 10
//    text = [text substringFromIndex:5]; //Обрежет строку НАЧИНАЯ С 5 индекса
    
    
    
    /*
    NSRange range = NSMakeRange(0, 4);
    text = [text substringWithRange:range]; //Обрежет строку по ЗАДАННОМУ RANGE
    */
   
    
    
//    text = [text substringWithRange:NSMakeRange(10, 10)]; //Обрежет текст начиная с 10 СИМВОЛА +10 символов
//    NSLog(@"%@", text);
    
    
    
    
    
    //*** Реальная задача
    //    ОБРЕЗАТЬ ТЕКСТ ДО СЛОВ "HIS LIFE"
    
    /*
    NSRange range = [text rangeOfString:@"His life"];
//    обязательная проверка - существует ли такая строка
    if (range.location != NSNotFound) {
        text = [text substringToIndex:range.location];
    }
    NSLog(@"%@", text);
    */
    
    
    //*** РЕАЛЬНАЯ ЗАДАЧА 2
//    ПОСЧИТАТЬ СКОЛЬКО РАЗ В ДАННОМ ТЕКСТЕ ИСПОЛЬЗУЕТСЯ СЛОВО "LONDON"
    
    
    /*
    NSRange searchRange = NSMakeRange(0, [text length]);
    NSInteger numberCount = 0;
    
    while (YES) {
        NSRange range = [text rangeOfString:@"London" option
     s:0 range:searchRange];
        
        if (range.location != NSNotFound) {
//            после первого найденного слова,мы должны сдвинуть наш searchRange
            NSInteger index = range.location + range.length;
            searchRange.location = index;
            
            searchRange.length = [text length] - index;
            
            NSLog(@"%@", NSStringFromRange(range));
            
            numberCount++;
        } else {
            break;
        }
    }
    NSLog(@"Counter of finded strings = %ld", numberCount);
    */
    
    
    
//    ЗАМЕНИТЬ ВСЕ СТРОКИ "LONDON" на другие
    /*
    text = [text stringByReplacingOccurrencesOfString:@"London" withString:@"NEW YORK"];
    NSLog(@"%@", text);
    */
    
    
    
//    СДЕЛАЕТ ВСЕ БУКВЫ ЗАГЛАВНЫМИ
    /*
    text = [text uppercaseString];
    NSLog(@"%@", text);
    */
    
    
    
//    СДЕЛАЕТ ВСЕ БУКВЫ МАЛЕНЬКИМИ
    /*
    text = [text lowercaseString];
    NSLog(@"%@", text);
    */
    
    
    
//    СДЕЛАЕТ КАЖДОЕ СЛОВО С ЗАГЛАВНОЙ БУКВЫ
    /*
    text = [text capitalizedString];
    NSLog(@"%@", text);
    */
    
    
    
    
//    РАСПЕЧАТАЕТ ИЗ СТРОКИ ЧИСЛО
    /*
    NSLog(@"%ld", [@"512" integerValue]);
    */
    
    
    
    
//    СОЗДАТЬ МАССИВ СТРОК РАЗДЕЛЁННЫХ КАКОЙ-ТО СТРОКОЙ
    /*
    NSArray* array = [text componentsSeparatedByString:@" "]; // @" " - цэ пробел
    NSLog(@"%@", array);
    
//    ЗАМЕНИМ ТОЧКИ+ЗАПЯТЫЕ НА ПРОБЕЛЫ
    text = [text stringByReplacingOccurrencesOfString:@"," withString:@" "];
     text = [text stringByReplacingOccurrencesOfString:@"." withString:@" "];
    
//    ВСЕ СЛОВА В ТЕКСТЕ СОЕДИНИЛИ  "_"
    text = [array componentsJoinedByString:@"_"];
    NSLog(@"%@", text);
    */
    
    
    
//    СЛОЖЕНИЕ СТРОК
    NSString* s1 = @"Hello";
    NSString* s2 = @"World";
    
    NSString* s3 = [s1 stringByAppendingString:s2];
    NSLog(@"%@", s3);
    
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
