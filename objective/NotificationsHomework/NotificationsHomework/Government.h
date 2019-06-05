//
//  Government.h
//  NotificationsHomework
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const GovernmentTaxLevelDidChangeNotification;
extern NSString* const GovernmentPensionDidChangeNotification;
extern NSString* const GovernmentAveragePriceDidChangeNotification;

extern NSString* const GovernmentTaxLevelUserInfoKey;
extern NSString* const GovernmentPensionUserInfoKey;
extern NSString* const GovernmentAveragePriceUserInfoKey;



NS_ASSUME_NONNULL_BEGIN

@interface Government : NSObject

@property (assign, nonatomic) NSInteger taxLevel;
@property (assign, nonatomic) NSInteger pension;
@property (assign, nonatomic) NSInteger averagePrice;


@end

NS_ASSUME_NONNULL_END
