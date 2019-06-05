//
//  ViewController.m
//  TableViewSearch
//
//  Created by Denis Nesteruk on 5/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "Section.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) NSArray* namesArray;

@property (strong, nonatomic) NSArray* sectionsArray;

@property (strong, nonatomic) NSOperation* currentOperation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        [array addObject:[[NSString randomAlphanumericString] capitalizedString]];
    }
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    
    [array sortUsingDescriptors:@[sortDescriptor]];
    
    self.namesArray = array;
    
    
//    self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFilter:self.searchBar.text];
//    [self.tableView reloadData];
    [self generateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}


//генерация секций в бэкграунд потоке
-(void) generateSectionsInBackgroundFromArray:(NSArray*) array withFilter:(NSString*) filterString {
    
//    если этот метод вызван и у нас уже есть операция,то мы её отменяем
    [self.currentOperation cancel];
    
    __weak ViewController* weakSelf = self;
    
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSArray* sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterString];
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.sectionsArray = sectionsArray;
//            ТАБЛИЦУ МОЖНО ПЕРЕЗАГРУЖАТЬ ТОЛЬКО НА ГЛАВНОМ ПОТОКЕ
            [weakSelf.tableView reloadData];
            
            
            self.currentOperation = nil;
        });
    }];
    
    [self.currentOperation start];
}





-(NSArray*) generateSectionsFromArray:(NSArray*) array withFilter:(NSString*) filterString {
    
    NSMutableArray* sectionsArray = [NSMutableArray array];
    
    NSString* currentLetter = nil;
    
    
    for (NSString* string in array) {
        
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound) {
            continue;
            
        }
        
        
        
        NSString* firstLetter = [string substringToIndex:1];
        
        Section* section = nil;
        
        if (![currentLetter isEqualToString:firstLetter]) {
            section = [[Section alloc] init];
            section.sectionName = firstLetter;
            section.itemsArray = [NSMutableArray array];
            currentLetter = firstLetter;
            [sectionsArray addObject:section];
        } else {
            section = [sectionsArray lastObject];
        }
        
        [section.itemsArray addObject:string];
        
    }
    return sectionsArray;
}





#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.sectionsArray count];
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return  [[self.sectionsArray objectAtIndex:section] sectionName];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Section* sec = [self.sectionsArray objectAtIndex:section];
    
    return [sec.itemsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    Section* section = [self.sectionsArray objectAtIndex:indexPath.section];
    
    NSString* name = [section.itemsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
}


//этот метод возвращает индексы для наших секций
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (Section* section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    
    return array;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}


//Чтобы фильтровать наш массив
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSLog(@"textDidChange = %@", searchText);
    
//    self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFilter:searchText];
//    [self.tableView reloadData];
    
    
      [self generateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}




@end
