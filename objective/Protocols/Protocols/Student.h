//
//  Student.h
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject  <Patient>

@property (strong, nonatomic) NSString* univercityName;
@property (strong, nonatomic) NSString* name;

-(void) study;


@end

NS_ASSUME_NONNULL_END
