//
//  Boxer.m
//  Properties
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Boxer.h"

@interface Boxer()
@property (assign, nonatomic) NSInteger nameCount; //расширить класс на определённое проперти
@end


@implementation Boxer
@synthesize name = _name;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
    }
    return self;
}




-(void) setName:(NSString *)name {
    _name = name;
    NSLog(@"setter setName was called");
}



-(NSString*) name {
    self.nameCount++;
    NSLog(@"name getter was called %ld times", self.nameCount);
    return _name;
}


-(NSInteger) age {
    NSLog(@"age getter was called");
    return _age;
}


-(NSInteger) howOldAreYou {
    //return self.age; вызовет геттер age с "age getter was called"
    return _age; //вызовет сразу возраст напрямую
}


@end
