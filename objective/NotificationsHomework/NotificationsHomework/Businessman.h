//
//  Businessman.h
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Businessman : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger taxLevel;

@end

NS_ASSUME_NONNULL_END
