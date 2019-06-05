//
//  Doctor.m
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Doctor.h"

@interface Doctor()
@property (strong, nonatomic) NSMutableDictionary* hospitalJournal;
@end



@implementation Doctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hospitalJournal = [[NSMutableDictionary alloc]init];
    }
    return self;
}



- (void)patientGoesToTheDoctor:(Patient *)patient {
    
    NSNumber* addPatient = [[NSNumber alloc]init];
    
    
    
    switch(patient.bodyPart) {
        case Head:
            NSLog(@"DOCTOR!My head hurts");
            addPatient = [NSNumber numberWithInt:patient.bodyPart];
            [self.hospitalJournal setObject:addPatient forKey:patient.name];
            break;
        case Stomach:
            NSLog(@"DOCTOR!My stomach hurts");
            addPatient = [NSNumber numberWithInt:patient.bodyPart];
            [self.hospitalJournal setObject:addPatient forKey:patient.name];
            break;
        case Throat:
            NSLog(@"DOCTOR!My throat hurts");
            addPatient = [NSNumber numberWithInt:patient.bodyPart];
            [self.hospitalJournal setObject:addPatient forKey:patient.name];
            break;
            
            
            default:
            break;
    }
    
    
    
    
    switch (patient.symptom) {
        case Headache:
            [patient takeAspirin];
            break;
        case Temperature:
            [patient takeRinza];
            break;
        case Sorethroat:
            [patient drinkHoneyWithTea];
            break;
            
            default:
            break;
    }
    
    
}


-(NSString*) returnSickBodyPart:(NSInteger) sickOrgan {
    
    switch (sickOrgan) {
        case Head:
            return @"Head";
            break;
        case Stomach:
            return @"Stomach";
            break;
        case Throat:
            return @"Throat";
            break;
            
            default:
            return nil;
            break;
        
            
            
    }
}


-(void) report {
    
    NSArray* sortedKeys = [self.hospitalJournal keysSortedByValueUsingComparator:^NSComparisonResult(id  obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (Patient* patient in sortedKeys) {
     NSLog(@"Patient %@ complained of pain in the %@", patient, [self returnSickBodyPart:[[self.hospitalJournal objectForKey:patient] integerValue]]);
    }
    
    
    
}







@end
