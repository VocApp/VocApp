//
//  CourseEditViewController.m
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "CourseEditViewController.h"
#import "AllLections.h"
#import "TableViewCell.h"


@interface CourseEditViewController ()
@property NSArray *lections;
@property (strong,nonatomic) NSMutableArray * selected;
@property (strong,nonatomic) NSMutableArray * selectedLections;
@end

@implementation CourseEditViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(NSMutableArray*)selected{
    if (!_selected) {
        _selected=[[NSMutableArray alloc] initWithCapacity:_lections.count];
        
    }
    return _selected;
}

-(NSMutableArray*)selectedLections{
    if (!_selectedLections) {
        _selectedLections=[[NSMutableArray alloc] initWithCapacity:2];
        
    }
    return _selectedLections;
}

- (void) loadComplete:(NSArray *)objects error:(NSError *)error {
    _lections=objects;
    [_tableview reloadData];
    NSLog(@"%d",objects.count);
    int i;
    for (i=0; i<_lections.count; i++) {
        self.selected[i]=[NSNumber numberWithBool:NO];
    }
}
- (IBAction)createCourse:(id)sender {
    
    
    for (int i=0; i<self.lections.count; i++) {
        if (self.selected[i]==[NSNumber numberWithBool:YES]) {
            [self.selectedLections addObject:self.lections[i]];
        }
    }
    PFUser *user= [PFUser currentUser];
    PFObject *course = [PFObject objectWithClassName:@"Course"];
    PFRelation *relation = [course relationforKey:@"Lections"];
    for (int j=0; j<self.selectedLections.count; j++) {
        [relation addObject:self.selectedLections[j]];
    }
  
    course[@"Author"] =user;
    course[@"Name"]=_name.text;
    PFRelation *relation3=[course relationForKey:@"Members"];
    [relation3 addObject:user];
    
    [course saveInBackground];
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"HALLLOO");
    [textField resignFirstResponder];
    return NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [AllLections loadLections:self];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSections{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _lections.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell* cell = [[TableViewCell alloc ] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"table"];
    PFObject * obj =(PFObject*) self.lections[indexPath.row];
 
    [[cell textLabel ]setText:obj[@"name"] ];
    
    if (_selected[indexPath.row]==[NSNumber numberWithBool:YES]) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType= UITableViewCellAccessoryNone;
    }
 
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_selected[indexPath.row]==[NSNumber numberWithBool:YES]) {
        cell.accessoryType=UITableViewCellAccessoryNone;
        self.selected[indexPath.row]=[NSNumber numberWithBool:NO];
    }else{
        cell.accessoryType= UITableViewCellAccessoryCheckmark;
        self.selected[indexPath.row]=[NSNumber numberWithBool:YES];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
