//
//  ViewController.m
//  UIViewController
//
//  Created by Denis Nesteruk on 2/11/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Loading

-(void) loadView {
//    Когда переопределяются методы родительского класса - использовать super,даже если они пустые
    [super loadView];
    NSLog(@"loadView");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Views


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated]; // animated = произошло с анимацией или без
    NSLog(@"viewWillAppear");
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}


//Когда перерисыовывается view
-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}


#pragma mark - Orientation




// Notifies when rotation begins, reaches halfway point and ends.
/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0,8_0, "Implement viewWillTransitionToSize:withTransitionCoordinator: instead") __TVOS_PROHIBITED;
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation NS_DEPRECATED_IOS(2_0,8_0) __TVOS_PROHIBITED;
*/


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    // Do view manipulation here.
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}


/*
- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;
- (UIInterfaceOrientationMask)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;
*/






@end
