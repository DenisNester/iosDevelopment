//
//  Patient.m
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Patient.h"

@implementation Patient


-(void) becameWorse {
    NSLog(@"Patient %@ became worse", self.name);
    [self.delegate patientGoesToTheDoctor:self];
}

-(void) takeRinza {
    NSLog(@"Take rinza and go to sleep");
}


-(void) takeAspirin {
    NSLog(@"Take aspirin and rest");
}


-(void) drinkHoneyWithTea {
    NSLog(@"Make some hot tea and add honey in it");
}





@end
