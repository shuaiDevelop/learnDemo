//
//  NSObject+JSONCategory.m
//  search
//
//  Created by 王帅 on 16/9/5.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "NSObject+JSONCategory.h"
#import <objc/runtime.h>

@implementation NSObject (JSONCategory)
- (void)setDictionary:(NSDictionary *)dictionary{
    Class c = self.class;
    while (c && c!= [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar * ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //成员变量名转为属性名 (去掉 下划线 _)
            key = [key substringFromIndex:1];
            // 取出字典的值
            id value = dictionary[key];
            // 如果 value 的值为nil  表示 模型里的key值数量大于json里边的key数量  会crash跳出循环
            if (value == nil) {
                continue;
            }

            // 获得成员变量类型
            NSString * type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            // 如果属性是对象类型
            NSRange range = [type rangeOfString:@"@"];
            
            if (range.location != NSNotFound) {
                // 截取对象的名字 如 @"Dog" 截取为 Dog
                type = [type substringWithRange:NSMakeRange(2, type.length - 3)];
                //
                if (![type hasPrefix:@"NS"]) {
                    Class class = NSClassFromString(type);
                    value = [class objectWithDictionary:value];
                }
                else if ([type isEqualToString:@"NSArray"]){
                    NSArray * array = (NSArray *)value;
                    NSMutableArray * mArray = [NSMutableArray array];
                    
                    
                    id class;
                    if ([self respondsToSelector:@selector(arrayObjectClass)]) {
                        NSString * classStr = [self arrayObjectClass];
                        class = NSClassFromString(classStr);
                        
                    }else {
                        
                        NSLog(@"数组内模型是未知类型 请实现arrayObjectClass方法");
                        return;
                    }
                    for (int i = 0; i < array.count; i++) {
                        [mArray addObject:[class objectWithDictionary:value[i]]];
                    }
                    
                    value = mArray;
                }
            }
            
            //字典中的值设置到模型上
            [self setValue:value forKey:key];
            
        }
        free(ivars);
        c = [c superclass];
      }



}
+(instancetype)objectWithDictionary:(NSDictionary *)dict{
    NSObject * obj = [[self alloc] init];
    [obj setDictionary:dict];
    return obj;
}
@end
