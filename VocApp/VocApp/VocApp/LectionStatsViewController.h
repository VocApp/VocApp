//
//  LectionStatsViewController.h
//  VocApp
//
//  Created by Tim on 21.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LectionStatsViewController : UIViewController
@property PFObject* stats;
@property PFObject* lection;


@end
