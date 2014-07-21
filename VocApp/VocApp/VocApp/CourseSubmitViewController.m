//
//  CourseSubmitViewController.m
//  VocApp
//
//  Created by Tim on 01.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "CourseSubmitViewController.h"

@interface CourseSubmitViewController ()
@property (weak, nonatomic) IBOutlet UITextView *description;

@end

@implementation CourseSubmitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)enterCourse:(id)sender {
    PFRelation* relation=[self.course relationForKey:@"Members"];
    [relation addObject:[PFUser currentUser]];
    [_course saveInBackground];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.description.text=self.course[@"Description"];
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
