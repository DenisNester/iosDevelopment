//
//  ViewController.m
//  Outlets
//
//  Created by Denis Nesteruk on 2/18/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//У каждой вью ест integer число - tag. По тэгу можно найти VIEW!


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256) / 255;
}


-(UIColor*) randomColor {
    
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
//    self.testView.backgroundColor = [self randomColor];
//    self.testView2.backgroundColor = [self randomColor];
    
    
    for (UIView* view in self.testViews) {
        view.backgroundColor = [self randomColor];
    }
    NSLog(@"%@", self.testViews);
}




@end
