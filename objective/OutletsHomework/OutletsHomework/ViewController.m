//
//  ViewController.m
//  OutletsHomework
//
//  Created by Denis Nesteruk on 2/19/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
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
//    Менять цвет чёрных клеток при повороте на рандомный
    /*
    for (UIView* square in self.squares) {
        square.backgroundColor = [self randomColor];
    }
    */
}



@end
