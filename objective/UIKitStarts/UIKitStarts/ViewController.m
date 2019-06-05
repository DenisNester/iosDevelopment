//
//  ViewController.m
//  UIKitStarts
//
//  Created by Denis Nesteruk on 2/16/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//В loadView - занимаемся графикой
//В viewDidLoad - можем инициализировать данные
//В viewWillAppear - можем переопределить какие-то калькуляции
//viewDidAppear - view появляется

#pragma mark - Loading

-(void) loadView {
    [super loadView]; //при переопределении метода вызывать родительский метод!
    
    NSLog(@"load view");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"view did load");
}


#pragma mark - Views

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"view will appear");
    
}


-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"view did appear");
}


//Методы,в которых перерисовываются subView
-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"view Will Layout Subviews");
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"view did Layout Subviews");
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

-(void) dealloc {
    
}


#pragma mark - Orientation

-(BOOL) shouldAutorotate {
    return YES;
}

//КОНТРОЛЛЕР БУДЕТ ПОДДЕРЖИВАТЬ ТОЛЬКО ВЫБРАННЫЕ ОРИЕНТАЦИИ
-(UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationPortrait;
}

/*
-(UIInterfaceOrientation) preferredInterfaceOrientationForPresentation {
    
}
*/



//Эти два метода вызываются перед тем,как КОНТРОЛЛЕР начинает менять ориентацию - NE RABOTAET
-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"willRotateToInterfaceOrientation from %ld to %ld", self.interfaceOrientation, toInterfaceOrientation);
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    NSLog(@"didRotateFromInterfaceOrientation from %ld to %ld", fromInterfaceOrientation, self.interfaceOrientation);
}


@end
