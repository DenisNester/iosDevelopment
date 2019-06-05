//
//  ViewController.m
//  OutletsChessboardHomework
//
//  Created by Denis Nesteruk on 2/28/19.
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


-(CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256) / 255.f;
    
}


-(UIColor*) randomColor {
    
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}



-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    for (UIView* anyBlackSquare in self.arrayOfBlackSquares) {
//        anyBlackSquare.backgroundColor = [self randomColor];
    }
    
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
