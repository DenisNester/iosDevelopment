//
//  ViewController.m
//  FontsTest
//
//  Created by Denis Nesteruk on 4/15/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    В нашей таблице секций столько,сколько у uifont групп
}


#pragma mark - UITableViewDataSource
//По умолчанию количество секций в таблице = 1.В первую очередь вызывается опциональный метод numberOfSectionsInTableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    
    return [[UIFont familyNames] count]; // узнали кол-во family
}

//Если у нас,допустим,5 секций,то этот метод будет вызван 5 раз,чтобы узнать сколько рядов в каждой секции
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection %ld", section);
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section]; // взяли family,которое пришло по индексу
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName]; // мы берём список шрифтов в этой family
    
    
    
    return [fontNames count]; //в нашей секции 5 рядов. Выводим кол-во рядов в секции
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
    
}



//Для каждого ряда будет говорить,верни мне ячейку по этому indexPath(содержит section и row)
//Т.к в у нас ОДНА секция,в которой 5 рядов,этот метод будет вызван 5 раз (0, 0) , (0, 1), ... , (0,4)
//ПРИ СКРОЛЕ ВПЕРЕДЁД/НАЗАД создаются новые ячейки(это когда мы поставили 100)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath: {%ld,%ld}", indexPath.section, indexPath.row);
    
    static NSString* indentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
//    Если такой ячейки не существет,тогда мы её и создадим с таким Indentifier
    
//    Короче,как только спрячется наша самая верхняя ячейка,когда мы будем скролить вниз - эта ячейка будет переиспользоваться для создания последующих
//    ПЕРЕИСПОЛЬЗОВАНИЕ ГОРАЗДО БЫСТРЕЕ,ЧЕМ СОЗДАНИЕ
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }
    
    
    NSArray* familyNames = [UIFont familyNames];
    
    NSString* familyName = [familyNames objectAtIndex:indexPath.section]; // взяли family,которое пришло по индексу
    
    NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    

    cell.textLabel.text = fontName;
    
    UIFont* font = [UIFont fontWithName:fontName size:16]; // создаём шрифт
    
    cell.textLabel.font = font;
    
    return cell;
}




@end
