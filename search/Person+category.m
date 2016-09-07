//
//  Person+category.m
//  search
//
//  Created by 王帅 on 16/9/2.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Person+category.h"
#import <objc/runtime.h>

//1 static void *nameKey = &nameKey;
//2 static NSString *nameKey = @"nameKey"; 标记是哪一个属性的key常见有三种写法，但代码效果是一样的
//3 static char nameKey;


//static char nameKey;
@implementation Person (category)

- (void)setName:(NSString *)name{

    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);

}
- (NSString *)name{


//    return objc_getAssociatedObject(self, &nameKey);
    return objc_getAssociatedObject(self, _cmd);
}
@end
