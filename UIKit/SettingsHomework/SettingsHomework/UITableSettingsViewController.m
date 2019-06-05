//
//  UITableSettingsViewController.m
//  SettingsHomework
//
//  Created by Denis Nesteruk on 4/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "UITableSettingsViewController.h"

@interface UITableSettingsViewController ()
//@property (strong, nonatomic) NSMutableString* resultString;
@end

static NSString* kSettingsName = @"name";
static NSString* kSettingsLastName = @"lastName";
static NSString* kSettingsLogin = @"login";
static NSString* kSettingsPassword = @"password";
static NSString* kSettingsAge = @"age";
static NSString* kSettingsPhoneNumber = @"phoneNumber";
static NSString* kSettingsEmail = @"email";
static NSString* kSettingsAddress = @"address";



@implementation UITableSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self loadSettings];
}

#pragma mark - Save and Load

-(void) saveSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.nameField.text forKey:kSettingsName];
    [userDefaults setObject:self.lastNameField.text forKey:kSettingsLastName];
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setObject:self.ageField.text forKey:kSettingsAge];
    [userDefaults setObject:self.phoneNumberField.text forKey:kSettingsPhoneNumber];
    [userDefaults setObject:self.emailField.text forKey:kSettingsEmail];
    [userDefaults setObject:self.addressField.text forKey:kSettingsAddress];
    
    
}

-(void) loadSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.nameField.text = [userDefaults objectForKey:kSettingsName];
    self.lastNameField.text = [userDefaults objectForKey:kSettingsLastName];
    self.loginField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults objectForKey:kSettingsPassword];
    self.ageField.text = [userDefaults objectForKey:kSettingsAge];
    self.phoneNumberField.text = [userDefaults objectForKey:kSettingsPhoneNumber];
    self.emailField.text = [userDefaults objectForKey:kSettingsEmail];
    self.addressField.text = [userDefaults objectForKey:kSettingsAddress];
    
    
    self.nameLabel.text = self.nameField.text;
    self.lastNameLabel.text = self.lastNameField.text;
    self.loginLabel.text = self.loginField.text;
    self.passwordLabel.text = self.passwordField.text;
    self.ageLabel.text = self.ageField.text;
    self.phoneNumberLabel.text = self.phoneNumberField.text;
    self.emailLabel.text = self.emailField.text;
    self.addressLabel.text = self.addressField.text;
    
    
    
}




#pragma mark - Actions

-(IBAction)actionChangeName:(UITextField*) sender {
    self.nameLabel.text = [NSString stringWithFormat:@"%@", sender.text];
    [self saveSettings];
}


-(IBAction)actionChangeLastName:(UITextField*) sender {
    self.lastNameLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}

-(IBAction)actionChangeLogin:(UITextField*) sender {
    self.loginLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}


-(IBAction)actionChangePassword:(UITextField*) sender {
    self.passwordLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}

-(IBAction)actionChangeAge:(UITextField*) sender {
    self.ageLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}

-(IBAction)actionChangePhoneNumber:(UITextField*) sender {
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}

-(IBAction)actionChangeEmail:(UITextField*) sender {
    self.emailLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}


-(IBAction)actionChangeAddress:(UITextField*) sender {
    self.addressLabel.text = [NSString stringWithFormat:@"%@", sender.text];
     [self saveSettings];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag < 8) {
        
        UITextField* currentTextField = [self.fieldForRegistration objectAtIndex:textField.tag];
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
       
        return YES;
    }
    
    
    
    return YES;
}


@end
