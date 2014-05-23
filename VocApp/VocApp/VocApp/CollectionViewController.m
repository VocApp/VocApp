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

@interface CollectionViewController ()
@property NSLock *lock;
@property NSArray *lections;
@property UICollectionView* Collectionview;
@end

@implementation CollectionViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{   //[_lock lock];
    _Collectionview=view;
    
    //[_lock lock];
    NSLog(@"%d",_lections.count);
    return _lections.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected");
    [self performSegueWithIdentifier:@"detail" sender:self];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"deselected");
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
   
    PFObject *lec =(PFObject*) _lections[indexPath.row] ;
    cell.label.text =lec[@"name"];
    
    

    
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
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
