//
//  LogIn.m
//  VocApp
//
//  Created by Tim Härle on 03.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "LogIn.h"
#import <Parse/Parse.h>

@implementation LogIn

-(BOOL)userComplete:(NSString*) user andPw:(NSString *)pwd;{
    NSLog(@"userUser %@",user);
    NSLog(@"userPWD %@",pwd);
    if(user&&pwd){
        return YES;
    }else{
        return NO;
    }
}

-(void)LogIn:(NSString*) user andPw:(NSString *)pwd{
    NSLog(@"USER %@",user);
    NSLog(@"PWD %@",pwd);
    
    [PFUser logInWithUsernameInBackground:user
                                 password:pwd
                                   target:self
                                 selector:@selector(handleUserLogin:error:)];
   
    
}

-(v)[PFUser logInWithUsernameInBackground:user password:pwd
                                block:^(PFUser *user, NSError *error) {
                                    if (user) {
                                        // Do stuff after successful login.
                                        NSLog(@"Hooray Sign Up läuft");
                                    } else {
                                        // The login failed. Check error to see why.
                                        
                                    }
                                }];





@end
