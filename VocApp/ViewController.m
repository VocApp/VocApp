//
//  ViewController.m
//  VocApp
//
//  Created by Tim Härle on 02.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "LogIn.h"
#import "User.h"
#import "HomeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *passwort;

@end

@implementation  ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapped:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)okPressed:(id)sender {
    
    _username.backgroundColor=[UIColor clearColor];
    _passwort.backgroundColor=[UIColor clearColor];
    if([_username.text isEqualToString:@""]){
        _username.backgroundColor=[UIColor redColor];
        _username.placeholder=@"Username angeben";
    }
    if([_passwort.text isEqualToString:@""]){
        _passwort.backgroundColor=[UIColor redColor];
        _passwort.placeholder=@"Passwort angeben";
        
    }
    
    LogIn *log=[LogIn new];
   
    
     [log  LogIn:_username.text andPw:_passwort.text andView:self];

   }

- (void)handleUserLogin:(PFUser *)user error:(NSError *)error {
    NSLog(@"Handle");
    if (user) {
        // Do stuff after successful login.
        NSLog(@"Yippie");
       [self performSegueWithIdentifier:@"NewView" sender:self];
        
    } else {
        // The login failed. Check error to see why.
    }
}

@end
