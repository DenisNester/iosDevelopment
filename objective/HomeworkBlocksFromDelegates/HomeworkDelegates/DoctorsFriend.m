//
//  DoctorsFriend.m
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DoctorsFriend.h"

@implementation DoctorsFriend





-(void) drinkWhisky {
    NSLog(@"Arrrr...Drink some whisky");
}


-(void) drinkLemonade {
    NSLog(@"Brrr...Drink some lemonade");
}



-(void) drinkGin {
    NSLog(@"Wuuuf..Drink some gin");
    
}





- (void)patientGoesToTheDoctor:(nonnull Patient *)patient {
    switch (patient.symptom) {
        case Headache:
            [self drinkWhisky];
            break;
        case Temperature:
            [self drinkGin];
            break;
        case Sorethroat:
            [self drinkLemonade];
            break;
            
        default:
            break;
    }
}

@end
