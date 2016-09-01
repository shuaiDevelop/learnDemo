//
//  VIewModel.m
//  search
//
//  Created by 王帅 on 16/7/18.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "VIewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "HYBNetworking.h"
#import "TestModel.h"
@implementation VIewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize{

    _successObject = [RACSubject subject];
    _errorObject   = [RACSubject subject];
    _dataSource = [NSMutableArray array];



}
- (void)getData{

    [HYBNetworking getWithUrl:@"http://www.ylzfsport.com:8080/ffp/SiteInterface?action=Page" success:^(id response) {
        if (response) {
            
            for (NSDictionary * dic in response[@"data"]) {
                TestModel * model = [[TestModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [_dataSource addObject:model];
            }
            
            [_successObject sendNext:_dataSource];
            [_successObject sendCompleted];

            
            
        }
        
        
        
        
    } fail:^(NSError *error) {
        
        [_errorObject sendNext:error];
        [_errorObject sendCompleted];
        
    }];

    

}
@end
