//
//  Object.h
//  Blocks
//
//  Created by Denis Nesteruk on 2/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ObjectBlock)(void);


@interface Object : NSObject

@property (strong, nonatomic) NSString* name;


-(void) testMethod:(ObjectBlock) block;

@end

NS_ASSUME_NONNULL_END
