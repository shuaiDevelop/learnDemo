//
//  Person.h
//  search
//
//  Created by 王帅 on 16/9/2.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, copy)NSString * age;
@property(nonatomic, assign)double money;
+ (void)run;
+ (void)study;
@end
