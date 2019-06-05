//
//  Government.h
//  Notifications
//
//  Created by Denis Nesteruk on 2/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

extern NSString* const GovernmentTaxLevelDidChangeNotification;
extern NSString* const GovernmentSalaryDidChangeNotification;
extern NSString* const GovernmentPensionDidChangeNotification;
extern NSString* const GovernmentAveragePriceDidChangeNotification;

extern NSString* const GovernmentTaxLevelUserInfoKey;
extern NSString* const GovernmentSalaryUserInfoKey;
extern NSString* const GovernmentPensionUserInfoKey;
extern NSString* const GovernmentAveragePriceUserInfoKey;




@interface Government : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;


@end

NS_ASSUME_NONNULL_END
