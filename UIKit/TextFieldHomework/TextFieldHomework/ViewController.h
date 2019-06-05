//
//  ViewController.h
//  TextFieldHomework
//
//  Created by Denis Nesteruk on 4/7/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* nameField;
@property (weak, nonatomic) IBOutlet UITextField* lastNameField;
@property (weak, nonatomic) IBOutlet UITextField* logingField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UITextField* ageField;
@property (weak, nonatomic) IBOutlet UITextField* phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField* emailField;
@property (weak, nonatomic) IBOutlet UITextField* addressField;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray* fieldsForRegistration;


@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel* loginLabel;
@property (weak, nonatomic) IBOutlet UILabel* passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel* ageLabel;
@property (weak, nonatomic) IBOutlet UILabel* phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel* emailLabel;
@property (weak, nonatomic) IBOutlet UILabel* addressLabel;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray* labelForRegistration;


-(IBAction)actionChangeName:(UITextField*) sender;
-(IBAction)actionChangeLastName:(UITextField*) sender;
-(IBAction)actionChangeLogin:(UITextField*) sender;
-(IBAction)actionChangePassword:(UITextField*) sender;
-(IBAction)actionChangeAge:(UITextField*) sender;
-(IBAction)actionChangePhoneNumber:(UITextField*) sender;
-(IBAction)actionChangeEmail:(UITextField*) sender;
-(IBAction)actionChangeAddress:(UITextField*) sender;

@end

