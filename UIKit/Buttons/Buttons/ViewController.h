//
//  ViewController.h
//  Buttons
//
//  Created by Denis Nesteruk on 3/19/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;



-(IBAction)actionTest2:(UIButton*) sender;
-(IBAction)actiontest2TouchDown:(UIButton*) sender;
@end

