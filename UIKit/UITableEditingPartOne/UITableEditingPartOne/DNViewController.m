//
//  DNViewController.m
//  UITableEditingPartOne
//
//  Created by Denis Nesteruk on 4/25/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DNViewController.h"
#import "Student.h"
#import "Group.h"


@interface DNViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView* tableView;

@property (strong, nonatomic) NSMutableArray* groupsArray;

@end



@implementation DNViewController


-(void) loadView {
    
    
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
//    Наш класс становится делегатом и датасорсом для этой таблицы
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
//    Позволяет в режиме редактирования писать
    self.tableView.allowsSelectionDuringEditing = NO;
  
    
//    LESSON 32
    self.navigationItem.title  = @"Students";
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddSection:)];
    self.navigationItem.leftBarButtonItem = addButton;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.groupsArray = [NSMutableArray array];
    
    for (int i = 0; i < ((arc4random() % 6) + 5); i++) {
        
        Group* group = [[Group alloc] init];
        group.name = [NSString stringWithFormat:@"Group #%d", i];
        
        
        NSMutableArray* array = [NSMutableArray array];
        
        for (int j = 0; j < ((arc4random() % 11) + 15); j++) {
            [array addObject:[Student randomStudent]];
        }
        
        group.students = array;
        
        [self.groupsArray addObject:group];
    }
    
//    Перезагружаем дату нашей tableView(чтобы в ней обновились данные)
    
    [self.tableView reloadData];
    
}


#pragma mark - Actions

-(void) actionAddSection:(UIBarButtonItem*) sender {
    
    Group* group = [[Group alloc] init];
    group.name = [NSString stringWithFormat:@"Group #%lu", [self.groupsArray count] + 1];
    
//    добавляем новых студентов в группы
    group.students = @[[Student randomStudent], [Student randomStudent]];
    NSInteger newSectionIndex = 0;
    
    [self.groupsArray insertObject:group atIndex:newSectionIndex]; // добавляем в начало
    

//    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    [self.tableView beginUpdates];
    
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    [self.tableView insertSections:insertSections withRowAnimation:UITableViewRowAnimationLeft];
    
    
    [self.tableView endUpdates];
    
//    Чтобы не было последующих нажатий,ставим игнорирование и через n-oe время убираем это игнорирование
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    });
    
    
    
}




-(void) actionEdit:(UIBarButtonItem*) sender {
    
//    Нужно узнать,редактируется ли в данный момент таблица или нет
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing animated:YES];
    
//    Т.к у barButton не меняется title,нам нужно сначала убрать,а потом поставить новый
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:self action:@selector(actionEdit:)];
//    self.navigationItem.rightBarButtonItem = editButton;
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
    
    
}



#pragma mark - UITableViewDataSource
//Удаление ячеек.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //    Нашли студента,которого хотим удалить
        Group* sourceGroup = [self.groupsArray objectAtIndex:indexPath.section];
        Student* student = [sourceGroup.students objectAtIndex:indexPath.row - 1];
        
//        Если мы удаляем, то нам уже не нужно проверять,что в массиве находятся студенты
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        
        
//        И опять нужно обновить данные
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        [tableView endUpdates];
    }
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Group* group = [self.groupsArray objectAtIndex:section];
    
    return [group.students count] + 1; //по умолчанию 1 ряд в секции у нас уже есть,и к нему мы прибавляем нужные
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Если наш наш ряд нулевой,то мы добавляем ряд "добавить студента",а если не нулевой,то добавляется существующий студент
    if (indexPath.row == 0) {
        static NSString* addStudentIdentifier = @"addStudent";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:addStudentIdentifier];
            cell.textLabel.textColor = [UIColor blueColor];
            cell.textLabel.text = @"Tap to add new student";
        }
        
        return cell;
        
    } else {
       
        static NSString* studentIdentifier = @"studentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:studentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:studentIdentifier];
            
        }
        
        
        
        Group* group = [self.groupsArray objectAtIndex:indexPath.section];
        Student* student = [group.students objectAtIndex:indexPath.row - 1]; //Т.к у нас нулевой ряд уже занят "Add student", то мы ставим - ряд начинается с 1 индекса,а не с 0
        
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.averageGrade];
        
        
        if (student.averageGrade >= 4.0) {
            cell.detailTextLabel.textColor = [UIColor greenColor];
        } else if (student.averageGrade >= 3.0) {
            cell.detailTextLabel.textColor = [UIColor orangeColor];
        } else {
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        
        return cell;
        
    }
  
}




- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Мы можем двигать только тогда,когда row больше 0
    return indexPath.row > 0;
    
    /*
    Group* sourceGroup = [self.groupsArray objectAtIndex:indexPath.section];
    Student* student = [sourceGroup.students objectAtIndex:indexPath.row];
    
    return student.averageGrade < 4.f; // можем двигать только тех,у кого низкая оценка
    */
}


//Метод перемещения ячейки
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
//    Нашли студента,которого хотим переместить в другую группу
    Group* sourceGroup = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    Student* student = [sourceGroup.students objectAtIndex:sourceIndexPath.row - 1]; // Всегда,когда мы берём студента из массива нам нужно вычитать 1,т.к 0 ряд занят "add student"
    
    
//    Проверка на перемещение объекта.(если перемещаем объект внутри одной группы)
    NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row - 1  withObjectAtIndex:destinationIndexPath.row - 1];
         sourceGroup.students = tempArray;
    } else {
        
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        
        
        Group* destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.students];
        [tempArray insertObject:student atIndex:destinationIndexPath.row - 1];
        destinationGroup.students = tempArray;
    }
        
    }






-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
 return [self.groupsArray count];
}



- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[self.groupsArray objectAtIndex:section] name];
    
}


#pragma mark - UITableViewDelegate
//Чтобы убрать кнопку удаления слева при редактировании
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    Чтобы нельзя было редактировать нашу ячейку "тапни для добавления нового студента"
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}



- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}



- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
//    Если наш ряд хочет перейти из индекса (0,1) в  (0,0),а мы этого не хотим,то мы вернём изначальный индекс ряда (0,1).А если он не (0,0), то мы возвращем тот indexPath,в который row хочет перейти
    
    if (proposedDestinationIndexPath.row == 0) {
        return  sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
    
}



//Когда мы нажали на ряд,то мы что-нибудь делаем
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Если мы нажали на какой-то ряд,то мы сразу же его отменяем
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    Теперь добавляем нового студента
    if (indexPath.row == 0) {
       
        Group* group = [self.groupsArray objectAtIndex:indexPath.section];
        
//        Нужно проверить, cуществует ли массив студентов.Если не существует, то создаём новый array
        NSMutableArray* tempArray = nil;
        if (group.students) {
             tempArray = [NSMutableArray arrayWithArray:group.students]; //создаёт массив на основе другого массива
        } else {
            tempArray = [NSMutableArray array];
        }
//        Добавляем студента в начало
        NSInteger newStudentIndex = 0;
        [tempArray insertObject:[Student randomStudent] atIndex:newStudentIndex];
        group.students = tempArray;
//        И мы должны опять обновить данные в таблице
   
        
        //    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        [self.tableView beginUpdates];
        
//        Перед тем,как вставить студента,нам нужно создать indexPath
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForItem:newStudentIndex + 1 inSection:indexPath.section];
        
    
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        
        [self.tableView endUpdates];
        
        //    Чтобы не было последующих нажатий,ставим игнорирование и через n-oe время убираем это игнорирование
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        });
        
    }
    
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
}



@end
