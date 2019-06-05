//
//  ViewController.m
//  Touches
//
//  Created by Denis Nesteruk on 2/26/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"


//NSSet - набор элементов,лежат не попорядку,быстрый доступ к ним
//при зажатом alt появляется второй курсор
//Рекурсивная функция - та функция,которая вызывает сама себя
@interface ViewController ()
//@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIView* draggingView;

//Создать точку касания
@property (assign, nonatomic) CGPoint touchOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 8; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(10 + 110*i, 100, 100, 100)];
        view.backgroundColor = [self randomColor];
        
        [self.view addSubview:view];
    }
    
    
    
  
    
//    self.testView = view;
    
//    self.view.multipleTouchEnabled = YES;
}

#pragma mark - Private Methods

-(UIColor*) randomColor {
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


//Выводим координаты тачей + название метода,в котором тач был вызван
-(void) logTouches:(NSSet*) touches withMethod:(NSString*) methodName {
    
    NSMutableString* string = [NSMutableString stringWithString:methodName];
    
    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        [string appendFormat:@" %@",NSStringFromCGPoint(point)];
    }
    NSLog(@"%@", string);
}




#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    
//    Попадает ли наше нажатие на созданную вьюху. 0 - нет, 1 - да
    UITouch* touch = [touches anyObject]; // вернёт любой тач из "массива" touches
    CGPoint pointOnMainView = [touch locationInView:self.view]; // смотреть где был нажат тач  созданной вьюхе
    
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event]; // короче :) возвращает нам самую "глубокую" вьюху,на которую попал наш тач,если не попал - вернёт self.view
    
    if (![view isEqual:self.view]) {
        self.draggingView = view;
        
        [self.view bringSubviewToFront:self.draggingView];
        
        CGPoint touchPoint = [touch locationInView:self.draggingView]; // чтобы не было,когда мы берёмся за край вьюхи переносится центр сразу
        self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2, 1.2); //на 20% увеличим
                             self.draggingView.alpha = 0.3f;
                         }];
        
    } else {
        self.draggingView = nil;
    }
    
    
//    NSLog(@"inside = %d", [self.testView pointInside:point withEvent:event]);
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesMoved"];
    
//    Если у нас есть draggingView
    if (self.draggingView) {
        
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.draggingView.center = correction;
    }
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesEnded"];
    
 
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity; // вернём в первоначальное состояние
                         self.draggingView.alpha = 1.f;
                     }];
       self.draggingView = nil;
    
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesCancelled"];
    
    
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity; // вернём в первоначальное состояние
                         self.draggingView.alpha = 1.f;
                     }];
    self.draggingView = nil;
}

@end
