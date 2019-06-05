//
//  Crossfiter.h
//  ProtocolsHomework
//
//  Created by Denis Nesteruk on 1/31/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "Human.h"
#import "Jumpers.h"
#import "Swimmers.h"
#import "Runners.h"
NS_ASSUME_NONNULL_BEGIN

@interface Crossfiter : Human <Jumpers, Swimmers, Runners>

@end

NS_ASSUME_NONNULL_END
