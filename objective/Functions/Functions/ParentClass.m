//
//  ParentClass.m
//  Functions
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ParentClass.h"

@implementation ParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class was initialized");
    }
    return self;
}


+(void) whoAreYou {
    NSLog(@"I'am parent class");
}


-(void) sayHello {
    NSLog(@"Hello world");
}

-(void) says:(NSString*) string {
    NSLog(@"%@", string);
}


-(void) says:(NSString*) string and:(NSString*) string2 {
    NSLog(@"%@, %@", string, string2);
}


-(NSString*) saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}



-(NSString*) saySomething {
    NSString* string = [self saySomeNumberString];
    return string;
}





@end
