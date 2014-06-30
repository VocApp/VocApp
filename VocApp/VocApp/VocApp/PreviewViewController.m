//
//  PreviewViewController.m
//  VocApp
//
//  Created by Tim Härle on 03.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "PreviewViewController.h"
#import <Parse/Parse.h>
#import "CollectionViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)add:(id)sender {

    
    
    PFUser *user = [PFUser currentUser];
    PFRelation *relation = [user relationforKey:@"Lections"];
    [relation addObject:_lection];
    [user saveInBackground];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
