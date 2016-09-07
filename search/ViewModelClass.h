//
//  ViewModelClass.h
//  search
//
//  Created by 王帅 on 16/9/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ReturnSuccessBlock) (id successValue);
typedef void (^ReturnErrorBlock)   (id errorValue);

/**
 *  ViewModel 的父类
 */
@interface ViewModelClass : NSObject

@property (nonatomic,copy) ReturnSuccessBlock successBlock;
@property (nonatomic,copy) ReturnErrorBlock   errorBlock;

- (void)setBlockWithReturnSuccessBlock:(ReturnSuccessBlock )successBlock ErrorBlock:(ReturnErrorBlock)errorBlock;
@end
