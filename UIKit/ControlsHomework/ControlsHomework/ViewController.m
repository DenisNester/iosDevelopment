//
//  ViewController.m
//  ControlsHomework
//
//  Created by Denis Nesteruk on 4/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, nonatomic) CGFloat currentSpeed;
@end

typedef enum {
    HomerImage,
    MargeImage,
    BartImage
} imageSegmentedControl;



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self refreshScreen];

}



#pragma mark - Private Methods

-(void) refreshScreen {
    
    
    if (self.imageControl.selectedSegmentIndex == HomerImage) {
        self.testImageView.image = [UIImage imageNamed:@"homerSimpson.jpg"];
    }
    if (self.imageControl.selectedSegmentIndex == MargeImage) {
        self.testImageView.image = [UIImage imageNamed:@"margeSimpson.jpg"];
    }
    if (self.imageControl.selectedSegmentIndex == BartImage) {
        self.testImageView.image = [UIImage imageNamed:@"bartSimpson.jpg"];
    }
    
    
    
    
    
   
    
    
    
}

#pragma mark - Actions

-(IBAction)actionSpeedSlider:(UISlider *) sender {
    
    [UIImageView animateWithDuration:_currentSpeed animations:^{
        self.currentSpeed = self.speedSlider.value;
    }];
    
}


-(IBAction)actionTransformSwitch:(UISwitch *)sender {
    
    if (self.rotationSwitch.isOn) {
        
        [self rotateImage];
        
    } else {
        [self.testImageView.layer removeAnimationForKey:@"360"];
    }
    
    
    
    
    
    if (self.scaleSwitch.isOn) {
    
        [self scaleImage];
       
    } else {
        [self.testImageView.layer removeAnimationForKey:@"scaleAnimation"];
    }
    
    
    
    
    
    if (self.translationSwitch.isOn) {
       
        [self moveImage];
        
    } else {
        [self.testImageView.layer removeAnimationForKey:@"movingAnimation"];
    }
    
    
}


-(IBAction)actionChangeImageSegmentedControl:(UISegmentedControl *)sender {
    
    [self refreshScreen];
 
}


#pragma mark - Animations

-(void) rotateImage {
    
    CABasicAnimation* fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360 * M_PI) / 180)];
    fullRotation.duration = _currentSpeed;
    fullRotation.repeatCount = HUGE_VALF;
    [self.testImageView.layer addAnimation:fullRotation forKey:@"360"];
    
}


-(void) scaleImage {
    
    CGFloat s = 0.5f;
    
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:s];
    scaleAnimation.duration = _currentSpeed;
    scaleAnimation.repeatCount = HUGE_VALF;
    [self.testImageView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
}


-(void) moveImage {
    
    CGRect rect = self.testView.bounds;
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    
    CABasicAnimation* movingAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    movingAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    movingAnimation.duration = _currentSpeed;
    movingAnimation.repeatCount = HUGE_VALF;
    [self.testImageView.layer addAnimation:movingAnimation forKey:@"movingAnimation"];
    
    
}

@end
