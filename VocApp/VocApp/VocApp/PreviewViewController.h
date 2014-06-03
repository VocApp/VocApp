//
//  PreviewViewController.h
//  VocApp
//
//  Created by Tim Härle on 03.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PreviewViewController : UIViewController
@property (strong,nonatomic) PFObject * lection;
@end
