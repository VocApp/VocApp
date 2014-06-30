//
//  AllCourses.m
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "AllCourses.h"


@implementation AllCourses


+(void) loadCourses: (id ) ctrl{
    PFQuery *query = [PFQuery queryWithClassName:@"Course"];
    [query findObjectsInBackgroundWithTarget: ctrl selector:@selector(loadComplete:error:)];
    NSLog(@"Ich lade ");
    
}

+(void) loadMyCourses: (id) crtl{
    
    PFQuery *query = [PFQuery queryWithClassName:@"Course"];
    
    [query whereKey:@"Members" equalTo:[PFUser currentUser]];
    [query addDescendingOrder:@"createdAt"];
    [query findObjectsInBackgroundWithTarget: crtl selector: @selector(loadCourseComplete:error:)];
}

@end
