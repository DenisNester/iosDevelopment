//
//  Doctor.m
//  Delegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Doctor.h"
@implementation Doctor


#pragma mark - PatientDelegate


-(void) patientFeelsBad:(Patient*) patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    
    
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {     // else работает в том случае,если не сработало предыдущее условие
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
}



-(void) patient:(Patient*) patient hasQuestion:(NSString*) question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}






@end
