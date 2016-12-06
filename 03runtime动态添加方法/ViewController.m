//
//  ViewController.m
//  03runtime动态添加方法
//
//  Created by coderXu on 16/12/5.
//  Copyright © 2016年 coderXu. All rights reserved.
//  动态添加方法：某个类，需要什么方法，用的时候加上牛

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    Person *p = [[Person alloc] init];
    
    //动态添加方法--- 类方法
//    [[Person class] performSelector:@selector(run)];
    
    // 动态添加方法--- 对象方法resolveInstanceMethod
//     [p performSelector:@selector(eat)];
    
    
    [p performSelector:@selector(eat:) withObject:@"11"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
