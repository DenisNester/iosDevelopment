//
//  Human.h
//  ArraysHomework
//
//  Created by Denis Nesteruk on 1/30/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Male,
    Female
} Gender;

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) Gender gender;


-(void) movement;



@end

NS_ASSUME_NONNULL_END
