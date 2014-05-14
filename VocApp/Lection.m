//
//  Lection.m
//  VocApp
//
//  Created by Tim Härle on 14.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "Lection.h"

@implementation Lection

-(Lection *) init{
    self=[super init] ;
    _entries=@[@[@"Hallo",@"hello"],@[@"Haus",@"house"]];
    _name=@"Lection 1";
    _author= [PFUser currentUser];
    return self;
}

@end
