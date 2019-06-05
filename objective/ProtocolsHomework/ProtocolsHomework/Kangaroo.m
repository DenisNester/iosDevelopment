//
//  Kangaroo.m
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Kangaroo.h"

@implementation Kangaroo

#pragma mark - Jumpers

-(void) jump {
    NSLog(@"Kangaroo %@ jumping all day", self.nickname);
}


-(NSInteger) jumpRecord {
    return 10;
}

@synthesize height;

@synthesize highestJump;

@end
