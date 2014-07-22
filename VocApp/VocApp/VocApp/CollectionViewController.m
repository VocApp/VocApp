//
//  CollectionViewController.m
//  VocApp
//
//  Created by Tim Härle on 13.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "CollectionViewController.h"
#import "cell.h"
#import "AllLections.h"
#import "Lection.h"
#import <Parse/Parse.h>
#import "ViewController.h"
#import "DetailViewController.h"
#import "AllCourses.h"
#import "CoursePreviewViewController.h"


@interface CollectionViewController ()
@property NSArray *lections;

@property UICollectionView* Collectionview;
@property NSInteger selectedItem;
@property NSArray *courses;
@property int showedCells;
@property BOOL loadedLec;
@property BOOL loadedCou;
@property int numberOfCells;
@property UILongPressGestureRecognizer* lpgr;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView1;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property UIRefreshControl* refreshControl;
@property cell* cellToDelete;

@end

@implementation CollectionViewController 


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        return self;
}
// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   UICollectionReusableView* rview= [ collectionView dequeueReusableSupplementaryViewOfKind: kind withReuseIdentifier:@"viewID" forIndexPath:indexPath];
   UILabel* title=(UILabel*)rview.subviews[0];
    if (indexPath.section==0){
    title.text=@"Lektionen";
    }else if (indexPath.section==1){
        title.text=@"Kurse";
    }
    return rview;
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    if(sender.state==UIGestureRecognizerStateBegan){
       // cell* cell= (cell* ) sender.view;
//        [cell setBackgroundColor: [UIColor colorWithRed:0.0 green:0.7 blue:1.0 alpha:0.5]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    _Collectionview=view;
    if(_loadedCou&&_loadedLec){
        [self.activityIndicatorView1 stopAnimating];
        
        


    switch (section) {
        case 0:
            return self.lections.count;
            break;
        case 1:
            return self.courses.count;
            break;
        default:
            return 0;
            break;
    }

    }
    return 0;
}

- (IBAction)Logout:(id)sender {
    [PFUser logOut];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *obj=[story instantiateViewControllerWithIdentifier:@"login"];
    self.navigationController.navigationBarHidden=YES;
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:obj animated:YES];
}





- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
   
   // [cell.backgroundView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Binary_LOGO"]]];
    //cell.image.image=[UIImage imageNamed:@"Binary_LOGO"];
    
    if (indexPath.section==0) {
         cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
        PFObject *lec =(PFObject*) _lections[indexPath.row] ;
        cell.label.text =lec[@"name"];
        cell.row=indexPath.row;
        cell.sec=indexPath.section;
       
       
        return cell;
        
    }else if(indexPath.section==1){
        cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"IDC" forIndexPath:indexPath];
        PFObject *course =(PFObject*) _courses[indexPath.row] ;
        cell.label.text =course[@"Name"];
        cell.row=indexPath.row;
        cell.sec=indexPath.section;
       
    
    
    return cell;
    }
    return nil;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (void) loadComplete:(NSArray *)objects error:(NSError *)error {
   
//    if((_courses.count+_lections.count)!=(_numberOfCells)){
    _lections=objects;
    [_Collectionview reloadData];
    _loadedLec=YES;
    NSLog(@"loaded lections: %d",objects.count);
//    }
}

- (void) loadCourseComplete:(NSArray *)objects error:(NSError *)error {
   
//    if((_courses.count+_lections.count)!=(_numberOfCells)){
    _courses=objects;
    [_Collectionview reloadData];
     _loadedCou=YES;
    
    NSLog(@"loaded courses: %d",objects.count);
//    }
}
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer{
    NSLog(@"Geiloner");
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        return;
    }else if (gestureRecognizer.state == UIGestureRecognizerStateBegan){
        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        if (indexPath == nil){
            NSLog(@"couldn't find index path");
        } else {
            // get the cell at indexPath (the one you long pressed)
            cell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            self.cellToDelete=cell;
            NSLog(cell.label.text);
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Löschen ?"
                                                      message:[NSString stringWithFormat:@"Wollen Sie die Lektion '%@' wirklich löschen?",cell.label.text]
                                                     delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"ok", nil];
        
        
            [alert show];
       
    
    
    
    
    }
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        NSLog(@"ok: %@ löschen",self.cellToDelete.label.text );
        PFUser *user = [PFUser currentUser];
        if (self.cellToDelete.sec==0) {
            
        
        PFRelation *relation = [user relationForKey:@"Lections"];
        [relation removeObject:self.lections[self.cellToDelete.row]];
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [self reload];
            }];

        }
   
    if (self.cellToDelete.sec==1) {
        PFObject* courseToDelete=self.courses[self.cellToDelete.row];
       PFRelation *rel= [courseToDelete relationForKey:@"Members"];
        [rel removeObject:user];
        [courseToDelete saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [self reload];
            }];
        }

    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _lpgr= [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    self.lpgr.minimumPressDuration = .5; //seconds
    self.lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:_lpgr ];
    self.activityIndicatorView1.hidesWhenStopped=YES;
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self
   action:@selector(refreshView:)
    forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
    
    
    
//    self.activityIndicatorView=[[ UIActivityIndicatorView  alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    [self.view addSubview:self.activityIndicatorView];
   // [self.collectionView ];

   
    }
-(void)refreshView:(UIRefreshControl *)refresh {
   NSLog(@"refresh");
//   refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
// 
//     // custom refresh logic would be placed here...
//  
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MMM d, h:mm a"];
//    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@",
//    [formatter stringFromDate:[NSDate date]]];
//        refresh.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
//     [refresh endRefreshing];
  }


-(void)reload
{
    _showedCells=0;
    _loadedCou=NO;
    _loadedLec=NO;
    [AllLections loadMyLections:self];
    [AllCourses  loadMyCourses:self];
    [self.activityIndicatorView1 startAnimating];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"will appear");
    [self reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detail"]){
        
    ((DetailViewController*)[segue destinationViewController]).lection=_lections[((cell*)sender).row];
    
    }
    if([segue.identifier isEqualToString:@"course"])((CoursePreviewViewController*)[segue destinationViewController]).course=_courses[((cell*)sender).row];

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
