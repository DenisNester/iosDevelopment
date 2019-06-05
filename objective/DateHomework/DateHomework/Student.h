//
//  Student.h
//  DateHomework
//
//  Created by Denis Nesteruk on 2/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSDate* dateOfBirth;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;

-(NSDate*) getRandomBirthDate;


@end

NS_ASSUME_NONNULL_END
