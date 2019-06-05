//
//  Student.m
//  BitwiseOperations
//
//  Created by Denis Nesteruk on 2/7/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Student.h"

@implementation Student


//ЧТОБЫ НЕ ДУБЛИРОВАТЬ КОД
-(NSString*) answerByType:(StudenSubjectType) type {
    return self.subjectType & type ? @"YES" : @"NO"; //Чтобы узнать,выбран или нет,мы умножаем сумму нашей нашей маски на определённый тип,если получается 1 = ПРЕДМЕТ ВЫБРАН
}



//когда делается NSLOG - БУДЕТ ВЫДАВАТЬ СТРОКУ
-(NSString*) description {
    
    return [NSString stringWithFormat:@"Student studies : \n"
                                        "biology = %@\n"
                                        "math = %@\n"
                                        "engineering = %@\n"
                                        "art = %@\n"
                                        "psychology = %@\n"
                                        "development = %@\n"
                                        "anatomy = %@",
            [self answerByType:StudenSubjectTypeBiology],
            [self answerByType:StudenSubjectTypeMath],
            [self answerByType:StudenSubjectTypeEngineering],
            [self answerByType:StudenSubjectTypeArt],
            [self answerByType:StudenSubjectTypePsychology],
            [self answerByType:StudenSubjectTypeDevelopment],
            [self answerByType:StudenSubjectTypeAnatomy]
    
            /*
            self.subjectType & StudenSubjectTypeBiology ? @"yes" : @"no",
            self.subjectType & StudenSubjectTypeMath ? "yes" : "no",
            self.subjectType & StudenSubjectTypeEngineering ? "yes" : "no",
            self.subjectType & StudenSubjectTypeArt ? "yes" : "no",
            self.subjectType & StudenSubjectTypePsychology ? "yes" : "no",
            self.subjectType & StudenSubjectTypeDevelopment ? "yes" : "no",
            self.subjectType & StudenSubjectTypeAnatomy ? "yes" : "no"
             */
            ];
    
}




@end
