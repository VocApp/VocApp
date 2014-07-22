//
//  CourseEditViewController.h
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CoursePreviewViewController.h"


@interface AddLectionViewController : UIViewController <UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property PFObject* course;
@property CoursePreviewViewController* parent;
@end
