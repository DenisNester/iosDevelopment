//
//  ViewController.h
//  ControlsHomework
//
//  Created by Denis Nesteruk on 4/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface ViewController : UIDocumentPickerViewController

@property (weak, nonatomic) IBOutlet UIImageView* testImageView;
@property (weak, nonatomic) IBOutlet UIView* testView;


@property (weak, nonatomic) IBOutlet UISwitch* rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch* scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch* translationSwitch;

@property (weak, nonatomic) IBOutlet UISlider* speedSlider;

@property (weak, nonatomic) IBOutlet UISegmentedControl* imageControl;


-(IBAction)actionSpeedSlider:(UISlider *) sender;
-(IBAction)actionTransformSwitch:(UISwitch *) sender;
-(IBAction)actionChangeImageSegmentedControl:(UISegmentedControl*) sender;
@end

