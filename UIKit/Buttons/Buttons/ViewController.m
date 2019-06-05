//
//  ViewController.m
//  Buttons
//
//  Created by Denis Nesteruk on 3/19/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    UILabel* label = [UILabel alloc] initWithFrame:<#(CGRect)#>];
    [self.view addSubview:label];
    */
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    button.frame = CGRectMake(200, 200, 200, 200);
    
    
    /*
//    Для обычного состояние атрибуты
    NSDictionary* attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30.f],
                                 NSForegroundColorAttributeName: [UIColor blueColor]};
    
    
    NSAttributedString* title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
    [button setAttributedTitle:title forState:UIControlStateNormal];
    
//   Для подсвеченного
    NSDictionary* attributes2 = @{NSFontAttributeName: [UIFont systemFontOfSize:20.f],
                                 NSForegroundColorAttributeName: [UIColor greenColor]};
    
    
    NSAttributedString* title2 = [[NSAttributedString alloc] initWithString:@"Button Pressed" attributes:attributes2];
    [button setAttributedTitle:title2 forState:UIControlStateHighlighted];
    
     */
     
    
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [button setTitle:@"Button pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
//    UIEdgeInsets - это отступы внутри. Offset - отступ снаружи
    UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 0, 0);
    button.titleEdgeInsets = insets;
    
//    [self.view addSubview:button];
    
    
    [button addTarget:self action:@selector(actionTest:event:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpOutside];
}


//для методов с кнопками название action
#pragma mark - Actions

-(void) actionTest:(UIButton*) button event:(UIEvent*) event {
    NSLog(@"button pressed inside!");
}

-(void) actionTestOutside:(UIButton*) button {
    NSLog(@"button pressed outside");
}

-(IBAction)actionTest2:(UIButton*) sender {
    NSLog(@"actionTest2 tag = %ld", sender.tag);
    
    self.indicatorLabel.text = [NSString stringWithFormat:@"%ld", sender.tag];
}


-(IBAction)actiontest2TouchDown:(UIButton*) sender {
    
//    NSLog(@"action2TouchDown");
}

@end
