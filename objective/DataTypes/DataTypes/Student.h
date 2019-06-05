//
//  Student.h
//  DataTypes
//
//  Created by Denis Nesteruk on 1/30/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//






#import <Foundation/Foundation.h>

typedef enum {
    Male,
    Female
} Gender;

//typedef NSInteger taburetka;


NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) Gender gender;

@end

NS_ASSUME_NONNULL_END
