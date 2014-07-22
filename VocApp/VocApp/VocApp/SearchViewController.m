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
#import "EditViewController.h"

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
    
    
    return _lections.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    
    PFObject *lec =(PFObject*) _lections[indexPath.row] ;
    cell.label.text =lec[@"name"];
    cell.row=indexPath.row;
   
    
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
    [AllLections loadLections:self];

    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    [AllLections loadLections:self];
}
-(void)reload{
    [AllLections loadLections:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"lection"]) {
        
    ((PreviewViewController*)[segue destinationViewController]).lection=_lections[((cell*)sender).row];
    }
    if ([segue.identifier isEqualToString:@"new"]) {
        
        ((EditViewController*)[segue destinationViewController]).parent=self;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
