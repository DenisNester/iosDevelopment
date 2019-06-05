//
//  Dancer.m
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Dancer.h"

@implementation Dancer

-(void) dance {
    
}

#pragma mark - Patient


-(BOOL) areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is dancer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
    
    
}


-(void) takePill {
    NSLog(@"Dancer %@ takes a pill", self.name);
}


-(void) makeShot {
    NSLog(@"Dancer %@ makes a shot", self.name);
}



@end
