//
//  Student.m
//  BitwiseOperationsHomework
//
//  Created by Denis Nesteruk on 2/9/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Student.h"

@implementation Student

-(NSString*) answerByType:(SubjectType) type {
    return self.subjectType & type ? @"YES" : @"NO"; 
}




-(NSString*) description {
    return [NSString stringWithFormat:
            @"Student studies : math = %@, development = %@, language = %@, literature = %@, history = %@, engineering = %@, psychology = %@",
            
            [self answerByType:StudentSubjectMath],
            [self answerByType:StudentSubjectDevelopment],
            [self answerByType:StudentSubjectLanguage],
            [self answerByType:StudentSubjectLiterature],
            [self answerByType:StudentSubjectHistory],
            [self answerByType:StudentSubjectEngineering],
            [self answerByType:StudentSubjectPsychology]
            
            
            
    
    ];
}


@end

