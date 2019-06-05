//
//  Section.h
//  TableViewSearch
//
//  Created by Denis Nesteruk on 5/23/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Section : NSObject

@property (strong, nonatomic) NSString* sectionName;
@property (strong, nonatomic) NSMutableArray* itemsArray;

@end

NS_ASSUME_NONNULL_END
