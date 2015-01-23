//
//  model.h
//  SortArray
//
//  Created by jamalping on 15-1-23.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject

@property (nonatomic)NSString *fristName;
@property (nonatomic)NSString *lastName;
@property (nonatomic)NSString *age;
@property (nonatomic)NSString *weight;

- (id)initWithName:(NSString *)fristName lastname:(NSString *)lastName age:(NSString *)age weight:(NSString *)weight;

@end
