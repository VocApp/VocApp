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

@synthesize lections =_lections;
-(NSMutableArray*)lections{

    if(!_lections){
        _lections=[[NSMutableArray alloc] initWithCapacity:2];
        [ _lections addObject:@"Hi"];
        [ _lections addObject:@"dumm"];
    }
    
    return _lections;
}
-(void)signUp{
        PFUser *newUser = [PFUser user];
        newUser.username = self.username;
        newUser.password = self.password;
        newUser.email = self.mail;
        
        
        // other fields can be set just like with PFObject
        newUser[@"vorname"] = self.forename;
        newUser[@"nachname"] = self.surname;
        newUser[@"lections"]= self.lections;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Hooray");
                // Hooray! Let them use the app now.
            } else {
                NSString *errorString = [error userInfo][@"error"];
                NSLog(@"%@",errorString);
                // Show the errorString somewhere and let the user try again.
            }
        }];
    
}




@end
