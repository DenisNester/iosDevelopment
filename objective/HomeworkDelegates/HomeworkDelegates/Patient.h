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
@protocol PatientDelegate;


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


@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) Symptom symptom;
@property (assign, nonatomic) BodyPart bodyPart;
@property (weak, nonatomic) id <PatientDelegate> delegate;

-(void) becameWorse;

-(void) takeRinza;
-(void) takeAspirin;
-(void) drinkHoneyWithTea;


@end


@protocol PatientDelegate <NSObject>
@required




-(void) patientGoesToTheDoctor:(Patient*) patient;

@end


NS_ASSUME_NONNULL_END
