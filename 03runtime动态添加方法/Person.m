//
//  Person.m
//  03runtime动态添加方法
//
//  Created by coderXu on 16/12/5.
//  Copyright © 2016年 coderXu. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person
// 定义函数
// 类型是void ,参数（id ,SEL）
void eat(id self, SEL _cmd,id param1){
    
    NSLog(@"调用%@---%@---%@",self,NSStringFromSelector(_cmd),param1);
}


// 默认一个方法都有2个参数--隐式参数
// self：就是方法调用者
// _cmd：调用方法的编号


// 外界调用一个没有实现的对象方法-
// resolveInstanceMethod中sel是没有实现的参数
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSLog(@"%@",NSStringFromSelector(sel));
    
    
//    if (sel == @selector(eat)) {}
    
    if ([NSStringFromSelector(sel) isEqualToString:@"eat:"] ) {
        // 这里添加方法
        // 给哪个类
        //SEL:方法名
        //IMP:方法的实现（函数的入口-函数的指针-函数的名）
        //type :方法类型
        //
        class_addMethod(self, sel, (IMP)eat, "v@:@");
        
        
       
        return YES;
    }
    
    
    return [super resolveInstanceMethod:sel];
    
}

// 外界调用一个没有实现的类方法 +
// resolveClassMethod

+ (BOOL)resolveClassMethod:(SEL)sel{
    
    NSLog(@"--%@",NSStringFromSelector(sel));
    
    return [super resolveClassMethod:sel];
    
}
@end
