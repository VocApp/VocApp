//
//  Detail2ViewController.h
//  VocApp
//
//  Created by Tim on 03.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lection.h"

@interface Detail2ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (strong,nonatomic) PFObject * lection;
@property (weak, nonatomic) IBOutlet UIView *VocappView;
@property (weak, nonatomic) IBOutlet UILabel *correction;
@end