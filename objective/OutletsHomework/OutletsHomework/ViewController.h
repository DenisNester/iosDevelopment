//
//  ViewController.h
//  OutletsHomework
//
//  Created by Denis Nesteruk on 2/19/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView* chessBoard;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* squares;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* whiteCheckers;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* redCheckers;
@end

