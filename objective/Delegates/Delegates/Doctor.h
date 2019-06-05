//
//  Doctor.h
//  Delegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@protocol PatientDelegate; // поверьте нам на слово,что такой протокол существует



@interface Doctor : NSObject <PatientDelegate>

@end

NS_ASSUME_NONNULL_END
