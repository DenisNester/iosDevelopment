//
//  Boxer.h
//  Properties
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Boxer : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;




-(NSInteger) howOldAreYou;


@end

NS_ASSUME_NONNULL_END
