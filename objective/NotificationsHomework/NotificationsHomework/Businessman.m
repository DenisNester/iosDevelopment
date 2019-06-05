//
//  Businessman.m
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"
@implementation Businessman

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self selector:@selector(taxLevelChangedNotification:) name:GovernmentTaxLevelDidChangeNotification object:nil];
    }
    return self;
}


-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:GovernmentTaxLevelDidChangeNotification object:nil];
}


-(void) taxLevelChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    
    NSInteger taxLevel = [value integerValue];
    
    self.taxLevel = taxLevel;
    
    NSLog(@"WOW...tax level has decreased.Now it is = %ld", self.taxLevel);
    
}




@end
