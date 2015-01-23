//
//  model.m
//  SortArray
//
//  Created by jamalping on 15-1-23.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "model.h"

@implementation model

- (id)initWithName:(NSString *)fristName lastname:(NSString *)lastName age:(NSString *)age weight:(NSString *)weight
{
    self = [super init];
    if (self) {
        _fristName = fristName;
        _lastName = lastName;
        _age = age;
        _weight = weight;
    }
    return self;
}

@end
