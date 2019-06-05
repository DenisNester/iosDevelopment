//
//  Object.m
//  Blocks
//
//  Created by Denis Nesteruk on 2/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Object.h"

@interface Object()

@property (copy, nonatomic) ObjectBlock objectBlock;
@end


@implementation Object
- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        __weak Object* weakSelf = self; //создаём на самих же себя слабую ссылку
        typeof(self) weakSelf = self;
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}


-(void) testMethod:(ObjectBlock) block {
    block();
}




-(void) dealloc {
    NSLog(@"Object is deallocated");
}





@end
