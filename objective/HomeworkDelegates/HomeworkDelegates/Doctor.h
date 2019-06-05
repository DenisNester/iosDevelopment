//
//  Doctor.h
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject <PatientDelegate>

@property (strong, nonatomic) NSString* name;

-(NSString*) returnSickBodyPart:(NSInteger) sickOrgan;


-(void) report;


@end

NS_ASSUME_NONNULL_END
