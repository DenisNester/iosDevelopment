//
//  ViewController.h
//  DynamicCellsTest
//
//  Created by Denis Nesteruk on 4/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* tableView;

//В indexPath Section - индекс группы,а row - это индекс элемента в этой section


@end

