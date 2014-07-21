//
//  ResultViewController.m
//  VocApp
//
//  Created by Tim on 21.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tryCount;
@property (weak, nonatomic) IBOutlet UILabel *right;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.right.text=[NSString stringWithFormat:@"%d",self.rightWords];
    self.tryCount.text=[NSString stringWithFormat:@"%d",self.words];
    
    
    NSMutableString *tmp=[[NSMutableString alloc]init];
    for (int i=0; i<self.falsch.count; i++) {
        NSString *tmp1= [NSString stringWithFormat:@"%@ - %@ \n",self.falsch[i][0],self.falsch[i][1]];
        [tmp appendString:tmp1];
    }
    self.textView.text=[tmp substringFromIndex:0];
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
