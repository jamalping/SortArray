//
//  ViewController.m
//  SortArray
//
//  Created by jamalping on 15-1-23.
//  Copyright (c) 2015年 jamalping. All rights reserved.
//

#import "ViewController.h"
#import "model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
///-------------------------------基本排序------------------------------------
/// [array sortedArrayUsingSelector:@selector(compare:)]
    // compare:直接取数组中的对象进行比较，不会转化
    // 当数组中的对象比较简单的时候我们就可以采用这种简单的排序
    NSArray *testAry = @[@"abcd",@"acbd",@"bacd",@"badc",@"bacd",@"cadb"];
    NSLog(@"testAry 排序前＝ %@",testAry);
    testAry = [testAry sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"testAry 排序后＝ %@",testAry);
    
    NSArray *testAry1 = @[@222,@303,@203,@32];
    NSLog(@"testAry1 排序前＝ %@",testAry1);
    testAry1 = [testAry1 sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"testAry1 排序后＝ %@",testAry1);
    // 当数组中的对象是NSString，而我们却要比较他的大小的时候上面的方法就不行了
    NSArray *testAry2 = @[@"222",@"303",@"203",@"32"];
    NSLog(@"testAry2 排序前＝ %@",testAry1);
    testAry2 = [testAry2 sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"testAry2 排序后＝ %@",testAry2);
    // 我们应该是这样做、
    NSArray *testAry3 = @[@"222",@"303",@"203",@"32"];
    NSLog(@"testAry3 排序前＝ %@",testAry3);
    testAry3 = [testAry3 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 integerValue]<[obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue]>[obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"testAr3 排序后＝ %@",testAry3);
    
    
///-------------------------------高级排序------------------------------------
    model * li = [[model alloc] initWithName:@"li" lastname:@"si" age:@"120" weight:@"100"];
    model * li1 = [[model alloc] initWithName:@"li" lastname:@"simin" age:@"120" weight:@"100"];
    model * zhang = [[model alloc] initWithName:@"zhang" lastname:@"san" age:@"24" weight:@"156"];
    model * liu = [[model alloc] initWithName:@"liu" lastname:@"xi" age:@"38" weight:@"34"];
    model * cao = [[model alloc] initWithName:@"cao" lastname:@"cao" age:@"100" weight:@"203"];
    NSArray *peoples = [NSArray arrayWithObjects:li1,li,zhang,liu,cao, nil];
    for (model *people in peoples) {
        NSLog(@"排序前people's name = %@",[NSString stringWithFormat:@"%@ %@",people.fristName,people.lastName]);
    }
    
    /// 按name（fristName，lastName）排序
    // key(可以是对象的属性，也可以是字典的key)ascending：YES升序、NO降序
    
    // 创建描述
    NSSortDescriptor *descriptor1 = [[NSSortDescriptor alloc] initWithKey:@"fristName" ascending:YES];
    NSSortDescriptor *descriptor2 = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    // 描述数组
    NSArray *descriptors = [NSArray arrayWithObjects:descriptor1,descriptor2, nil];
    // 根据描述数组进行排序
    peoples = [peoples sortedArrayUsingDescriptors:descriptors];
    for (model *people in peoples) {
        NSLog(@"排序后people's name = %@",[NSString stringWithFormat:@"%@ %@",people.fristName,people.lastName]);
    }
    
    /// 按age(大小)排序。。weight的排序同理
    peoples = [peoples sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        model *objj1 = (model *)obj1; model *objj2 = (model *)obj2;
        if ([objj1.age integerValue]<[objj2.age integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([objj1.age integerValue]>[objj2.age integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    for (model *people in peoples) {
        NSLog(@"222  %@",people.age);
    }
    
    for (model *people in peoples) {
        NSLog(@"排序前：age ＝ %@",people.age);
    }
    peoples = [peoples sortedArrayUsingFunction:customFunction context:nil];
    for (model *people in peoples) {
        NSLog(@"排序后：age ＝ %@",people.age);
    }
    
///---------------------------------------------------------------------
}

NSInteger customFunction(id obj1, id obj2) {
    model *objj1 = (model *)obj1; model *objj2 = (model *)obj2;
    if ([objj1.age integerValue]<[objj2.age integerValue]) {
        return (NSComparisonResult)NSOrderedAscending;
    }
    if ([objj1.age integerValue]>[objj2.age integerValue]) {
        return (NSComparisonResult)NSOrderedDescending;
    }
    return (NSComparisonResult)NSOrderedSame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
