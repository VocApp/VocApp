//
//  User.m
//  VocApp
//
//  Created by Tim Härle on 02.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "User.h"
#import <Parse/Parse.h>

@implementation User 
-(BOOL)isComplete{

    if(self.forename&&self.surname&&self.username&&self.password&&self.mail){
        return YES;
    }else{
        return NO;
    }
}

-(void)signUp{
        PFUser *newUser = [PFUser user];
        newUser.username = self.username;
        newUser.password = self.password;
        newUser.email = self.mail;
        
        // other fields can be set just like with PFObject
        newUser[@"vorname"] = self.forename;
        newUser[@"nachname"] = self.surname;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Hooray");
                // Hooray! Let them use the app now.
            } else {
                NSString *errorString = [error userInfo][@"error"];
            
                // Show the errorString somewhere and let the user try again.
            }
        }];
    
}



@end
