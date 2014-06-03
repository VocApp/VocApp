//
//  LectionData.m
//  VocApp
//
//  Created by Tim Härle on 03.06.14.
//  Copyright (c) 2014 VocApp. All rights reserved.
//

#import "LectionData.h"


@implementation LectionData

@dynamic name;
@dynamic entries;

@end

@implementation entries

+ (Class)transformedValueClass
{
    return [NSArray class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (id)reverseTransformedValue:(id)value
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}

@end
