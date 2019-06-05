//
//  DNViewController.m
//  TableEditing
//
//  Created by Denis Nesteruk on 5/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "DNViewController.h"
#import "Student.h"
#import "Group.h"


@interface DNViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) UITableView* testTableView;

@property (strong, nonatomic) NSMutableArray* groupsArray;


@end

@implementation DNViewController


-(void) loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
    self.testTableView = tableView;
 
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//     Массив всех групп
    self.groupsArray = [NSMutableArray array];
    
    for (int i = 0; i < ((arc4random() % 6) + 5); i++) {
        Group* group = [[Group alloc] init];
        group.name = [NSString stringWithFormat:@"Group #%d", i];
        
        NSMutableArray* array = [NSMutableArray array];
        
        for (int j = 0; j < ( (arc4random() % 11) + 15); j++) {
            [array addObject:[Student randomStudent]];
        }
        
        group.studentsArray = array;//У нашей группы есть проперти studentsArray и в него мы устанавливаем array,в который только что положили студентов

        
//        Добавляем в массив всех групп сгенерированные группы
        [self.groupsArray addObject:group];
        
    }
    
//    Перезагружаем наше проперти таблицы,чтобы данные из неё были видны
    [self.testTableView reloadData];
    
    
    
//    !!!!!!!
    
    self.navigationItem.title = @"Students";
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddSection:)];
    self.navigationItem.leftBarButtonItem = addButton;
    
    
}

#pragma mark - Actions


-(void) actionAddSection:(UIBarButtonItem*) sender {
    
    Group* group = [[Group alloc] init];
    group.name = [NSString stringWithFormat:@"Group #%lu", [self.groupsArray count] +1];
    
//    СНАЧАЛА МЫ МЕНЯЕМ ДАННЫЕ
    group.studentsArray = @[[Student randomStudent], [Student randomStudent]]; // Массив из 2ух студентов
    
    NSInteger newSectionIndex = 0;
    [self.groupsArray insertObject:group atIndex:newSectionIndex];
    
    
    //  !!!!  При добавлении каждый раз наша таблица должна быть перезагружен
    [self.testTableView beginUpdates];
    
//    Добавляем анимированно наши секции в таблицу
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    [self.testTableView insertSections:insertSections
                      withRowAnimation:[self.groupsArray count] % 2 ? UITableViewRowAnimationLeft : UITableViewRowAnimationRight]; //если чётное число - анимация слева,нечёт - справа
    

    [self.testTableView endUpdates];
    
    //    Чтобы во время апдейта были запрещены нажатия
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    });

}





-(void) actionEdit:(UIBarButtonItem*) sender {
    
    BOOL isEditing = self.testTableView.editing;
    [self.testTableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
//    Если у нас таблица уже в режиме редактирования,то нам нужно пересоздать кнопку (изменить кнопку edit на done)
    if (self.testTableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item target:self action:@selector(actionEdit:)];
    
//     self.navigationItem.rightBarButtonItem = editButton;
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
}





#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.groupsArray count];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Group* group = [self.groupsArray objectAtIndex:section];
    
    return [group.studentsArray count] + 1;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        static NSString* addStudentIdentifier = @"AddStudentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addStudentIdentifier];
            cell.textLabel.textColor = [UIColor blueColor];
            cell.textLabel.text = @"add student";
        }
        
        return cell;
        
    } else {
        
        static NSString* studentIdentifier = @"studentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:studentIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:studentIdentifier];
        }
        
        //    Берём группу,она соответстувет секции
        Group* group = [self.groupsArray objectAtIndex:indexPath.section];
        //    Берём студента,он соответствует нашему ряду
        Student* student = [group.studentsArray objectAtIndex:indexPath.row - 1];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Name = %@, lastName = %@", student.firstName, student.lastName];
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




- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return  [[self.groupsArray objectAtIndex:section] name];
}


//Можно ли этот ряд переместить по такому-то indexPath
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
        return indexPath.row > 0;
    
    /*
//    ex.Чтобы можно было двигать только определённый
    Group* group = [self.groupsArray objectAtIndex:indexPath.section];
    //    Берём студента,он соответствует нашему ряду
    Student* student = [group.studentsArray objectAtIndex:indexPath.row];
    
    return student.averageGrade >= 4; //можем двигать только тех, у кого оценка больше либо равна 4
    */
}


//Ряд по indexPath хочет перейти в другой indexPath.Метод вызывается,когда ячейча перемещается.Меняется только UI,ячейчка остаётся в том же массиве,в котором была изначально
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    //    Берём группу,она соответстувет секции
//    ТУТ МЫ БЕРЁМ ИСХОДНЫЕ ДАННЫЕ,КОТОРЫЕ БУДЕМ ПЕРЕМЕЩАТЬ
    Group* sourceGroup = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    //    Берём студента,он соответствует нашему ряду
    Student* student = [sourceGroup.studentsArray objectAtIndex:sourceIndexPath.row];
    
    
    //    ПЕРЕД ТЕМ,КАК ПЕРЕМЕСТИТЬ ЯЧЕЙКУ,МЫ ДОЛЖНЫ УДАЛИТЬ ЕЁ ИЗ ПРОШЛОЙ ГРУППЫ,ПОЭТОМУ СОЗДАЁМ ВРЕМЕННЫЙ МАССИВ,НА ОСНОВЕ sourceGroup.students (массив студентов в группе)
    NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceGroup.studentsArray];
    
    
    
//    Если перемещение осуществляется внутри одной секции,то просто меняются rows местами
    if (sourceIndexPath.section == destinationIndexPath.section) {
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
        sourceGroup.studentsArray = tempArray;
    } else {
//       Удаляем ячейку из временного массива
        [tempArray removeObject:student];
        
        
        //    ПОСЛЕ ТОГО,КАК УДАЛИЛИ ЯЧЕЙКУ ИЗ ГРУППЫ,МЫ ДОЛЖНЫ В НАШУ sourceGroup.students установить временный(обновлённый без удалённой ячейки) массив
        sourceGroup.studentsArray = tempArray;
        
        
        //    ТУТ МЫ СОЗДАЁМ МЕСТО,КУДА МЫ БУДЕМ ПЕРЕМЕЩАТЬ
        Group* destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        
        //    Берём тот же самый указатель,но создаём новый объект
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.studentsArray];
        //    Добавляем ячейку во временный массив
        [tempArray insertObject:student atIndex:destinationIndexPath.row];
        
        //    УСТАНАВЛИВАЕМ временный массив в destination массив
        destinationGroup.studentsArray = tempArray;
        
    }
    
}


#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleNone; // уберёт кнопку удаления слева
}


//Должен ли сдвигаться при редактировании
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}


@end
