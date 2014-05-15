//
//  Lection.h
//  VocApp
//
//  Created by Tim Härle on 14.05.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//
#import <Parse/Parse.h>
#import <Foundation/Foundation.h>

@interface Lection : NSObject
@property (strong,nonatomic) NSMutableArray * entries;
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) PFUser * author;


-(void) addEntryWithOrigninal:org andTranslation:tran;
@end
