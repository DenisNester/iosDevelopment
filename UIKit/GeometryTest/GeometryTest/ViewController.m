//
//  ViewController.m
//  GeometryTest
//
//  Created by Denis Nesteruk on 2/27/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* testView;
@end

@implementation ViewController


//У каждой view есть свойство superView,которое указывает на ту view,на которой наша вьюха лежит
//У кажой view  есть массив subviews - массив тех вьюх,которые лежат на нашей view

//Frame - координаты view относительно superView,на котором view лежит
//Bounds - свои собственные координаты(внутреннее пространство)
//Если мы хотим что-то поместить на вью по конкретным координатам - использовать bounds !
//Если хотим что-то переместить внутри вью - используем frame!
//Если мы хотим что-то,поместить на какую-то вьюху,то для своей вью мы устанавливаем frame.Будем двигать свою вью относительно другой вью
//WINDOW никогда не вращается!поэтому вьюхи на окне без контроллера не вращаются




//  !!!!ЕСЛИ МЫ ХОТИМ ПОСТАВИТЬ VIEW ВНУТРИ РОДИТЕЛЯ(SUPERVIEW) ИСПОЛЬЗОВАТЬ BOUNDS
// ЕСЛИ МЫ ХОТИМ ПЕРЕДВИНУТЬ VIEW В РОДИТЕЛЬСКИХ КООРДИНАТАХ(SUPERVIEW) ИСПОЛЬЗОВАТЬ FRAME
-(void) loadView {
    [super loadView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1];
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 130, 50, 250)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view2];
    
    self.testView = view2;
    view2.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |                              UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;

//    [self.view bringSubviewToFront:view1]; красную вьюху поставит поверх зелёной
    // Do any additional setup after loading the view, typically from a nib.
}



-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
//    перевести координаты origin на window
    CGPoint origin = CGPointZero;
    origin = [self.view convertPoint:origin toView:self.view.window];
    
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
    
    
//    Поставить квадрат в правый верхний угол
    CGRect r = self.view.bounds;
    r.origin.y = 0;
    r.origin.x = CGRectGetWidth(r) - 100;
    r.size = CGSizeMake(100, 100);
    
    
    UIView* v = [[UIView alloc] initWithFrame:r];
    v.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:v];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   
}


-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
  
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
}


@end
