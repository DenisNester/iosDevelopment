//
//  DrawningView.m
//  DrawningsHomework
//
//  Created by Denis Nesteruk on 3/16/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DrawningView.h"

@implementation DrawningView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();

#pragma mark - Make star
    
    CGPoint point1 = CGPointMake(100, 500);
    CGPoint point2 = CGPointMake(75, 325);
    CGPoint point3 = CGPointMake(200, 250);
    CGPoint point4 = CGPointMake(325, 325);
    CGPoint point5 = CGPointMake(300, 500);
    
//    Star without fill color
//    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    CGContextSetLineWidth(context, 4.f);
    
    
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    CGContextAddLineToPoint(context, point5.x, point5.y);
    CGContextAddLineToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point4.x, point4.y);
    CGContextAddLineToPoint(context, point1.x, point1.y);
    
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillPath(context);

    
  
    
    
#pragma mark - Make circles on edjes of the star
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddEllipseInRect(context, CGRectMake(75, 475, 50, 50));
    
    CGContextMoveToPoint(context, point2.x, point2.y);
    CGContextAddEllipseInRect(context, CGRectMake(50, 300, 50, 50));
    
    CGContextMoveToPoint(context, point3.x, point3.y);
    CGContextAddEllipseInRect(context, CGRectMake(175, 225, 50, 50));
    
    CGContextMoveToPoint(context, point4.x, point4.y);
    CGContextAddEllipseInRect(context, CGRectMake(300, 300, 50, 50));
    
    CGContextMoveToPoint(context, point5.x, point5.y);
    CGContextAddEllipseInRect(context, CGRectMake(275, 475, 50, 50));
    
    
    /*
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddArc(context, point1.x, point1.y, 25, 0, 2 * M_PI, NO);
    
    
    CGContextMoveToPoint(context, point2.x, point2.y);
    CGContextAddArc(context, point2.x, point2.y, 25, 0, 2 * M_PI, NO);
    
    CGContextMoveToPoint(context, point3.x, point3.y);
    CGContextAddArc(context, point3.x, point3.y, 25, 0, 2 * M_PI, NO);
    
    CGContextMoveToPoint(context, point4.x, point4.y);
    CGContextAddArc(context, point4.x, point4.y, 25, 0, 2 * M_PI, NO);
    
    CGContextMoveToPoint(context, point5.x, point5.y);
    CGContextAddArc(context, point5.x, point5.y, 25, 0, 2 * M_PI, NO);
    */
    
    CGContextStrokePath(context);
    
#pragma mark - Connect circles with lines
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddLineToPoint(context, point2.x, point2.y);
    
    CGContextMoveToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    
    CGContextMoveToPoint(context, point3.x, point3.y);
    CGContextAddLineToPoint(context, point4.x, point4.y);
    
    CGContextMoveToPoint(context, point4.x, point4.y);
    CGContextAddLineToPoint(context, point5.x, point5.y);
    
    CGContextMoveToPoint(context, point5.x, point5.y);
    CGContextAddLineToPoint(context, point1.x, point1.y);
    
    CGContextStrokePath(context);
}


@end
