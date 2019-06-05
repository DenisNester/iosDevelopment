//
//  ViewController.m
//  UITextFieldPartOne
//
//  Created by Denis Nesteruk on 4/4/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark;
//    self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    
     [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    
     [nc addObserver:self selector:@selector(notificationTextFieldTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];
    
   
    
    
    [self.firstNameField becomeFirstResponder]; // как только запустится приложение,фокус будет на поле first name
}


#pragma mark - Actions

-(IBAction)actionLog:(UIButton *)sender {
    
    NSLog(@"First name = %@, last name =  %@", self.firstNameField.text, self.lastNameField.text);
    
    
    if ([self.firstNameField isFirstResponder]) { // проверяется ,есть ли фокус на данном элементе
        [self.firstNameField resignFirstResponder]; // убирается фокус
    } else if ([self.lastNameField isFirstResponder]) {
        [self.lastNameField resignFirstResponder];
    }
    
}

-(IBAction)actionTextChanged:(UITextField *)sender {
    
    NSLog(@"%@", sender.text);
}

#pragma mark - UITextFieldDelegate

/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return [textField isEqual:self.firstNameField];
}


- (BOOL)textFieldShouldClear:(UITextField *)textField {

    return YES;
}
*/


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder]; // тот объект,на который устанавливается фокус
    } else {
        [textField resignFirstResponder]; // убирается фокус
    }
    
    
    return YES;
}





-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Notifications

-(void) notificationTextDidBeginEditing:(NSNotification*) notification {
    
    NSLog(@"notificationTextDidBeginEditing");
}


-(void) notificationTextDidEndEditing:(NSNotification*) notification {
    
    NSLog(@"notificationTextDidEndEditing");
}


-(void) notificationTextFieldTextDidChangeEditing:(NSNotification*) notification {
    
    NSLog(@"notificationTextFieldDidChangeEditing");
//    NSLog(@"userInfo = %@", notification.userInfo);
}



@end
