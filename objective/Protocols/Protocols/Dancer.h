//
//  Dancer.h
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
NS_ASSUME_NONNULL_BEGIN

@interface Dancer : NSObject <Patient>

@property (strong, nonatomic) NSString* favouriteDance;
@property (strong, nonatomic) NSString* name;

-(void) dance;




@end

NS_ASSUME_NONNULL_END
