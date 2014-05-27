//
//  DetailViewController.h
//  VocApp
//
//  Created by Tim Härle on 24.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lection.h"


@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (strong,nonatomic) PFObject * lection;
@property (weak, nonatomic) IBOutlet UIView *VocappView;
@property (weak, nonatomic) IBOutlet UILabel *correction;

@end
