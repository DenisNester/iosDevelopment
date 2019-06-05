//
//  ViewController.h
//  UITextFieldPartOne
//
//  Created by Denis Nesteruk on 4/4/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* firstNameField;
@property (weak, nonatomic) IBOutlet UITextField* lastNameField;


-(IBAction)actionLog:(UIButton *)sender;
-(IBAction)actionTextChanged:(UITextField *)sender;
@end

