//
//  CoursePreviewViewController.h
//  VocApp
//
//  Created by Tim on 01.07.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CoursePreviewViewController : UICollectionViewController
@property PFObject* course;
-(void)found:(NSArray *)objects error:(NSError *)error;
-(void)reloadWithCourse:(PFObject*)course;
@end
