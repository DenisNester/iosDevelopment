//
//  ViewController.m
//  AnimationsHomework
//
//  Created by Denis Nesteruk on 2/21/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* cornerViewOne;
@property (weak, nonatomic) UIView* cornerViewTwo;
@property (weak, nonatomic) UIView* cornerViewThree;
@property (weak, nonatomic) UIView* cornerViewFour;


@property (weak, nonatomic) UIImageView* imageFighter;

@end

@implementation ViewController

//Pupil

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView* viewForImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 400, 400)];
    [self.view addSubview:viewForImage];
    self.imageFighter = viewForImage;
    
    UIImage* imageOne = [UIImage imageNamed:@"5.png"];
    UIImage* imageTwo = [UIImage imageNamed:@"6.png"];
    UIImage* imageThree = [UIImage imageNamed:@"7.png"];
    UIImage* imageFour = [UIImage imageNamed:@"8.png"];
    UIImage* imageFive = [UIImage imageNamed:@"10.png"];
    
    NSArray* arrayOfImages = [NSArray arrayWithObjects:imageOne, imageTwo, imageThree, imageFour, imageFive, nil];
    viewForImage.animationImages = arrayOfImages;
    viewForImage.animationDuration = 3.f;
    [viewForImage startAnimating];
    
    
//    [self moveImageView:self.imageFighter];
    
    
    
    
    
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 75, 75)];
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 325, 75, 75)];
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 450, 75, 75)];
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 575, 75, 75)];
    
    
    
    NSArray* arrayOfhorizontViews = [NSArray arrayWithObjects:view1, view2, view3, view4, nil];
    
    for (UIView* anyView in arrayOfhorizontViews) {
        [self.view addSubview:anyView];
        anyView.backgroundColor = [self randomColor];
    }
    
    [self moveView:view1 withOption:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view2 withOption:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view3 withOption:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:view4 withOption:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    
    
//    Student
    CGRect r = self.view.bounds;
    CGFloat sizeOfCornerSquare = 75.f;
    
//    Создаём 4 квадратые вьюхи по углам
    UIView* cornerView1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(r), CGRectGetMinY(r), sizeOfCornerSquare, sizeOfCornerSquare)];
    cornerView1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    
    
    UIView* cornerView2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(r), CGRectGetMaxY(r) - 75, sizeOfCornerSquare, sizeOfCornerSquare)];
    cornerView2.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.8];
   
    
    UIView* cornerView3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(r) - 75, CGRectGetMinY(r), sizeOfCornerSquare, sizeOfCornerSquare)];
    cornerView3.backgroundColor  = [[UIColor greenColor] colorWithAlphaComponent:0.8];

    
    UIView* cornerView4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(r) - 75, CGRectGetMaxY(r) - 75, sizeOfCornerSquare, sizeOfCornerSquare)];
    cornerView4.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];

    
    NSArray* arrayOfCornerViews = [NSArray arrayWithObjects:cornerView1, cornerView2, cornerView3, cornerView4, nil];
    
    for (UIView* anyCornerView in arrayOfCornerViews) {
        [self.view addSubview:anyCornerView];
    }
    
    self.cornerViewOne = cornerView1;
    self.cornerViewTwo = cornerView2;
    self.cornerViewThree = cornerView3;
    self.cornerViewFour = cornerView4;

    
    [self moveCornerViews];

}


-(UIColor*) randomColor {
    CGFloat r = (float)(arc4random() % 256 / 255.f);
    CGFloat g = (float)(arc4random() % 256 / 255.f);
    CGFloat b = (float)(arc4random() % 256 / 255.f);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}


-(void) moveView:(UIView*) view withOption:(UIViewAnimationOptions) options {
    
    
//    For 4 horizontal views
    [UIView animateWithDuration:6
                          delay:0
                        options:options
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}


-(void) moveCornerViews {
   
    CGRect r = self.view.bounds;
    CGFloat sizeOfCornerSquare = 75.f;
    
    [UIView animateWithDuration:6
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.cornerViewOne.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(r) - sizeOfCornerSquare, 0);
                         self.cornerViewOne.backgroundColor = [UIColor greenColor];
                         
                         
                         self.cornerViewTwo.transform = CGAffineTransformMakeTranslation(0, CGRectGetMinY(r) - CGRectGetMaxY(r) + sizeOfCornerSquare);
                         self.cornerViewTwo.backgroundColor = [UIColor redColor];
                         
                         
                         self.cornerViewThree.transform = CGAffineTransformMakeTranslation(0, CGRectGetMaxY(r) - sizeOfCornerSquare);
                         self.cornerViewThree.backgroundColor = [UIColor blueColor];
                      
                         self.cornerViewFour.transform = CGAffineTransformMakeTranslation(CGRectGetMinX(r) - CGRectGetMaxX(r) + sizeOfCornerSquare, 0);
                         self.cornerViewFour.backgroundColor = [UIColor yellowColor];
                      
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    

    
 
    
    
}


-(void) moveImageView:(UIView*) view {
    
    [UIView animateWithDuration:5
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
            self.imageFighter.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(self.view.bounds) , 0);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
    
}

@end
