//
//  FileCell.h
//  FileManager
//
//  Created by Denis Nesteruk on 5/7/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* sizeLabel;
@property (weak, nonatomic) IBOutlet UILabel* dateLabel;

@end

NS_ASSUME_NONNULL_END
