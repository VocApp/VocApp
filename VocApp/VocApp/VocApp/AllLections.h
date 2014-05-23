//
//  AllLections.h
//  VocApp
//
//  Created by Tim Härle on 23.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Lection.h"
#import "CollectionViewController.h"

@interface AllLections : NSObject

+(void) loadLections:(CollectionViewController*)ctrl;

@end
