//
//  ViewController.m
//  Drawnings
//
//  Created by Denis Nesteruk on 3/15/19.
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
}


#pragma mark - Orientation

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [self.drawningView setNeedsDisplay]; // Метод говорит о том,что view должна быть перерисована
}


@end
