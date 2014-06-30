//
//  AllCourses.h
//  VocApp
//
//  Created by Tim on 05.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Course.h"

@interface AllCourses : NSObject

+(void) loadCourses: (id ) ctrl;
+(void) loadMyCourses: (id) crtl;
@end
