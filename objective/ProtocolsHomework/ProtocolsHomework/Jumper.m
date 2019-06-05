//
//  Jumper.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Jumper.h"

@implementation Jumper



#pragma mark - Jumpers



- (void)jump {
    NSLog(@"Jumper %@ training to jump all his free time", self.name);
}


-(void) getReadyBeforeJump {
    NSLog(@"just prepare before your highest jump");
}


@synthesize height;
@synthesize highestJump;


@end
