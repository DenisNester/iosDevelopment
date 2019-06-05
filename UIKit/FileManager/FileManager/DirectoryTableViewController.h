//
//  DirectoryTableViewController.h
//  FileManager
//
//  Created by Denis Nesteruk on 5/6/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DirectoryTableViewController : UITableViewController

@property (strong, nonatomic) NSString* path;

-(id) initWithFolderPath:(NSString*) path;


-(IBAction) actionInfoCell:(id)sender;


@end

NS_ASSUME_NONNULL_END
