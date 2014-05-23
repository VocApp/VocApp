//
//  AllLections.m
//  VocApp
//
//  Created by Tim Härle on 23.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "AllLections.h"

@implementation AllLections




+(void) loadLections: (CollectionViewController *) ctrl{
    PFQuery *query = [PFQuery queryWithClassName:@"Lection"];
    [query findObjectsInBackgroundWithTarget: ctrl selector:@selector(loadComplete:error:)];
    NSLog(@"Ich lade ");

}
@end
