//
//  Student.h
//  BitwiseOperationsHomework
//
//  Created by Denis Nesteruk on 2/9/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    StudentSubjectMath,
    StudentSubjectDevelopment,
    StudentSubjectLanguage,
    StudentSubjectLiterature,
    StudentSubjectHistory,
    StudentSubjectEngineering,
    StudentSubjectPsychology
} SubjectType;





@interface Student : NSObject

@property (assign, nonatomic) SubjectType subjectType;




@end

NS_ASSUME_NONNULL_END
