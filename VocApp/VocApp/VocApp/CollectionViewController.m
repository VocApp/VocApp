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


@interface CollectionViewController ()
@property NSArray *lections;
@property UICollectionView* Collectionview;
@property NSInteger selectedItem;
@property NSArray *courses;
@property int showedCells;
@property BOOL loadedLec;
@property BOOL loadedCou;
@property int numberOfCells;

@end

@implementation CollectionViewController 


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        return self;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    _Collectionview=view;
    
    NSLog(@"lectionsItemsInSection%d",_lections.count);
    if(_loadedCou&&_loadedLec){
        _numberOfCells=_lections.count+_courses.count;
        return _numberOfCells;
    }else{
        return 0;
    }
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
    cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    if (_showedCells<_lections.count) {
        
        PFObject *lec =(PFObject*) _lections[indexPath.row] ;
        cell.label.text =lec[@"name"];
        cell.row=indexPath.row;
        [cell.layer setCornerRadius:50.0f ];
        _showedCells++;
        return cell;
    }
    
    PFObject *course =(PFObject*) _courses[indexPath.row-_showedCells] ;
    cell.label.text =course[@"Name"];
    cell.row=indexPath.row;
    [cell.layer setCornerRadius:5.0f ];
    
    
    return cell;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
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
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
//    [AllLections loadMyLections:self];
//    [AllCourses  loadMyCourses:self];
//    _showedCells=0;
//    _loadedCou=NO;
//    _loadedLec=NO;
     _numberOfCells=0;
    self.navigationItem.title=[PFUser currentUser].username;
   // NSLog(@"nav:%hhd", [self.navigationController isMemberOfClass:[MainNavigationViewController class ]]);

   
    }
-(void)reload
{
    _showedCells=0;
    _loadedCou=NO;
    _loadedLec=NO;
    [AllLections loadMyLections:self];
    [AllCourses  loadMyCourses:self];
   
    
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
    if([segue.identifier isEqualToString:@"detail"])((DetailViewController*)[segue destinationViewController]).lection=_lections[((cell*)sender).row];


    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
