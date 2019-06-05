//
//  Jumpers.h
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol Jumpers <NSObject>

@required

@property (assign, nonatomic) CGFloat highestJump;
@property (assign, nonatomic) CGFloat height;


-(void) jump;


@optional

-(void) getReadyBeforeJump;
-(NSInteger) jumpRecord;


@end

NS_ASSUME_NONNULL_END
