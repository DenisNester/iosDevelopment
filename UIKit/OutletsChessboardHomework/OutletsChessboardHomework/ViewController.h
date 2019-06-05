//
//  ViewController.h
//  OutletsChessboardHomework
//
//  Created by Denis Nesteruk on 2/28/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView* chessBoard;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* arrayOfBlackSquares;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* arrayOfRedCheckers;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* arrayOfWhiteCheckers;
@end

