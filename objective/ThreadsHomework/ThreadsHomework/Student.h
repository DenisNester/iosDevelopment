//
//  Student.h
//  ThreadsHomework
//
//  Created by Denis Nesteruk on 2/4/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;


-(void) guessTheAnswer:(NSInteger) range and:(NSInteger) randomNumber;

@end

NS_ASSUME_NONNULL_END
