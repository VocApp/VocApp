//
//  EditViewController.h
//  VocApp
//
//  Created by Tim Härle on 15.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lection.h"
#import "SearchViewController.h"

@interface EditViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *original;
@property (weak, nonatomic) IBOutlet UITextField *translation;
@property (strong,nonatomic)Lection *lection;
@property SearchViewController* parent;

-(void)clearTextfield;
@end
