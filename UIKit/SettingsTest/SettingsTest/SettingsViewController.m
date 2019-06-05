//
//  SettingsViewController.m
//  SettingsTest
//
//  Created by Denis Nesteruk on 4/11/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

static NSString* kSettingsLogin             = @"login";
static NSString* kSettingsPassword          = @"password";
static NSString* kSettingsLevel             = @"level";
static NSString* kSettingShadows            = @"shadows";
static NSString* kSettingsDetalization      = @"detalization";
static NSString* kSettingsSound             = @"sound";
static NSString* kSettingsMusic             = @"music";

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


-(void) notificationKeyboardWillShow:(NSNotification*) notification {
 
    NSLog(@"notificationKeyboardWillShow:\n%@", notification.userInfo);
}


-(void) notificationKeyboardWillHide:(NSNotification*) notification {
    
    NSLog(@"notificationKeyboardWillHide:\n%@", notification.userInfo);
}





#pragma mark - Save and load

-(void) saveSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
   
    [userDefaults setInteger:self.levelCOntrol.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setBool:self.shadowsSwitch.isOn forKey:kSettingShadows];
    [userDefaults setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    
    [userDefaults setDouble:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    [userDefaults synchronize]; // чтобы сохранить
}


-(void) loadSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults objectForKey:kSettingsPassword];
    
    self.levelCOntrol.selectedSegmentIndex = [userDefaults integerForKey:kSettingsLevel];
    self.shadowsSwitch.on = [userDefaults boolForKey:kSettingShadows];
    self.detalizationControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsDetalization];
    
    self.soundSlider.value = [userDefaults doubleForKey:kSettingsSound];
    self.musicSlider.value = [userDefaults doubleForKey:kSettingsMusic];
    
    
}


#pragma mark - Actions
-(IBAction)actionTextFieldChanged:(UITextField *) sender {
    [self saveSettings];
    
}


-(IBAction)actionValueChanged:(id)sender {
    [self saveSettings];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}

@end
