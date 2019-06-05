//
//  Student.h
//  BitwiseOperations
//
//  Created by Denis Nesteruk on 2/7/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef enum {
    StudenSubjectTypeBiology         = 1 << 0,
    StudenSubjectTypeMath            = 1 << 1,
    StudenSubjectTypeDevelopment     = 1 << 2,
    StudenSubjectTypeEngineering     = 1 << 3,
    StudenSubjectTypeArt             = 1 << 4,
    StudenSubjectTypePsychology      = 1 << 5,
    StudenSubjectTypeAnatomy         = 1 << 6
} StudenSubjectType;




@interface Student : NSObject
/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesPsychology;
@property (assign, nonatomic) BOOL studiesAnatomy;
*/

@property (assign, nonatomic) StudenSubjectType subjectType;

@end

NS_ASSUME_NONNULL_END
