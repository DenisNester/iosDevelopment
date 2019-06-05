//
//  ViewController.m
//  UITouch
//
//  Created by Denis Nesteruk on 3/4/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIView* draggingView;

@property (assign, nonatomic) CGPoint touchOffset; // чтобы можно было тянуть вьюху за край и чтобы наш центр сразу не смещался
@end

//NSSet - набор элементов,не в упорядоченном порядке,но с быстрым доступом к ним
//Рекурсивная функция - та функция,которая вызывает сама себя
//HitTest метод  - заходит в каждую сабвьюху,которая лежит например на self.view и смотрит какая из сабвьюх содержит точку pointInside и возвращает нам эту вьюху(самую глубокую вью)


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 8; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(10 + 110*i, 100, 100, 100)];
//        view.backgroundColor = [UIColor orangeColor];
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
    }
    
  
    
//    self.testView = view;
    
//    self.view.multipleTouchEnabled = YES;
}


-(CGFloat) randomFromZeroToOne {
    
    return (float)(arc4random() % 256 / 255.f);
}


-(UIColor*) randomColor {
    
    CGFloat r = (float)(arc4random() % 256 / 255.f);
    CGFloat g = (float)(arc4random() % 256 / 255.f);
    CGFloat b = (float)(arc4random() % 256 / 255.f);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
    
}


//Метод ,который выдаёт координаты,где был нажат тач и метод,в котором этот тач был "вызван"
-(void) logTouches:(NSSet*) touches WithMethod:(NSString*) methodName {
    
    NSMutableString* string = [NSMutableString stringWithString:methodName];
    
    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInView:self.view]; // координаты точки,в которой был touch
        [string appendFormat:@" %@", NSStringFromCGPoint(point)];
    }
    NSLog(@"%@", string);
}


#pragma mark - Touches

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self logTouches:touches WithMethod:@"touchesBegan"];
    
    //    Если мы нажали на то место,где стоит наша оранжевая вью,то мы получаем,что поинт попадает inside этой вью
    UITouch* touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view]; //берём location у поинта,который находится на главной вьюхе(в данном примере на self.view)
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event]; // результат функции hitTest.
    
    //    Проверка,попадаем ли по нашей оранжевой вьюхе,либо попадаем по self.view
    if (![view isEqual:self.view] ) {
        self.draggingView = view; // и если мы попали в оранжевую,то устанавливаем эту вью в наше проперти drag.v.
        [self.view bringSubviewToFront:self.draggingView];
        
        CGPoint touchPoint = [touch locationInView:self.draggingView];// чтобы определить touch именно в координатах нашей draggingView
        
//        чтобы определить наше смещение offSet,нам надо от координаты центра отнять координату нашего касания
        self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
        
//        Перед тем,как тянуть отменять все анимации
        [self.draggingView.layer removeAllAnimations];
        
        
        [UIView animateWithDuration:0.3
                         animations:^{
//                             увеличим на 20% по ширине и высоте
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             self.draggingView.alpha = 0.3f;
                         }];
        
    } else {
        self.draggingView = nil; //если мы первый раз поставили,то нам нужно условие,чтобы его сбрасывать
    }
    
    /*
     CGPoint point = [touch locationInView:self.testView];
     NSLog(@"inside = %d", [self.testView pointInside:point withEvent:event]); возвращает insdie = 0,не попал touch на self.testView, inside = 1 - попал
     */
}


-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self logTouches:touches WithMethod:@"touchesMoved"];
    
//    И если у нас есть self.draggingView ,то будем двигать center этой drag.view
    
    if (self.draggingView) {
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x, //наша поправка со смещением
                                        pointOnMainView.y + self.touchOffset.y);
        
        self.draggingView.center = correction; // будем двигать center drag.view в ту точку pointOnMainView на нашей self.view
    }

}

//Когда завершается перетягивание состояние становится первоначальным
-(void) onTouchesEnded {
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity; //начальное состояние
                         self.draggingView.alpha = 1.f;
                     }];
    
    
}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self logTouches:touches WithMethod:@"touchesEnded"];
    
    [self onTouchesEnded];
    
    self.draggingView = nil; //сбрасывать draggingView
    
    
  
}


-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self logTouches:touches WithMethod:@"touchesCancelled"];
    
    [self onTouchesEnded];
    
    self.draggingView = nil; //сбрасывать draggingView
    
  
}

@end
