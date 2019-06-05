//
//  Swimmers.h
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Swimmers <NSObject>

@required

@property (assign, nonatomic) NSInteger distanceToSwim;
@property (strong, nonatomic) NSString* swimmingStyle;


-(void) swim;


@optional

-(NSString*) getReadyBeforeSwimming;
-(void) swimLikeFish;




@end

NS_ASSUME_NONNULL_END
