//
//  ViewController.m
//  TextFieldHomework
//
//  Created by Denis Nesteruk on 4/7/19.
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


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    /*
    if ([textField isEqual:self.nameField]) {
        [self.lastNameField becomeFirstResponder];
    } else if ([textField isEqual:self.lastNameField]) {
        [self.logingField becomeFirstResponder];
    } else if ([textField isEqual:self.logingField]) {
        [self.passwordField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordField]) {
        [self.ageField becomeFirstResponder];
    } else if ([textField isEqual:self.ageField]) {
        [self.phoneNumberField becomeFirstResponder];
    } else if ([textField isEqual:self.phoneNumberField]) {
        [self.emailField becomeFirstResponder];
    } else if ([textField isEqual:self.emailField]) {
        [self.addressField becomeFirstResponder];
    } else if ([textField isEqual:self.addressField]) {
        [textField resignFirstResponder];
    }
    */
    
    
  
    if (textField.tag < 8) {
        
        UITextField* currentTextField = [self.fieldsForRegistration objectAtIndex:textField.tag];
        [currentTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    
    
    return YES;
}


 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 
 
     if (textField.tag == 6) {
         
         NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
         NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
         
         
         if ([components count] > 1) {
             return NO;
         }
         
         
         NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
         
         //    +xx (xxx) xxx-xxxx
         
         NSLog(@"new string = %@", newString);
         
         
         NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
         newString = [validComponents componentsJoinedByString:@""];
         
         //    xxxxxxxxxxxx
         
         NSLog(@"new string fixed = %@", newString);
         
         
         //    Формат для нашего номера
         static const int localNumberMaxLength = 7; // static - будет проинициализирована только 1 раз
         static const int areaCodeMaxLength = 3;
         static const int countryMaxLength = 3;
         
         
         /*
          xxxxxxxxxxx
          +xx (xxx) xxx-xxxx
          */
         
         
         if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryMaxLength ) {
             return NO;
         }
         
         
         NSMutableString* resultString = [NSMutableString string];
         
         
         
         
         NSInteger localNumberLength =  MIN([newString length], localNumberMaxLength); // либо 7,либо меньше
         
         if (localNumberLength > 0) {
             NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
             
             [resultString appendString:number];
             
             if ([resultString length] > 3) {
                 [resultString insertString:@"-" atIndex:3];
             }
         }
         
         
         
         if ([newString length] > localNumberLength) {
             NSInteger areaCodeLength =  MIN([newString length] - localNumberMaxLength, areaCodeMaxLength);
             
             NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
             
             NSString* area = [newString substringWithRange:areaRange];
             
             area = [NSString stringWithFormat:@"(%@) ", area];
             
             [resultString insertString:area atIndex:0];
         }
         
         
         
         if ([newString length] > localNumberLength + areaCodeMaxLength) {
             NSInteger countryCodeLength =  MIN([newString length] - localNumberMaxLength - areaCodeMaxLength, countryMaxLength);
             
             NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
             
             NSString* countryCode = [newString substringWithRange:countryCodeRange];
             
             countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
             
             [resultString insertString:countryCode atIndex:0];
         }
         
         textField.text = resultString;
     }
 
     
 
 return YES;
 }






#pragma mark - Actions


-(IBAction)actionChangeName:(UITextField*) sender {
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}


-(IBAction)actionChangeLastName:(UITextField*) sender {
    
    self.lastNameLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}


-(IBAction)actionChangeLogin:(UITextField*) sender {
    self.loginLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}


-(IBAction)actionChangePassword:(UITextField*) sender {
    
    self.passwordLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}

-(IBAction)actionChangeAge:(UITextField*) sender {
    
    self.ageLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}

-(IBAction)actionChangePhoneNumber:(UITextField*) sender {
    
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}


-(IBAction)actionChangeEmail:(UITextField*) sender {
    
    self.emailLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}

-(IBAction)actionChangeAddress:(UITextField*) sender {
    
    self.addressLabel.text = [NSString stringWithFormat:@"%@", sender.text];
}







@end
