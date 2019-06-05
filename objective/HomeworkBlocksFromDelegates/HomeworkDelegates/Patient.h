//
//  Patient.h
//  HomeworkDelegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class Patient;




typedef enum {
    Head,
    Stomach,
    Throat
} BodyPart;


typedef enum {
    Temperature,
    Headache,
    Sorethroat
} Symptom;





typedef void(^BlockForPatient)(Patient*, BodyPart);




@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) Symptom symptom;
@property (assign, nonatomic) BodyPart bodyPart;
@property (copy, nonatomic) BlockForPatient blockForPatient;

-(void) becameWorse:(void(^)(Patient* patient, BodyPart bodypart)) blockWorse;

-(void) takeRinza;
-(void) takeAspirin;
-(void) drinkHoneyWithTea;


@end





NS_ASSUME_NONNULL_END
