//
//  ViewController.h
//  Drawnings
//
//  Created by Denis Nesteruk on 3/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawningView;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DrawningView* drawningView;

@end

