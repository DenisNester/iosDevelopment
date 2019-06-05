//
//  Patient.h
//  Delegates
//
//  Created by Denis Nesteruk on 2/1/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol PatientDelegate; //т.к идёт сверху - вниз,а инструкция делегата внизу

@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (weak, nonatomic) id <PatientDelegate> delegate; // ссылка на объект, который реализовал протокол PatientDelegate

-(BOOL) howAreYou;
-(void) takePill;
-(void) makeShot;

@end



//ДЕЛЕГАТ. Есть договорённость,что методы делегата должны содержать ссылку на сам объет(который делегировал свои полномочия)
@protocol PatientDelegate <NSObject>

@required

-(void) patientFeelsBad:(Patient*) patient; // без доп параметров.передаём ссылку на самого себя
-(void) patient:(Patient*) patient hasQuestion:(NSString*) question; // если у нас есть какие-то доп параметры

@end



NS_ASSUME_NONNULL_END
