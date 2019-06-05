//
//  DrawningView.m
//  Drawnings
//
//  Created by Denis Nesteruk on 3/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DrawningView.h"

@implementation DrawningView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    [super drawRect:rect];
    
    //ШАХМАТНАЯ ДОСКА
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGFloat offset = 50.f; //отступы по ширине/высоте
    CGFloat borderWidth = 4.f; //рамки вокруг поля
    
    CGFloat maxBoardSize = MIN(CGRectGetWidth(rect) - offset * 2 - borderWidth * 2,
                               CGRectGetHeight(rect) - offset * 2 - borderWidth * 2);
    
    int cellSize = (int)maxBoardSize / 8; //размер чёрной клетки
    int boardSize = cellSize * 8;
    
    CGRect boardRect = CGRectMake((CGRectGetWidth(rect) - boardSize) / 2,
                                  (CGRectGetHeight(rect) - boardSize) / 2,
                                  boardSize, boardSize);
    
    boardRect = CGRectIntegral(boardRect);// чтобы не было размытостей и неточностей с дробными числами
   
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(boardRect) + i * cellSize,
                                             CGRectGetMinY(boardRect) + j * cellSize,
                                             cellSize, cellSize);
                
                CGContextAddRect(context, cellRect);
            }
        }
        
        
    }
    
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextFillPath(context);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddRect(context, boardRect);
    
    CGContextSetLineWidth(context, borderWidth);
    
    CGContextStrokePath(context);
    */
    
    
    
    
    
    
    
    NSLog(@"draw rect %@", NSStringFromCGRect(rect));
    
//    Context - в данном случае это "среда".В каждом контексте есть path(stack - очередь)
    
    CGContextRef context = UIGraphicsGetCurrentContext();
//    Есть два вида color - 1) fill - который заполняет   2) stroke color - окрашивает границы
    
    
    CGRect square1 = CGRectMake(100, 100, 100, 100);
    CGRect square2 = CGRectMake(200, 200, 100, 100);
    CGRect square3 = CGRectMake(300, 300, 100, 100);
    
    
    
//    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    
//    Таким образом добавляется rectangle
    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    CGContextAddRect(context, square3);
    
//    CGContextFillPath(context);
    CGContextStrokePath(context);
    
//    Нарисуем круг(добавлется внутрь recta)
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    CGContextAddEllipseInRect(context, square3);
    
    CGContextFillPath(context);
    
    
   //ЛИНИЯ(gray color) ИЗ ТЕКУЩЕЙ ДО НУЖНОЙ ТОЧКИ
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextSetLineWidth(context, 3.f); // задаём ширину линии
    CGContextSetLineCap(context, kCGLineCapRound); // делает конец линии закруглённым
    
//    первая линия от нижнего левого края первого квадрата до нижнего левого края третьего квадрата
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1)); //двигаем context  в данную точку
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3)); // добавляем линию до нужной точки
    
//    вторая линия от верхнего правого края первого квадрата до верхнего правого края третьего квадрата
    CGContextMoveToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    
    
    
    CGContextStrokePath(context);
    
    
    
    
//    НАРИСОВАТЬ ПОЛОВИНУ КРУГА
//    первый полукруг
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1), M_PI, 0, YES);
    
//    второй полукруг
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddArc(context, CGRectGetMinX(square3), CGRectGetMinY(square3), CGRectGetWidth(square3), 0, M_PI, YES);
    
    CGContextStrokePath(context);
    
    
//    НАРИСУЕМ ТЕКСТ ВНУТРИ ВТОРОГО КВАДРАТА
    NSString* text = @"test";
    UIFont* font = [UIFont systemFontOfSize:14.f];
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1); // оффсет - сдвиг.  сдвигаем по x и y
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowBlurRadius = 0.5; //размытость
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor grayColor], NSForegroundColorAttributeName,
                                font,                NSFontAttributeName,
                                shadow,              NSShadowAttributeName,
                                nil];
    
    
    CGSize textSize = [text sizeWithAttributes:attributes];
    
    CGRect textRect = CGRectMake(CGRectGetMidX(square2) - textSize.width / 2,
                                 CGRectGetMidY(square2) - textSize.height / 2,
                                 textSize.width, textSize.height);
    
    textRect = CGRectIntegral(textRect); // округляет все "неровности с дробными величинами"
    [text drawInRect:textRect withAttributes:attributes];
    
    
//    [text drawAtPoint:CGPointMake(CGRectGetMidX(square2) - textSize.width / 2, CGRectGetMidY(square2) - textSize.height / 2) withAttributes:attributes];
    
    
     
     
    
//    Закрашиваем нашу drawning view, ДВА СПОСОБА
    /*
     1)
    CGContextAddRect(context, rect);
    CGContextFillPath(context);
    
    2)
//    CGContextFillRect(context, rect); // закрашиваем rect
    */
    
    
    
    
}


@end
