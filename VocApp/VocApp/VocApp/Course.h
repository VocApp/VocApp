//
//  Course.h
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Course : NSObject
@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSMutableArray* users;
@property (strong,nonatomic) NSMutableArray* lections;
@property (strong,nonatomic) PFUser* author;

-(void)save;
-(void) addUser:(PFUser*) user;
-(void) addLections:(PFObject*)lection;
@end
