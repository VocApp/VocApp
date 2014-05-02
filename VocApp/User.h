//
//  User.h
//  VocApp
//
//  Created by Tim Härle on 02.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong,nonatomic) NSString* forename;
@property (strong,nonatomic) NSString* surname;
@property (strong,nonatomic) NSString* username;
@property (strong,nonatomic) NSString* mail;
@property (strong,nonatomic) NSString* password;

-(BOOL)isComplete;


-(void)signUp;

@end
