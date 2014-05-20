//
//  EditViewController.h
//  VocApp
//
//  Created by Tim Härle on 15.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


//- (void)textFieldDidEndEditing:(UITextField *)textField;
@end
