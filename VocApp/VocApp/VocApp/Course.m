//
//  Course.m
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "Course.h"

@implementation Course


-(NSMutableArray*)users{

    if(!_users){
        _users= [[NSMutableArray alloc] initWithCapacity:20];
    }
    return _users;
}
-(NSMutableArray*)lections{
    
    if(!_lections){
        _lections= [[NSMutableArray alloc] initWithCapacity:20];
    }
    return _lections;
}

-(void) addUser:(PFUser*) user{
    [self.users addObject:user];
}
-(void) addLections:(PFObject*)lection{
    [self.lections addObject:lection];
}

-(void)save{
    
    PFObject *course=[PFObject objectWithClassName:@"Course"];
    
    course[@"Name"]=_name;
    course[@"Members"]=_users;
    course[@"Lections"]=_lections;
    course[@"Author"]=_author;
    [course saveEventually];
}

@end
