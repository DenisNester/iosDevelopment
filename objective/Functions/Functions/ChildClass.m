//
//  ChildClass.m
//  Functions
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ChildClass.h"

@implementation ChildClass
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class was initialized");
    }
    return self;
}


-(NSString*) saySomething {
    return [super saySomeNumberString];
}


-(NSString*) saySomeNumberString {
    return @"SoMeThIng";
}


@end
