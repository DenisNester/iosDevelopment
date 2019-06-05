//
//  ViewController.m
//  UIViewAnimationsTest
//
//  Created by Denis Nesteruk on 3/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) UIView* testView1;

@property (weak, nonatomic) UIImageView* testImageView;
@end

@implementation ViewController


//Center - это точка середины вьюхи относительно frame
//Если мы что-то хотим передвинуть внутри собсвтенной вьюхи - используем bounds


// UIViewAnimationOptionCurveEaseInOut - это ИНТЕРПОЛЯЦИЯ -  как передвигается вьюха
//CGAffineTransform - матрица преобразований для двумерного пространства. Rotation поворот, scale изменение масштаба, translate - перенос/передвижение


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* view1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor greenColor];
    
    
    UIImage* image1 = [UIImage imageNamed:@"simpson1.png"];
    UIImage* image2 = [UIImage imageNamed:@"simpson2.png"];
    UIImage* image3 = [UIImage imageNamed:@"simpson3.png"];
    
    NSArray* arrayOfImages = [NSArray arrayWithObjects:image1, image2, image3, nil];
    view1.animationImages = arrayOfImages;
    view1.animationDuration = 3;
    [view1 startAnimating];
    
    
    
    
    [self.view addSubview:view1];
    
//    self.testView1 = view1;
    self.testImageView = view1;
}


-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    [self moveView:self.testView1];
    [self moveView:self.testImageView];
    
    /*
    [UIView animateWithDuration:5 animations:^{
// Т.к мы передвигаем нашу вью внутри селф.вью - мы берём размеры self.view(bounds) и т.к мы передвигаем центр нашей testView1,то берём frame нашей testView(относительно координат self.view) и делим его пополам(определяем центр)
        self.testView1.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView1.frame) / 2, 150);
    }];
    */
    
    
//    !!!
    /*
    [UIView animateWithDuration:10
                          delay:1
                        options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.testView1.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView1.frame) / 2, 150);
                         self.testView1.backgroundColor = [self randomColor];
                         
//                       self.testView1.transform = CGAffineTransformMakeRotation(M_PI);  //поворот вью
//                         self.testView1.transform = CGAffineTransformMakeTranslation(800, 0); //передвинуть на столько по X и на столько по Y
//                         self.testView1.transform = CGAffineTransformMakeScale(2, 0.5); // увеличи нашу вьюху по ширине в два раза и уменьшим по высоте в два раза
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(2, 0.5);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
                         
//                         Чтобы складывать матрицы! Конкатенация
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         self.testView1.transform = transform;
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished %d", finished); //finished - 1 = yes = анимация завершилась добровольно, 0 = no , анимация была прервана
                     }];
     */
     
    
    /*
    double delayInSeconds = 6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [self.testView1.layer removeAllAnimations];
    });
    
    
    
    [UIView animateWithDuration:4
                          delay:0
                        options: UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.testView1.center = CGPointMake(500, 500);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished %d", finished); //finished - 1 = yes = анимация завершилась добровольно, 0 = no , анимация была прервана
                     }];
   */
}


-(void) moveView:(UIView*) view {
    
//    Рандомное перемещение внутри view
    CGRect rect = self.view.bounds;
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame)); //Делаем рамки из ширины и высоты нашей вьюхи.Т.к мы размещаем view на self.view - ставим view frame
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    
//    Делаем рандомное изменение масштаба
    CGFloat s = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    
//    Делаем рандомный поворот.Число от 0 до 2PI
    CGFloat r = (float)(arc4random() % (int)(M_PI *2 *10000)) / 10000 - M_PI;
    
    
//    Делаем рандмное duration
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    
    [UIView animateWithDuration:d
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                       
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                       
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         view.transform = transform;
                         
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished %d", finished);
                         NSLog(@"view frame = %@, view bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                          __weak UIView* v = view;
                         [self moveView:v]; // после завершения вызовем метод ещё раз
                     }];
    
    
    
    
}


-(CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256 / 255.f);
}


-(UIColor*) randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
