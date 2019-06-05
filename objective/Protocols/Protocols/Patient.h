//
//  Patient.h
//  Protocols
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Patient <NSObject>


@required

@property (strong, nonatomic) NSString* name;


-(BOOL) areYouOk;
-(void) takePill;
-(void) makeShot;



@optional

-(NSString*) howIsYourFamily;
-(NSString*) howIsYourJob;


@end

NS_ASSUME_NONNULL_END
