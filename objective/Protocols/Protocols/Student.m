//
//  Student.m
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void) study {
    
}


#pragma mark - Patient

-(BOOL) areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is student %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
    
    
}


-(void) takePill {
    NSLog(@"Student %@ takes a pill", self.name);
}


-(void) makeShot {
    NSLog(@"Student %@ makes a shot", self.name);
}


-(NSString*) howIsYourFamily {
    return @"My family is doing well";
}




@end
