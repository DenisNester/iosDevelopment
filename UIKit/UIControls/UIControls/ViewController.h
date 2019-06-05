//
//  ViewController.h
//  UIControls
//
//  Created by Denis Nesteruk on 4/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


//SLIDER SWITCH SEGMENTEDCONTROL у всех ValueChanged

@property (weak, nonatomic) IBOutlet UILabel* infoLabel;

@property (weak, nonatomic) IBOutlet UISlider* redComponentsSlider;
@property (weak, nonatomic) IBOutlet UISlider* greenComponentsSlider;
@property (weak, nonatomic) IBOutlet UISlider* blueComponentsSlider;


@property (weak, nonatomic) IBOutlet UISegmentedControl* colorShemeControl;


-(IBAction)actionSlider:(UISlider*)sender;
-(IBAction)actionEnable:(UISwitch*) sender;
@end

