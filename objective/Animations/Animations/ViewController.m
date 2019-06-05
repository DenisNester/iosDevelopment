//
//  ViewController.m
//  Animations
//
//  Created by Denis Nesteruk on 2/19/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) UIView* testView;

@property (weak, nonatomic) UIImageView* testImageView;



@end

//У каждой вьюхи есть проперти layer(есть и sublayer)

//Frame - положение относительно родителя
//Bounds -  своя собственная система координат
//Интерполяция - как передвигается вьюха

//Когда есть действие с анимацией,по факту наша вьюха уже стоит в том положении,в которое должна переместиться,мы просто видим остаточные движения

//!!!!ПРИ АНИМАЦИИ,ДАЖЕ ЕСЛИ У НАС ИЗМЕНИЛСЯ МАСШТАБ ВЬЮХИ,BOUNDS ОСТАЁТСЯ ТАКИМ ЖЕ,КАКИМ И БЫЛ ДО АНИМАЦИИ


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIImageView* view1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view1.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1];
    
//    self.testView = view1;
    self.testImageView = view1;
    
    
    UIImage* imageOne = [UIImage imageNamed:@"1.png"];
    UIImage* imageTwo = [UIImage imageNamed:@"2.png"];
    UIImage* imageThree = [UIImage imageNamed:@"3.png"];
    
    
    NSArray* arrayOfImages = [NSArray arrayWithObjects:imageOne, imageTwo, imageThree, nil];
    view1.animationImages = arrayOfImages;
    view1.animationDuration = 2.f;
    [view1 startAnimating];
    

}



-(UIColor*) randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}



-(void) moveView:(UIView*) view {
    
    
    CGRect rect = self.view.bounds; //Т.к мы будем двигать вьюху ВНУТРИ родительской вьюхи,то берём bounds родительской вьюхи
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));//Сделать отступы по ширине и высоте(делаем рамки)
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect); //Сначала берём и генерируем случайную точку по ширине(x) и прибавить её к минимальной координате X
     CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    
//    Делаем рандомный scale
    CGFloat s = (float) (arc4random() % 151) / 100.f + 0.5f; //генерируем случайное число от 0 до 1.5 для изменения масштаба нашей вьюхи. SCALE
    
//    Рандомный rotation
    CGFloat r = (double) (arc4random() %(int)(M_PI * 2 *10000)) / 10000 - M_PI; // делаем случайный rotation от -ПИ до ПИ. СГЕНЕРИРОВАЛИ ОТ 0 ДО 2ПИ и ОТНЯЛИ ПИ

//    Рандомный duration
    CGFloat d = (float) (arc4random() % 20001) / 10000 + 2; //сгенерировали случайное число от 2 до 4, получается 200001/10000 получили два = начало диапазона от 2, и чтобы определить конец диапазона прибавли 2 (2,4)
    
    
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                       view.center = CGPointMake(x, y); // двигаем наш центр в рандомную точку
                         view.backgroundColor = [self randomColor];
                         
                
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         //
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         //
                        view.transform = transform;
                         
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"view frame = %@, bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
//                       bounds остался 100,100 даже после изменения масштаба
                         
                         __weak UIView* v = view; // делаем слабую ссылку на view
                         
                         [self moveView:v]; //когда метод выполнится вызовем его ещё раз
                     }];
    
}



-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self moveView:self.testView];
    [self moveView:self.testImageView];
    
//    Т.к передвигаем относительно родителя - используем frame.Смещаем в центр
    /*
    [UIView animateWithDuration:5 animations:^{
        self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.view.frame) / 2, 150);
    }];
    */
//     CurveEaseInOut - легко начинается и легко заканчивается анимация,скорость приходится на середину анимации
//    CurveLinear - движется равномерно.
//   Curve - это кривая анимации по которой идёт движение. не являются масками и мы не можем использовать две одновременно
    
//    frame,bounds, center - всё можно трансформировать. Backgroundcolor тоже може анимироваться
    
    
//    Transform -  есть проперти у каждой вью. Операция поворота,операция увеличение/измененение масштаба,перенос передвижение
    
    /*
    [UIView animateWithDuration:10
                          delay:1
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView.frame) / 2, 150); // перемещение в точку
                         self.testView.backgroundColor = [self randomColor];
                         
//                         self.testView.transform = CGAffineTransformMakeRotation(M_PI); //ВЫБИРАЕМ УГОЛ ПОВОРОТА.Число пи
//                         self.testView.transform = CGAffineTransformMakeTranslation(800, 0); // Переместить в заданную точку
//                         self.testView.transform = CGAffineTransformMakeScale(2, 0.5);//изменение масштаба.По X увеличим в два раза,по Y уменьшим в 2 раза
                         
                         
//                         Объединить трансформы в матрицу(чтобы можно было применить сразу несколько)
                         CGAffineTransform scale = CGAffineTransformMakeScale(2, 0.5); // масштаб
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI); //поворот
                         
//                         Сложение матриц/КОНКАТЕНАЦИЯ МАТРИЦ
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
//                         Применяем наш трансформ
                         self.testView.transform = transform;
                         
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished); //finished - была ли завершена добровольно или была отменена, 1 = yes = добровольно, 0 = no = была отменена
                     }];
    */
     
     
//    Обрываем анимацию и запускаем другую
    /*
    double delayInSeconds = 6.f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        
        [self.testView.layer removeAllAnimations]
        
        [UIView animateWithDuration:4
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.testView.center = CGPointMake(500, 500);
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"animation finished! %d", finished);
                         }];
  
    });
    */
  
    
    
    
}



@end
