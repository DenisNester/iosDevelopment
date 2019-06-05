//
//  ViewController.m
//  UITouchRepeat
//
//  Created by Denis Nesteruk on 3/9/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIView* draggingView;

@property (assign, nonatomic) CGPoint touchOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
//    self.testView = view;
    
//    self.view.multipleTouchEnabled = YES;
}


#pragma mark - Touches


-(void) logTouches:(NSSet*) touches withMethod:(NSString*) methodName {
    NSMutableString* string = [NSMutableString stringWithString:methodName];
    
    for (UITouch* touch in touches) {
        
        CGPoint point = [touch locationInView:self.view];
        [string appendFormat:@" %@", NSStringFromCGPoint(point)];
    }
    NSLog(@"%@", string);
    
}


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    UITouch* touch = [touches anyObject];
    
    CGPoint pointOnMainView = [touch locationInView:self.view];
    
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event];
    
    if (![view isEqual:self.view]) {
        self.draggingView = view;
        
        CGPoint touchPoint = [touch locationInView:self.draggingView];
        
        self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
    } else {
        self.draggingView = nil;
    }
    
    
//    NSLog(@"inside = %d", [self.view pointInside:pointOnMainView withEvent:event]);
}


-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self logTouches:touches withMethod:@"touchesMoved"];
    
    
    if (self.draggingView) {
        
        UITouch* touch = [touches anyObject];
        
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        
        self.draggingView.center = correction;
    }
    
}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
   [self logTouches:touches withMethod:@"touchesEnded"];
    
    self.draggingView = nil;
}


-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
  [self logTouches:touches withMethod:@"touchesCanceled"];
    
    self.draggingView = nil;
}

@end
