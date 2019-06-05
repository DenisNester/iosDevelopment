//
//  ViewController.m
//  UIControls
//
//  Created by Denis Nesteruk on 4/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


typedef enum {
    
    ColorSchemeTypeRGB,
    ColorSchemeTypeHSV
    
} ColorSchemeType;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self refreshScreen];
    
    self.colorShemeControl.selectedSegmentIndex = ColorSchemeTypeRGB; // изначально установится RGB, а не HSV
}


#pragma mark - Private Methods

-(void) refreshScreen {
    
    CGFloat red = self.redComponentsSlider.value;
    CGFloat green = self.greenComponentsSlider.value;
    CGFloat blue = self.blueComponentsSlider.value;
    
    
    
    UIColor* color = nil;
    
    
    if (self.colorShemeControl.selectedSegmentIndex == ColorSchemeTypeRGB) {
        
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
        
    } else {
        
        color = [UIColor colorWithHue:red saturation:green brightness:green alpha:1.f];
    }
    
    CGFloat hue, saturation, brightness, alpha; // просто объявлены
    
    NSString* result = @" ";
    
//    Изменяем значения по адресу
//    ДЛЯ RGB
    if ([color getRed:&red green:&green blue:&blue alpha:&blue]) {
        
        result = [result stringByAppendingFormat:@"RGB:{%1.2f, %1.2f, %1.2f}", red, green, blue];
        
    } else {
        
        result = [result stringByAppendingFormat:@"RGB:{NO DATA}"];
    }
    
//    CGFloat * hueRef = &hue; так создаётся указалтель на float
//    ДЛЯ HSV
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"HSV:{%1.2f, %1.2f, %1.2f}", hue, saturation, brightness];
    } else {
        
           result = [result stringByAppendingFormat:@"HSV:{NO DATA}"];
    }
    
    
    
    
    
    self.infoLabel.text = result;
    
    self.view.backgroundColor = color;
}




#pragma mark - Actions

-(IBAction)actionSlider:(UISlider *)sender {
    
    [self refreshScreen];
}


-(IBAction)actionEnable:(UISwitch*) sender {
    
    self.redComponentsSlider.enabled = self.greenComponentsSlider.enabled = self.blueComponentsSlider.enabled = sender.isOn;
  
    /*
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents]; // с этого момента игнорируются ивенты
   
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ( [[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
        
    });
    
    
//    [[UIApplication sharedApplication] isIgnoringInteractionEvents]; игнорируются ли ивенты(проверка)
//    [[UIApplication sharedApplication] endIgnoringInteractionEvents];  перестают игнорироваться
     */
}


@end
