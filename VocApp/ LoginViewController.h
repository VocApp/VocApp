//
//  ViewController.h
//  VocApp
//
//  Created by Tim Härle on 02.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface  LoginViewController : UIViewController

- (void)handleUserLogin:(PFUser *)user error:(NSError *)error;

@end
