//
//  EditViewController.m
//  VocApp
//
//  Created by Tim Härle on 15.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "EditViewController.h"
#import "Lection.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)submitLection:(id)sender {
    [self.lection addEntryWithOrigninal:self.original.text andTranslation:self.translation.text];
    self.original.text=@"";
    self.translation.text=@"";
}
- (IBAction)finishEditting:(id)sender {
    [self.lection save];
}


- (IBAction)tap:(id)sender {
     [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%@", [alertView textFieldAtIndex:0].text);
    self.lection=[Lection new];
    self.lection.name=[alertView textFieldAtIndex:0].text;
}

-(void)viewDidAppear:(BOOL)animated{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Neue Lektion"
                                                  message:@"Bitte Name eintragen"
                                                 delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    
    [alert show];

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