//
//  Runner.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Runner.h"

@implementation Runner

#pragma mark - Runner


-(void) run {
    NSLog(@"Runner %@ training to run", self.name);
}


-(NSString*) getReadyBeforeRunning {
    return @"I'am scared.I'am not ready";
}



@synthesize distanceToRun;

@synthesize maxSpeed;

@end
