//
//  Student.h
//  UITableEditingPartOne
//
//  Created by Denis Nesteruk on 4/25/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) CGFloat averageGrade;


+(Student*) randomStudent;


@end

NS_ASSUME_NONNULL_END
