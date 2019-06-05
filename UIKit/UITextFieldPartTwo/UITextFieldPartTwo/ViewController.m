//
//  ViewController.m
//  UITextFieldPartTwo
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

//Этот метод вызывается перед тем,как мы добавляем новую букву в textfield
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
//    NSRange (0, 0) - первое индекс,второе length
    
    
//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange %@", NSStringFromRange(range));
//    NSLog(@"replacementString = %@", string);
    
    
    
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
    
    
    return NO;
    
   
    
//    NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@" ,"]; // разделены пробелами и запятыми
    /*
    NSCharacterSet* set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet]; // всё,что не является цифрой - будет разделено на слова
    
    NSArray* words = [resultString componentsSeparatedByCharactersInSet:set];
    
    NSLog(@"words = %@", words);
     
       return [resultString length] <= 10;
    */
    
  
}


//- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
