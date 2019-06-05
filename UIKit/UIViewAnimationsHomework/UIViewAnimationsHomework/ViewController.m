//
//  ViewController.m
//  UIViewAnimationsHomework
//
//  Created by Denis Nesteruk on 3/3/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView* viewWithSafeArea;

@property (weak, nonatomic) UIView* view1;
@property (weak, nonatomic) UIView* view2;
@property (weak, nonatomic) UIView* view3;
@property (weak, nonatomic) UIView* view4;


@property (weak, nonatomic) UIView* cornerView1;
@property (weak, nonatomic) UIView* cornerView2;
@property (weak, nonatomic) UIView* cornerView3;
@property (weak, nonatomic) UIView* cornerView4;

@property (strong, nonatomic) NSMutableArray* arrayOfViews;

@property (assign, nonatomic) CGFloat sideOfSquare;
@property (assign, nonatomic) CGFloat sideOfCornerSquare;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    
    CGFloat squareSide = 75.f;
    self.sideOfSquare = squareSide;
    self.arrayOfViews = [NSMutableArray array];
    
 
#pragma mark - Creation of horizontal views
    
    for (int i = 0; i < 4; i++) {
       UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds) + squareSide*3 + 100*i, squareSide, squareSide)];
        view.backgroundColor = [self randomColor];
        [self.arrayOfViews addObject:view];
        [self.view addSubview:view];
    }
    
    for (UIView* anyView in self.arrayOfViews) {
        self.view1 = [self.arrayOfViews objectAtIndex:0];
        self.view2 = [self.arrayOfViews objectAtIndex:1];
        self.view3 = [self.arrayOfViews objectAtIndex:2];
        self.view4 = [self.arrayOfViews objectAtIndex:3];
    }
    
    
#pragma mark - Creation of corner views
    
    CGFloat cornerSquareSide = 80.f;
    self.sideOfCornerSquare = cornerSquareSide;
    
    
    UIView* viewOne = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.viewWithSafeArea.frame), CGRectGetMinY(self.viewWithSafeArea.frame), cornerSquareSide, cornerSquareSide)];
    viewOne.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:viewOne];
    self.cornerView1 = viewOne;
    
    
    UIView* viewTwo = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.viewWithSafeArea.frame), CGRectGetMaxY(self.viewWithSafeArea.frame)  - cornerSquareSide, cornerSquareSide, cornerSquareSide)];
    viewTwo.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:viewTwo];
    self.cornerView2 = viewTwo;
    
    
    UIView* viewThree = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.viewWithSafeArea.frame) - cornerSquareSide, CGRectGetMinY(self.viewWithSafeArea.frame), cornerSquareSide, cornerSquareSide)];
    viewThree.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:viewThree];
    self.cornerView3 = viewThree;
    
    
    UIView* viewFour = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.viewWithSafeArea.frame) - cornerSquareSide, CGRectGetMaxY(self.viewWithSafeArea.frame) - cornerSquareSide, cornerSquareSide, cornerSquareSide)];
    viewFour.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8f];
    [self.view addSubview:viewFour];
    self.cornerView4 = viewFour;
    
}

#pragma mark - Operations with View

-(CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256 / 255.f);
}


-(UIColor*) randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}



-(void) moveView:(UIView*) view withOptions:(UIViewAnimationOptions) options {
    
    [UIView animateWithDuration:6
                          delay:0
                        options: options
                     animations:^{
                         view.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2, view.center.y);
                         view.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
}



-(void) moveCornerViews {
    
    [UIView animateWithDuration:6
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         self.cornerView1.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(self.viewWithSafeArea.bounds) - self.sideOfCornerSquare, 0);
                         self.cornerView1.backgroundColor = [UIColor grayColor];
                         
                         
                         self.cornerView2.transform = CGAffineTransformMakeTranslation(0, CGRectGetMinY(self.viewWithSafeArea.bounds) - CGRectGetMaxY(self.viewWithSafeArea.bounds) + self.sideOfCornerSquare);
                         self.cornerView2.backgroundColor = [UIColor orangeColor];
                         
                         
                         self.cornerView3.transform = CGAffineTransformMakeTranslation(0, CGRectGetMaxY(self.viewWithSafeArea.bounds) - self.sideOfCornerSquare);
                         self.cornerView3.backgroundColor = [UIColor blueColor];
                         
                         
                         
                         self.cornerView4.transform = CGAffineTransformMakeTranslation(CGRectGetMinX(self.viewWithSafeArea.bounds) - CGRectGetMaxX(self.viewWithSafeArea.bounds) + self.sideOfCornerSquare, 0);
                         self.cornerView4.backgroundColor = [UIColor purpleColor];
                         
                         
                         
                         
                         /*
                         CGAffineTransform transform1 = CGAffineTransformMakeTranslation(CGRectGetMaxX(self.viewWithSafeArea.bounds) - self.sideOfCornerSquare, 0);
                         
                         CGAffineTransform transform2 = CGAffineTransformMakeTranslation(0, CGRectGetMaxY(self.viewWithSafeArea.bounds) - self.sideOfCornerSquare);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(transform1, transform2);
                         self.cornerView1.transform = transform;
                        */
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
}



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self moveView:self.view1 withOptions:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:self.view2 withOptions:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:self.view3 withOptions:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    [self moveView:self.view4 withOptions:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse];
    
    [self moveCornerViews];
}


@end
