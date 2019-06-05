//
//  ViewController.m
//  DynamicCellsHomework
//
//  Created by Denis Nesteruk on 4/17/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"
#import "testObject.h"
#import "Student.h"

@interface ViewController ()
@property (assign, nonatomic) CGFloat redRGB;
@property (assign, nonatomic) CGFloat greenRGB;
@property (assign, nonatomic) CGFloat blueRGB;

@property (strong, nonatomic) testObject* object;

@property (strong, nonatomic) Student* student;


@property (strong, nonatomic) NSMutableArray* arrayForTestObjects;

@property (strong, nonatomic) NSMutableArray* arrayOfStudents;
@property (strong, nonatomic) NSArray* arrayOfNames;
@property (strong, nonatomic) NSArray* arrayOfLastNames;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.arrayOfNames = [NSArray arrayWithObjects:@"Pan", @"Dana", @"Peter", @"Davis", @"Glen", @"Nomi", nil];
    self.arrayOfLastNames = [NSArray arrayWithObjects:@"Haris", @"Parvin", @"Trent", @"Jerno", @"Chef", @"Skin", nil];

    
    
    self.arrayOfStudents = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 30; i++) {
        self.student = [[Student alloc] init];
        self.student.name = [self.arrayOfNames objectAtIndex:arc4random() % [self.arrayOfNames count]];
        self.student.lastName = [self.arrayOfLastNames objectAtIndex:arc4random() % [self.arrayOfLastNames count]];
        self.student.averageGrade = arc4random() % 6;
        [self.arrayOfStudents addObject:self.student];
        NSLog(@"name = %@, lastName = %@, grade = %ld", self.student.name, self.student.lastName, self.student.averageGrade);
    }
    
    
    
    
    
    
    self.arrayForTestObjects = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 1000; i++) {
        self.object = [[testObject alloc] init];
        self.object.color = [self randomColor];
        self.object.name = [NSString stringWithFormat:@"row number is %d, RGB{%1.2f, %1.2f, %1.2f}", i, self.redRGB, self.greenRGB, self.blueRGB];
        [self.arrayForTestObjects addObject:self.object];
    }
//    NSLog(@"array = %@", self.arrayForTestObjects);
    NSSortDescriptor* sortedByLastNames = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    [self.arrayOfStudents sortUsingDescriptors:@[sortedByLastNames]];
    
    
}

#pragma mark - Methods

-(UIColor*) randomColor {
    self.redRGB = (float)(arc4random() % 256) / 255.f;
    self.greenRGB = (float)(arc4random() % 256) / 255.f;
    self.blueRGB = (float)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:self.redRGB green:self.greenRGB blue:self.blueRGB alpha:1.f];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return [self.arrayForTestObjects count];
    return [self.arrayOfStudents count];
 
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    
    
    self.student = [self.arrayOfStudents objectAtIndex:indexPath.row];
    
    if (self.student.averageGrade < 4) {
        cell.textLabel.textColor = [UIColor redColor];
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    /*
    UIColor* textColor = (self.student.averageGrade < 4) ? ([UIColor redColor]) : ([UIColor blackColor]);
    cell.textLabel.textColor = textColor;
    */
    
    cell.textLabel.text = [NSString stringWithFormat:@"name = %@, lastName = %@", self.student.name, self.student.lastName];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"grade = %ld", self.student.averageGrade];
    
    
    
    
    
    /*
    self.object = [self.arrayForTestObjects objectAtIndex:indexPath.row];
    
    cell.backgroundColor = self.object.color;
    
    cell.textLabel.text = self.object.name;
    */
    return cell;
}








@end
