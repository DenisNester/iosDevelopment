//
//  ViewController.m
//  DrawningsHomework
//
//  Created by Denis Nesteruk on 3/16/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"
#import "DrawningView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(75, 525, 50, 50)] CGPath]];
    [circleLayer setStrokeColor:[[UIColor orangeColor] CGColor]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    [[self.view layer] addSublayer:circleLayer];
    */
    
    
    
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [self.drawningView setNeedsDisplay]; // Метод говорит о том,что view должна быть перерисована
}

@end
