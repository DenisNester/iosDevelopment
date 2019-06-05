//
//  ViewController.m
//  GeometryHomework
//
//  Created by Denis Nesteruk on 2/14/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView* chessBoard;
@property (strong, nonatomic) UIView* blackSquare;

@property (strong, nonatomic) UIView* whiteCheckers;
@property (strong, nonatomic) UIView* redCheckers;


@property (strong, nonatomic) NSMutableArray* arrayOfBlackSqaures;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
//    Задаём размеры самой доски
    CGRect board = CGRectMake(0, 200, 420, 420);
//    Добавляем доску на вьюху
    self.chessBoard = [[UIView alloc] initWithFrame:board];
    self.chessBoard.backgroundColor = [UIColor brownColor];
    
    self.chessBoard.autoresizingMask =
                                    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
                                    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    
    self.chessBoard.center = [self.view convertPoint:self.view.center fromView:self.view.superview]; //при поворотах,чтобы доска находилась всегда по центру
    
    [self.view addSubview:self.chessBoard];
    
//    Задаём размеры чёрного квадрата на доске
    CGRect square = CGRectMake(0, 0, 52.5f , 52.5f);

//    ЦИКЛ ДЛЯ РЯДОВ 1 3 5 7
    for (int i = 0; i < 4; i++) {
        
    for (int j = 0; j < 4; j++) {
        self.blackSquare = [[UIView alloc] initWithFrame:square];
        self.blackSquare.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        
        
        
        [self.chessBoard addSubview:self.blackSquare];
        
        square.origin.x += 105.f;
    }
        square.origin.x = 0;
        square.origin.y += 105;
    }
    
    
//    ЦИКЛ ДЛЯ РЯДОВ 2 4 6 8
    square.origin.x = 52.5f;
    square.origin.y = 52.5f;
    for (int i = 0; i < 4; i++) {
        
        for (int j = 0; j < 4; j++) {
            
            self.blackSquare = [[UIView alloc] initWithFrame:square];
            self.blackSquare.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
            [self.chessBoard addSubview:self.blackSquare];
            
            square.origin.x += 105.f;
        }
        square.origin.x = 52.5f;
        square.origin.y += 105.f;
    }
    
    
//   ШАШКИ
    
//    задаём размер шашек
    CGRect redChecker = CGRectMake(8, 250 , 30, 30);
    
#pragma mark - placed Red Checkers
    
//    Ставим red шашки в 1 и 3 ряд
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 4; j++) {
            self.redCheckers = [[UIView alloc] initWithFrame:redChecker];
            self.redCheckers.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
            
            [self.view addSubview:self.redCheckers];
            
            redChecker.origin.x += 105.f;
        }
        redChecker.origin.x = 8;
        redChecker.origin.y += 105.f;
        
    }
    
//    Ставим red шашки во 2ой ряд
    redChecker.origin.x = 60.f;
    redChecker.origin.y = 300.f;
    
    for (int i = 0; i < 4; i++) {
        self.redCheckers = [[UIView alloc] initWithFrame:redChecker];
        self.redCheckers.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
        [self.view addSubview:self.redCheckers];
        
        redChecker.origin.x += 105.f;
    }
    
#pragma mark - placed White Checkers
//    Задаём размер белой шашке
    CGRect whiteChecker = CGRectMake(60.f, 510.f , 30, 30);
    
//    Ставим белые в 6 и 8 ряд
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 4; j++) {
            self.whiteCheckers = [[UIView alloc] initWithFrame:whiteChecker];
            self.whiteCheckers.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
            [self.view addSubview:self.whiteCheckers];
            
            whiteChecker.origin.x += 105.f;
        }
        whiteChecker.origin.x = 60.f;
        whiteChecker.origin.y += 105.f;
        
    }
    
    
//    Ставим белые в 7 ряд
    whiteChecker.origin.x = 8.f;
    whiteChecker.origin.y = 565.f;
    
    for (int i = 0; i < 1; i++) {
        
        for (int j = 0; j < 4; j++) {
            self.whiteCheckers = [[UIView alloc] initWithFrame:whiteChecker];
            self.whiteCheckers.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
            [self.view addSubview:self.whiteCheckers];
            
            whiteChecker.origin.x += 105.f;
        }
        
        
        
    }
    

}


#pragma mark - Orientation

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
//    Собираем все чёрные квадраты из нашей вьюхи chessboard  и закидываем в массив,чтобы всем менять цвета
    /*
    self.arrayOfBlackSqaures = [[NSMutableArray alloc]init];
    for (UIView* subview in self.chessBoard.subviews) {
        [self.arrayOfBlackSqaures addObject:subview];
    }

    for (UIView* anySquare in self.arrayOfBlackSqaures) {
        
        CGFloat red = arc4random_uniform(256) / 255.0;
        CGFloat green = arc4random_uniform(256) / 255.0;
        CGFloat blue = arc4random_uniform(256) / 255.0;
        
        UIColor* randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        
        anySquare.backgroundColor = randomColor;
    }
    */
}





@end
