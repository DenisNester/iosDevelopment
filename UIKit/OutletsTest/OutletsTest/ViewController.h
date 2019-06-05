//
//  ViewController.h
//  OutletsTest
//
//  Created by Denis Nesteruk on 2/28/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//IBOutlet - это проперти,которое мы можем брать из сториборда
//@property (weak, nonatomic) IBOutlet UIView* testView;
//@property (weak, nonatomic) IBOutlet UIView* testView2;
//@property (weak, nonatomic) IBOutlet UIView* testView3;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray* testViews;

@end

