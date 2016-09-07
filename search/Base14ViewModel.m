//
//  Base14ViewModel.m
//  search
//
//  Created by 王帅 on 16/9/6.
//  Copyright © 2016年 shuai. All rights reserved.
//

#import "Base14ViewModel.h"
#import "HYBNetworking.h"
#import "Base14Model.h"
#import "NSObject+JSONCategory.h"
#import "Base9Controller.h"
@implementation Base14ViewModel
- (void) fetchDataFromSever{

    
[HYBNetworking getWithUrl:@"http://www.ylzfsport.com:8080/ffp/SiteInterface?action=Page" success:^(id response) {
    if (response) {
       
        [self fetchSuccess:response];
    }
   
    
} fail:^(NSError *error) {
    self.errorBlock(error);
}];



}
- (void)fetchSuccess:(id)response{
    NSMutableArray * successValue = [NSMutableArray array];
    for (NSDictionary * dic in [response objectForKey:@"data"]) {
        
        Base14Model * model = [Base14Model objectWithDictionary:dic];
        [successValue addObject:model];
    }

    self.successBlock(successValue);
}
- (void)pushDetail:(Base14Model *)model WithController:(UIViewController *)controller{

    [controller.navigationController pushViewController:[Base9Controller new] animated:YES];

}
- (void)dealloc
{
    NSLog(@"Base14ViewModel dealloc");
}

@end
