//
//  DNTableViewController.m
//  FileManagerHomework
//
//  Created by Denis Nesteruk on 5/7/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DNTableViewController.h"

@interface DNTableViewController ()

@property (strong, nonatomic) NSArray* contents;
@property (strong, nonatomic) NSString* path;


@property (strong, nonatomic) NSMutableArray* arrayOfFolders;
@property (strong, nonatomic) NSMutableArray* arrayOfFiles;

@end

@implementation DNTableViewController

-(id) initWithFolderPath:(NSString*) path {
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        self.path = path;
        
        NSError* error = nil;
        
        NSFileManager* fileManager = [NSFileManager defaultManager];
        self.contents = [fileManager contentsOfDirectoryAtPath:self.path error:&error];
        
        
        NSURL * selectedFolderURL = [NSURL fileURLWithPath:self.path];
        [fileManager contentsOfDirectoryAtURL:selectedFolderURL
                   includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                        error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    return self;
}


-(void) loadView {
    [super loadView];
    
    UIBarButtonItem* createButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionCreateDirectory:)];
    
    self.navigationItem.rightBarButtonItem = createButton;
    
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    
    self.navigationItem.leftBarButtonItem = editButton;
    
//    self.tableView.editing = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.path lastPathComponent];
    

    
    
    
//    Sorting by name
    NSSortDescriptor* valueDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    self.contents = [self.contents sortedArrayUsingDescriptors:@[valueDescriptor]];
}



-(BOOL) isDirectoryAtIndexPath:(NSIndexPath*) indexPath {
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}



 


#pragma mark - Actions

-(void) actionEdit:(UIBarButtonItem*) sender {
    
    BOOL isEditing = self.tableView.isEditing;
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:self action:@selector(actionEdit:)];
    [self.navigationItem setLeftBarButtonItem:editButton animated:YES];
    
}




-(void) actionCreateDirectory:(UIBarButtonItem*) sender {
   
    NSInteger componentsCount = [self.contents count] + 1;
    NSString* newFolderName = [NSString stringWithFormat:@"New folder %ld", componentsCount];
    
    NSString* pathForNewFolder = [self.path stringByAppendingPathComponent:newFolderName];
    
    NSFileManager* directory = [NSFileManager defaultManager];
    NSError* error = nil;
    
    BOOL isDir = NO;
    
    if (![directory fileExistsAtPath:pathForNewFolder isDirectory:&isDir]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:pathForNewFolder withIntermediateDirectories:NO attributes:nil error:&error];
        NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:self.contents];
        [tempArray addObject:newFolderName];
        
        self.contents = tempArray;
        
        NSInteger rowInArray = [self.contents indexOfObject:newFolderName];
        
        [self.tableView beginUpdates];
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:rowInArray inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
    }
   
}





#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.contents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        cell.imageView.image = [UIImage imageNamed:@"newFolder.png"];
        
    } else {
        cell.imageView.image = [UIImage imageNamed:@"newFile.png"];
        
        
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSError *attributesError = nil;
        NSDictionary *attributes = [fileManager attributesOfItemAtPath:[self.path stringByAppendingPathComponent:fileName]
                                                        error:&attributesError];
        
        unsigned long long size = [attributes fileSize];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%llu", size];
        
        
        /*
        unsigned long long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:fileName error:nil] fileSize];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%llu", fileSize];
        NSLog(@"%llu", fileSize);
        */
        
    }
    

    return cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSString* fileForDelete = [self.contents objectAtIndex:indexPath.row];
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:self.contents];
        
        [tempArray removeObject:fileForDelete];
        self.contents = tempArray;
        
        
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        [tableView endUpdates];
        
    }

}




#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        DNTableViewController* newController = [[DNTableViewController alloc] initWithFolderPath:path];
        [self.navigationController pushViewController:newController animated:YES];
        
    }
    
}





@end
