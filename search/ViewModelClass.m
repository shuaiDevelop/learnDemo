//
//  ViewModelClass.m
//  search
//
//  Created by 王帅 on 16/9/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "ViewModelClass.h"


@implementation ViewModelClass

- (void)setBlockWithReturnSuccessBlock:(ReturnSuccessBlock )successBlock ErrorBlock:(ReturnErrorBlock)errorBlock{

    _successBlock = successBlock;
    _errorBlock   = errorBlock;


}
@end
