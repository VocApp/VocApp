//
//  CoursePreviewViewController.m
//  VocApp
//
//  Created by Tim on 01.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "CoursePreviewViewController.h"
#import "cell.h"
#import "Detail2ViewController.h"

@interface CoursePreviewViewController ()
@property  NSArray *lections;
@property UICollectionView* Collectionview;
@end

@implementation CoursePreviewViewController

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
    cell.label3.text =lec[@"name"];
    cell.row=indexPath.row;
    [cell.layer setCornerRadius:46.0f ];
    
    return cell;
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
  //  PFQuery* query=[PFQuery queryWithClassName:@"Lections"];
    PFRelation* rel=[_course relationForKey:@"Lections"];
    [[rel query] findObjectsInBackgroundWithTarget:self selector:@selector(found:error:)];
    // Do any additional setup after loading the view.
}
-(void)found:(NSArray *)objects error:(NSError *)error{
    _lections=objects;
    NSLog(@"Lections: %d",_lections.count);
      [_Collectionview reloadData];
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
   if([segue.identifier isEqualToString:@"detail2"])((Detail2ViewController*)[segue destinationViewController]).lection=_lections[((cell*)sender).row];
}


@end
