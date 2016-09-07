//
//  NSObject+JSONCategory.h
//  search
//
//  Created by 王帅 on 16/9/5.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (JSONCategory)


//- (void)setDictionary:(NSDictionary *)dictionary;
/**
 *  字典转模型
 */
+(instancetype)objectWithDictionary:(NSDictionary *)dict;
/**
 *  告诉数组中都是什么类型的模型对象
 */
- (NSString *)arrayObjectClass ;

@end
