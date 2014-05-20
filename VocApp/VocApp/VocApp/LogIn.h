//
//  LogIn.h
//  VocApp
//
//  Created by Tim Härle on 03.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface LogIn : NSObject
@property (strong,nonatomic) NSString* user;
@property (strong,nonatomic) NSString* pwd;
//-(BOOL)userComplete:(NSString*) user andPw:(NSString *)pwd;
-(void)LogIn:(NSString*) user andPw:(NSString *)pwd andView:(ViewController*)view;


@end
