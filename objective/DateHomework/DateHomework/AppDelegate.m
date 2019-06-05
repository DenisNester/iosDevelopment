//
//  AppDelegate.m
//  DateHomework
//
//  Created by Denis Nesteruk on 2/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
@interface AppDelegate ()

@property (strong, nonatomic) NSDate *currentDate;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    PUPIL
    NSMutableArray* arrayOfStudents = [[NSMutableArray alloc]init];
  
    NSArray* arrayOfNames = [NSArray arrayWithObjects:@"Lebron", @"Stephen", @"Danila", @"Veronika", @"Julia", nil];
    NSArray* arrayOfLastnames = [NSArray arrayWithObjects:@"Irving", @"Bryant", @"Allen", @"George", @"Ingram", nil];
    
    for (int i = 0; i < 30; i++) {
        Student* student = [[Student alloc]init];
        [student getRandomBirthDate];
        
//      Берём рандомное имя и фамилию из соответствующих массивов и устанавливаем их в наши проперти Имя и Фамилия
        NSString* randomName = [arrayOfNames objectAtIndex:arc4random() % [arrayOfNames count]];
        NSString* randomLastName = [arrayOfLastnames objectAtIndex:arc4random() % [arrayOfLastnames count]];
        
        student.firstName = randomName;
        student.lastName = randomLastName;
        
        [arrayOfStudents addObject:student];
        }
    
//    Вывод дня рождения в нормальном формате
    /*
    for (Student* anyStudent in arrayOfStudents) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        NSLog(@"birthday of student = %@", [dateFormatter stringFromDate:anyStudent.dateOfBirth]);
    }
     */
    
//    STUDENT
    //    Сортировка стундентов по дате рождения
    NSArray* sortedArray = [arrayOfStudents sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *first = [(Student*) obj1 dateOfBirth];
        NSDate *second = [(Student*) obj2 dateOfBirth];
        return [first compare:second];
    }];
    

    for (Student* anyStudent in sortedArray) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        NSLog(@"student name = %@, student lastname = %@,  birthday of student = %@", anyStudent.firstName, anyStudent.lastName, [dateFormatter stringFromDate:anyStudent.dateOfBirth]);
    }
    
    
    
  
//    MASTER
    NSDate* startDate = [NSDate distantFuture]; // чтобы определить earlier date
    NSDate* endDate = [NSDate distantPast]; // чтобы определить later date
    
    
//    Цикл,чтобы узнать самую раннюю и самую позднюю дату рождения студентов
    for (Student* anyStudent in sortedArray) {
        
        NSDate* date = anyStudent.dateOfBirth;
        startDate = [startDate earlierDate:date];
        endDate = [endDate laterDate:date];
        
    }
    
    
//    Вывести разницу между самым молодым и самым старым
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* componentsForComparing = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |   NSCalendarUnitDay fromDate:startDate toDate:endDate options:0];
    
    NSLog(@"The difference between the youngest and the oldest is %@", componentsForComparing);
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerForTaskMaster:) userInfo:nil repeats:YES];
    
    
    return YES;
}


-(void) timerForTaskMaster:(NSTimer*) timer {
    NSDate *date;
    if (self.currentDate == nil) {
        NSDateComponents* components = [NSDateComponents new];
        [components setDay:1];
        [components setMonth:1];
        [components setYear:1969];
        
        date = [[NSCalendar currentCalendar] dateFromComponents:components];
    } else {
        date = [self.currentDate dateByAddingTimeInterval:24 * 60 * 60];
    }
    
   
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSLog(@"%@", [dateFormatter stringFromDate:date]);
    self.currentDate = date;
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
