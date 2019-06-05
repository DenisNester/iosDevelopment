//
//  ViewController.m
//  DynamicCellsTest
//
//  Created by Denis Nesteruk on 4/20/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




#pragma mark - UITableViewDataSource

//Метод опциональный.В первую очередь будет вызван именно этот метод
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    
//    return 1; // по умолчанию кол-во секций в таблице = 1
    return [[UIFont familyNames] count]; // в нашей таблице секций столько,сколько у шрифтов кол-во групп этих шрифтов
}


//Сколько рядов в секции под индексом section.Если у нас 5 секций,то этот метод будет вызван 5 раз. (0,1,2,3,4)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSLog(@"numberOfRowsInSection %ld", section);
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
    
//    return 5; в секции 5 ячеек
//    return 100; // Сразу не создаётся 100 ячеек,а постепенно в процессе скрола
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
    
}





//Верни мне ячейку по этому indexPath.IndexPath содержит section и row.
//Если у нас 1 секция и в ней 5 ячеек,то этот метод будет вызван 5 раз (0, 0), (0, 1), ... , (0,4)


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath {%ld, %ld}", indexPath.section, indexPath.row);
    
    static NSString* indentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
//    Если такой ячейки не существует,тогда мы её и создадим(а её изначально в таблице не существует)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
         NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }
    
    
//    Создаём ячейку.НЕПРАВИЛЬНЫЙ МЕТОД,ТУТ СОЗДАЁТ,А НЕ ПЕРЕИСПОЛЬЗУЕТ
    /*
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
    */
  
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    
    
    UIFont* font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.font = font;
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Section = %ld, row = %ld", indexPath.section, indexPath.row];
    
    return cell;
}






@end
