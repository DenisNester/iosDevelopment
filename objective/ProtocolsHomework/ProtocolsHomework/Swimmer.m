//
//  Swimmer.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Swimmer.h"

@implementation Swimmer


#pragma mark - Swimmers

-(void) swim {
    NSLog(@"Swimmer %@ training to swim", self.name);
}

-(NSString*) getReadyBeforeSwimming {
    return @"Always ready to swim";
}


@synthesize distanceToSwim;

@synthesize swimmingStyle;

@end
