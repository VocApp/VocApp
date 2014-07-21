//
//  CourseViewController.m
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "CourseViewController.h"
#import "Course.h"
#import "cell.h"
#import "AllCourses.h"
#import "CourseSubmitViewController.h"

@interface CourseViewController ()
@property (nonatomic,strong) NSArray *courses;
@property UICollectionView *cv;

@end

@implementation CourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    _cv=view;
    
    NSLog(@"%d",_courses.count);
    return _courses.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"course" forIndexPath:indexPath];
    
    
    PFObject *cou =(PFObject*) _courses[indexPath.row] ;
    
    cell.label2.text =cou[@"Name"];
    cell.row=indexPath.row;
    [cell.layer setCornerRadius:15.0f ];
    
    return cell;
}


- (void) loadComplete:(NSArray *)objects error:(NSError *)error {
    _courses=objects;
    [_cv reloadData];
    
    NSLog(@"%d",objects.count);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [AllCourses loadCourses:self];
    // Do any additional setup after loading the view.
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
   if([segue.identifier isEqualToString:@"enter"])((CourseSubmitViewController*)[segue destinationViewController]).course=_courses[((cell*)sender).row];}


@end
