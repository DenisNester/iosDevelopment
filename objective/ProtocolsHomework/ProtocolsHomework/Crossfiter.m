//
//  Crossfiter.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Crossfiter.h"

@implementation Crossfiter

-(void) run {
    NSLog(@"Crossfiter %@ is the fastest in running", self.name);
}


-(void) swim {
    NSLog(@"Crossfiter %@ is the fastest in swimming", self.name);
}


-(void) jump {
    NSLog(@"Crossfiter %@ is the highest jumping person", self.name);
}


@synthesize distanceToRun;

@synthesize distanceToSwim;

@synthesize height;

@synthesize highestJump;

@synthesize maxSpeed;

@synthesize swimmingStyle;

@end
