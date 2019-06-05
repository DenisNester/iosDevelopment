//
//  ViewController.m
//  Gestures
//
//  Created by Denis Nesteruk on 3/10/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGuidedAccessRestrictionDelegate>

@property (weak, nonatomic) UIView* testView;

@property (assign, nonatomic) CGFloat testViewScale;
@property (assign, nonatomic) CGFloat testViewRotation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) - 50, 100, 100)];
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    self.testView = view;
    
    
//    UILongPressGestureRecognizer
    
//    Одинарный тап
    UITapGestureRecognizer* tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                        action:@selector(handleTap:)];
    
//    tapGesture.numberOfTapsRequired = 2; срабатывает только двойной тап
//    tapGesture.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:tapGesture];
    
    
    
//    Двойной тап
    UITapGestureRecognizer* doubleTapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTap:)];

    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    
    
    
//    Двойной тап+тач
    UITapGestureRecognizer* doubleTapGestureDoubleTouch =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTapDoubleTouch:)];
    
    doubleTapGestureDoubleTouch.numberOfTapsRequired = 2;
    doubleTapGestureDoubleTouch.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapGestureDoubleTouch];
    
//    Тап не срабатывает пока не сработает дабл тап
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    
//    ЗУМ!
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
    
//    Поворот
    UIRotationGestureRecognizer* rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
//    !!!
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    
    
//    PAN! Перемещение
    UIPanGestureRecognizer* panGesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
    
    
    //    Швайп :) У свайпа мы ставим direction - направление(если ставим и влево и вправо - получается горизонт.свайп)
    
//    Вертикальный
    UISwipeGestureRecognizer* verticalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleVerticalSwipe:)];
    verticalSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    verticalSwipeGesture.delegate = self;
    [self.view addGestureRecognizer:verticalSwipeGesture];
    
    
//    Горизонтальный
    UISwipeGestureRecognizer* horizontalSwipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleHorizontalSwipe:)];
    horizontalSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    horizontalSwipeGesture.delegate = self;
    [self.view addGestureRecognizer:horizontalSwipeGesture];
}

#pragma mark - Methods

-(UIColor*) randomColor {
    
    CGFloat r = (float)(arc4random() % 256 / 255.f);
    CGFloat g = (float)(arc4random() % 256 / 255.f);
    CGFloat b = (float)(arc4random() % 256 / 255.f);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}




#pragma mark - Gestures

-(void) handleTap:(UITapGestureRecognizer*) tapGesture {
    NSLog(@"Tap: %@", NSStringFromCGPoint([tapGesture locationInView:self.view]));
    
    self.testView.backgroundColor = [self randomColor];
}


-(void) handleDoubleTap:(UITapGestureRecognizer*) doubleTapGesture {
    NSLog(@"Double Tap: %@", NSStringFromCGPoint([doubleTapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransofrm = self.testView.transform; // текущий трансформ
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransofrm, 1.2f, 1.2f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
        self.testView.transform = newTransform;
                     }];
    
    self.testViewScale = 1.2f;
}


-(void) handleDoubleTapDoubleTouch:(UITapGestureRecognizer*) doubleTapGesture {
    NSLog(@"Double Tap Double Touch: %@", NSStringFromCGPoint([doubleTapGesture locationInView:self.view]));
    
    CGAffineTransform currentTransofrm = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransofrm, 0.8f, 0.8f);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.testView.transform = newTransform;
                     }];
    
    self.testViewScale = 0.8f;
}



-(void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture {
    
    NSLog(@"handlePinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
    
    CGFloat newScale = 1.0 + pinchGesture.scale - self.testViewScale;
    
    CGAffineTransform currentTransofrm = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransofrm, newScale, newScale);
    
    self.testView.transform = newTransform;
    
//    Каждый раз ,когда мы изменяем scale - мы должны его сохранить
    self.testViewScale = pinchGesture.scale;
}



-(void) handleRotation:(UIRotationGestureRecognizer*) rotationGesture {
    NSLog(@"handleRotation %1.3f", rotationGesture.rotation);
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransofrm = self.testView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransofrm, newRotation);
    
    self.testView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
}



-(void) handlePan:(UIPanGestureRecognizer*) panGesture {
    NSLog(@"handlePan");
    
    self.testView.center = [panGesture locationInView:self.view];
}




-(void) handleVerticalSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    NSLog(@"vertical swipe");
}



-(void) handleHorizontalSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    NSLog(@"horizontal swipe");

}



#pragma mark - UIGestureRecognizerDelegate
//чтобы отрабатывали и scale и rotation в жестах
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

//чтобы срабатывал swipe,а не pan
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]];
}


@end
