//
//  ViewController.h
//  Outlets
//
//  Created by Denis Nesteruk on 2/18/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//IBOutlet - это проперти,которое мы можем брать из storyboard!

/*
@property (weak, nonatomic) IBOutlet UIView* testView;
@property (weak, nonatomic) IBOutlet UIView* testView2;
 */

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* testViews;
@end

