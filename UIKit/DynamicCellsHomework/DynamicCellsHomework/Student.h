//
//  Student.h
//  DynamicCellsHomework
//
//  Created by Denis Nesteruk on 4/25/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSInteger averageGrade;


@end

NS_ASSUME_NONNULL_END
