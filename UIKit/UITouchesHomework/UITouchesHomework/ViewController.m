//
//  ViewController.m
//  UITouchesHomework
//
//  Created by Denis Nesteruk on 3/4/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView* chessboard;
@property (weak, nonatomic) UIView* blackSquare;

@property (weak, nonatomic) UIView* orangeChecker;
@property (weak, nonatomic) UIView* whiteChecker;

@property (assign, nonatomic) CGFloat sideOfChecker;
@property (assign, nonatomic) CGFloat sideOfBlackSquare;

@property (weak, nonatomic) UIView* draggingView;

@end

@implementation ViewController

-(void) loadView {
    [super loadView];
    
    UIView* chessboardView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
    chessboardView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:chessboardView];
    self.chessboard = chessboardView;
    
    
    CGFloat sizeOfsideBlackSquare = self.view.bounds.size.width / 8;
    self.sideOfBlackSquare = sizeOfsideBlackSquare;
    
    
//    Задаём размеры и координату первой шашки
    CGRect r = CGRectMake(0, 0, sizeOfsideBlackSquare, sizeOfsideBlackSquare);

//  Цикл для того,чтобы расставить чёрные квадраты в ряды 1 3 5 7
    for (int j = 0; j < 4; j++) {
    
    for (int i = 0; i < 4; i++) {
        UIView* blackSquare = [[UIView alloc] initWithFrame:r];
        blackSquare.backgroundColor = [UIColor blackColor];
        [self.chessboard addSubview:blackSquare];
        self.blackSquare = blackSquare;
        
        r.origin.x += sizeOfsideBlackSquare*2;
    }
        r.origin.x = 0;
        r.origin.y += sizeOfsideBlackSquare*2;
    }
    
    
//    Цикл для того,чтобы расставить чёрные квадраты в ряды 2 4 6 8
    r.origin.x = sizeOfsideBlackSquare;
    r.origin.y = sizeOfsideBlackSquare;
    
    for (int j = 0; j < 4; j++) {
    
    for (int i = 0; i < 4; i++) {
        UIView* blackSquare = [[UIView alloc] initWithFrame:r];
        blackSquare.backgroundColor = [UIColor blackColor];
        [self.chessboard addSubview:blackSquare];
        self.blackSquare = blackSquare;
        
        r.origin.x += sizeOfsideBlackSquare*2;
        
    }
        r.origin.x = sizeOfsideBlackSquare;
        r.origin.y += sizeOfsideBlackSquare*2;
    }
    
    
//    Задаём размер и координату первой белой шашки
    CGFloat checkersSide = sizeOfsideBlackSquare / 1.5;
    self.sideOfChecker = checkersSide;
    CGRect rectWhiteChecker = CGRectMake(CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6, CGRectGetMinY(self.chessboard.frame) + self.sideOfBlackSquare / 6, checkersSide, checkersSide);
    
//    Цикл для расстановки белых шашек в 1 и 3 ряд
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
    
    UIView* whiteChecker = [[UIView alloc] initWithFrame:rectWhiteChecker];
    whiteChecker.backgroundColor = [UIColor whiteColor];
    whiteChecker.layer.cornerRadius = whiteChecker.bounds.size.width / 2;
    whiteChecker.layer.masksToBounds = YES;
    [self.view addSubview:whiteChecker];
    self.whiteChecker = whiteChecker;
    
        
        rectWhiteChecker.origin.x += sizeOfsideBlackSquare*2;
    }
        rectWhiteChecker.origin.x =  CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6;
        rectWhiteChecker.origin.y += sizeOfsideBlackSquare*2;
    }
    
    
    
//    Цикл для расстановки белых шашек во второй ряд
    rectWhiteChecker.origin.x =  CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare;
    rectWhiteChecker.origin.y = CGRectGetMinY(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare;
    
    for (int i = 0; i < 4; i++) {
        UIView* whiteChecker = [[UIView alloc] initWithFrame:rectWhiteChecker];
        whiteChecker.backgroundColor = [UIColor whiteColor];
        whiteChecker.layer.cornerRadius = whiteChecker.bounds.size.width / 2;
        whiteChecker.layer.masksToBounds = YES;
        [self.view addSubview:whiteChecker];
        self.whiteChecker = whiteChecker;
        
        rectWhiteChecker.origin.x += sizeOfsideBlackSquare*2;
    }
    
    
    
    
//    Задаём размер и координату первой оранжевой шашки
    CGRect rectOrangeChecker = CGRectMake(CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare, CGRectGetMinY(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare*5, checkersSide, checkersSide);
    
//    Цикл для расстановки шашек в 6 и 8 ряды
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
    UIView* orangeChecker = [[UIView alloc] initWithFrame:rectOrangeChecker];
    orangeChecker.backgroundColor = [UIColor orangeColor];
    orangeChecker.layer.cornerRadius = orangeChecker.bounds.size.width / 2;
    orangeChecker.layer.masksToBounds = YES;
    [self.view addSubview:orangeChecker];
    
    self.orangeChecker = orangeChecker;
        
    rectOrangeChecker.origin.x += sizeOfsideBlackSquare*2;
    }
    rectOrangeChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare;
    rectOrangeChecker.origin.y += sizeOfsideBlackSquare*2;
    }
    
    
    
//    Цикл для расстановки шашек в 7 ряд
    rectOrangeChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + self.sideOfBlackSquare / 6;
    rectOrangeChecker.origin.y = CGRectGetMinY(self.chessboard.frame) + self.sideOfBlackSquare / 6 + self.sideOfBlackSquare*6;
    
    for (int i = 0; i < 4; i++) {
        UIView* orangeChecker = [[UIView alloc] initWithFrame:rectOrangeChecker];
        orangeChecker.backgroundColor = [UIColor orangeColor];
        orangeChecker.layer.cornerRadius = orangeChecker.bounds.size.width / 2;
        orangeChecker.layer.masksToBounds = YES;
        [self.view addSubview:orangeChecker];
        
        self.orangeChecker = orangeChecker;
        rectOrangeChecker.origin.x += sizeOfsideBlackSquare*2;
    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.chessboard.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin         | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
}


-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event];
    
    if (![view isEqual:self.view]) {
        self.draggingView = view;
    } else {
        self.draggingView = nil;
    }
    
    [self.draggingView.layer removeAllAnimations];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                        
                         self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                         self.draggingView.alpha = 0.3f;
                     }];
    
    
}


-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.draggingView) {
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        self.draggingView.center = pointOnMainView;
    }
    
    
}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self onTouchesEnded];
    
    self.draggingView = nil;
}


-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self onTouchesEnded];
    
    self.draggingView = nil;
}




-(void) onTouchesEnded {
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity; //начальное состояние
                         self.draggingView.alpha = 1.f;
                     }];
}

@end
