//
//  ViewController.m
//  GeometryTwo
//
//  Created by Denis Nesteruk on 2/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* testView;
@end

@implementation ViewController

//Если хотим что-то поместить куда-то(на какую-нибудь вьюху) - для своей вьюхи устанавливаем frame!Будем двигать свою вьюху относительно другой вьюхи через frame!
//А если мы хотим достать координаты вьюхи работающей с нашей родительской вьюхой и что-то двигать внутри этой вьюхи - используем bounds!



//У каждой вьюхи есть проперти window!!! WINDOW никогда не вращается!координаты не меняются

//У каждой вью есть такое свойство как: view1.superview; - указывает на вью,на которой данная вьюха лежит.У view1 superview = self.view,т.к мы её добавили на неё!


//У каждой вью есть массив subviews - self.view.subviews,массив тех вьюх,которые на ней лежат!

//Со всеми вьюхами работаем только через методы,т.к проперти на них  - READONLY

//Когда мы добавляем вьюху как subview - создаётся стронг ссылка,поэтому мы через проперти можем сделать weak

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8]; //colorWithAlpha - делает немного прозрачным
    [self.view addSubview:view1]; // Добавление вьюхи на главную вью!
    
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 130, 50, 250)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    
    //По умолчанию идёт не flexible,всё крепко закреплено
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin; //расстояние до левого края может меняться
    [self.view addSubview:view2];
    
    self.testView = view2;
    
    [self.view bringSubviewToFront:view1]; //Положит view1 впереди view2
    
}


-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
//    Frame - это положение вьюхи относительно его SUPERVIEW(вьюха,на которой данная вью лежит)
//    Bounds -  положение относительно себя (CGFloat не меняется)).При bounds не меняется сама кордината вьюхи!!!
    
//    Frame это прямоугольник вьюхи в координатах супервью - вьюхи на которой наша вьюха лежит. Bounds это прямоугольник вьюхи в собственных координатах.
    
    
    
//    Если мы хотим что-то положить на вьюху,надо работать с bounds(с внутренним пространством)
    
    
//    NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.testView.frame), NSStringFromCGRect(self.testView.bounds));
    
    NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
    
    
    //МОЖНО ПЕРЕВОДИТЬ КООРДИНАТЫ ИЗ ПРОСТРАНСТВА ОДНОЙ ВЬЮХИ - В ДРУГУЮ
//    convertPoint convertRect
    
    
    CGPoint origin = CGPointZero; //кордината 0, 0
//    ОКНО СТОИТ НА МЕСТЕ.ВСЕ КООРДИНАТЫ МЕНЯЮТСЯ ОТНОСИТЕЛЬНО ОКНА
    origin = [self.view convertPoint:origin toView:self.view.window];
    
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
    
    
    
//    При повороте будем добавлять вьюху!Поставить квадрат 100на100 в правый верхний угол
//    Если хотим узнать,куда поставить вьюху внутри родителя - ИСПОЛЬЗОВАТЬ BOUNDS!
//    А если хотим передвинуть вьюху в родительских координатах - ИСПОЛЬЗОВАТЬ FRAME
    
    CGRect r = self.view.bounds; //получается прямоугольник 320на480
    r.origin.x = CGRectGetWidth(r) - 100; //ставим его координату х,  т.е от максимальной X отнимаем 100
    r.origin.y = 0;
    r.size = CGSizeMake(100, 100);
   
    
    UIView* view3 = [[UIView alloc] initWithFrame:r];
    view3.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view3];
    
}




@end
