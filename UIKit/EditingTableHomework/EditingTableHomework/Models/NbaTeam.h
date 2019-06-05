//
//  NbaTeam.h
//  EditingTableHomework
//
//  Created by Denis Nesteruk on 5/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NbaTeam : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger wins;
@property (assign, nonatomic) NSInteger looses;



@end

NS_ASSUME_NONNULL_END
