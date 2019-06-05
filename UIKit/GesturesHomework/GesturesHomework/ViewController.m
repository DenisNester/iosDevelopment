//
//  ViewController.m
//  GesturesHomework
//
//  Created by Denis Nesteruk on 3/11/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGuidedAccessRestrictionDelegate>
@property (weak, nonatomic) UIImageView* imageView;

@property (assign, nonatomic) CGPoint pointOnTap;
@property (assign, nonatomic) CGFloat testViewRotation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#pragma mark - Creation Of Image View
    
    UIImageView* testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, CGRectGetWidth(self.view.bounds) / 4, CGRectGetWidth(self.view.bounds) / 4)];
    [self.view addSubview:testImageView];
    
    self.imageView = testImageView;
    
    
    UIImage* image1 = [UIImage imageNamed:@"first.jpg"];
    UIImage* image2 = [UIImage imageNamed:@"second.jpg"];
    UIImage* image3 = [UIImage imageNamed:@"third.jpg"];
    UIImage* image4 = [UIImage imageNamed:@"fourth.jpg"];
    
    NSArray* arrayOfImages = [NSArray arrayWithObjects:image1, image2, image3, image4, nil];
    testImageView.animationImages = arrayOfImages;
    testImageView.animationDuration = 3;
    [testImageView startAnimating];
    
    
#pragma mark - Creation tap gesture
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGesture];
    
#pragma mark - swipe gestures
    UISwipeGestureRecognizer* rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipe:)];
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
    UISwipeGestureRecognizer* leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];

#pragma mark - creation of double tap double touch stop animation
    UITapGestureRecognizer* doubleTapGestureDoubleTouch =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleDoubleTapDoubleTouch:)];
    
    doubleTapGestureDoubleTouch.numberOfTapsRequired = 2;
    doubleTapGestureDoubleTouch.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapGestureDoubleTouch];
    
#pragma mark - creation of pinch gesture
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
#pragma mark - creation of rotation gesture
    UIRotationGestureRecognizer* rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
}


#pragma mark - Handles

-(void) handleRightSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    NSLog(@"handle right swipe");
    
     CABasicAnimation* fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360 * M_PI) / 180)];
    fullRotation.duration = 10;
    fullRotation.repeatCount = 0;
    [self.imageView.layer addAnimation:fullRotation forKey:@"360"];
    
  
}


-(void) handleLeftSwipe:(UISwipeGestureRecognizer*) swipeGesture {
    NSLog(@"handle left swipe");
    
    CABasicAnimation* fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((-360 * M_PI) / 180)];
    fullRotation.duration = 10;
    fullRotation.repeatCount = 0;
    [self.imageView.layer addAnimation:fullRotation forKey:@"-360"];
    
}


-(void) handleTap:(UIPanGestureRecognizer*) tapGesture {
    NSLog(@"handlePan");
    
    self.pointOnTap = [tapGesture locationInView:self.view];
    
    [UIView animateWithDuration:3
                          delay:0
                        options: UIViewAnimationOptionCurveLinear | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.imageView.center = self.pointOnTap;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Done!");
                     }];
    
}


-(void) handleDoubleTapDoubleTouch:(UITapGestureRecognizer*) doubleTapGesture {
    NSLog(@"Double Tap Double Touch: %@", NSStringFromCGPoint([doubleTapGesture locationInView:self.view]));
    
    [self.imageView.layer removeAnimationForKey:@"360"];
    [self.imageView.layer removeAnimationForKey:@"-360"];
}



-(void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture {
    
    CGFloat lastScaleFactor = 1;
    CGFloat factor = [(UIPinchGestureRecognizer*)  pinchGesture scale];
    
    
    if (factor  > 1) {
        self.imageView.transform = CGAffineTransformMakeScale(lastScaleFactor + (factor - 1), lastScaleFactor + (factor - 1));
    } else {
        self.imageView.transform = CGAffineTransformMakeScale(lastScaleFactor* factor, lastScaleFactor* factor);
    }
 
    if (pinchGesture.state == UIGestureRecognizerStateEnded) {
        
        if (factor > 1) {
            lastScaleFactor += (factor - 1);
        } else {
            lastScaleFactor *= factor;
        }
        
    }
    
}


-(void) handleRotation:(UIRotationGestureRecognizer*) rotationGesture {
    
    NSLog(@"handle rotation");
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransofrm = self.imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransofrm, newRotation);
    
    self.imageView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
    
    
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}


@end
