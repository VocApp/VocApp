//
//  SearchViewController.m
//  VocApp
//
//  Created by Tim Härle on 03.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "SearchViewController.h"
#import "Lection.h"
#import "AllLections.h"
#import <Parse/Parse.h>
#import "cell.h"
#import "ViewController.h"
#import "PreviewViewController.h"

@interface SearchViewController ()
@property NSArray *lections;
@property UICollectionView* Collectionview;
@property NSInteger selectedItem;
@end

@implementation SearchViewController

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
    _Collectionview=view;
    
    NSLog(@"%d",_lections.count);
    return _lections.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    
    PFObject *lec =(PFObject*) _lections[indexPath.row] ;
    cell.label.text =lec[@"name"];
    cell.row=indexPath.row;
    [cell.layer setCornerRadius:50.0f ];
    
    return cell;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void) loadComplete:(NSArray *)objects error:(NSError *)error {
    _lections=objects;
    [_Collectionview reloadData];
    
    NSLog(@"%d",objects.count);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [AllLections loadLections:self];
    self.navigationItem.title=[PFUser currentUser].username;
    // NSLog(@"nav:%hhd", [self.navigationController isMemberOfClass:[MainNavigationViewController class ]]);
     NSUserDefaults* userDef = [NSUserDefaults standardUserDefaults];
    PFObject* obj =  [userDef objectForKey:@"lections"];
    NSLog(@"%@",obj[@"name"]);
    
    
}


- (IBAction)Logout:(id)sender {
    [PFUser logOut];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *obj=[story instantiateViewControllerWithIdentifier:@"login"];
    self.navigationController.navigationBarHidden=YES;
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:obj animated:YES];
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
      ((PreviewViewController*)[segue destinationViewController]).lection=_lections[((cell*)sender).row];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
