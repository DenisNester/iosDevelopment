//
//  ViewController.m
//  ButtonsHomework
//
//  Created by Denis Nesteruk on 3/22/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}




-(IBAction)actionTouchDown:(UIButton*) sender {
    
   
    if ([self.indicatorLabel.text isEqualToString:@"0"]) {
        self.indicatorLabel.text = @" ";
    }
    
    self.indicatorLabel.text = [self.indicatorLabel.text stringByAppendingString:sender.currentTitle];

    

    
    
    if ([sender.currentTitle isEqualToString:@"/"] || [sender.currentTitle isEqualToString:@"*"] ||
        [sender.currentTitle isEqualToString:@"+"] || [sender.currentTitle isEqualToString:@"-"])
    {
        self.savedCurrentTitle = sender.currentTitle;
        
        self.firstNumber = [self.indicatorLabel.text integerValue];
        self.indicatorLabel.text = @" ";
    }
    
    
    
//    RESULT
    if ([sender.currentTitle isEqualToString:@"="]) {
        
        self.secondNumber = [self.indicatorLabel.text integerValue];
        

        
        
        if ([self.savedCurrentTitle isEqualToString:@"/"]) {
            self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", self.firstNumber / self.secondNumber];
        }
        
        if ([self.savedCurrentTitle isEqualToString:@"*"]) {
            self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", self.firstNumber * self.secondNumber];
        }
        
        if ([self.savedCurrentTitle isEqualToString:@"-"]) {
            self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", self.firstNumber - self.secondNumber];
        }
        
        if ([self.savedCurrentTitle isEqualToString:@"+"]) {
            self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", self.firstNumber + self.secondNumber];
        }
        

        }

    
    

    if ([sender.currentTitle isEqualToString:@"AC"]) {
        self.indicatorLabel.text = @"0";
    }
}





@end
