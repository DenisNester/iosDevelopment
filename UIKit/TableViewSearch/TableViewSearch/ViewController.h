//
//  ViewController.h
//  TableViewSearch
//
//  Created by Denis Nesteruk on 5/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar* searchBar;


@end

