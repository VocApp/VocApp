//
//  NewUserViewController.m
//  VocApp
//
//  Created by Tim Härle on 02.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "NewUserViewController.h"
#import "User.h"

@interface NewUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *vorname;
@property (weak, nonatomic) IBOutlet UITextField *nachname;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *passwort;
@property (weak, nonatomic) IBOutlet UITextField *passwortwdh;

@end

@implementation NewUserViewController
- (IBAction)okPressed:(id)sender {
    User *user =[User new];
    if([_vorname.text isEqualToString:@""]){
        _vorname.backgroundColor= [UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
        _vorname.placeholder=@"Bitte Vorname angeben";
        NSLog(@"Vorname fehlt");
    }else{
        user.forename=_vorname.text;
    }
    if([_nachname.text isEqualToString:@""]){
        _nachname.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
        _nachname.placeholder=@"Bitte Nachname angeben";
        NSLog(@"Nachname fehlt");
    }else{
        user.surname=_nachname.text;
    }
    if([_username.text isEqualToString:@""]){
        _username.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
        _username.placeholder=@"Bitte Username angeben";
        NSLog(@"username fehlt");
    }else{
        user.username=_username.text;
    }
    if([_email.text isEqualToString:@""]){
        _email.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
        _email.placeholder=@"Bitte E-Mail-Adresse angeben";
    }else{
        user.mail=_email.text;
    }
    if((![_passwort.text isEqualToString: _passwortwdh.text])||([_passwort.text isEqualToString:@""] )){
        _passwortwdh.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
        _passwortwdh.placeholder=@"Passwort muss übereinstimmen";
        _passwort.placeholder=@"Passwort muss übereinstimmen";
        _passwort.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.25];
    }else{
        user.password=_passwort.text;
    }
    
    if([user isComplete]){
        
        NSLog(@"%@", user.forename);
        NSLog(@"%@", user.surname);
        [user signUp];
        NSLog(@"complete");
    }
    
}
- (IBAction)tapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)CancelPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
