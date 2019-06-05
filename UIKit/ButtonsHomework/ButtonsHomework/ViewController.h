//
//  ViewController.h
//  ButtonsHomework
//
//  Created by Denis Nesteruk on 3/22/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

typedef enum {
    Plus,
    Minus,
    Multiply,
    Divide,
    Equally
} Operations ;



@property (weak, nonatomic) IBOutlet UIView* calculatorBoard;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* arrayOfNumberButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray* arrayOfOperationsButtons;
@property (weak, nonatomic) IBOutlet UILabel* indicatorLabel;

@property (assign, nonatomic) Operations operation;
@property (assign, nonatomic) NSInteger firstNumber;
@property (assign, nonatomic) NSInteger secondNumber;
@property (assign, nonatomic) NSInteger result;
@property (strong, nonatomic) NSString* savedCurrentOperation;

@property (strong, nonatomic) NSString* savedCurrentTitle;


-(IBAction)actionTouchDown:(UIButton*) sender;

@end

