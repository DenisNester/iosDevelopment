//
//  ViewController.m
//  supermanChessboard
//
//  Created by Denis Nesteruk on 3/5/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"
#import "CheckerView.h"
@interface ViewController ()
@property (weak, nonatomic) UIView* chessboard;
@property (weak, nonatomic) UIView* draggingView;
@property (weak, nonatomic) UIView* blackSquare;

@property (strong, nonatomic) NSMutableArray* arrayOfBlackSquares;
@property (strong, nonatomic) NSMutableArray* arrayOfOrangeCheckers;
@property (strong, nonatomic) NSMutableArray* arrayOfPurpleCheckers;


@end

@implementation ViewController


-(void) loadView {
    [super loadView];
 
#pragma mark - Make board and blackSquares
    
//    Make a board for black squares
    UIView* board = [[UIView alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), CGRectGetWidth(self.view.bounds))];
    board.backgroundColor = [UIColor grayColor];
    [self.view addSubview:board];
    self.chessboard = board;
    
    
    
    CGFloat sideOfBlackSquare = CGRectGetWidth(self.view.bounds) / 8;
    CGRect rectBlackSquare = CGRectMake(0, 0, sideOfBlackSquare, sideOfBlackSquare);
    
    self.arrayOfBlackSquares = [NSMutableArray array];
    
//    Чёрные квадраты в 2 4 6 8 ряды + добавление в массив
    for (int j = 0; j < 4; j++) {
        
    for (int i = 0; i < 4; i++) {
        
//        if (i %% 2 == 0) {
//
//        }
        UIView* blackSquare = [[UIView alloc] initWithFrame:rectBlackSquare];
        blackSquare.backgroundColor = [UIColor blackColor];
        [self.chessboard addSubview:blackSquare];
        
        [self.arrayOfBlackSquares addObject:blackSquare];
        
        rectBlackSquare.origin.x += sideOfBlackSquare*2;
    }

        rectBlackSquare.origin.x = 0;
        rectBlackSquare.origin.y += sideOfBlackSquare*2;
    }
    
    
    
//    Чёрные квадраты в 1 3 5 7
    rectBlackSquare.origin.x = sideOfBlackSquare;
    rectBlackSquare.origin.y = sideOfBlackSquare;
    
    for (int j = 0; j < 4; j++) {
    
    for (int i = 0; i < 4; i++) {
        
        UIView* blackSquare = [[UIView alloc] initWithFrame:rectBlackSquare];
        blackSquare.backgroundColor = [UIColor blackColor];
        [self.chessboard addSubview:blackSquare];
        [self.arrayOfBlackSquares addObject:blackSquare];
        
        rectBlackSquare.origin.x += sideOfBlackSquare*2;
    }
        rectBlackSquare.origin.x = sideOfBlackSquare;
        rectBlackSquare.origin.y += sideOfBlackSquare*2;
    }
    
#pragma mark - Make all checkers
    
    
//    Оранжевые шашки в 1 и 3 ряды
    self.arrayOfOrangeCheckers = [NSMutableArray array];
    
    CGFloat sideOfChecker = sideOfBlackSquare / 1.5f;
    CGRect rectChecker = CGRectMake(CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6, CGRectGetMinY(self.chessboard.frame) + sideOfBlackSquare / 6, sideOfChecker, sideOfChecker);
    
    
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
    
    CheckerView* orangeChecker = [[CheckerView alloc] initWithFrame:rectChecker];
    orangeChecker.backgroundColor = [UIColor orangeColor];
    orangeChecker.layer.cornerRadius = orangeChecker.bounds.size.width / 2;
    orangeChecker.layer.masksToBounds = YES;
    [self.view addSubview:orangeChecker];
    [self.arrayOfOrangeCheckers addObject:orangeChecker];
    
        rectChecker.origin.x += sideOfBlackSquare*2;
    }
        rectChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6;
        rectChecker.origin.y += sideOfBlackSquare*2;
    }
    
    
    
//    Оранжевые шашки во второй ряд
    rectChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare;
    rectChecker.origin.y = CGRectGetMinY(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare;
   
    for (int i = 0; i < 4; i++) {
        
        CheckerView* orangeChecker = [[CheckerView alloc] initWithFrame:rectChecker];
        orangeChecker.backgroundColor = [UIColor orangeColor];
        orangeChecker.layer.cornerRadius = orangeChecker.bounds.size.width / 2;
        orangeChecker.layer.masksToBounds = YES;
        [self.view addSubview:orangeChecker];
        [self.arrayOfOrangeCheckers addObject:orangeChecker];
        
        rectChecker.origin.x += sideOfBlackSquare*2;
    }
    
    
    
    
//     Фиолетовые шашки в 6 и 8 ряды
    self.arrayOfPurpleCheckers = [NSMutableArray array];
   
    
    rectChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare;
    rectChecker.origin.y = CGRectGetMinY(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare + sideOfBlackSquare*4;
    
    
    for (int j = 0; j < 2; j++) {
    
    for (int i = 0; i < 4; i++) {
        CheckerView* purpleChecker = [[CheckerView alloc] initWithFrame:rectChecker];
        purpleChecker.backgroundColor = [UIColor purpleColor];
        purpleChecker.layer.cornerRadius = purpleChecker.bounds.size.width / 2;
        purpleChecker.layer.masksToBounds = YES;
        [self.view addSubview:purpleChecker];
        
        [self.arrayOfPurpleCheckers addObject:purpleChecker];
        
        rectChecker.origin.x += sideOfBlackSquare*2;
    }
        rectChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare;
        rectChecker.origin.y += sideOfBlackSquare*2;
    }
    
    
//    Фиолетовые шашки в 7 ряд
    rectChecker.origin.x = CGRectGetMinX(self.chessboard.frame) + sideOfBlackSquare / 6;
    rectChecker.origin.y = CGRectGetMinY(self.chessboard.frame) + sideOfBlackSquare / 6 + sideOfBlackSquare + sideOfBlackSquare*5;
    
    
    for (int i = 0; i < 4; i++) {
        CheckerView* purpleChecker = [[CheckerView alloc] initWithFrame:rectChecker];
        purpleChecker.backgroundColor = [UIColor purpleColor];
        purpleChecker.layer.cornerRadius = purpleChecker.bounds.size.width / 2;
        purpleChecker.layer.masksToBounds = YES;
        [self.view addSubview:purpleChecker];
        
        [self.arrayOfPurpleCheckers addObject:purpleChecker];
        
        rectChecker.origin.x += sideOfBlackSquare*2;
    }
    

}

#pragma mark - Touches

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event];
    
//    NSIndexSet* indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 7)];
    
    if ([view isKindOfClass:[CheckerView class]]) {
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
        
    }
    
}


-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self onTouchesEnded];
    
    CheckerView* checkerView = (CheckerView*)[touches anyObject].view;
    
    for (UIView* anyBlackSquare in self.arrayOfBlackSquares) {
        if (CGRectIntersectsRect(anyBlackSquare.frame, checkerView.frame)) {
            checkerView.frame = CGRectMake(anyBlackSquare.center.x, anyBlackSquare.center.y, checkerView.frame.size.width, checkerView.frame.size.height);
        }
    }
    
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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
