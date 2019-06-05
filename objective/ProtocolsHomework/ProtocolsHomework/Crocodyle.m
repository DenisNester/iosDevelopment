//
//  Crocodyle.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Crocodyle.h"

@implementation Crocodyle


#pragma mark - Swimmers

-(void) swim {
    NSLog(@"Crocodyle %@ swims to hunt", self.nickname);
}

-(void) swimLikeFish {
    NSLog(@"%@ swim like the fastest fish", self.nickname);
}


@synthesize distanceToSwim;

@synthesize swimmingStyle;

@end
