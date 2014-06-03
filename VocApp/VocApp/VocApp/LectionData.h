//
//  LectionData.h
//  VocApp
//
//  Created by Tim Härle on 03.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LectionData : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id entries;

@end
@interface entries : NSValueTransformer

@end