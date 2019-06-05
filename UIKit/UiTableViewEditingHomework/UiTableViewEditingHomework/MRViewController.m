//
//  MRViewController.m
//  UiTableViewEditingHomework
//
//  Created by Denis Nesteruk on 4/26/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "MRViewController.h"
#import "NBATeam.h"
@interface MRViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView* tableView;

@property (strong, nonatomic) NSMutableArray* arrayOfAllTeams;


@end

@implementation MRViewController


-(void) loadView {
    
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
  

    
}


#pragma mark - UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [NSString stringWithFormat:@"NBA Teams"];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    
    
    
    return  cell;
}





@end
