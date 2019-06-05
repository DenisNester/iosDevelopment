//
//  NSString+Random.h
//  TableViewSearch
//
//  Created by Denis Nesteruk on 5/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Random)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;


@end

NS_ASSUME_NONNULL_END
