//
//  ViewController.m
//  GeometryChessboardHomework
//
//  Created by Denis Nesteruk on 2/28/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property  (weak, nonatomic) UIView* chessBoard;
@property (weak, nonatomic) UIView* blackSquare;
@property (assign, nonatomic) CGFloat sizeOfSideSquare;

@property (weak, nonatomic) UIView* redChecker;
@property (weak, nonatomic) UIView* whiteChecker;
@property (assign, nonatomic) CGFloat sizeOfChecker;

@property (strong, nonatomic) NSMutableArray* arrayOfBlackSquares;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* board = [[UIView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
    board.backgroundColor = [[UIColor brownColor] colorWithAlphaComponent:0.8];
    board.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
                             UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin ;
    [self.view addSubview:board];
    self.chessBoard = board;
    
    
  
    CGFloat sideSquare = 46.85f;
    self.sizeOfSideSquare = sideSquare;
    
    
//    Задаём размер чёрных квадратов
    CGRect r = CGRectMake(0, 0, sideSquare, sideSquare);
    
    
//    Цикл для расстановки чёрных квадратов в ряды 1 3 5 7
    for (int i = 0; i < 4; i++) {
        
        for (int j = 0; j < 4; j++) {
        UIView* square = [[UIView alloc] initWithFrame:r];
        square.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        [self.chessBoard addSubview:square];
        self.blackSquare = square;

        r.origin.x += sideSquare*2;
    }
        r.origin.x = 0;
        r.origin.y += sideSquare*2;
    
    }
    
//    Цикл для расстановки чёрных квадрадов в ряды 2 4 6 8
    r.origin.x = sideSquare;
    r.origin.y = sideSquare;
    
    for (int i = 0; i < 4; i++) {
        
        for (int j = 0; j < 4; j++) {
            UIView* square = [[UIView alloc] initWithFrame:r];
            square.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
            [self.chessBoard addSubview:square];
            self.blackSquare = square;
        
        r.origin.x += sideSquare*2;
    }
        r.origin.x = sideSquare;
        r.origin.y += sideSquare*2;
    }
    
    
    
//    Задаём размеры шашки и начальную координату первой шашки
   
    CGFloat checkerSize = 23.42f;
    self.sizeOfChecker = checkerSize;
   
    CGRect firstRedChecker = CGRectMake(11, 211, checkerSize, checkerSize);
    
    
//    Cтавим красные шашки в 1 и 3 ряды
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
        UIView* redCheck = [[UIView alloc] initWithFrame:firstRedChecker];
        redCheck.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
        [self.view addSubview:redCheck];
        self.redChecker = redCheck;
        
        firstRedChecker.origin.x += sideSquare*2;
    }
        firstRedChecker.origin.x = 11;
        firstRedChecker.origin.y += sideSquare*2;
   
    }
    
    
//    Ставим красные шашки во второй ряд
    
    firstRedChecker.origin.x = 11 + sideSquare;
    firstRedChecker.origin.y = 211 + sideSquare;
    
    for (int i = 0; i < 4; i++) {
        UIView* redCheck = [[UIView alloc] initWithFrame:firstRedChecker];
        redCheck.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
        [self.view addSubview:redCheck];
        self.redChecker = redCheck;
        
        firstRedChecker.origin.x += sideSquare*2;
    }
    
    
    
    
//    Ставим белые шашки в 7 ряд
    
    CGRect firstWhiteChecker = CGRectMake(11, 211 + sideSquare*6, checkerSize, checkerSize);
    
    
    for (int i = 0; i < 4; i++) {
        UIView* whiteCheck = [[UIView alloc] initWithFrame:firstWhiteChecker];
        whiteCheck.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self.view addSubview:whiteCheck];
        
        self.whiteChecker = whiteCheck;
        
        firstWhiteChecker.origin.x += sideSquare*2;
    }
    
    
//    Ставим белые шашки в 6 и 8 ряды
//    Меняем стартовую координату белой шашки
    firstWhiteChecker.origin.x = 11 + sideSquare;
    firstWhiteChecker.origin.y = 211 + sideSquare*5;
    
    
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
        UIView* whiteCheck = [[UIView alloc] initWithFrame:firstWhiteChecker];
        whiteCheck.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self.view addSubview:whiteCheck];
        
        self.whiteChecker = whiteCheck;
        
        firstWhiteChecker.origin.x += sideSquare*2;
    }
        firstWhiteChecker.origin.x = 11+ sideSquare;
        firstWhiteChecker.origin.y += sideSquare*2;
        
    }
    
}



-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    self.arrayOfBlackSquares = [NSMutableArray array];
    
    for (UIView* anyView in self.chessBoard.subviews) {
        [self.arrayOfBlackSquares addObject:anyView];
//        anyView.backgroundColor = [self randomColor];
    }
    
    

}


-(UIColor*) randomColor {
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}



@end
