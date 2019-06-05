//
//  Group.h
//  TableEditing
//
//  Created by Denis Nesteruk on 5/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Group : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSArray* studentsArray;

@end

NS_ASSUME_NONNULL_END
