//
//  SettingsViewController.h
//  SettingsTest
//
//  Created by Denis Nesteruk on 4/11/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* loginField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UISegmentedControl* levelCOntrol;
@property (weak, nonatomic) IBOutlet UISwitch* shadowsSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl* detalizationControl;
@property (weak, nonatomic) IBOutlet UISlider* soundSlider;
@property (weak, nonatomic) IBOutlet UISlider* musicSlider;


-(IBAction)actionTextFieldChanged:(UITextField *) sender;
-(IBAction)actionValueChanged:(id)sender;

@end

NS_ASSUME_NONNULL_END
