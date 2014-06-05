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

//+(void) loadMyLections: (CollectionViewController*) crtl{
//    PFUser *user = [PFUser currentUser];
//    PFRelation *relation = [user relationforKey:@"Lections"];
//    
//    [[relation query] findObjectsInBackgroundWithTarget: crtl selector: @selector(loadComplete:error:)];
//}

@end
