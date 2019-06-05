//
//  ViewController.h
//  FontsTest
//
//  Created by Denis Nesteruk on 4/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* tableView;

@end

