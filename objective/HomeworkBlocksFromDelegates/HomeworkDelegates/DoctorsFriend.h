//
//  DoctorsFriend.h
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoctorsFriend : NSObject 

@property (strong, nonatomic) NSString* name;


-(void) drinkWhisky;
-(void) drinkLemonade;
-(void) drinkGin;


@end

NS_ASSUME_NONNULL_END
