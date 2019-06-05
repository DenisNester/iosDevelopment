//
//  Cheetah.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Cheetah.h"

@implementation Cheetah


#pragma mark - Runners


-(void) run {
    NSLog(@"Cheetah %@ is the fastest animal in the world", self.nickname);
}


-(void) stopRunning {
    NSLog(@"I'll stop.try to catch me");
}

@synthesize distanceToRun;

@synthesize maxSpeed;

@end
