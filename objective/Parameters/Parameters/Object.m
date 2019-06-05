//
//  Object.m
//  Parameters
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Object.h"

@implementation Object

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object is created");
    }
    return self;
}



-(void) dealloc {
    NSLog(@"object was deallocated");
}


-(id) copyWithZone:(NSZone *)zone {
    //return [[Object alloc]init]; если копируем без всяких проперти
    Object* newObject = [[Object alloc]init];
    newObject.name = self.name; // если копируем с проперти
    return newObject;
}



@end
