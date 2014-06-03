//
//  AllLections.m
//  VocApp
//
//  Created by Tim Härle on 23.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "AllLections.h"
#import "SearchViewController.h"

@implementation AllLections




+(void) loadLections: (SearchViewController *) ctrl{
    PFQuery *query = [PFQuery queryWithClassName:@"Lection"];
    [query findObjectsInBackgroundWithTarget: ctrl selector:@selector(loadComplete:error:)];
    NSLog(@"Ich lade ");

}

+(void) loadMyLections: (CollectionViewController*) crtl{
    PFUser *user = [PFUser currentUser];
    PFRelation *relation = [user relationforKey:@"Lections"];

    [[relation query] findObjectsInBackgroundWithTarget: crtl selector: @selector(loadComplete:error:)];
}
@end
