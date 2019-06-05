//
//  ParentClass.h
//  Functions
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ParentClass : NSObject

+(void) whoAreYou;

-(void) sayHello;
-(void) says:(NSString*) string;
-(void) says:(NSString*) string and:(NSString*) string2;

-(NSString*) saySomeNumberString;



-(NSString*) saySomething;

@end

NS_ASSUME_NONNULL_END
