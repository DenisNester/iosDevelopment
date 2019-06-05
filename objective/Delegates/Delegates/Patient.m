//
//  Patient.m
//  Delegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Patient.h"

@implementation Patient

-(BOOL) howAreYou {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self]; //своё проперти делегат,вызываем собственный метод и передаём ссылку на себя
    }
    return iFeelGood;
}


-(void) takePill {
    NSLog(@"Patient %@ takes pill", self.name);
}



-(void) makeShot {
    NSLog(@"Patient %@ takes a pill", self.name);
}




@end
