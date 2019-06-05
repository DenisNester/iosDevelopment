//
//  ViewController.m
//  ViewGeometry
//
//  Created by Denis Nesteruk on 2/13/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.view; Проперти view - та вьюха,которую контроллер держит
//    У КАЖДОГО VIEW ЕСТЬ PROPERTY BOUNDS
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1]; // как добавить вью
    
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 130, 50, 250)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8]; //ColorWithAlphaComponent делает прозрачным
//    Если flexibleLeft - то крепится жёстко только к правому краю,левый растягивается
    
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight |                                                               UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    [self.view addSubview:view2];
    
    self.testView = view2;
//    КОГДА ВЬЮ ДОБАВЛЯЕТСЯ КАК SUBVIEW - устанавливается strong ссылка,поэтому после создания мы через проперти можем установить weak
    
    
    
    
    [self.view bringSubviewToFront:view1]; //сделает view1 выше view2
    
//    view1.superview   ВЬЮ УКАЗЫВАЕТ НА ТУ ВЬЮХУ,НА КОТОРОЙ ОНА ЛЕЖИТ
//   У КАЖДОЙ ВЬЮ ЕСТЬ МАССИВ SUBVIEWS
    
//    self.view.subviews //МАССИВ ТЕХ ВЬЮХ,НА КОТОРЫХ ЭТА ВЬЮ ЛЕЖИТ
    
//    СО ВСЕМИ ВЬЮХАМИ РАБОТАЕМ ТОЛЬКО ЧЕРЕЗ МЕТОДЫ
    
}


-(NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}





-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//    Отличия между FRAME и BOUNDS
//    Frame - положение относительно его parent(super view)
//    Bounds - положение относительно себя,внутреннее пространство
    
//    NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.testView.frame), NSStringFromCGRect(self.testView.bounds));
    
      NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
    
//    У UIView есть свойство переводить координаты из пространства одной вьюхи - в другую(не важно subview или нет)
//    Если мы что-то перемещаем внутри вьюхи,используем bounds
//    А frame,если относительно главной вьюхи
    CGPoint origin = CGPointZero; // (0,0)
    origin = [self.view convertPoint:origin toView:self.view.window];
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
    
//    СОЗДАТЬ КВАДРАТ РАЗМЕРОМ 100 НА 100 И ПОСТАВИТЬ ЕГО В ПРАВЫЙ ВЕРХНИЙ УГОЛ
//    Если хотим узнать,куда поставить внутри родителя - используем bounds!!!!!
//    Если хотим передвинуть свою вьюху в родительских координатах - используем frame!!!!
    
    CGRect r = self.view.bounds;
    r.origin.y = 0;
    r.origin.x = CGRectGetWidth(r) - 100;
    r.size = CGSizeMake(100, 100);
    
    UIView* view3 = [[UIView alloc] initWithFrame:r];
    view3.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view3];
}


@end
