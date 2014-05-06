//
//  LogIn.m
//  VocApp
//
//  Created by Tim Härle on 03.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "LogIn.h"
#import <Parse/Parse.h>
#import "ViewController.h"

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

-(void)LogIn:(NSString*) user andPw:(NSString *)pwd andView:(ViewController*)view {
    NSLog(@"USER %@",user);
    NSLog(@"PWD %@",pwd);
    
    
    
    [PFUser logInWithUsernameInBackground:user
                                 password:pwd
                                   target:view
                                 selector:@selector(handleUserLogin:error:)];
   
    
}






@end
