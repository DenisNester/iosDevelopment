//
//  DirectoryTableViewController.m
//  FileManager
//
//  Created by Denis Nesteruk on 5/6/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DirectoryTableViewController.h"
#import "FileCell.h"
@interface DirectoryTableViewController () <UITableViewDelegate>
@property (strong, nonatomic) NSArray* contents;


@end

@implementation DirectoryTableViewController

//Будет вызван тогда,когда отработает наш переопределённый метод setPath
-(id) initWithFolderPath:(NSString*) path {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
    }
    return self;
}

//Переопределяем сеттер,чтобы путь подгружался независимо от наличия контроллера
-(void) setPath:(NSString *)path {
    
        _path = path;
        
        NSError* error = nil;
        
        self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];
}


-(void) dealloc {
    NSLog(@"controller with path %@ has been deallocated", self.path);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Если наш viewDidLoad прогрузился и path не установился
    if (!self.path) {
        self.path = @"/Users/denisnesteruk/Documents/it-camasutra/kmb4"; // наш контроллер стартанёт с этого пути
    }
    
}



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.navigationController.viewControllers count] > 1) {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"Back to root" style:UIBarButtonItemStylePlain target:self action:@selector(actionBackToRoot:)];
        
        
        self.navigationItem.rightBarButtonItem = item;
    }
}


-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"path = %@", self.path);
    NSLog(@"view controllers on stack = %ld", [self.navigationController.viewControllers count]);
    NSLog(@"index on stack %ld", [self.navigationController.viewControllers indexOfObject:self]);//чтобы узнать индекс нашего контроллера
}


-(BOOL) isDirectoryAtIndexPath:(NSIndexPath*) indexPath {
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    NSString* filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    
    return isDirectory;
}

#pragma mark - Actions
//вернёт нас к root контроллеру
-(void) actionBackToRoot:(UIBarButtonItem*) sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(IBAction) actionInfoCell:(id)sender {
    
    NSLog(@"actionInfoCell");
    
    
}





#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.contents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* fileIdentifier = @"FileCell";
    static NSString* folderIdentifier = @"FolderCell";
    
    NSString* fileName = [self.contents objectAtIndex:indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:folderIdentifier];
        
        cell.textLabel.text = fileName;
        
        return cell;
        
    } else {
        
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary* attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        FileCell* cell = [tableView dequeueReusableCellWithIdentifier:fileIdentifier];
        
        
        cell.nameLabel.text = fileName;
        cell.sizeLabel.text = [NSString stringWithFormat:@"%lld", [attributes fileSize]];
        cell.dateLabel.text = [NSString stringWithFormat:@"%@", [attributes fileModificationDate]];
        
        return cell;
    }
    
    
    
    return nil; // т.к мы сюда никогда не попадём
}

#pragma mark - UITableViewDelegate
//Для установки рамеров рядов в таблице
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        return 44.f;
    } else {
        
        return 80.f;
    }
    
}



//ЧТОБЫ ПРИ НАЖАТИИ НА ПАПКУ МЫ МОГЛИ ДВИГАТЬСЯ ДАЛЬШЕ ВНУТРЬ
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString* fileName = [self.contents objectAtIndex:indexPath.row];
        NSString* path = [self.path stringByAppendingPathComponent:fileName];
        
//        Добавляется ещё один контроллер,который будет отображать дальнейший путь
//        DirectoryTableViewController* controller = [[DirectoryTableViewController alloc] initWithFolderPath:path];
        
//        [self.navigationController pushViewController:controller animated:YES];
        
//        !!!!!Инициализация сториборда!!!!!
//        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"NewStoryBoard" bundle:nil];
   
        
//        2 ВАРИАНТ
        
        DirectoryTableViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DirectoryTableViewController"];
//        Теперь должны для контроллера установить path
        vc.path = path;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }
    
    
}




@end
