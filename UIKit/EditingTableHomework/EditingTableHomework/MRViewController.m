//
//  MRViewController.m
//  EditingTableHomework
//
//  Created by Denis Nesteruk on 5/2/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "MRViewController.h"
#import "NbaTeam.h"
#import "Conference.h"
@interface MRViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) UITableView* tableView;

@property (strong, nonatomic) NSMutableArray* conferencesArray;



@property (strong, nonatomic) NSArray* arrayOfAllTeamsNames;
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
    
    
    
//    Navigation
    self.navigationItem.title = @"Where Amazing Happens";
    
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddSection:)];
    self.navigationItem.leftBarButtonItem = addButton;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.arrayOfAllTeamsNames = [NSArray arrayWithObjects:@"Milwaukee Bucks", @"Toronto Raptors", @"Philadelphia 76ers",  @"Boston Celtics", @"Indiana Pacers", @"Brooklyn Nets", @"Orlando Magic", @"Detroit Pistons", @"Charlotte Hornets", @"Miami Heat", @"Washington Wizards", @"Atlanta Hawks", @"Chicago Bulls", @"Cleavland Cavaliers", @"New York Nicks", @"Golden State Warriors", @"Denver Nuggets", @"Portland Blazers", @"Houston Rockets", @"Utah Juzz", @"Oklahoma City Thunder", @"San Antonio Spurs", @"LA Clippers", @"Sacramento Kings", @"Los Angeles Lakers", @"Minnesota Timberwolves", @"Memphis Grizzles", @"New Orleans Pelicans", @"Dallas Mavericks", @"Phoenix Suns", nil];
    
    
    self.conferencesArray = [NSMutableArray array];
    
    for (int i = 0; i < 2; i++) {
        Conference* conference = [[Conference alloc] init];
        
        NSMutableArray* array = [NSMutableArray array];
        
        for (int j = 0; j < 15; j++) {
            NbaTeam* team = [[NbaTeam alloc] init];
            team.name = [self.arrayOfAllTeamsNames objectAtIndex:arc4random() % [self.arrayOfAllTeamsNames count]];
            team.wins = arc4random() % 41;
            team.looses = arc4random() % 41;
            
            [array addObject:team];
        }
        conference.arrayOfTeams = array;
        
        
        [self.conferencesArray addObject:conference];
    }
    
    
    [self.tableView reloadData];
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
    [self.navigationItem setRightBarButtonItem:editButton animated:YES];
}

-(void) actionAddSection:(UIBarButtonItem*) sender {
    
    Conference* conference = [[Conference alloc] init];
    NSInteger newSectionIndex = 0;
    
    [self.conferencesArray insertObject:conference atIndex:newSectionIndex];
    
    
    
    [self.tableView beginUpdates];
    
    NSIndexSet* insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
    [self.tableView insertSections:insertSections withRowAnimation:UITableViewRowAnimationLeft];
    
    
    [self.tableView endUpdates];
    
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.conferencesArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    Conference* conference = [self.conferencesArray objectAtIndex:section];
    
    return [conference.arrayOfTeams count] + 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        
        static NSString* addTeamIdentifier = @"addTeam";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addTeamIdentifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:addTeamIdentifier];
            cell.textLabel.textColor = [UIColor orangeColor];
            cell.textLabel.text = @"Add Team";
        }
        
        return cell;
        
    } else {
    
    
    
    static NSString* teamIdentifier = @"teamCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:teamIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:teamIdentifier];
    }
    
    Conference* conference = [self.conferencesArray objectAtIndex:indexPath.section];
    NbaTeam* team = [conference.arrayOfTeams objectAtIndex:indexPath.row - 1];
    
    if (team.wins > team.looses) {
        cell.detailTextLabel.textColor = [UIColor greenColor];
    } else {
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", team.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld / %ld", team.wins, team.looses];
    
    
    
    return cell;
        
    }
        
}



- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* sectionName;
    
    switch (section) {
        case 0:
            sectionName = NSLocalizedString(@"Eastern Conference", @"Eastern Conference");
            break;
        case 1:
            sectionName = NSLocalizedString(@"Western Conference", @"Western Conference");
            break;
            
        default:
            sectionName = NSLocalizedString(@"New Conference", @"New Conference");
            break;
    }
    
    return sectionName;
}




- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row > 0;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    Conference* sourceConference = [self.conferencesArray objectAtIndex:sourceIndexPath.section];
    NbaTeam* team = [sourceConference.arrayOfTeams objectAtIndex:sourceIndexPath.row - 1];
    
    NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceConference.arrayOfTeams];
    
    
    if (sourceIndexPath.section == destinationIndexPath.section) {
        [tempArray exchangeObjectAtIndex:sourceIndexPath.row - 1 withObjectAtIndex:destinationIndexPath.row - 1];
        sourceConference.arrayOfTeams = tempArray;
    } else {
        
        [tempArray removeObject:team];
        sourceConference.arrayOfTeams = tempArray;
        
        
        Conference* destinationConference = [self.conferencesArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationConference.arrayOfTeams];
        
        [tempArray insertObject:team atIndex:destinationIndexPath.row - 1];
        destinationConference.arrayOfTeams = tempArray;
        
        
    }
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Conference* sourceConference = [self.conferencesArray objectAtIndex:indexPath.section];
        NbaTeam* team = [sourceConference.arrayOfTeams objectAtIndex:indexPath.row - 1];
        
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:sourceConference.arrayOfTeams];
        [tempArray removeObject:team];
        sourceConference.arrayOfTeams = tempArray;
        
        
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        
        [tableView endUpdates];
        
    }
    
    
}

#pragma mark - UITableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section != proposedDestinationIndexPath.section)
    {
        return sourceIndexPath;
    }
    else
    {
        return proposedDestinationIndexPath;
    }
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"eliminate";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        Conference* conference = [self.conferencesArray objectAtIndex:indexPath.section];
        
        NbaTeam* team = [[NbaTeam alloc] init];
        team.name = [self.arrayOfAllTeamsNames objectAtIndex:arc4random() % [self.arrayOfAllTeamsNames count]];
        team.wins = arc4random() % 41;
        team.looses = arc4random() % 41;
        
        NSMutableArray* tempArray = nil;
        
        if (conference.arrayOfTeams) {
            tempArray = [NSMutableArray arrayWithArray:conference.arrayOfTeams];
        } else {
            tempArray = [NSMutableArray array];
        }
        
        NSInteger newTeamIndex = 0;
        [tempArray insertObject:team atIndex:newTeamIndex];
        conference.arrayOfTeams = tempArray;
        
        
        
        [tableView beginUpdates];
        
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForItem:newTeamIndex + 1 inSection:indexPath.section];
        
        
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        
        [tableView endUpdates];
    }
    
    
}

@end
