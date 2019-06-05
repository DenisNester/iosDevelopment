//
//  Runners.h
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Runners <NSObject>

@required

@property (assign, nonatomic) NSInteger maxSpeed;
@property (assign, nonatomic) NSInteger distanceToRun;


-(void) run;



@optional

-(void) stopRunning;
-(NSString*) getReadyBeforeRunning;



@end

NS_ASSUME_NONNULL_END
