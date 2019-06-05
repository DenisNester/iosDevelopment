//
//  Animal.h
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject

@property (strong, nonatomic) NSString* nickname;
@property (strong, nonatomic) NSString* birthplace;

@end

NS_ASSUME_NONNULL_END
