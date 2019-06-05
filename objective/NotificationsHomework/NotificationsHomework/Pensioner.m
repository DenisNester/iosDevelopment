//
//  Pensioner.m
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"
#import "AppDelegate.h"
@implementation Pensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(pensionChangedNotification:) name:GovernmentPensionDidChangeNotification object:nil];
        
        [nc addObserver:self selector:@selector(didEnterBackGroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [nc addObserver:self selector:@selector(applicationWillEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
        
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:GovernmentPensionDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}



#pragma mark - Notifications


-(void) pensionChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    
    NSInteger pension = [value integerValue];
    self.pension = pension;
    NSLog(@"Ohh...again pension did changed...what a disaster.Now pension %@ = %ld", self.name, self.pension);
    
    
}


-(void) didEnterBackGroundNotification:(NSNotification*) notification {
    NSLog(@"Pensioner goes to sleep");
}


-(void) applicationWillEnterForegroundNotification:(NSNotification*) notification {
    NSLog(@"Oh yj etot nesnosniy pensioner!");
}



@end
